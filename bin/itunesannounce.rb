#!/usr/bin/env ruby

trap("SIGINT") { exit }

while true do
  puts "Announcing iTunes Name"
  %x{osascript<<ENDGAME
      tell application "iTunes"
          set song to name of current track
          say song using "vicki"
      end tell
ENDGAME
}
  sleep 90
end
