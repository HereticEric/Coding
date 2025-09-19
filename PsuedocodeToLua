--[[print("Hello World")

print("Enter some text")
someText = io.read()
print(someText--]]

-- #1
-- Ask the user for some text and convert the text into all caps
print("Enter some words")
someWords = io.read()
print(string.upper(someWords))

-- #2
-- Ask the user for 2 numbers, add them, the print the result
--[[print("Please input 2 numbers, and I will add them together for you.")
userNumber1 = io.read()
userNumber2 = io.read()
print("The sum of these two numbers is: " .. userNumber1 + userNumber2)--]]

-- #3 
-- getr an unknown amount of numbers from the user and add them together, print out the result
-- while ..... do
-- (code)
-- end

--[[continueVal = "y"
total = 0
newNumber = 0

while continueVal ~= "n" do
 print("Enter a number")
  newNumber = tonumber(io.read())

  if type(newNumber) ~= "number" then
   print("Not a number, try again!")
    newNumber = tonumber(io.read())
end
  
  total = total + newNumber
  print("Do you want to enter another number? y for yes, n for no")
  continueVal = io.read()
end


print("the total for all of these numbers is " .. total)---]]



-- #4
--Have the user define a maximum whole number, print out a random number between 0 and their number. 
--Allow the user to play again or quit
-- math.random(0,100)

--[[continueVal = "y"
math.randomseed(os.time())

while continueVal ~= "n" do
 print("Give me a max value")
  maxValue = tonumber(io.read())
  while maxValue == nil do
    print("INvalid input. please enter a valid number")
    maxValue = tonumber(io.read())
  end
  randomValue = math.random(0, maxValue)
  print(randomValue)
  print("Do you want to enter another number?")
  continueVal = io.read()
end--]]


--#5
-- get a random number. If the number is even print "right" if its odd, print "left".
--Do this ten times, print out how many times it was "left" and how many times it was "right"
--number %2 = 0, even
--for loops!

math.randomseed(os.time())
evenCounter = 0
oddCounter = 0

for x = 1, 10 do
  myRandomNum = math.random(1,100)
    print(myRandomNum)
    if myRandomNum %2 == 0 then
      print("EVEN")
      evenCounter = evenCounter + 1
    else
      print("ODD")
      oddCounter = oddCounter + 1
    end
  end
  print("There were " ..evenCounter .. " even numbers and " .. oddCounter .. "odd numbers")
