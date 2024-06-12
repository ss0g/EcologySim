open Graphics

let pm a b =
    (a + b, a - b)

let rev a =
    (snd a, fst a)

let mp a b =
    rev @@ pm a b

let apply_to_both f (a, b) = (f a, f b)

let lerp x x0 x1 y0 y1 =
    let num = y0 *. (x1 -. x) +. y1 *. (x -. x0) and
    denom = x1 -. x0 in
    num /. denom

let draw_map () =
    let w = size_x () and h = size_y () in
    let center = (w / 2, w / 2) and
    min_dim = min w h in
    let half_min_dim = min_dim / 2 in
    let xbound = mp (fst center) half_min_dim and
    ybound = mp (snd center) half_min_dim and
    lerp' x x0_i x1_i y0_i y1_i =
        let x0_f = float_of_int x0_i and
        x1_f = float_of_int x1_i and
        y0_f = float_of_int y0_i and
        y1_f = float_of_int y1_i in
        int_of_float @@ lerp x x0_f x1_f y0_f y1_f
    in
    let draw_col x =
        for y = -1000 to 999 do
            if Game_map.is_land (x, float_of_int y) then
                let c = lerp' x (-1000) 999 (fst xbound) (snd xbound) and
                r = lerp' (float_of_int y) (-1000) 999 (fst ybound) (snd ybound) in
                plot c r
        done
    in
    begin
        set_color blue;
        fill_rect 0 0 w h;
        set_color green;
        for x = -1000 to 999 do
            draw_col @@ float_of_int x
        done
    end

let draw_map_threaded () =
    let w = size_x () and h = size_y () in
    let center = (w / 2, w / 2) and
    min_dim = min w h in
    let half_min_dim = min_dim / 2 in
    let xbound = mp (fst center) half_min_dim and
    ybound = mp (snd center) half_min_dim and
    lerp' x x0_i x1_i y0_i y1_i =
        let x0_f = float_of_int x0_i and
        x1_f = float_of_int x1_i and
        y0_f = float_of_int y0_i and
        y1_f = float_of_int y1_i in
        int_of_float @@ lerp x x0_f x1_f y0_f y1_f
    in
    let draw_col x =
        for y = -1000 to 999 do
            if Game_map.is_land (x, float_of_int y) then
                let c = lerp' x (-1000) 999 (fst xbound) (snd xbound) and
                r = lerp' (float_of_int y) (-1000) 999 (fst ybound) (snd ybound) in
                plot c r
        done
    in
    begin
        set_color blue;
        fill_rect 0 0 w h;
        set_color green;
        let rd = Domain.recommended_domain_count () in
        let halfrd = rd / 2 + 1 and
        cpd = 2000 / rd in
        for x = -halfrd to halfrd - 1 do
            (fun _ -> ()) (Domain.spawn (fun _ ->
                for j = 0 to 99 do
                    draw_col @@ float_of_int (x * cpd + j)
                done
            ))
        done;
        for x = -1000 to 999 do
            (fun _ -> ()) (Thread.create draw_col @@ float_of_int x)
        done
    end

