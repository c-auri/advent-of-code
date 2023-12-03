#! /bin/awk -f

{ scheme[++number_of_lines] = $0 }
END {
    for (row in scheme) {
        while (match(scheme[row], /[0-9]+/, number) != 0) {
            if (is_part_number(RSTART, RLENGTH)) result += number[0]
            substitute = number[0]
            gsub(/./, ".", substitute)
            sub(number[0], substitute, scheme[row])
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