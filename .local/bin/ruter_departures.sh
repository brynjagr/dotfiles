
departures_json=$(curl -s 'http://reisapi.ruter.no/StopVisit/GetDepartures/3012234?linenames=54')

first_departure=$(echo "$departures_json" | jq -r '[.[]|select(.MonitoredVehicleJourney.DestinationRef=="3010090")][0]')
second_departure=$(echo "$departures_json" | jq -r '[.[]|select(.MonitoredVehicleJourney.DestinationRef=="3010090")][1]')

expected_arrival_time_first="$(echo "$first_departure" | jq -r '.MonitoredVehicleJourney.MonitoredCall.ExpectedArrivalTime' | xargs -i date -d '{}' '+%s')"
expected_arrival_time_second="$(echo "$second_departure" | jq -r '.MonitoredVehicleJourney.MonitoredCall.ExpectedArrivalTime' | xargs -i date -d '{}' '+%s')"

date_now=$(date +%s)

minutes_remaining_first=$((($expected_arrival_time_first - $date_now) / 60))
minutes_remaining_second=$((($expected_arrival_time_second - $date_now) / 60))

echo "Øvre Stabburvei: $minutes_remaining_first min, $minutes_remaining_second min"
