require 'set'
lines = []
registers = Set.new
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    lines.push(line.gsub(/inc/, "+=").gsub(/dec/, "-="))
    register = line.split()[0]
    registers.add(register) unless register.nil?
  end
end

File.open("out.rb", "w") do |f|
  registers.each do |register|
    f.puts "#{register} = 0"
  end
  f.puts "all_values = []"
  
  lines.each do |line|
    register = line.split()[0]
    f.puts line
    f.puts "all_values.push(#{register})"
  end

    f.puts "puts all_values.max"
end
