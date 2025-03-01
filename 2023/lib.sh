#!/bin/bash

invalid_arg_msg="Invalid argument:"

function print_result
{
	GREEN=$(tput setaf 2)
	RED=$(tput setaf 1)
	NORMAL=$(tput sgr0)

	actual=$1
	expected=$2

	if [[ $actual == $expected ]]
	then
		printf "$GREEN\xE2\x9C\x94$NORMAL $actual\n"
	else
		printf "$RED\xE2\x9D\x8C$NORMAL actual: $actual, expected: $expected\n"
	fi
}

function test
{
	case $1 in
		'silver')
			actual=$(solve_silver "$silver_test_file")
			expected=$silver_expected_test_result
			;;
		'gold')
			actual=$(solve_gold "$gold_test_file")
			expected=$gold_expected_test_result
			;;
		*)
			echo $invalid_arg_msg $1
			exit 1
			;;
	esac

	print_result $actual $expected
}

function solve
{
	case $1 in
		'silver')
			echo $(solve_silver puzzle.txt)
			;;
		'gold')
			echo $(solve_gold puzzle.txt)
			;;
		*)
			echo $invalid_arg_msg $1
			exit 1
			;;
	esac
}

function run
{
	case $1 in
		'test')
			test $2
			;;
		'solve')
			solve $2
			;;
		*)
			echo $invalid_arg_msg $1
	esac
}
