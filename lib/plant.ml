open Energy
open Edible

class virtual plant = (* TODO: create bush and tree subclasses *)
    object (self)
        inherit edible

        val virtual cooldown : int
        val virtual remaining_cooldown : int option ref

        val virtual energy_yield : energy

        method private decr_cooldown () =
            match !remaining_cooldown with
            | Some x when x >= 2 -> remaining_cooldown := Some (x - 1)
            | _ -> remaining_cooldown := None

        method private reset_cooldown () =
            remaining_cooldown := Some cooldown

        method update =
            self#decr_cooldown

        method on_eaten () =
            match !remaining_cooldown with
            | None -> Some 10.0
            | _ -> None
    end
