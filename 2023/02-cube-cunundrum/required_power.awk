#! /bin/awk -f

BEGIN { result = 0 }
match($0, /Game [0-9]+: (.*)/, record) {
    required_red = 0
    required_green = 0
    required_blue = 0

    split(record[1], rounds, "; ")

    for (i in rounds) {
        match(rounds[i], /([0-9]+) red/, red)
        if (red[1] > required_red) required_red = red[1]

        match(rounds[i], /([0-9]+) green/, green)
        if (green[1] > required_green) required_green = green[1]

        match(rounds[i], /([0-9]+) blue/, blue)
        if (blue[1] > required_blue) required_blue = blue[1]
    }

    result += required_red * required_green * required_blue
}
END { print result }