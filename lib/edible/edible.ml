open Energy

class virtual edible =
    object
        method virtual on_eaten : unit -> energy option
    end
