require 'ruby-progressbar'

print "Enter the approx time in minutes or hours to be tracked: "
answer = gets.chomp.strip.gsub(",", ".").to_f
countdown = (answer < 11 ? answer * 60 * 2 : answer * 2).to_i
ti = Time.new

greetings = [
	"New day, new opportunities.",
	"Ready, set, go!",
	"Time to tackle the day",
	"Let's make today count",
	"Bring on the challenges",
	"Onward and upward",
	"The day is yours for the taking",
	"Start strong, finish stronger",
	"Another day to make a difference",
	"Embrace the possibilities",
	 "Seize the day!",
	"Time to make things happen",
	"Let's crush it today",
	"Rise and grind",
	"Today is a gift, let's use it wisely"
]	

puts `clear`
puts "Initiated at: #{ti.strftime('%k:%M')}"
puts ti.strftime('%A, %d of %B')
puts ""
puts "Tracking: #{answer < 11 ? answer.to_s + " h" : answer.to_s + " min"}"
puts ""
puts greetings.sample
puts ""

pgb = ProgressBar.create(	:format => '%t <%B> [%e ] %P%%',
							:title => ' Work',
							total: countdown)							

motivational_quotes = [
	"I find that the harder I work, the more luck I seem to have.",
	"Don't watch the clock; do what it does. Keep going.",
	"Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
	"You don't have to be great to start, but you have to start to be great.",
	"Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got this.",
	"It does not matter how slowly you go as long as you do not stop.",
	"Believe in yourself, push your limits, experience life, conquer your goals, and be happy.",
	"Success is not final, failure is not fatal: it is the courage to continue that counts.",
	"Believe in yourself, and the rest will fall into place. Have faith in your own abilities, work hard, and there is nothing you cannot accomplish.",
	"The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
	"Believe in yourself, take action, and you can achieve anything.",
	"The future belongs to those who believe in the beauty of their dreams.",
	"Believe in yourself and your abilities. That's the only way to get where you want to go.",
	"Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.",
	"Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
	"The only place where success comes before work is in the dictionary.",
	"Believe in yourself and you will be unstoppable.",
	"You're good. Keep it up.",
	"The journey of a thousand miles begins with one step.",
	"Believe in yourself, and the rest will fall into place. Have faith in your own abilities, work hard, and there is nothing you cannot accomplish."
]

messages = {
	friday: %W[Sextou,\ jovem\ trabalhador!]
}

quote_count = 0

countdown.times do
	pgb.increment
	sleep(30)
	left = pgb.total - pgb.progress
	real_progress = (pgb.progress / pgb.total.to_f * 100).round
	
	if real_progress == 5 && quote_count == 0
		quote_count += 1
		pgb.log "You got this."		
	elsif real_progress == 20 && quote_count == 1
		quote_count += 1
		pgb.log motivational_quotes.sample
	elsif real_progress == 40 && quote_count == 2
		quote_count += 1
		pgb.log motivational_quotes.sample
	elsif real_progress == 50 && quote_count == 3
		quote_count += 1
		pgb.log ""
		pgb.log "Believe you can! You're halfway there."
		pgb.log ""
	elsif real_progress == 65 && quote_count == 4
		quote_count += 1
		pgb.log motivational_quotes.sample
	elsif real_progress == 80 && quote_count == 5
		quote_count += 1
		pgb.log motivational_quotes.sample
	elsif real_progress == 90 && quote_count == 6
		quote_count += 1
		pgb.log motivational_quotes.sample
	elsif real_progress == 97 && quote_count == 7
		quote_count += 1
		pgb.log "ALMOST THERE!"
	end
	
	if Time.now.strftime("%k:%M") == '10:01'
		pgb.log "Did you already have a snack?? Don't starve to death."
	elsif Time.now.strftime("%k:%M") == '11:45'
		pgb.log ""
		pgb.log "LUNCH TIME!"
		pgb.log ""
	end
	
	if left == 0
		pgb.log "YOU MADE IT!!! See you next time ;)"
		pgb.log "" if ti.monday?
		pgb.log "Zum Deutschkurs!" if ti.tuesday?
		pgb.log "" if ti.wednesday?
		pgb.log "Zum Deutschkurs!" if ti.thursday?
		pgb.log "Have a nice weekend :D" if ti.friday?
	end
end

puts ""
tf = Time.new
puts "Time elapsed: #{((tf - ti) / 60 / 60).round(1)} h"

# Ideas for new features

# :73 Think of better way because when I wanna add new, I have to change everything that comes after that is hard coded.
