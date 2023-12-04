#! /bin/awk -f

match($0, /.*: ([ *[0-9]+ *]*) \| ([ *[0-9]+ *]*)/, sides) {
    split(sides[2], player_numbers, " ")
    split(sides[1], winning_numbers, " ")
    for (i in winning_numbers)
        winning_dictionary[winning_numbers[i]] = ""
}
{
    for (i in player_numbers) {
        if (player_numbers[i] in winning_dictionary) {
            number_of_matches++
        }
    }
    if (number_of_matches > 0)
        result += 2 ^ (number_of_matches - 1)
}
{
    delete player_numbers
    delete winning_numbers
    delete winning_dictionary
    number_of_matches = 0
}
END { print result }