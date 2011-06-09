" Description: .chklst Indentation Script
" Author:	Christopher Truett <chris@theywillknow.us>

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

" [-- local settings (must come before aborting the script) --]
setlocal shiftwidth=2
setlocal autoindent
setlocal indentexpr=ChecklistIndentGet(v:lnum)
setlocal indentkeys=*<Return>

function! ChecklistIndentGet(linenum)
  let cline = getline(a:linenum) 
  let pline = getline(a:linenum - 1) 
  if cline =~ '^+ '
    return 0
  elseif cline =~ '^[*×] '
    return &sw
  elseif cline =~ '^  [*×] '
    return &sw
  else
    return 0
  endif
endfunction
" [-- EOF <runtime>/indent/chklst.vim --]
