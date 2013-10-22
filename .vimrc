syntax on

highlight Search   ctermfg=NONE  ctermbg=magenta guifg=NONE    guibg=yellow

set noautoindent
set autowrite
set nobackup
set nobinary
set cindent
set cursorline

set noerrorbells
set expandtab
set noexrc
set fileformat=unix
set filetype=unix
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set joinspaces
set ruler
set secure
set shiftwidth=4
set shortmess=at
set noshowmatch
set nosmartindent
set tabstop=4
set textwidth=0
set ttyfast
set undolevels=200
set viminfo=
set wrapmargin=0
set wrapscan
set nowritebackup
set matchpairs+=<:>
set wildmode=list:longest
set wildmenu

"""" Don't have to press the spacebar for multi-line cmd output at start-up.
:autocmd FileReadPre,BufReadPre   * set cmdheight=4
:autocmd FileReadPost,BufReadPost * set cmdheight=3

":autocmd BufReadPost * tab ball
":autocmd BufReadPost * tabprev

"""" Always CD into the directory of the file I am currently working on.
autocmd BufEnter * lcd %:p:h

"Explorer should list file date and size.
let g:explDetailedList=1
"Explorer should list directories mixed in with file names.
let g:explDirsFirst=0

set iskeyword=a-z,A-Z,48-57,_

:nmap <silent> TR :set expandtab<CR>:%retab!<CR>
:nmap <silent> TT :set noexpandtab<CR>:%retab!<CR>

map Q :bd<CR>

" Page through a file like a pager.
set pastetoggle=<F8>

" Format (line wrap) a paragraph.
map F gq}

" An easier mapping for "redo".
map U <C-R>

" tab browsing
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>
map <F2> :tj 
map t :tj /

" Show buffer list.
map + :buffers<CR>

" Cycle forward and backward through buffers.
map <C-N> :bn<CR>
map <C-P> :bp<CR>

" Delete a buffer.
map <M-C-W> :bd<CR>

" Swap the two tick mark keys.
noremap ` '
noremap ' `

" Turns of highsearch, once I've found what I'm looking for.
map ` :nohls<C-M>

cnoremap <Tab> <C-L><C-D>

" Tag name completion
inoremap <C-]> <C-X><C-]>

" File name completion
inoremap <C-F> <C-X><C-F>

inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

" Pressing enter just adds a plain old blank line.
nmap <CR> o<ESC>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  1
endfunction

set tags=~/tags
map T :Shell ~/bin/codegrep <C-R>=expand("<cword>")<CR>

map <S-F4> :Shell grep -E "function [^(]*" <C-R>=expand("%:p")<CR><CR>
nmap <C-L><C-L> :set invnumber<CR>

