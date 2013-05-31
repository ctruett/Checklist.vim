" Title: checklist.vim - v0.65
" Summary: Vim script for creating a checklist.
" Last Modified: 06.04.2011 07:11 AM
" Maintainer: Chris Truett <http://www.theywillknow.us>
" Description: Checklist.vim is a super-simple way to create todo lists.
"---------------------------------------------------------------------"
" Only load plugin once
if exists("manage_checklist")
	finish
endif
"---------------------------------------------------------------------"
let manage_checklist = 1
"---------------------------------------------------------------------"
if !("g:checklist_use_timestamps")
	let g:checklist_use_timestamps = 0
else 
	if g:checklist_use_timestamps == 0
		let g:checklist_use_timestamps = 0
	else
		let g:checklist_use_timestamps = 1
	endif
endif
"---------------------------------------------------------------------"
function! CheckLine(line, direction, offset)
	if a:direction == 'down'
		let l:line = getline(line(a:line) + a:offset)
	elseif a:direction == 'up'
		let l:line = getline(line(a:line) - a:offset)
	endif
	return l:line
endfunction
"---------------------------------------------------------------------"
function! MakeItem ()
	let pline = getline(line('.') - 1) 

	if line('.') == 1
		exe 'normal I+ '
	endif

	if pline =~ '^\s*$'
		exe 'normal a+ '
	endif

	if pline =~ '^+ '
		exe 'normal i  * '
	endif

	if pline =~ '^\s*\* '
		exe 'normal i* '
	endif

	if pline =~ '^  × '
		exe 'normal i* '
	endif

	return ''
endfunction "---------------------------------------------------------------------"
function! ToggleItem ()
	let cline = getline(line('.'))
	let nline = getline(line('.') + 1) 
	let n2line = getline(line('.') + 2) 

	if cline =~ '* '
		echo "Item checked."
		exe 's/* /× /'
		let time = strftime("%m.%d.%Y at %I:%M %p")
		if g:checklist_use_timestamps == 1
			exe "normal a ".time." :"
		endif
		return ""
	elseif cline =~ '× '
		echo "Item unchecked."
		if g:checklist_use_timestamps == 1
			exe 's/\× \d\{2}\.\d\{2}\.\d\{4} at \d\{2}:\d\{2} [A|P]M :/*/i'
		elseif g:checklist_use_timestamps == 0
			exe 's/× /* /i'
		endif
		return ""
	endif

	if cline =~ '^+ ' && nline !~ '^\s*$'
		if n2line !~ '^\s*$'
			exe 's/+ /- /i'
			normal jzc
			normal k
		endif
		return ""
	elseif cline =~ '^- ' && nline !~ '^\s*$'
		if n2line !~ '^\s*$'
			exe 's/- /+ /i'
			normal jzo
			normal k
		endif
		return ""
	endif
endfunction

imap <leader>ca <C-R>=MakeItem()<CR><End>
nmap <leader>cc :call ToggleItem()<CR><End>
