set nocompatible               " be iMproved
filetype off                   " required!

" -------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'spolu/dwm.vim'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" -------------------------------------------------------------------------

" Add a red column at 80 characters
"hi ColorColumn guibg=#2d0000
set colorcolumn=100

" set foldmethod=indent

" Tab settings
set ts=2 sts=2 sw=2 expandtab"
"
function! RunPry (path)
  let target = g:tmux_sessionname . ":Pry.0"
  let command = substitute("\nload \"" . a:path . "\"\n", "'", "'\\\\''", 'g')
  call system("tmux set-buffer '" . command . "'" )
  call system("tmux paste-buffer -t " . target)
  call system("tmux select-window -t " . g:tmux_sessionname . ":Pry")
endfunction

function! RunCommand ()
  let target = g:tmux_sessionname . ":2.0"
  let command = substitute("\n!!\n", "'", "'\\\\''", 'g')
  call system("tmux set-buffer '" . command . "'" )
  call system("tmux paste-buffer -t " . target)
  call system("tmux select-window -t " . g:tmux_sessionname . ":2")
endfunction

syntax on
set t_Co=256
set bg=dark
color jellybeans
set listchars=tab:▸\ ,eol:¬
set list
set nu

" Command-T
set wildignore+=coverage,.svn       " Don't show certain directories

map <S-h> gT
map <S-l> gt
map tn :tabnew<CR>
map td :tabclose<CR>

" Ignore syntax highlighting on txt files
au BufRead,BufNewFile *.txt setfiletype ignored

" Setup our primary tmux session
let g:tmux_sessionname = system("tmux list-sessions | grep '(attached)' | sed  's/\:.*//' | tr -d '\n'")
let g:VimuxHeight = 30

map <Leader>ri :call VimuxInspectRunner()<CR>
map <Leader>rq :call VimuxCloseRunner()<CR>
map <Leader>rs :call VimuxInterruptRunner()<CR>
map <Leader>rf :w<bar>:RunRubyFocusedTest<CR>
map <Leader>rb :w<bar>:RunAllRubyTest<CR>
map <Leader>rl :w<bar>:call VimuxRunLastCommand()<CR>
map <Leader>rp :w<bar>:call RunPry(expand('%'))<CR>
map <Leader>rc :w<bar>:call RunCommand()<CR>
" map <S-k> :call VimuxScrollUpInspect()<CR>
" map <S-j> :call VimuxScrollDownInspect()<CR>

"nmap <silent> <C-h> :wincmd h<CR>
"nmap <silent> <C-j> :wincmd j<CR>
"nmap <silent> <C-k> :wincmd k<CR>
"nmap <silent> <C-l> :wincmd l<CR>

" Toggle paste mode using <F2>
noremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Only remove trailing white spaces when compiled with support for
" autocommands
if has("autocmd")
  autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
endif

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  
  " Do the strip
  %s/\s\_$//e

  " Restore our settings
  let @/=_s
  call cursor(l, c)
endfunction

map <silent> <Leader>wB :call MyRsyncToBancroft()<CR>
function! MyRsyncToBancroft()
  silent execute "! rsync -avz " . fnamemodify('.',':p:h') . " nwertman@bancroft:/tmp/testing 2>&1 >/dev/null &" | redraw!
endfunction

" Syntastic Config
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_auto_loc_list=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Folding stuff
nnoremap <Space> za

function! RubyMethodFold(line)
  let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
  let line_is_def = getline(a:line) =~ '\s*def '
  return line_is_method_or_end || line_is_def
endfunction

set foldexpr=RubyMethodFold(v:lnum)
