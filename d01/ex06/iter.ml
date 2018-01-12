(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 11:53:55 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 12:06:25 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let iter f x n =
	let rec callback n acc =
	if n = 0 then
		acc
	else
		callback (n - 1) (f acc)
	in
	if n < 0 then
		-1
	else
	callback n x

let testone f fname x n =
	Printf.printf "Test with [%s %d %d] = %d\n%!" fname x n (iter f x n)
	
let testtwo x n =
	testone (fun x -> x * x) "(fun x -> x * x)" x n;
	testone (fun x -> x * 2) "(fun x -> x * 2)" x n

let () =
	testtwo 0 0;
	testtwo 0 1;
	testtwo 0 2;
	testtwo 1 0;
	testtwo 1 1;
	testtwo 1 2;
	testtwo 2 0;
	testtwo 2 1;
	testtwo 2 2;
	testtwo 2 3;
	testtwo 2 4;

