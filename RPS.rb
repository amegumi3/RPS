class Rps
  def initialize(number)
    @hands = ["グー","チョキ","パー"]
    @direction = ["上","下","左","右"]
    @opponent = @hands[rand(3)] 
    @your = @hands[number]
    @number = number 
  end

  def finish 
    puts "わかりました。また遊びましょう。"
    exit
  end 

  def call
    puts "ぽい！"
    puts "-------------------------------"
    puts "相手は#{@opponent}を出しました"
    puts "あなたは#{@your}を出しました"
    puts "-------------------------------"
    if @opponent == @your
    puts "あいこで..."
    draw()
    else 
      result1()
    end 
  end

  #２回目以降じゃんけんをする場合の処理
  def draw
    puts "0(グー) 1(チョキ) 2(パー) 3(戦うのをやめる)"
    @number = gets.chomp.to_i
    if !(0 <= @number && @number <= 3)
      puts "入力エラー：入力が間違っています。0 から 2 の半角数字を入力してください。"  
      draw()
    elsif @number == 3
      finish()
    else 
      @your = @hands[@number]
      @opponent = @hands[rand(3)] 
      call()
    end
  end

  #じゃんけんの勝敗判定
  def result1
    case @your
    when  "グー"
      if @opponent == "チョキ"
        win_ver()
      elsif @opponent == "パー"
        lose_ver()
      end   
    when "チョキ"
      if @opponent == "グー"
        lose_ver()
      elsif @opponent == "パー"
        win_ver()
      end 
    when "パー"
      if @opponent == "グー"
        win_ver()
      elsif @opponent == "チョキ"
        lose_ver()
      end
    end
  end
  
  #じゃんけんに勝った場合
  def win_ver
    puts "あっち向いて..."
    puts "0.上 1.下 2.左 3.右 4.戦いをやめる"
    @number = gets.chomp.to_i
    if !(0 <= @number && @number <= 4 )
      puts "入力が間違っています。0 から 4 の半角数字を入力してください。"
      win_ver()
    elsif @number == 4
     finish()
    end    
    @opponent = @direction[rand(3)]
    @you = @direction[@number]
    puts "ほい！"
    puts "-------------------------------"
    puts "あなたは#{@you}を指しました。"
    puts "相手は#{@opponent}を向きました"
    puts "-------------------------------"
    if @you == @opponent
      puts "あなたの勝ちです!"
    else
      puts "じゃんけん..."
      draw()
    end    
  end

  #じゃんけんに負けた場合
  def lose_ver
    puts "-------------------------------"
    puts "あっち向いて..."
    puts "0.上 1.下 2.左 3.右 4.戦いをやめる"
    @number = gets.chomp.to_i
    @opponent = @direction[rand(3)]
    if !(0 <= @number && @number <= 4 )
      puts "入力が間違っています。0 から 4 の半角数字を入力してください。"
      win_ver()
    elsif @number == 4
      finish()
    end 
    @you = @direction[@number]
    puts "ほい！"
    puts "-------------------------------"
    puts "相手は#{@opponent}を指しました"
    puts "あなたは#{@you}を向きました。"
    puts "-------------------------------"
    if @you == @opponent
      puts "残念！ あなたの負けです。"
    else
    puts "-------------------------------"
    puts "じゃんけん..."
    puts "0(グー) 1(チョキ) 2(パー)"
      draw()
    end    
  end
end  

puts "じゃんけん..."
puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
yourhand = gets.chomp.to_i
if 0 <= yourhand && yourhand <= 2
  you = Rps.new(yourhand)
  you.call()
elsif yourhand == 3
  puts "残念です。また遊びましょう。"
else
  puts "入力が間違っています。0 から 3 の半角数字を入力してください。"
end