(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Utils.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/20 13:48:52 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 18:24:36 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let str_is f str =
	let rec callback i =
		if (String.length str) <= i then
			true
		else if f (String.get str i) then
			callback (i + 1)
		else
			false
	in
	callback 0

let str_is_int = str_is (fun c -> (c >= '0') && (c <= '9'))

let rec prompt_line prompt no_empty =
	print_string prompt;
	print_string ": ";
	let line = read_line () in
	if no_empty && (String.length line) = 0 then begin
		print_endline "Cannot be empty. Please retry";
		prompt_line prompt no_empty
	end else
		line

let rec prompt_int prompt =
	let line = prompt_line prompt true in
	if str_is_int line then
		int_of_string line
	else begin
		print_endline "Bad number. Please retry";
		prompt_int prompt
	end

let nth l i =
	List.nth l i
