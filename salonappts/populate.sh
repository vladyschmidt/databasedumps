#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWhat service would you like to add?"
read SERVICE_NAME

SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE_NAME'")
if [[ -z $SERVICE_ID ]]
then
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO services(name) VALUES ('$SERVICE_NAME')")
  if [[ $INSERT_SERVICE_RESULT = 'INSERT 0 1' ]]
  then
    echo -e "\nService added!"
  fi
else
  echo -e "\nService already exists."
fi