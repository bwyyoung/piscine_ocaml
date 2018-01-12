(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 09:49:09 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 10:06:25 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ackermann m n =
	let rec callback m n =
	if m = 0 then
		n + 1
	else if n = 0 && m > 0 then
		callback (m - 1) 1
	else
		callback (m - 1) (callback m (n - 1))
	in

	if m < 0 || n < 0 then
	-1
	else
	callback m n
	
let testone m n =
	Printf.printf "Test with [m=%+2d, m=%+2d] = %!" m n;
	Printf.printf "%+d\n%!" (ackermann m n)

let () =
	testone (-1) 7;
	testone 7 (-1);
	testone 0 0;
	testone 0 1;
	testone 0 2;
	testone 0 3;
	testone 0 4;
	testone 0 5;
	testone 0 6;
	testone 0 7;
	testone 1 0;
	testone 1 1;
	testone 1 2;
	testone 1 3;
	testone 1 4;
	testone 1 5;
	testone 1 6;
	testone 1 7;
	testone 2 0;
	testone 2 1;
	testone 2 2;
	testone 2 3;
	testone 2 4;
	testone 2 5;
	testone 2 6;
	testone 2 7;
	testone 3 0;
	testone 3 1;
	testone 3 2;
	testone 3 3;
	testone 3 4;
	testone 3 5;
	testone 3 6;
	testone 3 7;
	testone 4 0;
	testone 4 1;
