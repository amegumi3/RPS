require "csv"

puts "こんにちわ。いずれかの番号を半角数字で入力してください"
puts  "1.新規メモを作成 2.既存のメモを編集する"
question1 = gets.chomp.to_i 

case question1 
when 1
  puts "ファイル名を入力してください"
  title = gets.chomp
  puts "メモしたい内容を入力してください"
  puts "入力が完了したらCtrl + D または Ctrl + Z をおしてください"
  text = readlines
  CSV.open("#{title}.csv","w") do |memo|
    memo << text
  end
  puts "メモを作成しました"
  puts "============================="
  CSV.foreach("#{title}.csv") do |memo|
      puts memo
  end
  puts "============================="
when 2
  puts "編集したいファイル名を入力してください"
  title = gets.chomp
  puts "============================="
  CSV.foreach("#{title}.csv") do |memo|
      puts memo
  end
  puts "=============================" 
  puts "どのように編集しますか？"
  puts "1.全部書き直す 2.メモを追加する"   
  question2 = gets.chomp.to_i
  if question2 == 1
    puts "メモしたい内容を入力してください"
    puts "入力が完了したらCtrl + D をおしてください"
    text = readlines
    CSV.open("#{title}.csv","a") do |memo|
      memo << text
    end
    puts "編集が完了しました"
  elsif question2 == 2
    puts "追加したい内容を入力してください"
    puts "入力が完了したらCtrl + D をおしてください"
    text = readlines
    CSV.open("#{title}.csv","a") do |memo|
      memo << text
    end
    puts "編集が完了しました。"
    puts "============================="
    CSV.foreach("#{title}.csv") do |memo|
      puts memo
    end
    puts "============================="
  end
else 
  puts 番号が誤っています。もう一度入力してください。
  puts 全角で入力している場合は、半角に変更したうえで入力してください。
end  
