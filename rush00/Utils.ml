(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Utils.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
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

let rec prompt_string prompt =
	let line = prompt_line prompt true in
	if (String.length line) > 0  then
		line
	else begin
		print_endline "Bad Input. Please retry";
		prompt_string prompt
	end

let nth l i =
	List.nth l i

