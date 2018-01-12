(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 11:39:10 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 11:52:03 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_f n =
	let rec callback n =
	if n = 0 then
		1
	else
		n - (hfs_m (callback (n - 1)))
	in
	if n < 0 then
		-1
	else
	callback n

and hfs_m n =
	let rec callback n =
	if n = 0 then
		0
	else
		n - hfs_f (callback (n - 1))
	in
	if n < 0 then
		-1
	else
		callback n

let testone n =
	Printf.printf "Test with [%s * %d] = %!" "hfs_f" n;
	Printf.printf "%d\n%!" (hfs_f n);
	Printf.printf "Test with [%s * %d] = %!" "hfs_m" n;
	Printf.printf "%d\n%!" (hfs_m n)

let () =
	testone	(-1);
	testone	0;
	testone	1;
	testone	2;
	testone	3;
	testone	4;
	testone	5;
	testone	6;
	testone	7;
	testone	8;
	testone	9;
	testone	10;
	testone	11;
	testone	12;
	testone	13;
	testone	14;