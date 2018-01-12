(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 16:25:19 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 16:56:31 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

open Card
open Printf

let printcard c =
	Printf.printf "%s %!" (Card.toString c)

let printcard' c =
	Printf.printf "%s %!" (Card.toStringVerbose c)

let testone l =
	Printf.printf "Showing card list: \n%!";
	List.iter	printcard l; Printf.printf "\n%!";
	List.iter	printcard' l; Printf.printf "\n%!";
	Printf.printf "Best: %s\n%!" (Card.toStringVerbose (Card.best l));
	Printf.printf "Checking the first one:\n%!";
	let c = List.nth l 0 in
	Printf.printf "isOf Card.Color.Club = %B\n%!" (Card.isOf c Card.Color.Club);
	Printf.printf "isSpade Card.Color.Club = %B\n%!" (Card.isSpade c);
	Printf.printf "isHeart Card.Color.Club = %B\n%!" (Card.isHeart c);
	Printf.printf "isDiamond Card.Color.Club = %B\n%!" (Card.isDiamond c);
	Printf.printf "isClub Card.Color.Club = %B\n%!" (Card.isClub c);
	Printf.printf "GetValue: %s\n%!" (Card.Value.toStringVerbose (Card.getValue c));
	Printf.printf "GetColor: %s\n%!" (Card.Color.toStringVerbose (Card.getColor c));
	Printf.printf "Comparing the two first\n%!";
	let c' = List.nth l 1 in
	let cmp = compare c c' in
	let mx = max c c' in
	let mn = min c c' in
	Printf.printf "compare:%d	max:%s	min:%s\n%!"
	(cmp)
	(Card.toStringVerbose mx)
	(Card.toStringVerbose mn);
	Printf.printf "\n%!"


let () =
	testone (allSpades);
	testone (allHearts);
	testone (allDiamonds);
	testone (allClubs);
	testone ([
	Card.newCard Card.Value.Jack Card.Color.Spade;
	newCard Card.Value.Jack Card.Color.Heart;
	newCard Card.Value.T6 Card.Color.Spade;
	newCard Card.Value.T7 Card.Color.Club;
	newCard Card.Value.Queen Card.Color.Diamond
	]);
