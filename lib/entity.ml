open Timer

type drawing_fn = int -> int -> unit

class virtual entity =
    object (self)
        method register_to_timer (t : timer) =
            t#register_routine self#update

        method virtual update : unit -> unit
        method virtual destroy : unit -> unit
    end
