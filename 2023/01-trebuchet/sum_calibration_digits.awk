#! /bin/awk -f

{
    gsub(/[^0-9]/, "")
    result += substr($0, 1, 1) substr($0, length($0), 1)
}
END { print result }