open Entity
open Edible
open Energy

class virtual plant :
    object
        inherit entity
        inherit edible

        val virtual cooldown : int
        val virtual remaining_cooldown : int option ref

        val virtual energy_yield : energy

        method private decr_cooldown : unit -> unit
        method private reset_cooldown : unit -> unit
        method update : unit -> unit

        method on_eaten : unit -> energy option
    end
