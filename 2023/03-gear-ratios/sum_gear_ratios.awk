#! /bin/awk -f

{ scheme[++number_of_lines] = $0 }
END {
    for (row = 1; row <= number_of_lines; row++) {
        while (match(scheme[row], "*") != 0) {
            result += get_ratio(RSTART)
            sub("*", ".", scheme[row])
        }
    }
    print result
}

function get_ratio(position) {
    ratio = 1
    for (i = -1; i <= 1; i++) {
        line = scheme[row + i]
        if (is_digit(substr(line, position, 1))) {
            left = 0
            right = 0
            while (is_digit(substr(line, position - left - 1, 1))) { left++ }
            while (is_digit(substr(line, position + right + 1, 1))) { right++ }
            is_gear = ratio > 1
            ratio *= substr(line, position - left, left + right + 1)
        } else {
            if (match(substr(line, 1, position - 1), /[0-9]+$/) != 0) {
                is_gear = ratio > 1
                ratio *= substr(line, RSTART, RLENGTH)
            }
            if (match(substr(line, position + 1), /^[0-9]+/) != 0) {
                is_gear = ratio > 1
                ratio *= substr(line, position + 1, RLENGTH)
            }
        }
    }
    return is_gear ? ratio : 0
}

function is_digit(string) {
    return match(string, /[0-9]/) != 0
}