TEXT_RED = "\e[31m"
TEXT_GREEN = "\e[32m"
TEXT_RESET = "\e[m"

arg = {
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
}

def launch(script_name, cases)
  kos = 0
  puts "[#{script_name}]"
  cases.each_with_index{ |c, i|
    begin
      print "#{c[:name]} ... "
      result = (`./yasl #{script_name} #{c[:in].join(" ")}; echo $?`).split(/(?<=\n)/)
      actual_exit = result.pop.to_i
      result.each_with_index { |actual_line, l|
        expected_line = c[:out][l]
        if !expected_line 
          raise "result is shorted than expected!!"
        end
        if !actual_line.match(expected_line)
          raise "l:#{l + 1} differs: expected: #{expected_line}, actual: \"#{actual_line.gsub(/\n/, "\\n")}\""
        end
      }
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

launch(arg[:exe], arg[:cases])

