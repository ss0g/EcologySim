type point = float * float

let map_points : point array =
    [|
        (430.0, -716.0);
        (-420.0, -503.0);
        (-320.0, -306.0);
        (-677.0, -322.0);
        (260.0, -280.0);
        (-375.0, 8.0);
        (58.0, -25.0);
        (75.0, 184.0);
        (-675.0, 252.0);
        (-399.0, 400.0);
        (-835.0, -26.0);
        (570.0, 95.0);
        (-177.0, 559.0);
        (80.0, 678.0);
        (479.0, 411.0);
        (466.0, -161.0);
        (-114.0, -684.0);
        (308.0, 603.0);
        (168.0, -586.0);
        (708.0, -390.0);
    |]

let f (p : point) (mp : point) =
    let denominator =
        let a = (fst p) -. (fst mp) and
        b = (snd p) -. (snd mp) in
        a *. a +. b *. b
    in
    1.0 /. denominator

let is_land (p : point) =
    let mapped = Array.map (f p) map_points in
    let x = Array.fold_left (+.) 0.0 mapped and
    r = 100.0 in
    x >= 1.0 /. (r *. r)

let is_water p =
    not (is_land p)

