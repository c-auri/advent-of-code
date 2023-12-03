#! /bin/awk -f

{ scheme[++number_of_rows] = $0 }
END {
    for (row in scheme) {
        while (match(scheme[row], "*") != 0) {
            result += get_ratio(RSTART)
            sub("*", ".", scheme[row])
        }
    }
    print result
}

function get_ratio(position) {
    num_of_parts = 0
    ratio = 1
    for (i = -1; i <= 1; i++) {
        line = scheme[row + i]
        if (is_digit(substr(line, position, 1))) {
            left = 0
            right = 0
            while (is_digit(substr(line, position - left - 1, 1))) { left++ }
            while (is_digit(substr(line, position + right + 1, 1))) { right++ }
            num_of_parts++
            ratio *= substr(line, position - left, left + right + 1)
        } else {
            if (match(substr(line, 1, position - 1), /[0-9]+$/) != 0) {
                num_of_parts++
                ratio *= substr(line, RSTART, RLENGTH)
            }
            if (match(substr(line, position + 1), /^[0-9]+/) != 0) {
                num_of_parts++
                ratio *= substr(line, position + 1, RLENGTH)
            }
        }
    }
    return num_of_parts > 1 ? ratio : 0
}

function is_digit(string) {
    return match(string, /[0-9]/) != 0
}