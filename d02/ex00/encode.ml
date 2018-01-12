(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/17 13:57:49 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/17 15:15:36 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let encode la =
	let rec callback la lb =
		match la, lb with
		| [], _					-> lb
		| hda::tla, []			-> callback tla [(1, hda)]
		| hda::tla, hdb::tlb	-> savehead hda tla hdb tlb
	and savehead hda tla hdb tlb =
		match hdb with
		| (n, v) when v = hda	-> callback tla ((n + 1, v)::tlb)
		| _						-> callback tla ((1, hda)::hdb::tlb)
	in
	let rec rev l l' =
	match l with
	| []					-> l'
	| hdl::tll				-> rev tll (hdl::l')
	in
	rev (callback la []) []

let print_f x =
	Printf.printf "%-10.2f%!" x
let print_d x =
	Printf.printf "%-10d%!" x
let print_s x =
	Printf.printf "%-10s%!" x
				
let printcode_f (n, x) =
	Printf.printf "%-10s%!" (Printf.sprintf "%.2f(%d)" x n)
let printcode_d (n, x) =
	Printf.printf "%-10s%!" (Printf.sprintf "%d(%d)" x n)
let printcode_s (n, x) =
	Printf.printf "%-10s%!" (Printf.sprintf "\"%s\"(%d)" x n)

let testone fl fel l =
	Printf.printf "List  : %!";
	List.iter fl l;
	Printf.printf "\nResult: %!";
	List.iter fel (encode l);
	Printf.printf "\n\n%!"

let () =
	Printf.printf "strings\n%!";
	testone print_s printcode_s [""];
	testone print_s printcode_s ["5"];
	testone print_s printcode_s ["5"; "5"];
	testone print_s printcode_s ["5"; "42"];
	testone print_s printcode_s ["5"; "42"; "5"];
	testone print_s printcode_s ["5"; "5"; "42"];
	testone print_s printcode_s ["5"; "5"; "42"; "5"; "5"; "5"; "42"];
	Printf.printf "floats\n%!";
	testone print_f printcode_f [];
	testone print_f printcode_f [5.];
	testone print_f printcode_f [5.; 5.];
	testone print_f printcode_f [5.; 42.];
	testone print_f printcode_f [5.; 42.; 5.];
	testone print_f printcode_f [5.; 5.; 42.];
	testone print_f printcode_f [5.; 5.; 42.; 5.; 5.; 5.; 42.];
	Printf.printf "ints\n%!";
	testone print_d printcode_d [];
	testone print_d printcode_d [5];
	testone print_d printcode_d [5; 5];
	testone print_d printcode_d [5; 42];
	testone print_d printcode_d [5; 42; 5];
	testone print_d printcode_d [5; 5; 42];
	testone print_d printcode_d [5; 5; 42; 5; 5; 5; 42];