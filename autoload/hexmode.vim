" vim: et ts=2 sts=2 sw=2
" Vim HexMode - Enhancing Vim to support hex mode displaying/editing
" Auto load script
let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

" Set current buffer noreadonly and modified when you toggle on hex mode in current buffer.
" Restore the 'readonly' and 'modifiable' when the hex mode if off.
function! hexmode#ToggleHexMode()
  let l:bufReadonly = &l:readonly
  let l:bufModified = &l:modified

  setlocal noreadonly
  setlocal modifiable

  if !exists("b:hexOn") || !b:hexOn
    " Convert the display content to hex format.
    let b:bufFt = &l:ft
    let b:bufBin = &l:bin

    setlocal binary

    silent edit
    silent execute "%!xxd"

    setlocal bin
    setlocal ft=xxd

    let b:hexOn = 1
  else
    " Restore the display content to its original stata.
    let &l:ft = b:bufFt
    let &l:bin = b:bufBin

    silent execute "%!xxd -r"

    let b:hexOn = 0
  endif

  let &l:modified = l:bufModified
  let &l:readonly = l:bufReadonly
endfunction

" Some files are almost always binary, so it would be nice if Vim would pick " up on this
" and automatically enter the hex mode.
function! hexmode#IsBinaryCharset()
  let acFilePath = expand('<afile>:p')

  silent let charset = system('file -b -i ' .. acFilePath)->split(';')[1]
  
  let charset = trim(charset)

  let isBin = 0

  if charset ==# 'charset=binary'
    isBin = 1
  endif

  return isBin
endfunction

