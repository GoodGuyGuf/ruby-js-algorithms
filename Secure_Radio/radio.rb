#!/usr/bin/env ruby
class Radio

    attr_reader :band, :volume, :frequency

    @@fm_frequency = rand(88.0..108.0).floor(1)
    @@am_frequency = rand(540.0..1600.0).floor(1)
    @@volume = rand(1..10)

    @@audio_samples = [
        "Here comes the sun",
        "Like a Rollin Stone",
        "I Heard it Through the Grapevine",
        "Stairway to Heaven",
        "a traffic report",
        "a news report"
    ]

    def initialize(options = {})
        @band = options[:band] ||= "FM"
        self.volume = options[:volume] ||= 5
        self.frequency = options[:frequency] ||= @@fm_frequency
    end

    def self.fm
        Radio.new
    end

    def self.am
        Radio.new(band: "AM")
    end

    def volume=(volume = @@volume)
        if volume < 1 || volume > 10
            @volume = @@volume
        else
            @volume = volume
        end
    end

    def frequency=(frequency = @@fm_frequency)
        if self.band == "FM"
            if frequency < 88.0 || frequency > 108.0
                @frequency = @@fm_frequency
            else
                @frequency = frequency
            end
        elsif self.band =="AM"
            if frequency < 540.0 || frequency > 1600.0
                @frequency = @@am_frequency
            end
        elsif !frequency.is_a?(Float)
            @frequency = @@am_frequency
        end
    end

    def status
        "The volume is #{self.volume}, the frequency is #{self.frequency}, the band is '#{self.band}'"
    end

    def play(audio)
        puts "The radio plays: " + audio
    end

    private

    def audio_stream
        @@audio_samples.sample # sample is an array method that returns a random element from the array
    end

end