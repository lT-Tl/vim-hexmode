" vim: et ts=2 sts=2 sw=2
" Vim HexMode - Enhancing Vim to support hex mode displaying/editing
" Plugin script
if &cp || v:version < 702 || exists("g:loaded_hexmode")
  finish
endif

let g:loaded_hexmode = 1

command -bar ToggleHexMode call hexmode#ToggleHexMode()

" Automatically enter hex mode when the charset of file is binary
" use `vim -b` to enter binary mode
if has("autocmd")
  augroup HexFormat
    au!

    au BufReadPost * 
          \ if exists('b:hexOn') && b:hexOn |
          \   let b:hexOn = 0 |
          \ endif

    au BufReadPost *
          \ if &binary | call hexmode#ToggleHexMode() | endif

    au BufReadPost *
          \ if hexmode#IsBinaryCharset() != 0 | call hexmode#ToggleHexMode() | endif

    au BufUnload *
          \ if getbufvar(expand('<afile>'), 'hexOn') == 1 | 
          \   call setbufvar(expand('<afile>'), 'hexOn', 0) |
          \ endif

  augroup END
endif


