open Entity
open Edible

module Creature_traits = Creature_traits

open Creature_traits

class creature traits =
    object
        inherit entity
        inherit edible

        val traits : creature_traits = traits

        val energy : Energy.energy ref = ref 0.0

        method eat_creature (c : creature) = (* add size and implement size check here *)
            let eat_creature_unchecked (c : creature) =
                match c#on_eaten () with
                | Some x -> energy := !energy +. x
                | None -> ()
            in
            match traits.diet with
            | Herbivore -> ()
            | _ -> eat_creature_unchecked c

        method eat_plant (_p : Plant.plant) =
            let _eat_plant_unchecked (_p : Plant.plant) = () in
            () (* match plant traits *)

        method on_eaten () = None (* TODO: IMPLEMENT *)

        method destroy () = ()

        method update () = ()
    end
