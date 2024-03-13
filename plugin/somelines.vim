function! SplitIntoSomeLines()
    let current_line = getline(".")
    let tokens = split(current_line, " ")
    let result_lines = []
    let line = []
    let prev_hyphen = 0
    " build result_lines
    " -から始まる文字列を読んだ時か文字列の走査が終わった時にresult_linesに行を追加する
    for token in reverse(tokens)
        if len(line) == 0
            let line = add(line,token)
            continue
        endif
        if token[0] == "-"
            if line[0][0] == "-"
                let result_lines = add(result_lines,line)
                let result_lines = add(result_lines, [token])
            else
                let head = line[0]
                let line = line[1:]
                if len(line) >= 1
                    let result_lines = add(result_lines,line)
                endif
                let result_lines = add(result_lines,[token, head])
                let line = []
            endif
            let prev_hyphen = 1
        else
            if prev_hyphen == 1
                let result_lines = add(result_lines, line)
                let line = [token]
            else
                let line = [token] + line
            endif
            let prev_hyphen = 0
        endif
    endfor
    if len(line) != 0
        let result_lines = add(result_lines, line)
    endif

    " output
    for i in range(len(result_lines))
        if i == 0
            call append(".", join(result_lines[i], " "))
        else
            call append(".", join(result_lines[i]+["\\"], " "))
       endif
    endfor

endfunction

:command! Sisl :call SplitIntoSomeLines()
