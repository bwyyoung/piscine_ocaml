(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/17 17:47:55 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/17 18:33:19 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let sequence n =
	let rec revl src dst =
	match src with
	| []					-> dst
	| hd::tl				-> revl tl (hd::dst)
	in
	let gen src =
	let rec gen_helper src dst nb nbcount =
		match src with
		| [] when nb = -1		-> dst
		| []					-> nb::nbcount::dst
		| hd::tl when nb = -1	-> gen_helper tl dst				hd 1
		| hd::tl when nb = hd	-> gen_helper tl dst				hd (nbcount + 1)
		| hd::tl				-> gen_helper tl (nb::nbcount::dst)	hd 1
	in
	revl (gen_helper src [] (-1) 0) []
	in
	let rec callback n prev =
	if n = 0 then
		prev
	else
		callback (n - 1) (gen prev)
	in
	let rec string_of_int_list l s =
	match l with
	| []					-> s
	| hd::tl				-> string_of_int_list tl (s ^ string_of_int hd)
	in
	if n < 1 then
	""
	else
	string_of_int_list (callback (n - 1) [1]) ""


let testone n =
	Printf.printf "Test with [%d]: %!" n;
	Printf.printf "\"%s\"\n%!" (sequence n)

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
	testone 10;

