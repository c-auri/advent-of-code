#!/bin/awk -f

match($0, /Game [0-9]+: (.*)/, record) {
    required["red"] = 0
    required["green"] = 0
    required["blue"] = 0

    split(record[1], rounds, "; ")

    for (i in rounds) {
        match(rounds[i], /([0-9]+) red/, red)
        if (red[1] > required["red"])
            required["red"] = red[1]

        match(rounds[i], /([0-9]+) green/, green)
        if (green[1] > required["green"])
            required["green"] = green[1]

        match(rounds[i], /([0-9]+) blue/, blue)
        if (blue[1] > required["blue"])
            required["blue"] = blue[1]
    }

    result += required["red"] * required["green"] * required["blue"]
}
END { print result }
