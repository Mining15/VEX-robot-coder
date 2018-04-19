code = "//code generated by VEX-robot-coder (https://github.com/Mining15/VEX-robot-coder)\n"
pragma = ""
body = "task main(){\n\twhile(true){\n"
joystick = Array.new(2, nil)
print "How many motors are there? "
i = gets.chomp.to_i

while i > 0
	print "What would you like to name the motor (only use letters and numbers)? "
	name = gets.chomp
	print "What motor port is the motor plugged into? "
	port = gets.chomp.to_i
	print "Does this motor need to be reversed (y or n)? "
	case gets.chomp
	when "n"
		case port
		when 1 or 10
			pragma << "#pragma config(Motor, port#{port}, #{name}, tmotorVex393_HBridge, openLoop)\n"
		else
			pragma << "#pragma config(Motor, port#{port}, #{name}, tmotorVex393_MC29, openLoop)\n"
		end
	when "y"
		case port
		when 1 or 10
			pragma << "#pragma config(Motor, port#{port}, #{name}, tmotorVex393_HBridge, openLoop, reversed)\n"
		else
			pragma << "#pragma config(Motor, port#{port}, #{name}, tmotorVex393_MC29, openLoop, reversed)\n"
		end
	end


	print "Would you like to control this motor with the main controler or the partner (1 or 2)? "
	remote = gets.chomp.to_i
	print "Would you like to control it with the joy stick on the left or right (l or r)? "
	joystick[0] = gets.chomp
	print "Would you like to control it by moving the joy stick sideways or up and down (1 or 2)? "
	joystick[1] = gets.chomp.to_i

	case joystick
	when ["l", 1]
		body << "\t\tmotor(port#{port}) = vexRT(Ch4"
	when ["l", 2]
		body << "\t\tmotor(port#{port}) = vexRT(Ch3"
	when ["r", 2]
		body << "\t\tmotor(port#{port}) = vexRT(Ch2"
	when ["r", 1]
		body << "\t\tmotor(port#{port}) = vexRT(Ch1"
	end

	body << "Xmtr2" if remote == 2
	body << ");\n"
	
	i = i - 1
end


body << "\t}\n}"
code << pragma
code << body