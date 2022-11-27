#!zsh
DIR="${1:-.}"

ex00 () {
	./yasl_hw "$@" | tee >(cat) \
		| diff - <(<<< "Hello world") \
		&& echo ok || echo KO
}

ex01 () {
	echo "[$@]"
	[ $VERBOSE ] && ./yasl_aff_param "$@" 
	./yasl_aff_param "$@" \
		| diff - <(ruby -e 'puts ARGV' "$@") \
		&& echo ok || echo KO
}

ex02 () {
	echo -n "$@ = `./yasl_do "$1" "$2" "$3"` "
	./yasl_do "$1" "$2" "$3" \
		| diff  - <(<<< "$4") \
		&& echo ok || echo KO
}

ex03 () {
	expected="$1"
   	shift
	echo "./yasl_repeat $@"
	[ "$expected" -ne 0 ] && {
		./yasl_repeat "$@" ; [ "$?" -eq "$expected" ] && echo "error handled ok" || echo KO
		return
	}
	[ $VERBOSE ] && ./yasl_repeat "$@"  
		./yasl_repeat "$@"  \
		| diff - <(ruby -e 'n=ARGV[0].to_i; puts ARGV[1..-1].map{|s|n+=1;s*(n-1)}' "$@") \
		&& echo ok || echo KO
}

ex04 () {
	expected="$1"
   	shift
	echo -n "factorial($1) = `./yasl_fact "$@"` "
	[ "$expected" -ne 0 ] && {
		./yasl_fact "$@" ; [ "$?" -eq "$expected" ] && echo "error handled ok" || echo KO
		return
	}
		./yasl_fact "$@"  \
		| diff - <(ruby -e 'n=ARGV[0].to_i; puts (1..n).inject(:*) || 1' "$@") \
		&& echo ok || echo KO
}

ex05 () {
	expected="$1"
   	shift
	echo "./yasl_split $@"
	[ "$expected" -ne 0 ] && {
		./yasl_split "$@" ; [ "$?" -eq "$expected" ] && echo "error handled ok" || echo KO
		return
	}
	[ $VERBOSE ] && ./yasl_split "$@" 
		./yasl_split "$@" \
		| diff - <(ruby -e 'sep=ARGV[0]; puts ARGV[1].split(sep)' "$@") \
		&& echo ok || echo KO
}

ex06 () {
	[ $VERBOSE ] && ./yasl_interactive <<<"$@" 
	./yasl_interactive <<<"$@" \
		| diff - <(./yasl <<<"$@") \
		&& echo ok || echo KO
}

[ "$1" = "-v" ] && VERBOSE=1

echo "\nex00\n"
ex00
ex00 Hello World 42 "Be Cool"

echo "\nex01\n"
ex01 Hello World 42 "Be Cool"
ex01

echo "\nex02\n"
ex02 -42 + 84	42
ex02 2147483648 "-" 2147483606	42
ex02 7 "*" 6	42
ex02 4242 "/" 101	42
ex02 4242 "%" 100	42
ex02 42  "<" 100	1
ex02 100 "<" 100	0
ex02 100 "<=" 100	1
ex02 100 "<=" 0		0
ex02 4242 ">" 100	1
ex02 100 ">" 100	0
ex02 100 ">=" 100	1
ex02 100 ">=" 101	0
ex02 42  "==" 42	1
ex02 100 "==" 42	0
ex02 100 "!=" 42	1
ex02 42  "!=" 42	0

echo "\nex03\n"
ex03 0 4 "Bonjour" "how are you ?"
ex03 0 1 "************" "******" "****" "---"
ex03 0 1 a b c d e f g
ex03 1
ex03 1 1
ex03 1 a a
ex03 1 0 a
ex03 1 -1 ""

echo "\nex04\n"
ex04 1 -1
for ((i=0;i<=20;i++)) {
ex04 0 $i
}
ex04 1 21
ex04 1 ""
ex04 1 "a"

echo "\nex05\n"
ex05 0 " "  " Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
ex05 0 " "  "Lorem ipsum dolor sit amet, consectetur  adipiscing  elit."
ex05 0 ","  "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
ex05 0 "a" "ljksdpoiapoipoialljlaiuoiu"
ex05 0 "a" "a"
ex05 0 "a" ""
ex05 1 
ex05 1 "a" 
ex05 1 "" "ljksdpoiapoipoialljlaiuoiu"
ex05 1 "aeiou" "ljksdpoiapoipoialljlaiuoiu"
ex05 1 "a" "a" "a"

echo "\nex06\n"
ex06 '42
21
+ "\n" +
print'
ex06 ' "hello world" print "\n" print '
