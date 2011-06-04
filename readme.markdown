#### INSTALL
Download latest checklist.vx.x.zip, extract it in your .vim directory:

    cd ~/.vim
    unzip /path/to/checklist.vx.x.zip

Add the following line to your .vimrc:

    au BufNewFile,BufRead *.chklst setf chklst 

#### CONFIGURE
If you want timestamps, add the following line to your .vimrc:

    let g:checklist_use_timestamps = 1 "Default 0

#### USAGE
When starting to make a checklist, make sure to first set the filetype using:

    :set ft=chklst

To create a checklist, use `<leader>v`.
To mark items as done use `<leader>vv` in normal mode.
To fold list items use `<leader>vv` on a parent (+) item in normal mode.

#### CHANGE_LOG
06.03.2011
  Changed the ascii box `<81>` to an asterick. (Didn't really want to though!)

06.01.2011
  Added datestamp support. 

05.28.2011
  Major Rehaul. Much faster. Added syntax file and packaged into .zip.

05.24.2011
  Rewrote entire plugin. Should be faster and easier.

05.16.2011
  Added sup­port for sub-items.

05.19.2011
  Made timestamps optional, general code cleanup.
