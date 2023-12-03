#! /bin/awk -f

{ scheme[++line_number] = $0 }
END {
    for (row = 1; row <= line_number; row++) {
        while (match(scheme[row], /[0-9]+/) != 0) {
            number = substr(scheme[row], RSTART, RLENGTH)
            if (is_part_number(RSTART, RLENGTH)) result += number
            remove(number)
        }
    }
    print result
}

function is_part_number(start, len) {
    for (i = -1; i <= 1; i++) {
        if (match(substr(scheme[row + i], start - 1, len + 2), /[^0-9|\.]/)) {
            return 1
        }
    }
    return 0
}

function remove(number) {
    substitute = ""
    for (i = 0; i < length(number); i++) substitute = substitute "."
    sub(number, substitute, scheme[row])
}