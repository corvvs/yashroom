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
        if !actual_line.match(expected_line)
          raise "l:#{l + 1} differs: expected: #{expected_line}, actual: \"#{actual_line.gsub(/\n/, "\\n")}\""
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


