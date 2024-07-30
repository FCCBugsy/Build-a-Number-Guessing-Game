#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_NUMBER() {
  echo "Enter your username:"
  read USER_NAME
  REGISTERED_USERS=$($PSQL "SELECT username FROM users WHERE username='$USER_NAME'")

  # if no one with the entered username was found in the db.. then we add them to the db
  if [[ -z $REGISTERED_USERS ]]
  then
    INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USER_NAME', 0, 999)")
    echo "Welcome, $USER_NAME! It looks like this is your first time here."

  else
    # here, I use 'xargs' to remove any whitespaces in the 'GAMES_PLAYED' variable. Since the output MUST be the exact same in the test one, the removel of whitespaces is necessary
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USER_NAME'")
    GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)

    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_NAME'")
    BEST_GAME=$(echo $BEST_GAME | xargs)

    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  GUESS_COUNT=0

  echo "Guess the secret number between 1 and 1000:"
  # i use '-eq' instead of '==' because I want to MAKE SURE the 'USER_INPUT' variable is an integer
  until [[ $USER_INPUT -eq $RANDOM_NUMBER ]]
  do
    read USER_INPUT

    # if the user enteed any input that is NOT an integer, then he'll be forced to select an integer
    if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
    then
      # I could've increased the amount of count here, but since the user didn't even **TRY** to enter an integer, I decided to not increase the amount of tries
      echo "That is not an integer, guess again:"

    else
      ((GUESS_COUNT++))
      if [[ $USER_INPUT -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"

      elif [[ $USER_INPUT -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      fi
    fi
  done

  # in order to "secretly" update the amount of games played for our user, I had to put it in a variable, otherwise it would print out "UPDATE 0 1" in the console, which isn't really a "secret" update
  UPDATE_GAMES_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USER_NAME'")

  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_NAME'")
  BEST_GAME=$(echo $BEST_GAME | xargs)  

  # by default, I set the 'best_game' column in the db to be 999 because, if you checked the db after the test, the 'best_guess' column for every 'bot users' were above 900...
  if [[ $GUESS_COUNT -lt $BEST_GAME ]]
  then
    UPDATE_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username='$USER_NAME'")
  fi

  echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
}

GUESS_NUMBER #call the function
