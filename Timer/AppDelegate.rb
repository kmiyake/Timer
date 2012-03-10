#
#  AppDelegate.rb
#  Timer
#
#  Created by 耕太 三宅 on 12/03/10.
#  Copyright 2012年 __MyCompanyName__. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    attr_accessor :timeLabel, :currentTime
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end
    
    
    
    def startTimer(sender)
        if @thread.nil?
            @thread = Thread.start do
                @currentTime = 25 * 60
                loop do
                    stopTimer if @currentTime < 1
                    timeLabel.stringValue = currentTimeAsString
                    sleep 1
                    @currentTime -= 1
                end
            end
        end
    end
    
    def stopTimer(sender)
        if @thread
            @thread.kill
            @thread = nil
        end
    end
    
    def currentTimeAsString
        p currentTime
        minutes = (currentTime % 3600) / 60
        seconds = (currentTime % 60)
        minutes = 60 if currentTime == 3600
        m = sprintf("%02i", minutes)
        s = sprintf("%02i", seconds)
        "#{m}:#{s}"
    end
end

