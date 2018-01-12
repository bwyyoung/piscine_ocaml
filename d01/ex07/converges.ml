(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 12:07:16 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 13:03:19 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let converges f x n =
	let rec callback n prev =
	if n = 0 then
		false
	else
		begin
		let prev' = f prev in
		if prev' = prev then
			true
		else
			callback (n - 1) prev'
		end
	in
	if n < 0 then
		false
	else
	callback (n + 1) x

let testone f fname x n =
	Printf.printf "Test with [\027[35m%-19s\027[0m %d %d] = %B\n%!" fname x n (converges f x n)

let testtwo f fname x n =
	Printf.printf "Test with [\027[35m%-19s\027[0m %f %d] = %B\n%!" fname x n (converges f x n)

let testoneprime x n =
	testone (( * ) 2) "(( * ) 2)" x n;
	testone (fun x -> x / 2) "(fun x -> x / 2)" x n

let testtwoprime x n =
	testone (( * ) 2) "(( * ) 2)" x n;
	testone (fun x -> x / 2) "(fun x -> x / 2)" x n

let () =
	testoneprime 0 0;
	testoneprime 1 0;
	testoneprime 2 0;
	testoneprime 3 0;
	testoneprime 0 1;
	testoneprime 1 1;
	testoneprime 2 1;
	testoneprime 3 1;
	testoneprime 0 2;
	testoneprime 1 2;
	testoneprime 2 2;
	testoneprime 3 2;
	testoneprime 0 3;
	testoneprime 1 3;
	testoneprime 2 3;
	testoneprime 3 3;
	testone (( * ) 2) "(( * ) 2)" 2 5;
	testone (fun x -> x / 2) "(fun x -> x / 2)" 2 3;
	testone (fun x -> x / 2) "(fun x -> x / 2)" 2 2;
	testone (fun x -> x / 2) "(fun x -> x / 2)" 2 1;
	testtwo (( *. ) 2.) "(( *. ) 2.)" 2. 5;
	testtwo (fun x -> x /. 2.) "(fun x -> x /. 2.)" 2. 3;
	testtwo (fun x -> x /. 2.) "(fun x -> x /. 2.)" 2. 2;
