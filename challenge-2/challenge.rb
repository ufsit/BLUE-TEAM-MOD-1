require 'socket'
port = 4000

#our file things
part1 = File.new("part1","r")
part2 = File.new("part2","r")
part3 = File.new("part3","r")

$s1 = part1.read
$s2 = part2.read
$s3 = part3.read

server = TCPServer.open(31337)

def orderWool(client)
    client.puts "How much wool would you like to order? (Maximum 1337 per customer!)"
    foo = client.gets().to_i;
    
    if(foo >1337)
        client.puts "WHAT HAVE YOU DONE!!!!"
        client.gets
        client.print $s1
    else
        client.puts "Thank you your order has been placed!"
    end
end

def complaint(client)
    client.puts("*You hear a click on the other side of the phone*")
    client.gets
    client.puts("###NOW TRANSFERING YOU TO ONE OF OUR WOOL SPECIALIST###")
    client.puts("BBBAAAAAAAAAAAAaaaaaa? BBAAAAA Baa")
    client.gets()
    client.puts("Baaaaaaaaaaaa ba bbbaaaaaa ba ba")
    client.gets()
    client.puts("BA BA baaaa BA ba ba")
    client.puts("*The (person?) on the other side of the phone bangs on their desk*")
    client.gets()
    client.print $s2
end

def takeit(client)
    client.puts("So you just want the key huh?")
    client.gets
    client.puts("And you don't want anymore challenges about sheep?")
    client.gets
    client.puts("Well thats just tooooo BAAAAAaaad")
    client.gets
    client.puts("See what I did there")
    client.gets
    client.puts("Time to make your terminal go funny again!")
    client.gets
    client.print $s3
end



loop {
    Thread.start(server.accept) do |client|
        client.puts("Welcome to the wool processing mainframe!");
        client.puts("I would like to:")
        client.puts("1.Order some wool")
        client.puts("2.File a complaint with HR")
        client.puts("3.Solve this challenge already")
        
        while true
            foo = client.gets
            foo = foo.strip

            if(foo == "1")
                orderWool(client)
            end
            if(foo == "2")
                complaint(client)
            end
            if(foo == "3")
                takeit(client)
            end
        end

        client.close
    end
}
