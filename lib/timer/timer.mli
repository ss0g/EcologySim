type runnable = (unit -> unit)
type routine_handle = int

class timer :
    object
        val routines : (routine_handle, runnable) Hashtbl.t
        val next_handle_no : routine_handle ref
        method register_routine : runnable -> routine_handle
    end
