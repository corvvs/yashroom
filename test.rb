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


