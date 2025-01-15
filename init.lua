do
    -- Specifies where to install/use rocks.nvim
    local install_location = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rocks")

    -- Set up configuration options related to rocks.nvim (recommended to leave as default)
    local rocks_config = {
        rocks_path = vim.fs.normalize(install_location),
    }

    vim.g.rocks_nvim = rocks_config

    -- Configure the package path (so that plugin code can be found)
    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    -- Configure the C path (so that e.g. tree-sitter parsers can be found)
    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    -- Add rocks.nvim to the runtimepath
    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
end

-- If rocks.nvim is not installed then install it!
if not pcall(require, "rocks") then
    local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache") --[[@as string]], "rocks.nvim")

    if not vim.uv.fs_stat(rocks_location) then
        -- Pull down rocks.nvim
        local url = "https://github.com/nvim-neorocks/rocks.nvim"
        vim.fn.system({ "git", "clone", "--filter=blob:none", url, rocks_location })
        -- Make sure the clone was successfull
        assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")
    end

    -- If the clone was successful then source the bootstrapping script
    vim.cmd.source(vim.fs.joinpath(rocks_location, "bootstrap.lua"))

    vim.fn.delete(rocks_location, "rf")
end

vim.g.mapleader = " "

-- Config undo, backup and swap directory
USER = os.getenv("USER")
SWAPDIR = "/home/" .. USER .. "/nvim/swap//"
BACKUPDIR = "/home/" .. USER .. "/nvim/backup//"
UNDODIR = "/home/" .. USER .. "/nvim/undo//"
if vim.fn.isdirectory(SWAPDIR) == 0 then
	vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
	vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end

vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})
