for mod in io.popen("ls ~/.config/nvim/lua"):lines() do
    if mod:match("%d%d.+%.lua") then
        require(mod:sub(1, -5))
    end
end

pcall(require, "debug.lua")
