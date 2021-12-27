function fish_greeting
  # curl -s https://mensa-kzu.sv-restaurant.ch/de/menuplan/ | grep menu-title | head -2 | sed -e 's/<[^>]*>//g' | tr -d '[:blank:]' 
  echo "Ich lieb die Mensa. Es ist so fein."
end
