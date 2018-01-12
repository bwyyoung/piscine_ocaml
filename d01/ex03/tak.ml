(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 10:07:52 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 10:18:43 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let min = 0
let max = 16

let tak x y z =
	let rec callback x y z =
	if y >= x then
		z
	else
		callback (callback (x - 1) y z) (callback (y - 1) z x) (callback (z - 1) x y)
	in
	callback x y z

let testone x y z =
	Printf.printf "Test with [%+2d %+2d %+2d] = %!" x y z;
	Printf.printf "%d\n%!" (tak x y z)

let testz x y =
	for i = min to max do
		testone x y i
	done

let testy x =
	for i = min to max do
		testz x i
	done

	
let () =
	for i = min to max do
		testy i
	done;
	testone 1 2 3;
	testone 5 23 7;
	testone 9 1 0;
	testone 1 1 1;
	testone 0 42 0;
	testone 23498 98734 98776;

