type runnable = (unit -> unit)
type routine_handle = int

class timer =
    object
        val routines : (routine_handle, runnable) Hashtbl.t =
            Hashtbl.create 65536

        val next_handle_no = ref 0

        method register_routine fn =
            Hashtbl.add routines !next_handle_no fn;
            incr next_handle_no;
            !next_handle_no - 1
    end
