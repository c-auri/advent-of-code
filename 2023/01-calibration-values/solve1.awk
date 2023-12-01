BEGIN { result = 0 }
{
    gsub(/[^0-9]/, "")
    $0 = substr($0, 1, 1) substr($0, length($0), 1)
    result += $0
}
END { print result }