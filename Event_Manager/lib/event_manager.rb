require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'
require 'time'

def time_of_day(reg_date)
    time = Time.strptime(reg_date, "%m/%d/%y %k:%M").hour
    return time
end

def date(reg_date)
  date = Date.strptime(reg_date, "%m/%d/%y %k:%M").wday
end
def format_week_day(value)
    week_days = ["Monday", "Thuesday", "Wendsday", "Thursday", "Friday", "Saturday", "Sunday"]
    return week_days[value -1]
end

def average_value(arr)
    temp = 0
    arr.each do |num|
        temp += num.to_f
    end
    return (temp / arr.length).to_i
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone(phone_number)
    phone_number.to_s.rjust(10, "1")[0..9]
end

def clear_phone_number_for_check(phone_number)
  num_arr = [*"0".."9"]
  phone_number = phone_number.split("")
  temp = ""
  phone_number.each do |letter|
    if num_arr.include?(letter) == false
      letter = ''
      temp += letter
    else 
      temp += letter
    end
  end
  return temp
end

def check_phone_number(phone_number)
  phone_number = phone_number.to_s
  phone_number = clear_phone_number_for_check(phone_number)
  if phone_number.length < 10
    clean_phone(phone_number)
  elsif phone_number.length > 11
    clean_phone(phone_number)
  elsif phone_number.length == 11 
    if phone_number[0] == "1"
      phone_number[0] = ""
      return phone_number
    else
      clean_phone(phone_number)
    end
  else 
    return phone_number
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
peak_hour = Array.new
peak_day = Array.new

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = check_phone_number(row[:homephone])
  reg_date = row[:regdate]

  peak_day << date(reg_date)
  peak_hour << time_of_day(reg_date)
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end

puts "Average registration hour: " + average_value(peak_hour).to_s + "h"
puts "Average registration week day: " + format_week_day(average_value(peak_day))