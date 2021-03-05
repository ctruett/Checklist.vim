#### INSTALL

Add the following to your .vimrc, or download and install it manually.

    Plug 'ctruett/Checklist.vim'

#### CONFIGURE
If you want timestamps, add the following line to your .vimrc:

    let g:checklist_use_timestamps = 1 "Default 0

#### USAGE
When starting to make a checklist, make sure to first set the filetype using:

    :set ft=chklst

To create a checklist, use `<leader>ca` in insert mode.  
To mark items as done use `<leader>cc` in normal mode.  
To fold list items use `<leader>cc` on a parent (+) item in normal mode.

Basic use is `<leader>ca` 'Name of checklist' `<CR>`, `<leader>ca` for subsequent list items, `<CR>`, etc.

#### CHANGE LOG
    03.05.2021 - Merged a long-outstanding pull request that updated the
                 documentation, moved ft detection into the main plugin file.
                 Thanks @TNTINC!
    06.03.2011 - Changed the ascii box <81> to an asterick. (Didn't really want
                 to though!)  
    06.01.2011 - Added datestamp support. 
    05.28.2011 - Major Rehaul. Much faster. Added syntax file and packaged into .zip.  
    05.24.2011 - Rewrote entire plugin. Should be faster and easier.  
    05.16.2011 - Added sup­port for sub-item
    05.19.2011 - Made timestamps optional, general code cleanup.
