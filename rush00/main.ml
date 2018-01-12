(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let rec start_game p1 p2 ((init, a, b, c, destroy) as ui) =
	init ();
	let winner = Game.start p1 p2 (a, b, c) in
	destroy ();
	print_endline ((Player.string_of_player winner) ^ " win the game");
	let re = Utils.prompt_string "Restart (n/y)" in
	if (re = "n" || re = "N") then
		()
	else begin
		start_game p1 p2 ui;
	end

let rec get_gui () =
	(Graphics.init, Graphics.get_input, Graphics.print, Graphics.render, Graphics.destroy)

let () =
	print_endline "888   d8b        888                   888                    ";
	print_endline "888   Y8P        888                   888                    ";
	print_endline "888              888                   888                    ";
	print_endline "888888888 .d8888b888888 8888b.  .d8888b888888 .d88b.  .d88b.  ";
	print_endline "888   888d88P\"   888       \"88bd88P\"   888   d88\"\"88bd8P  Y8b ";
	print_endline "888   888888     888   .d888888888     888   888  88888888888 ";
	print_endline "Y88b. 888Y88b.   Y88b. 888  888Y88b.   Y88b. Y88..88PY8b.     ";
	print_endline "  Y888888 \"Y8888P \"Y888\"Y888888 \"Y8888P \"Y888 \"Y88P\"  \"Y8888  ";
	print_endline "                                                             ";
	print_endline "~~~~~~~~~~~~~~~~tic-tac-tic-tac-toe~~~~~~~~~~~~~~~~~~~~";
	print_endline "Use 'AI' as player name for AI";
	let p1 = Utils.prompt_line "Player 1" true in
	let p2 = Utils.prompt_line "Player 2" true in
	if p1 = p2 then
		print_endline "Error player 1 and 2 have the same name"
	else
		start_game p1 p2 (get_gui ())
