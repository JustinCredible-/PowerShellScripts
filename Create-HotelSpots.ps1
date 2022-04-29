#Creates a number of Hotel Spots for WFH employees. These are Rooms people can schedule themselves in for up to 1 day at a time.

#Hotel spot number
$i = 0
#How many hotel spots needed?
$totalspots = 8
#Change this to however many minutes you want people to be able to schedule the hotel spot for
$maxappttime = 1440

Connect-ExchangeOnline
while ($i -le $totalspots) {
  $i = $i + 1
  $displayname = 'Hotel Spot ' + $i
  #Don't forget to remove -WhatIf switch or this will do nothing
  New-Mailbox -Name $displayname.replace(" ","") -DisplayName $displayname -Room -ResourceCapacity 1 -WhatIf | Set-CalendarProcessing -ScheduleOnlyDuringWorkHours $true -MaximumDurationInMinutes $maxappttime -WhatIf
}
