(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/17 16:11:06 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/17 17:44:27 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let gray n =
	let swap_char = function
	| '0'		-> '1'
	| _			-> '0'
	in				 
	let mapifun changei curi c = if changei = curi then swap_char c else c in
	let swap str i = String.mapi (mapifun (n - i - 1)) str in

	let rec swap_print strold i top =
	let str = swap strold i in
	print_string (" " ^ str);
	if i > 0 then
		current_top (swap_print str 0 i) i top
	else
		current_top str i top
	and current_top str i top =
	if i + 1 < top then
		swap_print str (i + 1) top
	else
		str
	in
	if n > 0 then
	begin
		let str = String.make n '0' in
		print_string str;
		ignore (swap_print str 0 (n))
	end;
	print_char '\n'


let testone n =
	Printf.printf "Test for %d:\n%!" n;
	gray n

let () =
	testone (-1);
	testone 0;
	testone 1;
	testone 2;
	testone 3;
	testone 4;

