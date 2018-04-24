
" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.1
"
let s:mode_list = [":", ">", "/", "?"]

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif

  if exists("##CmdlineEnter") 
    autocmd CmdlineEnter * call s:Set_nornu()
  endif
  if exists("##CmdlineLeave") 
    autocmd CmdlineLeave * call s:Set_rnu()
  endif
augroup END

function! s:Set_rnu()
  if &nu && index(s:mode_list, expand('<afile>')) != -1
    set rnu
    redraw
  endif
endfunction

function! s:Set_nornu()
  if &nu && index(s:mode_list, expand('<afile>')) != -1
    set nornu
    redraw
  endif
endfunction
