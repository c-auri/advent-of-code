#! /bin/awk -f

{ scheme[++number_of_rows] = $0 }
END {
    for (row in scheme) {
        while (match(scheme[row], /[0-9]+/, number) != 0) {
            if (is_part_number()) result += number[0]
            substitute = number[0]
            gsub(/./, ".", substitute)
            sub(number[0], substitute, scheme[row])
        }
    }
    print result
}

function is_part_number() {
    for (i = -1; i <= 1; i++) {
        if (substr(scheme[row + i], RSTART - 1, RLENGTH + 2) ~ /[^0-9|\.]/) {
            return 1
        }
    }
}