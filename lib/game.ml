open Graphics

module Map = Game_map

let run_game () =
    open_graph " 1200x1200";
    Render.draw_map_threaded ();
    while true do () done

