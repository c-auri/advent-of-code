#! /bin/awk -f

BEGIN {
    max["red"] = 12
    max["green"] = 13
    max["blue"] = 14
}
match($0, /Game ([0-9]+): (.*)/, game) {
    split(game[2], rounds, "; ")
    for (i in rounds) {
        split(rounds[i] ", ", groups, ", ")
        for (j = 1; j < length(groups); j++) {
            split(groups[j], parts, " ")
            if (parts[1] > max[parts[2]]) next
        }
    }

    result += game[1]
}
END { print result }