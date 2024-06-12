open Timer

type drawing_fn = int -> int -> unit

class virtual entity :
    object
        method register_to_timer : timer -> routine_handle
        method virtual update : unit -> unit
        method virtual destroy : unit -> unit
    end
