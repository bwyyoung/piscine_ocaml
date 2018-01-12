(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 09:13:54 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 09:46:05 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let repeat_x n =

	let rec callback s n =
	if n <= 0 then
		s
	else
		callback (s ^ "x") (n - 1)
	in

	if n < 0 then
	"Error"
	else
	callback "" n

		 
let testone n =
	Printf.printf "Test with [%+2d]: %s\n%!" n (repeat_x n)

let () =
	testone (-1);
	testone 0;
	testone 1;
	testone 2;
	testone 3;
