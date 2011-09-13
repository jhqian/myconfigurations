augroup filetype
        au!
        au! BufRead,BufNewFile *.reg    set filetype=reg
        au! BufRead,BufNewFile *.dat    set filetype=dat
        au! BufRead,BufNewFile *.db     set filetype=db
augroup END
