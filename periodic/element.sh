#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check if argument provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # check if number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements 
      INNER JOIN properties USING(atomic_number)
      INNER JOIN types USING(type_id)
      WHERE atomic_number = $1
    ")
  else
    ELEMENT=$($PSQL "SELECT * FROM elements 
      INNER JOIN properties USING(atomic_number)
      INNER JOIN types USING(type_id)
      WHERE symbol = '$1' OR name = '$1'
    ")
  fi

  #check if element exists
  if [[ -z $ELEMENT ]]
  then
    echo -e "I could not find that element in the database."
  else
    echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi