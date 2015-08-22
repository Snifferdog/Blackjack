class Blackjack
	@hand = 0
	@dealer_hand = 0
	def initialize()
		@hand = 0
		@dealer_hand = 0
	end

	def nextRound()
		puts "Enter hit to get another card or stand to show your cards!"
		type = gets.chomp
		if type == "hit" || type == "Hit"
			rand = rand(1..14)
			if rand == 14
				puts "You got an ace, enter 1 or 11!"
				num = gets.chomp
				@hand += num if num == 1 || num == 11
			else
				@hand += rand
			end

			rand = rand(1..14)
			if @dealer_hand < 13
				if rand == 14
					if @dealer_hand > 6
						@dealer_hand += 1
					else
						@dealer_hand += 11
					end
				elsif rand == 11 || rand == 12 || rand == 13
					dealer_hand += 10
				else
					@dealer_hand += rand
				end
			end
			puts "You have #{@hand} so far!"
			if @hand > 21
				puts "You busted!"
				a =gets
				abort
			end
			if @dealer_hand > 17
				puts "Dealer busted, you win!"
				a = gets
				abort
			end
		elsif type == "stand" || type == "Stand"
			system "cls"
			puts "You hand: #{@hand}"
			puts "Dealer's hand: #{@dealer_hand}"
			puts "You won!" if @hand > @dealer_hand
			puts "You lose!" if @hand < @dealer_hand
			puts "Tie!" if @hand == @dealer_hand
			a = gets
			abort
		end

	end

	def deal
		2.times do |i|
			rand = rand(1..14)
			puts "Card #{i + 1} is #{rand}"
			if rand == 14
				puts "You got an ace, enter 1 or 11!"
				num = gets.chomp
				puts "You entered #{num}"
				if num == "1"
					@hand += 1
					puts "adding 1"
				elsif num == "11"
					puts "adding 11"
					@hand += 11
				end
			elsif rand == 11 || rand == 12 || rand == 13
				@hand += 10
			else
				@hand += rand
			end
			system "cls"
		end

		2.times do |i|
			rand = rand(1..14)
			if rand == 14
				if @dealer_hand > 6
					@dealer_hand += 1
				else
					@dealer_hand += 11
				end
			elsif rand == 11 || rand == 12 || rand == 13
				@dealer_hand += 10
			else
				@dealer_hand += rand
			end
			system "cls"
		end
		puts "You have #{@hand} so far!"
		puts "You busted!" if @hand > 21
		if @dealer_hand > 17
			puts "Dealer busted, you win!"
			a = gets
			abort
		end
	end
end

puts "Press enter to deal!"
start = gets
game = Blackjack.new()
game.deal
20.times do |i|
	game.nextRound()
end