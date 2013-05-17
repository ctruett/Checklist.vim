" Vim syntax file
" Language: Checklist
" Maintainer: Christopher Truett
" Latest Revision: 06.04.2011
" Special Thanks: karategeek6 from stackover flow for the fold expression.

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'chklst'
endif

setlocal foldlevel=0
setlocal foldmethod=expr
setlocal foldexpr=FoldLevel(v:lnum)

function! FoldLevel(linenum)
  let linetext = getline(a:linenum)
  let level = indent(a:linenum) / 4
  if linetext =~ '^\s*[\*|×]'
    let level = 1
  endif
  return level
endfunction

exe 'normal zR'
exe 'g!/^\t[*×]/s/- /+ /g'

" Matches
syn match checkBox /^\s*\* / skipwhite
syn match checkedBox /^\s*× .*/ skipwhite
syn match plus /^+ / skipwhite
syn match minus /^- / skipwhite

hi link checkBox Type
hi link checkedBox Comment
hi link minus Statement
hi link plus PreProc
