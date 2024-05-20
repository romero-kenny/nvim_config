" filetype file for typst

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.typ	setfiletype typst
augroup END
