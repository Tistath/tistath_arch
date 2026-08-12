# Arch Linux安装配置指南

## 1. 准备Live环境

### 1.1 下载并校验镜像

- 下载[ISO镜像，SIG签名](https://archlinux.org.cn/download)

- 进入镜像目录，校验签名
```bash
cd ~/Downloads
pacman-key -v archlinux-version-x86_64.iso.sig
```
    
### 1.2 制作启动U盘

- 确认U盘名（以/dev/sda为例），并确保其未被挂载
```bash
lsblk
```

- 写入镜像
```bash
sudo cat archlinux-version-x86_64.iso > /dev/sda
```

- 刷写缓存并弹出
```bash
sync
eject /dev/sda
```

### 1.3 进入Live环境

- 进入BIOS，禁用Secure Boot（若存在Secure Boot Mode，设为Standard或关闭）

- 确保处于UEFI模式（输出64表示成功）
```bash
cat /sys/firmware/efi/fw_platform_size
```

### 1.4 连接网络并同步时间

- 连接wifi
```bash
iwctl
station wlan0 connect "wifi名"
输入密码
exit
```

- 验证网络（有IP地址即为成功）
```bash
ip a
```

- 开启网络时间同步
```bash
timedatectl set-ntp true
```

## 2. 磁盘分区与文件系统

### 2.1 分区

- 查看磁盘设备
```bash
lsblk -pf
```

- 对磁盘进行分区（以/dev/nvme0n1为例）
```bash
cfdisk /dev/nvme0n1

delete所有已有分区

创建 EFI 分区：new -> 大小 1G -> type -> EFI System

创建根分区：new -> 使用剩余全部空间 -> write -> quit
```

- 确认分区结果
```bash
lsblk -pf
```

### 2.2 格式化
```bash
mkfs.fat -F 32 /dev/nvme0n1p1   # EFI 分区
mkfs.btrfs -f /dev/nvme0n1p2    # 根分区
```

### 2.3 创建 Btrfs 子卷并挂载

- 临时挂载根分区
```bash
mount -t btrfs -o compress=zstd /dev/nvme0n1p2 /mnt
```

- 创建子卷
```bash
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@swap
```

- 卸载临时挂载
```bash
umount /mnt
```

- 正式挂载子卷
```bash
mount -t btrfs -o subvol=/@,compress=zstd /dev/nvme0n1p2 /mnt
mount --mkdir -t btrfs -o subvol=/@home,compress=zstd /dev/nvme0n1p2 /mnt/home
mount --mkdir -t btrfs -o subvol=/@swap,compress=zstd /dev/nvme0n1p2 /mnt/swap
```

### 2.4 挂载启动分区
```bash
mount --mkdir /dev/nvme0n1p1 /mnt/boot
df -h   # 检查挂载情况
```

## 3. 安装基本系统

### 3.1 配置镜像源并安装基础包

- 更新密钥
```bash
pacman -Sy archlinux-keyring
```

- 编辑/etc/pacman.d/mirrorlist，添加
```text
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch
```

- 安装基础包
```bash
pacstrap -K /mnt base base-devel linux linux-firmware btrfs-progs
pacstrap /mnt networkmanager neovim amd-ucode
```

### 3.2 创建交换文件
```bash
btrfs filesystem mkswapfile --size 8g --uuid clear /mnt/swap/swapfile
chmod 600 /mnt/swap/swapfile
swapon /mnt/swap/swapfile
```

### 3.3 生成 fstab
```bash
genfstab -U /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab    # 检查内容
```

### 3.4 chroot 进入新系统
```bash
arch-chroot /mnt
```

## 4. 系统基础配置（chroot内）

### 4.1 时区与硬件时钟
```bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
```

### 4.2 本地化设置

- 编辑/etc/locale.gen
```gen
取消注释 en_US.UTF-8 UTF-8和zh_CN.UTF-8 UTF-8
```

- 生成本地化
```bash
locale-gen
```

- 设置默认语言，编辑/etc/locale.conf
```conf
LANG=en_US.UTF-8
```

### 4.3 网络配置

- 设置主机名
```bash
echo "tistath" > /etc/hostname
```

- 编辑/etc/hosts，写入
```text
127.0.0.1   localhost
::1         localhost
127.0.1.1   tistath.localdomain tistath
```

### 4.4 设置root密码
```bash
passwd
```

### 4.5 安装并配置systemd-boot
```bash
systemctl daemon-reload
bootctl install --esp-path=/boot
chmod 600 /boot/loader/random-seed
```

- 创建启动项/boot/loader/entries/arch.conf
```conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2) rootflags=subvol=@ rw loglevel=5
```

- 配置启动管理器/boot/loader/loader.conf
```conf
default arch
timeout 3
console-mode max
editor no
```

- 生效
```bash
systemd-machine-id-setup
bootctl update
```

### 4.6 安装efibootmgr并重启
```bash
pacman -S efibootmgr
exit    # 退出 chroot
reboot
```

> [!NOTE]以上是通用配置，其余按需选择

## 5. 用户与桌面环境

### 5.1 连接网络

```bash
重启后以root登录，执行
systemctl enable --now NetworkManager
nmcli dev wifi connect "wifi名" password "密码"
ip a   # 验证
```

### 5.2 安装Fish Shell
```bash
pacman -S fish
```

### 5.3 创建普通用户并配置
```bash
useradd -m -G wheel,users -s /usr/bin/fish tistath
passwd tistath
echo "tistath ALL=(ALL) ALL" > /etc/sudoers.d/tistath
chmod 440 /etc/sudoers.d/tistath
退出root，以普通用户登录
```

### 5.4 安装图形界面与基本应用
```bash
sudo pacman -S  mate-polkit xdg-desktop-portal-gtk xwayland-satellite niri \
                kitty \
                adobe-source-han-sans-otc-fonts ttf-jetbrains-mono-nerd \
                firefox #Firefox 的交互询问均选择2
fc-cache -fv
```

### 5.5 配置Niri窗口管理器

- 生成默认配置
```bash
niri-session
```

- 编辑~/.config/niri/config.kdl

- 为闲置脚本添加执行权限
```bash
chmod +x ~/.config/niri/scripts/swayidle.sh
```

### 5.6 安装通知服务
```bash
sudo pacman -S libnotify mako
```

## 6. 中文输入法与加速器

### 6.1 添加archlinuxcn源并安装yay

- 编辑/etc/pacman.conf，添加
```conf
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch
Server = https://repo.huaweicloud.com/archlinuxcn/$arch
```

- 安装yay并配置AUR镜像
```bash
sudo pacman -Sy archlinuxcn-keyring
sudo pacman -S yay
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save # 清华源
# 若失效，恢复官方源yay --aururl "https://aur.archlinux.org" --save
```

### 6.2 安装并配置fcitx5输入法
```bash
sudo pacman -S fcitx5-im fcitx5-rime rime-ice-pinyin-git
```

- 编辑Rime配置~/.local/share/fcitx5/rime/default.custom.yaml
```yaml
patch:
  __include: rime_ice_suggestion:/
  ascii_composer:
    switch_key:
      Shift_L: commit_code
      Shift_R: commit_code
  menu:
    page_size: 10
  style:
    horizontal: true
  'engine/filters':
    - simplifier
```

- 在输入法配置中添加Rime

### 6.3 安装Watt-Toolkit加速器
```bash
yay -S watt-toolkit-bin
```

- 初始化证书数据库并信任证书
```bash
mkdir -p ~/.pki/nssdb
certutil -N -d ~/.pki/nssdb
sudo trust anchor --store SteamTools.Certificate.cer
sudo chmod a+w /etc/hosts
```

- 加速github：在Firefox的[设置-安全](about:preferences#connectionSecurity)中导入[证书](~/.local/share/Steam++/Plugins/Accelerator/SteamTools.Certificate.cer)

- 加速steam：在steam中，打开任意游戏，按Shift+Tab，点击进入内置浏览器，在chrome://settings的安全中加入后缀名从cer改成pem的证书

## 7. 应用配置

### Git配置
```bash
git config --global user.name "Tistath"
git config --global user.email "eta_gamma_omega@qq.com"
git config --global init.defaultBranch main
```

### 7.1 大写锁定映射为Ctrl

- 编辑/etc/udev/hwdb.d/99-caps-ctrl.hwdb，添加
```hwdb
evdev:atkbd:dmi:bvn*:bvr*:bd*:svn*:pn*:pvr*
  KEYBOARD_KEY_3a=leftctrl
```

- 生效
```bash
sudo systemd-hwdb update
sudo udevadm trigger
```

### 7.2 浏览器配置

- 在Firefox中调整[语言偏好](about:preferences#accessibility)

- 修改下载目录至所需位置

### 7.3 主题与鼠标指针

- 更换主题

    - btop：<F2>打开设置，Color themes改为nord，Theme background改为false

    - copyq：右键选择首选项，在外观中载入主题

    - fcitx5：编辑~/.config/fcitx5/conf/classicui.conf，将Themes行改为Theme=catppuccin-mocha-blue

    - firefox：安装[主题插件](https://addons.mozilla.org/en-GB/firefox/addon/firefox-color/)，应用[主题](https://color.firefox.com/?theme=XQAAAAJDBAAAAAAAAABBqYhm849SCicxcUcPX38oKRicm6da8pFtMcajvXaAE3RJ0F_F447xQs-L1kFlGgDKq4IIvWciiy4upusW7OvXIRinrLrwLvjXB37kvhN5ElayHo02fx3o8RrDShIhRpNiQMOdww5V2sCMLAfehho7r-AtSBPnvx4uvv7vRnzG2zBiFpesm1SAl1KsPscTY8iQYgDnBUvUwxRg5oKKrqaQ_z3v5Hws-8hk4Kc3t_NXn8IoY4ZYVdc86z2QRba2CmsdOmEA-8eHxrfsyZHFWrEEdKZyHYvxjqukUFLs50Fy6pCfDvrjyNBjAtl1dnf9Nj5Jm0ul9fPQvmPAMvweio7eiPSwgqK0N4okhCeWhmc0VioXa6KngF81ywVKwm6ZuPBvP1fLlkT3IQ2e3Psy08_qy2cz2cV67Je242GGYfnOaLZl36LyWV0_AUCtjW19KlUsTGIMGopDMEWZDYstyLga9H5O6w7Q58QVg7y2k7-oNLsIMr3nPFiMjZeJGYJZ9dd4PzYa90eT6KAqaGs50nZXt6xwOFEcYsIJjRbn__m_9iA)

### 7.4 Neovim配置

- 安装treesitter解析器
```Vimscript
:TSInstall cpp html latex yaml
```

### 7.5 沙盒版微信配置

- 创建共享目录用于文件传输
```bash
mkdir -p ~/wechat-shared
```

- 查找微信启动脚本
```bash
ls /usr/bin/wechat*
```
    
- 编辑脚本（以/usr/bin/wechat-universal为例），在exec bwrap与/opt/wechat/wechat "$@"之间插入一行
```text
--bind /home/tistath/wechat-shared /home/tistath/wechat-shared
```

## 配置文件

- [我的仓库](https://github.com/Tistath/tistath_arch)

## 备份配置

```bash
rsync -av --delete ~/.config/copyq/themes/ ~/tistath_arch/home/tistath/.config/copyq/themes/
rsync -av --delete /usr/share/fastfetch/presets/examples/6.jsonc ~/tistath_arch/usr/share/fastfetch/presets/examples/6.jsonc
rsync -av --delete ~/.local/share/fcitx5/themes/ ~/tistath_arch/home/tistath/.local/share/fcitx5/themes/
rsync -av --delete ~/.config/fish/ ~/tistath_arch/home/tistath/.config/fish/
rsync -av --delete ~/.config/fontconfig/ ~/tistath_arch/home/tistath/.config/fontconfig/
rsync -av --delete ~/.config/kitty/ ~/tistath_arch/home/tistath/.config/kitty/
rsync -av --delete ~/.config/mako/ ~/tistath_arch/home/tistath/.config/mako/
rsync -av --delete ~/.config/niri/ ~/tistath_arch/home/tistath/.config/niri/
rsync -av --delete ~/.config/nvim/ ~/tistath_arch/home/tistath/.config/nvim/
rsync -av --delete ~/.config/swaylock/ ~/tistath_arch/home/tistath/.config/swaylock/
rsync -av --delete ~/.config/waybar/ ~/tistath_arch/home/tistath/.config/waybar/
rsync -av --delete ~/.config/zathura/ ~/tistath_arch/home/tistath/.config/zathura/
rsync -av --delete ~/.local/share/icons/ ~/tistath_arch/home/tistath/.local/share/icons/
rsync -av --delete ~/Documents/arch_install.md ~/tistath_arch/home/tistath/Documents/arch_install.md

pacman -Qqen > ~/tistath_arch/pkglist-official.txt
pacman -Qqem > ~/tistath_arch/pkglist-aur.txt

cd ~/tistath_arch

git add .
git commit -m ""
git push -u origin main
```
## 包

| 内核固件 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| linux | 内核本体 |
| linux-firmware | 必需固件集合 |
| amd-ucode | 微码，管理CPU |
| tlp | 电源管理 |
| brightnessctl | 亮度调节 |

| 基础系统 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| base | 最小系统环境 |
| base-devel | 编译环境 |
| btrfs-progs | BTRFS文件系统管理工具 |
| efibootmgr | UEFI启动项管理 |
| man-db | 命令手册 |
| pacman-contrib | pacman清理工具 |
| networkmanager | 网络管理 |
| git | 版本管理 |

| 系统维护 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| snapper | 快照工具 |
| snap-pac | 自动创建快照 |

| 桌面环境 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| niri | 窗口管理器 |
| xwayland-satellite | 兼容X11应用 |
| waybar | 状态栏 |
| swaybg | 壁纸 |
| swayidle | 锁屏 |
| swaylock-effects | 屏保 |
| mako | 消息通知 |
| libnotify | 桌面通知库，mako依赖 |
| mate-polkit | 图形应用提权 |
| wl-clipboard | 底层剪切板 |
| copyq | 图形化高级剪切板 |

| 命令行工具 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| kitty | 终端 |
| fish | shell |
| fastfetch | 系统信息展示 |
| tree | 文件结构显示 |
| rsync | 高效复制 |
| pastel | 颜色显示工具 |
| chafa | 图片查看工具 |

| AUR | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| archlinuxcn-keyring | 仓库密钥 |
| yay | AUR助手 |

| 开发工具 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| neovim | 文本编辑器 |
| tree-sitter-cli | 语法树解析，treesitter依赖 |
| ripgrep | 高速文本搜索，telescope依赖 |
| clang | C/C++前后端 |

| 多媒体 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| gst-libav | 音视频编解码插件 |
| gst-plugins-base | 音视频编解码插件 |
| gst-plugins-good | 音视频编解码插件 |
| libva-utils | 硬件加速管理 |

| 浏览器 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| firefox | 火狐浏览器 |
| gnome-keyring | 密码管理 |
| torbrowser-launcher | 洋葱浏览器 |

| 加速器 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| watt-toolkit-bin | 加速github，steam等 |

| 文档查看 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| zathura | PDF查看工具 |
| zathura-pdf-mupdf | PDF渲染后端 |
| tesseract-data-eng | PDF英文语言包 |
| tesseract-data-chi_sim | PDF中文语言包 |

| 字体 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| adobe-source-han-sans-otc-fonts | 思源黑体，简繁日韩字体 |
| ttf-jetbrains-mono-nerd | Jetbrains mono nerd font,英文字体及图标 |

| 输入法| 说明 |
| :-------------------------------------- | :-------------------------------------- |
| fcitx5 | 输入法 |
| fcitx5-rime | 中州韵，桥接中文输入法 |
| fcitx5-configtool | 输入法配置工具 |
| fcitx5-gtk | 使输入法在GTK中可用 |
| fcitx5-qt | 使输入法在QT中可用 |
| rime-ice-pinyin-git | 雾凇拼音 |

| 游戏 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| steam | 游戏平台 |

| 社交 | 说明 |
| :-------------------------------------- | :-------------------------------------- |
| linuxqq | QQ |
| wechat-universal-bwrap | 隐私版微信 |
