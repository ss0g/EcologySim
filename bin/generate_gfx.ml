open Graphics

let () = open_graph " 1920x1200";;

let iptarrtofptarr a =
    Array.map (fun b -> (float_of_int @@ fst b, float_of_int @@ snd b)) a

let w = size_x ()
let h = size_y ()
let cr = 150
let cc = rgb 255 127 127
let lr = 90
let lc = rgb 0 80 0
let tc = rgb 117 72 41

let creature_locs : (int * int) array =
    [|
        (200, 250);
        (600, 470);
        (250, 620);
    |]

let leaf_locs : (int * int) array =
    [|
        (1350, 700);
        (1550, 700);
        (1450, 850);
    |]

let draw_metaballs (r : int) (locs : (int * int) array) =
    let f = Lib.Game.Map.f in
    for x = 0 to w do
        for y = 0 to h do
            let mapped = Array.map (f (float_of_int x, float_of_int y)) @@ iptarrtofptarr locs in
            let t = Array.fold_left (+.) 0.0 mapped in
            if t >= 1.0 /. float_of_int (r * r) then plot x y
        done
    done

let () =
    begin
        set_color green;
        fill_rect 0 0 w h;
        set_color cc;
        Array.iter (fun x -> fill_circle (fst x) (snd x) cr) creature_locs;
        set_color tc;
        fill_rect 1400 400 100 400;
        set_color lc;
        draw_metaballs lr leaf_locs;
    end;
    while true do () done

