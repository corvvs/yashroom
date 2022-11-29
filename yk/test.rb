TEXT_RED = "\e[31m"
TEXT_GREEN = "\e[32m"
TEXT_RESET = "\e[m"

Programs = [
  {
    exe: "yasl_hw",
    cases: [
      {
        name: "basic",
        in: [],
        out: [/^Hello world\n$/],
      },
      {
        name: "with an arg",
        in: ["apple"],
        out: [/^Hello world\n$/],
        },
      {
        name: "with two args",
        in: ["apple", "banana"],
        out: [/^Hello world\n$/],
      },
    ],
  },

  {
    exe: "yasl_aff_param",
    cases: [
      {
        name: "no arg",
        in: [],
        out: [],
      },
      {
        name: "with an arg",
        in: ["apple"],
        out: ["apple"],
      },
      {
        name: "with a blank arg",
        in: [""],
        out: [""],
      },
      {
        name: "with two args",
        in: ["apple", "banana"],
        out: ["apple", "banana"],
      },
      {
        name: "with separated args",
        in: ["apple", "banana latte", "chai    latte"],
        out: ["apple", "banana latte", "chai    latte"],
      },
    ],
  },

  {
    exe: "yasl_do",
    cases: [
      {
        name: "0 + 0",
        in: [0, "+", 0],
        out: ["0"],
      },
      {
        name: "100 + 0",
        in: [100, "+", 0],
        out: ["100"],
      },
      {
        name: "1 + 100",
        in: [1, "+", 100],
        out: ["101"],
      },
      {
        name: "-100 + 100",
        in: [-100, "+", 100],
        out: ["0"],
      },
      {
        name: "0 - 0",
        in: [0, "-", 0],
        out: ["0"],
      },
      {
        name: "100 - 0",
        in: [100, "-", 0],
        out: ["100"],
      },
      {
        name: "0 - 100",
        in: [0, "-", 100],
        out: ["-100"],
      },
      {
        name: "1.2 - 9.8",
        in: [1.2, "-", 9.8],
        out: [/^-8.60*$/],
      },
      {
        name: "1234 * 0",
        in: [1234, "*", 0],
        out: ["0"],
      },
      {
        name: "1234 * 0",
        in: [1234, "*", 0],
        out: ["0"],
      },
      {
        name: "1234 * 1",
        in: [1234, "*", 1],
        out: ["1234"],
      },
      {
        name: "3.14 * 10.0",
        in: [3.14, "*", 10.0],
        out: [/^31.40*$/],
      },
      {
        name: "10 / 0",
        in: [10, "/", 0],
        out: [],
        exit: 136, # FPE
      },
      {
        name: "10 / 1",
        in: [10, "/", 1],
        out: ["10"],
      },
      {
        name: "10 / 2",
        in: [10, "/", 2],
        out: ["5"],
      },
      {
        name: "10 / 3",
        in: [10, "/", 3],
        out: ["3"],
      },
      {
        name: "10 / 4",
        in: [10, "/", 4],
        out: ["2"],
      },
      {
        name: "10 / 5",
        in: [10, "/", 5],
        out: ["2"],
      },
      {
        name: "10 / 9.0",
        in: [10, "/", 9.0],
        out: [/^1.11+$/],
      },
      {
        name: "21 % 1",
        in: [21, "%", 1],
        out: ["0"],
      },
      {
        name: "21 % 2",
        in: [21, "%", 2],
        out: ["1"],
      },
      {
        name: "21 % 3",
        in: [21, "%", 3],
        out: ["0"],
      },
      {
        name: "21 % 4",
        in: [21, "%", 5],
        out: ["1"],
      },
      {
        name: "21 % 5",
        in: [21, "%", 5],
        out: ["1"],
      },
      {
        name: "21 % 6",
        in: [21, "%", 6],
        out: ["3"],
      },
      {
        name: "21 % 7",
        in: [21, "%", 7],
        out: ["0"],
      },
      {
        name: "21 % 8",
        in: [21, "%", 8],
        out: ["5"],
      },
      {
        name: "1.0 > 0.99999",
        in: [1.0, ">", 0.99999],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 == 0.99999",
        in: [1.0, "==", 0.99999],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 < 0.99999",
        in: [1.0, "<", 0.99999],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 >= 0.99999",
        in: [1.0, ">=", 0.99999],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 >= 1.0",
        in: [1.0, ">=", 1.0],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 >= 1.00000001",
        in: [1.0, ">=", 1.00000001],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 >= 0.99999",
        in: [1.0, "<=", 0.99999],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 <= 1.0",
        in: [1.0, "<=", 1.0],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 <= 1.00000001",
        in: [1.0, "<=", 1.00000001],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 == 0.99999",
        in: [1.0, "==", 0.99999],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 == 1.0",
        in: [1.0, "==", 1.0],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 == 1.00000001",
        in: [1.0, "==", 1.00000001],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 != 0.99999",
        in: [1.0, "!=", 0.99999],
        out: [/^1(.0+)?$/],
      },
      {
        name: "1.0 != 1.0",
        in: [1.0, "!=", 1.0],
        out: [/^0(.0+)?$/],
      },
      {
        name: "1.0 != 1.00000001",
        in: [1.0, "!=", 1.00000001],
        out: [/^1(.0+)?$/],
      },
    ],
  },

  {
    exe: "yasl_repeat",
    cases: [
      {
        name: "ok_basic1",
        in: [1, "a"],
        out: ["a"],
      },
      {
        name: "ok_basic2",
        in: [2, "a"],
        out: ["aa"],
      },
      {
        name: "ok_basic3",
        in: [2, "a", "b", "c"],
        out: ["aa", "bbb", "cccc"],
      },
      {
        name: "ok_blank",
        in: [2, "a", "", "c"],
        out: ["aa", "", "cccc"],
      },
      {
        name: "ok_pdf_1",
        in: [4, "Bonjour", "how are you ?"],
        out: [
          "BonjourBonjourBonjourBonjour",
          "how are you ?how are you ?how are you ?how are you ?how are you ?",
        ],
      },
      {
        name: "ok_pdf_2",
        in: [1, "************", "******", "****", "---"],
        out: [
          "************",
          "************",
          "************",
          "------------",
        ],
      },
      {
        name: "ko_zero",
        in: [0, "apple"],
        exit: 1,
      },
      {
        name: "ko_blank",
        in: ["", "apple"],
        exit: 1,
      },
      {
        name: "ko_negative",
        in: [-1, "apple"],
        exit: 1,
      },
      {
        name: "ko_negative2",
        in: [-98, "apple"],
        exit: 1,
      },
      {
        name: "ko_non_numeric",
        in: ["apple", "banana"],
        exit: 1,
      },
      {
        name: "ko_no_arg",
        in: [],
        exit: 1,
      },
      {
        name: "ko_no_value",
        in: [100],
        exit: 1,
      },
    ],
  },

  {
    exe: "yasl_fact",
    cases: [
      {
        name: "ok_0",
        in: [0],
        out: ["1"],
      },
      {
        name: "ok_1",
        in: [1],
        out: ["1"],
      },
      {
        name: "ok_2",
        in: [2],
        out: ["2"],
      },
      {
        name: "ok_3",
        in: [3],
        out: ["6"],
      },
      {
        name: "ok_4",
        in: [4],
        out: ["24"],
      },
      {
        name: "ok_5",
        in: [5],
        out: ["120"],
      },
      {
        name: "ok_9",
        in: [9],
        out: ["362880"],
      },
      {
        name: "ok_10",
        in: [10],
        out: ["3628800"],
      },
      {
        name: "ok_19",
        in: [19],
        out: ["121645100408832000"],
      },
      {
        name: "ok_20",
        in: [20],
        out: ["2432902008176640000"],
      },
      {
        name: "ko_overflow1",
        in: [21],
        exit: 1,
      },
      {
        name: "ko_overflow2",
        in: [22],
        exit: 1,
      },
      {
        name: "ko_overflow3",
        in: [999999],
        exit: 1,
      },
      {
        name: "ko_noarg",
        in: [],
        exit: 1,
      },
      {
        name: "ko_negative",
        in: [-1],
        exit: 1,
      },
      {
        name: "ko_float",
        in: [1.0],
        exit: 1,
      },
      {
        name: "ko_non_numeric1",
        in: ["apple"],
        exit: 1,
      },
      {
        name: "ko_non_numeric2",
        in: ["12apple"],
        exit: 1,
      },
      {
        name: "ko_non_numeric3",
        in: ["apple3"],
        exit: 1,
      },
      {
        name: "ko_blank",
        in: [""],
        exit: 1,
      },
    ],
  },

  {
    exe: "yasl_split",
    cases: [
      {
        name: "ok_pdf1",
        in: ["a", "ljksdpoiapoipoialljlaiuoiu"],
        out: [
          "ljksdpoi",
          "poipoi",
          "lljl",
          "iuoiu",
        ],
      },
      {
        name: "ok_pdf2",
        in: [" ", " Lorem ipsum dolor sit amet, consectetur adipiscing elit. "],
        out: [
          "Lorem",
          "ipsum",
          "dolor",
          "sit",
          "amet,",
          "consectetur",
          "adipiscing",
          "elit.",
        ],
      },
      {
        name: "ok_no_separator",
        in: ["X", "applepie is very sweet."],
        out: ["applepie is very sweet."],
      },
      {
        name: "ok_s_is_blank",
        in: ["X", ""],
        out: [],
      },
      {
        name: "ok_all_separator",
        in: ["x", "xxxxxxxxxxx"],
        out: [],
      },
      {
        name: "ok_single",
        in: ["x", "xyx"],
        out: ["y"],
      },
      {
        name: "ok_an_separator",
        in: ["x", "x"],
        out: [],
      },
      {
        name: "ko_more_args",
        in: ["x", "apple", "banana"],
        exit: 1,
      },
      {
        name: "ko_no_args",
        in: [],
        exit: 1,
      },
      {
        name: "ko_an_arg",
        in: ["x"],
        exit: 1,
      },
      {
        name: "ko_blank_separator",
        in: ["", "apple"],
        exit: 1,
      },
      {
        name: "ko_long_separator",
        in: ["ba", "banana"],
        exit: 1,
      },
      {
        name: "ko_character?1",
        in: ["b ", "banana"],
        exit: 1,
      },
      {
        name: "ko_character?2",
        in: [" b ", "banana"],
        exit: 1,
      },
      {
        name: "ok_long",
        in: ["x", "banana" * 1234],
        out: ["banana" * 1234],
      },
    ],
  },

  {
    exe: "mandel",
    cases: [
      {
        name: "ok_32_32",
        in: [32, 32],
      },
      {
        name: "ok_80_80",
        in: [80, 80],
      },
      # {
      #   name: "ok_128_128",
      #   in: [128, 128],
      # },
      {
        name: "ok_1_2",
        in: [1, 2],
      },
      {
        name: "ko_0_32",
        in: [0, 32],
        exit: 1,
      },
      {
        name: "ko_32_0",
        in: [32, 0],
        exit: 1,
      },
      {
        name: "ko_0_0",
        in: [0, 0],
        exit: 1,
      },
      {
        name: "ko_-32_32",
        in: [-32, 32],
        exit: 1,
      },
      {
        name: "ko_32_-32",
        in: [32, -32],
        exit: 1,
      },
      {
        name: "ko_32.0_32",
        in: [32.0, 32],
        exit: 1,
      },
      {
        name: "ko_a_b",
        in: ["a", "b"],
        exit: 1,
      },
      {
        name: "ko_no_arg",
        in: [],
        exit: 1,
      },
      {
        name: "ko_an_arg",
        in: [32],
        exit: 1,
      },
      {
        name: "ko_3_args",
        in: [32, 32, 32],
        exit: 1,
      },
      {
        name: "ko_blank1",
        in: ["", 32],
        exit: 1,
      },
      {
        name: "ko_blank2",
        in: ["", ""],
        exit: 1,
      },
    ],
  },

  {
    exe: "bf3",
    cases: [
      {
        name: "FizzBuzz",
        in: ["++++++[->++++>>+>+>-<<<<<]>[<++++>>+++>++++>>+++>+++++>+++++>>>>>>++>>++<
          <<<<<<<<<<<<<-]<++++>+++>-->+++>->>--->++>>>+++++[->++>++<<]<<<<<<<<<<[->
          -[>>>>>>>]>[<+++>.>.>>>>..>>>+<]<<<<<-[>>>>]>[<+++++>.>.>..>>>+<]>>>>+<-[
          <<<]<[[-<<+>>]>>>+>+<<<<<<[->>+>+>-<<<<]<]>>[[-]<]>[>>>[>.<<.<<<]<[.<<<<]
          >]>.<<<<<<<<<<<]"],
        out: (1..100).map{ |n|
          n % 15 == 0 ? "FizzBuzz" : n % 3 == 0 ? "Fizz" : n % 5 == 0 ? "Buzz" : "#{n}"
        },
      },
      {
        name: "Squares",
        in: ["++++[>+++++<-]>[<+++++>-]+<+[>[>+>+<<-]++>>[<<+>>-]>>>[-]++>[-]+>>>+[[-]++++++>>>]<<<[[<++++++++<++>>-]+<.<[>----<-]<]<<[>>>>>[>>>[-]+++++++++<[>-<-]+++++++++>[-[<->-]+[<<<]]<[>+<-]>]<<-]<<-]"],
        out: (0..100).map{ |n| "#{n ** 2}" },
      },
    ],
  },
]

