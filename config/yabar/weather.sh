#! /bin/bash
URL='http://www.accuweather.com/en/de/berlin/10178/weather-forecast/333081'
wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"° F" }'| head -1
