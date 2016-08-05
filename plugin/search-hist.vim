" valami hehe hihi haha
" hehe1
" hehe2
" hehe3
" hehe4
" hehe5
" hehe6
" hehe7
" hehe8
"

hi SearchHist1  ctermfg=15 cterm=bold ctermbg=163
hi SearchHist2  ctermfg=15 cterm=bold ctermbg=169
hi SearchHist3  ctermfg=15 cterm=bold ctermbg=166
hi SearchHist4  ctermfg=15 cterm=bold ctermbg=174
hi SearchHist5  ctermfg=15 cterm=bold ctermbg=172
hi SearchHist6  ctermfg=15 cterm=bold ctermbg=215
hi SearchHist7  ctermfg=15 cterm=bold ctermbg=215
hi SearchHist8  ctermfg=15 cterm=bold ctermbg=215
hi SearchHist9  ctermfg=15 cterm=bold ctermbg=215
hi SearchHist10 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist11 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist12 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist13 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist14 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist15 ctermfg=15 cterm=bold ctermbg=215
hi SearchHist16 ctermfg=15 cterm=bold ctermbg=215

function! ColorLastNFromSearchHist(numHist)
  let l:n = 0
  call clearmatches()
  for l:n in range(1, a:numHist)
    call matchadd('SearchHist' . l:n, histget("search", -1 * (l:n + 1)))
  endfor
endfunction

if !exists('g:NColoredSeachHist')
  let g:NColoredSeachHist = 2
endif

au BufEnter * call ColorLastNFromSearchHist(g:NColoredSeachHist)

nnoremap <silent> * :normal! *<cr>:call ColorLastNFromSearchHist(g:NColoredSeachHist)<cr>
nnoremap <silent> # :normal! #<cr>:call ColorLastNFromSearchHist(g:NColoredSeachHist)<cr>

"" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<Bar>call ColorLastNFromSearchHist(15)<cr>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

