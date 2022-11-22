#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you? Type 'exit' to exit salon service."

EXIT() {
  echo -e "\nHave a nice day!"
}

BOOK_SERVICE() {
  if [[ $1 = 'exit' ]]
  then
    EXIT
  else
    # continue booking appointment
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $1")
    # if there's no service with provided id
    if [[ -z $SERVICE_NAME_SELECTED ]]
    then
      # return to services menu and ask again
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # check customer record in db
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # find customer record
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      # if there's no customer record in db
      if [[ -z $CUSTOMER_ID ]]
      then
        # add customer
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")        
      fi

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME_SELECTED | sed -E 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')?"
      read SERVICE_TIME
      
      # add appointment to the database
      INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $1, '$SERVICE_TIME')")
      if [[ $INSERT_APPT_RESULT = 'INSERT 0 1' ]]
      then
        echo -e "\nI have put you down for a $(echo $SERVICE_NAME_SELECTED | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
      fi
    fi
  fi
}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  BOOK_SERVICE $SERVICE_ID_SELECTED
}
MAIN_MENU
