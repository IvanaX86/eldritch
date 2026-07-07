-- Init
local g    = vim.g
local opt  = vim.opt
local cmd  = vim.cmd
local call = vim.cmd.call
local Plug = vim.fn['plug#']
local api  = vim.api

-- Vim Options
opt.smarttab       = true

-- Quality of Life
opt.autoindent     = true
opt.expandtab      = true
opt.shiftround     = true
opt.shiftwidth     = 2
opt.smarttab       = true
opt.tabstop        = 2

opt.hlsearch       = true
opt.ignorecase     = true
opt.incsearch      = true
opt.smartcase      = true

opt.linebreak      = true
opt.scrolloff      = 1
opt.sidescrolloff  = 5
opt.wrap           = true

opt.laststatus     = 2
opt.ruler          = true
opt.wildmenu       = true
opt.cursorline     = true

opt.number         = true
opt.relativenumber = true
opt.errorbells     = false
opt.title          = true

opt.foldmethod     = indent
opt.history        = 10000

-- Plugins --
call("plug#begin()")
  Plug 'bjarneo/pixel.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
call("plug#end()")
-------------

--coc config --
cmd ([[
  inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"
  inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#next(1) : "\<C-h>"
  inoremap <silent><expr> <A-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<Ignore>"
]])
---------------

-- Theme --
cmd("syntax enable")

-- Make theme follow convention
api.nvim_create_autocmd("ColorScheme", {
  pattern = "pixel",
  callback = function()
    cmd([[highlight Normal ctermfg=NONE ctermbg=NONE]])
    cmd([[highlight NormalFloat ctermbg=NONE]])
    cmd([[highlight NormalNC ctermfg=NONE ctermbg=NONE]])
  end,
})

cmd.colorscheme("pixel")
---------

--lualine --
local pixel_lualine = require('lualine.themes.pixel')

for _, mode in pairs(pixel_lualine) do
  if mode.b then mode.b.bg = 232 end
  if mode.c then mode.c.bg = 232 end
  if mode.x then mode.x.bg = 232 end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = pixel_lualine
  }
}
------------


