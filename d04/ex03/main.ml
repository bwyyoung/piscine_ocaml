(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 18:02:36 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 18:16:00 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let testone d =
	Printf.printf "Deck: %!"; List.iter print_string (Deck.toStringList d); Printf.printf "\n%!";
	Printf.printf "Deck: %!"; List.iter print_string (Deck.toStringListVerbose d); Printf.printf "\n%!";
	let (cur, d) = Deck.drawCard d in
	Printf.printf "Picked a %s %!\n" (Deck.Card.toStringVerbose cur);
	let (cur, d) = Deck.drawCard d in
	Printf.printf "Picked a %s %!\n" (Deck.Card.toStringVerbose cur);
	Printf.printf "Deck: %!"; List.iter print_string (Deck.toStringList d); Printf.printf "\n%!";
	let (cur, d) = Deck.drawCard d in
	Printf.printf "Picked a %s %!\n" (Deck.Card.toStringVerbose cur);
	Printf.printf "Deck: %!"; List.iter print_string (Deck.toStringList d); Printf.printf "\n%!";
	let (cur, d) = Deck.drawCard d in
	Printf.printf "Picked a %s %!\n" (Deck.Card.toStringVerbose cur);
	Printf.printf "\n%!"

let () =
	testone (Deck.newDeck ())

