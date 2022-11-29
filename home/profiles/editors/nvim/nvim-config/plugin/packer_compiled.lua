-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/aniket/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/aniket/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/aniket/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/aniket/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aniket/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "require('plugins.configs.alpha')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bracey.vim"] = {
    commands = { "Bracey" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/bracey.vim",
    url = "https://github.com/turbio/bracey.vim"
  },
  ["bufferline.nvim"] = {
    config = { "require('plugins.configs.bufferline')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  chadtree = {
    config = { "require('plugins.configs.chadtree')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/chadtree",
    url = "https://github.com/ms-jpq/chadtree"
  },
  ["context.vim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/context.vim",
    url = "https://github.com/wellle/context.vim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    config = { "require('plugins.configs.coq')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    needs_bufread = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["direnv.vim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/direnv.vim",
    url = "https://github.com/direnv/direnv.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.configs.gitsigns')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  hop = {
    config = { "require('plugins.configs.hopword')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugins.configs.indent_blankline')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["legendary.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('plugins.configs.lualine')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["navigator.lua"] = {
    config = { "require('plugins.configs.navigator')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/navigator.lua",
    url = "https://github.com/ray-x/navigator.lua"
  },
  neorg = {
    config = { "require('plugins.configs.neorg')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/vhyrro/neorg"
  },
  ["nisha-v2-vim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/nisha-v2-vim",
    url = "/home/aniket/nisha-v2/nisha-v2-vim"
  },
  ["numbers.vim"] = {
    config = { "require('plugins.configs.numbers')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/numbers.vim",
    url = "https://github.com/myusuf3/numbers.vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.configs.treesitter')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "require('plugins.configs.quickscope')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    commands = { "Telescope" },
    config = { 'require("plugins.configs.telescope")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "lazygit.nvim" }
  },
  ["todo-comments.nvim"] = {
    config = { "require('plugins.configs.todo_comments')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('plugins.configs.trouble')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "require('plugins.configs.twilight')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-auto-save"] = {
    config = { "require('plugins.configs.autosave')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-bundler"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-bundler",
    url = "https://github.com/tpope/vim-bundler"
  },
  ["vim-crunch"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-crunch",
    url = "https://github.com/arecarn/vim-crunch"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    config = { "require('plugins.configs.dbui')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
  },
  ["vim-http"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-http",
    url = "https://github.com/nicwest/vim-http"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-jdaddy"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-jdaddy",
    url = "https://github.com/tpope/vim-jdaddy"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-schlepp"] = {
    config = { "require('plugins.configs.schlepp')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-schlepp",
    url = "https://github.com/zirrostig/vim-schlepp"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-surround"] = {
    config = { "require('plugins.configs.surround')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["vim-yankstack"] = {
    config = { "require('plugins.configs.yankstack')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vim-yankstack",
    url = "https://github.com/maxbrunsfeld/vim-yankstack"
  },
  vimspector = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  vimtex = {
    config = { "require('plugins.configs.vimtex')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  },
  ["which-key.nvim"] = {
    config = { "require('plugins.configs.which_key')" },
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/start/wildfire.vim",
    url = "https://github.com/gcmt/wildfire.vim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "require('plugins.configs.zen_mode')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/aniket/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
require('plugins.configs.zen_mode_setup')
time([[Setup for zen-mode.nvim]], false)
-- Setup for: bracey.vim
time([[Setup for bracey.vim]], true)
require('plugins.configs.bracey_setup')
time([[Setup for bracey.vim]], false)
-- Setup for: coq_nvim
time([[Setup for coq_nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "setup", "coq_nvim")
time([[Setup for coq_nvim]], false)
time([[packadd for coq_nvim]], true)
vim.cmd [[packadd coq_nvim]]
time([[packadd for coq_nvim]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
require('plugins.configs.glow_setup')
time([[Setup for glow.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('plugins.configs.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
require('plugins.configs.surround')
time([[Config for vim-surround]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require('plugins.configs.todo_comments')
time([[Config for todo-comments.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('plugins.configs.bufferline')
time([[Config for bufferline.nvim]], false)
-- Config for: navigator.lua
time([[Config for navigator.lua]], true)
require('plugins.configs.navigator')
time([[Config for navigator.lua]], false)
-- Config for: vim-schlepp
time([[Config for vim-schlepp]], true)
require('plugins.configs.schlepp')
time([[Config for vim-schlepp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('plugins.configs.which_key')
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.configs.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
require('plugins.configs.quickscope')
time([[Config for quick-scope]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('plugins.configs.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
require('plugins.configs.vimtex')
time([[Config for vimtex]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
require('plugins.configs.chadtree')
time([[Config for chadtree]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugins.configs.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: vim-dadbod-ui
time([[Config for vim-dadbod-ui]], true)
require('plugins.configs.dbui')
time([[Config for vim-dadbod-ui]], false)
-- Config for: vim-yankstack
time([[Config for vim-yankstack]], true)
require('plugins.configs.yankstack')
time([[Config for vim-yankstack]], false)
-- Config for: coq.thirdparty
time([[Config for coq.thirdparty]], true)
require('plugins.configs.coq')
time([[Config for coq.thirdparty]], false)
-- Config for: hop
time([[Config for hop]], true)
require('plugins.configs.hopword')
time([[Config for hop]], false)
-- Config for: vim-auto-save
time([[Config for vim-auto-save]], true)
require('plugins.configs.autosave')
time([[Config for vim-auto-save]], false)
-- Config for: numbers.vim
time([[Config for numbers.vim]], true)
require('plugins.configs.numbers')
time([[Config for numbers.vim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('plugins.configs.indent_blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require('plugins.configs.twilight')
time([[Config for twilight.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('plugins.configs.trouble')
time([[Config for trouble.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('plugins.configs.alpha')
time([[Config for alpha-nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bracey lua require("packer.load")({'bracey.vim'}, { cmd = "Bracey", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'bracey.vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'bracey.vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'bracey.vim'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/aniket/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/aniket/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/aniket/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
