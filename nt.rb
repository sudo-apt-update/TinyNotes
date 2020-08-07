#TinyNotes by jinrenmass, written 8/6/20

t = Time.now

print "Would you like to create a new file, open a previous file, or add to the base file? If you would like a new file, simply type the name. Otherwise, type base.\n> "
input = gets.chomp.downcase

if input == "base"
	file = File.open("basenotes.txt", "a+")
    print "\nYou have selected the base file. Type your note: \n> "
    text = gets
	et = Time.now
    file.write("#{t.strftime("[%m/%d/%y]  %I:%M:%S %p")} ~ #{et.strftime("%I:%M:%S %p")} - #{text}")
    file.close
	puts "\nGoodbye!"
else
    if File.exist? "#{input}.txt"
        print "\nYou have selected #{input}.txt. Type your note: \n> "
    else
        print "\nYou have created a new file #{input}.txt. Type your note: \n> "
    end
    file = File.open("#{input}.txt", "a+")
    text = gets
	et = Time.now
    file.write("#{t.strftime("[%m/%d/%y]  %I:%M:%S %p")} ~ #{et.strftime("%I:%M:%S %p")} - #{text}")
    file.close
	puts "\nGoodbye!"
end
