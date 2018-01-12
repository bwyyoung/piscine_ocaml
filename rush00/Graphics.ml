(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Graphics.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let cell_width = 6
let cell_height = 2

let add_player (board_x, board_y) i o (x_sel, y_sel) =
	let x', y' = (i mod 3 + board_x), (i / 3 + board_y) in
	let x'', y'' = (x' * cell_width), (y' * cell_height) in
	if x_sel = x' && y_sel = y' then begin
		Curses.attron (Curses.A.color_pair 12);
		ignore (Curses.mvaddch y'' x'' (int_of_char o));
		Curses.attron (Curses.A.color_pair 13)
	end else
		ignore (Curses.mvaddch y'' x'' (int_of_char o))

let init () =
	ignore (Curses.initscr ());
	ignore (Curses.start_color ());
	ignore (Curses.noecho ());
	ignore (Curses.curs_set 0);
	ignore (Curses.init_color 21 1000 1000 1000);
	ignore (Curses.init_color 20 0 0 0);
	ignore (Curses.init_pair 12 20 21);
	ignore (Curses.init_pair 13 21 20)

let destroy () = ignore (Curses.endwin ())

let rec draw_board pos i b sel =
	match b with
	| (Board.Occupied head)::tail		->
		add_player pos i (Cellmaster.char_cellmaster head) sel;
		draw_board pos (i + 1) tail sel
	| _								-> ()

let rec render_m_board b i sel =
	match b with
	| (Board.Playing (head))::tail  ->
		draw_board ((i mod 3 * 3), (i / 3 * 3)) 0 head sel;
		render_m_board tail (i + 1) sel
	| head::tail	->
		draw_board ((i mod 3 * 3), (i / 3 * 3)) 0 (Board.occupied_to_playing head) sel;
		render_m_board tail (i + 1) sel
	| _								-> ()

let render_grid () =
	let padding_x, padding_y = cell_width / 2, cell_height / 2 in
	Curses.mvvline 0 (3 * cell_width - padding_x) (int_of_char '|') (9 * cell_height - padding_y);
	Curses.mvvline 0 (6 * cell_width - padding_x) (int_of_char '|') (9 * cell_height - padding_y);
	Curses.mvhline (3 * cell_height - padding_y) 0 (int_of_char '-') (9 * cell_width - padding_x);
	Curses.mvhline (6 * cell_height - padding_y) 0 (int_of_char '-') (9 * cell_width - padding_x)

let render_selection b sel =
	Curses.erase () ;
	begin
		match b with
		| Board.Playing (lst)			-> render_m_board lst 0 sel
		| _								-> ()
	end;
	render_grid ();
	ignore (Curses.refresh ())

let render b = render_selection b (-1, -1)

let rec get_selection b ((x, y) as sel) =
	render_selection b sel;
	match Curses.getch () with
	| 67 when x < 8											-> get_selection b ((x + 1), y)
	| 68 when x > 0											-> get_selection b ((x - 1), y)
	| 66 when y < 8											-> get_selection b (x, (y + 1))
	| 65 when y > 0											-> get_selection b (x, (y - 1))
	| 10 when (Board.cellmaster b (x, y)) = Board.Occupied Cellmaster.EMPTY	-> sel
	| _														-> get_selection b sel

let get_input b = get_selection b (0, 0)

let print msg = ignore (Curses.mvaddstr 0 0 msg)
