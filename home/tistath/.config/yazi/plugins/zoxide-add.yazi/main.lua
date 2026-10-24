local zoxide_add = {}

function zoxide_add:setup()
        ps.sub("cd", function()
                local cwd = cx.active.current.cwd
                if not cwd then return end
                Command("zoxide")
                        :arg("add")
                        :arg(tostring(cwd))
                        :output()
        end)
end

return zoxide_add
