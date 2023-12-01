BEGIN {
    digit_by_word["one"] = 1
    digit_by_word["two"] = 2
    digit_by_word["three"] = 3
    digit_by_word["four"] = 4
    digit_by_word["five"] = 5
    digit_by_word["six"] = 6
    digit_by_word["seven"] = 7
    digit_by_word["eight"] = 8
    digit_by_word["nine"] = 9

    result = 0
}
{
    result += get_first_number($0) get_last_number($0)
}
END { print result }

function get_first_number(str) {
    match(str, /1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine/)
    number_string = substr(str, RSTART, RLENGTH)

    return is_digit(number_string) ? number_string : digit_by_word[number_string]
}

function get_last_number(str) {
    reversed = reverse(str)
    match(reversed, /1|2|3|4|5|6|7|8|9|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/)
    number_string = reverse(substr(reversed, RSTART, RLENGTH))

    return is_digit(number_string) ? number_string : digit_by_word[number_string]
}

function reverse(str) {
    reversed = ""
    for (i = length(str); i > 0; i--) { reversed = reversed substr(str,i,1) }
    return reversed
}

function is_digit(str) { return str == str + 0 }