open Energy
open Entity
open Edible

module Creature_traits = Creature_traits

open Creature_traits

class creature : creature_traits ->
    object
        inherit entity
        inherit edible

        val traits : creature_traits

        val energy : Energy.energy ref

        method eat_creature : creature -> unit
        method eat_plant : Plant.plant -> unit

        method on_eaten : unit -> energy option

        method destroy : unit -> unit

        method update : unit -> unit
    end
