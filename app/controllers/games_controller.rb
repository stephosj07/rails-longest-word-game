class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @input = params[:input]
    @characters = params[:letters]
    @included = included?(@input, @characters)
    if @included == true
      return @score = "Good job!"
    else
      return @score = "Wrong answer!"
    end
  end

  private

  def included?(input, characters)
    input.chars.all? { |character| input.count(character) <= characters.count(character) }
  end


end

# The word can’t be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
# use API to check if word is valid English word. Returns hash with { "found": true/false }
