#! /bin/awk -f

{ scheme[++number_of_rows] = $0 }
END {
    for (row in scheme) {
        while (match(scheme[row], /[0-9]+/, number) != 0) {
            for (i = -1; i <= 1; i++) {
                if (substr(scheme[row + i], RSTART - 1, RLENGTH + 2) ~ /[^0-9|\.]/) {
                    result += number[0]
                    break
                }
            }
            substitute = number[0]
            gsub(/./, ".", substitute)
            sub(number[0], substitute, scheme[row])
        }
    }
    print result
}
