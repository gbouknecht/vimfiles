au BufReadPre ~/my-wiki/*.txt
        \ set filetype=help |
        \ set iskeyword=!-~,^*,^\|,^\",192-255

au BufWritePost ~/my-wiki/*.txt
        \ helptags ~/my-wiki
