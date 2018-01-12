(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/17 15:18:45 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/18 19:36:43 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let crossover la lb =
	let rec is_in l v =
	match l with
	| []					-> false
	| hd::_ when hd = v		-> true
	| _::tl					-> is_in tl v
	in
	let rec callback l la lb =
	match la with
	| []											-> l
	| hd::tl when is_in lb hd						-> callback (hd::l) tl lb
	| _::tl											-> callback l tl lb
	in
	callback [] la lb

let printcode_f x =
	Printf.printf "%-10.2f%!" x
let printcode_d x =
	Printf.printf "%-4d%!" x
let printcode_s x =
	Printf.printf "%-10s%!" x

let testone fprint la lb =
	Printf.printf "    la: %!";
	List.iter fprint la;
	Printf.printf "\n    lb: %!";
	List.iter fprint lb;
	Printf.printf "\nResult: %!";
	List.iter fprint (crossover la lb);
	Printf.printf "\n\n%!"

let () =


	Printf.printf "strings\n%!";
	testone printcode_s [] [];
	testone printcode_s ["42"] [];
	testone printcode_s [] ["42"];
	testone printcode_s ["42"] ["42"];
	testone printcode_s ["42"] ["99"];
	testone printcode_s ["42"] ["99"; "99"];
	testone printcode_s ["42"; "42"] ["99"; "99"; "99"];
	testone printcode_s ["42"; "99"] ["99"; "42"];
	testone printcode_s ["42"; "99"; "42"; "101"] ["99"; "42"; "99"; "103"];
	Printf.printf "floats\n%!";
	testone printcode_f [] [];
	testone printcode_f [42.] [];
	testone printcode_f [] [42.];
	testone printcode_f [42.] [42.];
	testone printcode_f [42.] [99.];
	testone printcode_f [42.] [99.; 99.];
	testone printcode_f [42.; 42.] [99.; 99.; 99.];
	testone printcode_f [42.; 99.] [99.; 42.];
	testone printcode_f [42.; 99.; 42.; 101.] [99.; 42.; 99.; 103.];
	Printf.printf "ints\n%!";
	testone printcode_d [] [];
	testone printcode_d [42] [];
	testone printcode_d [] [42];
	testone printcode_d [42] [42];
	testone printcode_d [42] [99];
	testone printcode_d [42] [99; 99];
	testone printcode_d [42; 42] [99; 99; 99];
	testone printcode_d [42; 99] [99; 42];
	testone printcode_d [42; 99; 42; 101] [99; 42; 99; 103];

