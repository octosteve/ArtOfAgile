class StoryFrame
  
  attr_reader :text, :question, :choices

  def initialize(frame)
    @text = frame[:text]
    @question = frame[:question]
    @choices = frame[:choices]
  end

  def display_text
    system('clear')
    print "\n########################################"
    puts @text
  end

  def ask_question_and_get_score
    if @question
    puts ""
    puts @question
    puts ""
  end
    puts "-" * 20

    if @choices.respond_to? :each_with_index
      @choices.each_with_index do |choice, index|
        puts "    #{index +1}. #{choice[:text]}"
      end 
    else
      puts "Press ENTER to continue..."
    end


    puts "-" * 20
    
    print "--> "

    response = gets.chomp.to_i - 1 
  
    show_response response
    
    puts "Press Enter to continue"
    gets
    return 0
  end

  def show_response(response)
    if @choices
    puts ""
    puts "#{@choices[response][:response]}"
    puts ""
  end
  end

end
