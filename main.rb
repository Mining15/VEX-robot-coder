code = "//code generated by VEX-robot-coder (https://github.com/Mining15/VEX-robot-coder)\n"
pragma = ""
body = "task main(){\n\twhile(true){\n"

print "How many motors are there? "
i = gets.chomp.to_i

while i > 0
	print "what would you like to name the motor (only use letters and numbers)? "
	name = gets.chomp
	print "What motor port is the motor plugged into? "
	port = gets.chomp.to_i
	print "Does this motor need to be reversed (y or n)? "
	case gets.chomp
	when "n"
		case port
		when 1 or 10
			pragma << "#pragma config(Motor, #{port}, #{name}, tmotorVex393_HBridge, openLoop)\n"
		else
			pragma << "#pragma config(Motor, #{port}, #{name}, tmotorVex393_MC29, openLoop)\n"
		end
	when "y"
		case port
		when 1 or 10
			pragma << "#pragma config(Motor, #{port}, #{name}, tmotorVex393_HBridge, openLoop, reversed)\n"
		else
			pragma << "#pragma config(Motor, #{port}, #{name}, tmotorVex393_MC29, openLoop, reversed)\n"
		end
	end
	i = i - 1
end


body << "\t}\n}"
code << pragma
code << body