def launch(script_name, cases)
  kos = 0
  cases.each_with_index{ |c, i|
    begin
      print "#{c[:name]} ... "
      # 実行
      result = (`./yasl #{script_name} #{c[:in].map{ |a| "\"#{a}\""}.join(" ")}; echo $?`).split(/(?<=\n)/)
      # 終了ステータスだけを分離
      actual_exit = result.pop.to_i

      # 出力を比較
      expected_lines = c[:out]
      if expected_lines
        result.each_with_index { |actual_line, l|
          expected_line = expected_lines[l]
          # 出力行数 > 想定行数 の場合のエラー
          if !expected_line 
            raise "result is shorter than expected!!"
          end
          if expected_line.is_a?(String)
            # 文字列比較
            actual_line = actual_line.chomp
            if actual_line != expected_line
              raise "l:#{l + 1} differs: expected: #{expected_line}, actual: \"#{actual_line.gsub(/\n/, "\\n")}\""
            end
          else
            # 正規表現マッチ
            if !actual_line.match(expected_line)
              raise "l:#{l + 1} differs: expected: #{expected_line}, actual: \"#{actual_line.gsub(/\n/, "\\n")}\""
            end
          end
        }
        # 出力行数 < 想定行数 の場合のエラー
        if result.size < expected_lines.size
          raise "result is longer than expected!!"
        end
      end

      # 終了ステータス
      expected_exit = c[:exit] || 0
      if expected_exit != actual_exit
        raise "exit status differs: expected: #{expected_exit}, actual: #{actual_exit}"
      end
      puts "#{TEXT_GREEN}ok#{TEXT_RESET}"

    rescue => e
      puts "#{TEXT_RED}KO: #{e}#{TEXT_RESET}"
      kos += 1
    end
  }
  if kos == 0
    puts "#{TEXT_GREEN}** #{script_name} is ALL GREEN **#{TEXT_RESET}"
  else
    puts "#{TEXT_RED}!! #{script_name} has #{kos} KO!!#{TEXT_RESET}"
  end
  kos
end


given, _ = ARGV

Programs.each_with_index{ |prog, i|
  script_name = prog[:exe]
  next if given && given != script_name

  puts "[#{script_name}]"
  launch(prog[:exe], prog[:cases])
}


