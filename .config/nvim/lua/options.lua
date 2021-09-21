local o = vim.o
local fn = vim.fn

o.autoread=true
o.hidden=true
o.showcmd=true
o.number=true
o.relativenumber=true
o.cursorline=true
o.virtualedit='onemore'
o.visualbell=true
o.showmatch=true
o.laststatus=2
o.wildmode='list:longest'

o.smartindent=true
o.expandtab=true
o.tabstop=4
o.shiftwidth=4

o.ignorecase=true
o.smartcase=true
o.incsearch=true
o.hlsearch=true

o.wrap=false
o.wrapscan=true
o.clipboard='unnamedplus'
o.signcolumn='yes'

o.iminsert=0
o.imsearch=-1

o.termguicolors=true
o.pumblend=30

-- diff mode option
if not (o.diff) then
  o.foldmethod='marker'
  o.foldopen='all'
  o.foldclose='all'
end


if fn.has('conceal') == 1 then
  o.conceallevel=2
  o.concealcursor='i'
end

o.background='dark'
