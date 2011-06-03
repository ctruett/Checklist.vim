#### Installation

Extract checklist.zip to your .vim folder, or manually put chklst.vim into /syntax and checklist.vim into /plugin.

Add the following lines to your .vimrc:

    " Checklist
    au BufNewFile,BufRead *.chklst setf chklst

#### Usage

    To create a checklist, use <leader>v.
    To mark items as done use <leader>vv in normal mode.
    To fold list items use <leader>vv on a parent (+) item in normal mode.

#### Notes

To dis­able timestamps, add this to your .vimrc:

    :let g:checklist_use_timestamps = 0

#### Updates
    03.06.2011 - Changed the ascii box <81> to an asterick. (Didn't really want to though!)
    01.06.2011 - Added datestamp support. 
    05.28.2011 — Major Rehaul. Much faster. Added syntax file and packaged into .zip.
    05.24.2011 — Rewrote entire plugin. Should be faster and easier.
    05.16.2011 — Added sup­port for sub-items.
    05.19.2011 — Made timestamps optional, general code cleanup.

#### Feedback

If you have benefited from this plugin in any way, please leave me a comment!
