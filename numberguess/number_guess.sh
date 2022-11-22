#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo -e "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES ('$USERNAME', 0)")
  GAMES_PLAYED=0
  BEST_GAME=-1
else
  USER_INFO=$($PSQL "SELECT * FROM users WHERE user_id = $USER_ID")
  IFS="|" read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< $USER_INFO
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# initial setup
echo -e "Guess the secret number between 1 and 1000:"
GUESS=-1
typeset -i NUMBER_OF_GUESSES=0

### Play game
while (( $GUESS != $RANDOM_NUMBER ))
do
	NUMBER_OF_GUESSES=$NUMBER_OF_GUESSES+1
  read GUESS

  # if user entered number
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if (( $GUESS < $RANDOM_NUMBER ))
    then
      echo "It's higher than that, guess again:"
    elif (( $GUESS > $RANDOM_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

# final calculations
if [[ $BEST_GAME = -1 ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
then
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
fi

INCREMENT_GAMES_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")