--Lua Guessing Game based on PsudoCode
--Eric Escobedo 9/23/2025


--Create the function to play the Game
function playGame()
  math.randomseed(os.time())

  --Create variables for the game
  local minNumber = 1
  local maxNumber = 100
  local hiddenNumber = math.random(minNumber, maxNumber)
  local userGuess
  local maxAttempts = 7
  local attemptCount = 0
  local correctGuess = false

  --The text that will appear every time the game starts
  print("Welcome! Try and guess a number between 1 & 100! You have 7 attempts, good luck!")

  --Create the game loop
  while attemptCount < maxAttempts and correctGuess == false do
    attemptCount = attemptCount + 1
    print( "Attempt  " .. attemptCount .. "of " .. maxAttempts)
    print("Please Enter Your Guess:")

    --Get the users input and then validate it
    userGuess = tonumber(io.read())

    if userGuess == nil then
      print("Please enter a valid number")
      attemptCount = attemptCount - 1 --do this so that an invalid input doesnt count as an attempt 
    else


      --create an if statement for when the user guesses the hidden number
      if userGuess == hiddenNumber then
        correctGuess = true
        print("Congratulations! You guessed the hidden number correctly!")
      elseif userGuess < hiddenNumber then
        print("Too low!")
        else
        print("Too high!")
        end
      end
    end


  --create an if statement for when the user uses all of their attempts 
if attemptCount >= maxAttempts and correctGuess == false then
    print("Sorry, you are out of attempts!")
    print("The hidden number was " .. hiddenNumber)
    print("Game Over.")
  end
end


--Main Function for the game
function main()
  local playAgain = true

  while playAgain do
    playGame()
    print("Would you like to play again? Yes or No")
    local userEntry = io.read()
    if userEntry: lower() ~= "yes" then
     playAgain = false
      print("Thank you for playing")
    end
  end
end


--begin the game
main()