#! /bin/awk -f

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
}
{
    result += get_first_number() get_last_number()
}
END { print result }

function get_first_number() {
    match($0, /[0-9]|one|two|three|four|five|six|seven|eight|nine/)
    return to_digit(substr($0, RSTART, RLENGTH))
}

function get_last_number() {
    reversed = reverse($0)
    match(reversed, /[0-9]|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/)
    return to_digit(reverse(substr(reversed, RSTART, RLENGTH)))
}

function reverse(str) {
    reversed = ""
    for (i = length(str); i > 0; i--) {
        reversed = reversed substr(str,i,1)
    }
    return reversed
}

function to_digit(number_string) {
    return number_string ~ /[0-9]/ ? number_string : digit_by_word[number_string]
}