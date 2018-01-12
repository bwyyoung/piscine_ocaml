(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   testone.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 11:14:17 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 11:38:00 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
	let rec callback a b n =
	if n > 0 then
		callback b (a + b) (n - 1)
	else
		a
	in
	if n < 0 then
	-1
	else
	callback 0 1 n

let testone n =
	Printf.printf "Test with [%02d] = %!" n;
	Printf.printf "%d\n%!" (fibonacci n)

let () =
	testone (-1);
	testone 0;
	testone 1;
	testone 2;
	testone 3;
	testone 4;
	testone 5;
	testone 6;
	testone 7;
	testone 8;
	testone 9;

