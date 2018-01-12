(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/19 14:22:35 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/19 14:33:39 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
	let c = Color.Spade in Printf.printf "Test: \"%s\" \"%s\"\n%!" (Color.toString c) (Color.toStringVerbose c);
	let c = Color.Heart in Printf.printf "Test: \"%s\" \"%s\"\n%!" (Color.toString c) (Color.toStringVerbose c);
	let c = Color.Diamond in Printf.printf "Test: \"%s\" \"%s\"\n%!" (Color.toString c) (Color.toStringVerbose c);
	let c = Color.Club in Printf.printf "Test: \"%s\" \"%s\"\n%!" (Color.toString c) (Color.toStringVerbose c);