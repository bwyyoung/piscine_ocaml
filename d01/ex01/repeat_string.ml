(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 09:26:57 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 09:46:13 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let repeat_string ?(str = "x") n =
	let rec callback s n =
	if n <= 0 then
		s
	else
		callback (s ^ str) (n - 1)
	in
	
	if n < 0 then
	"Error"
	else
	callback "" n

let test2 str n =
	Printf.printf "Test with [%+2d * \"%s\"]: %s\n%!" n str (repeat_string ~str:str n)
		 
let test1 n =
	Printf.printf "Test with [%+2d * %s]: %s\n%!" n "default" (repeat_string n)

let () =
	test1 (-1);
	test1 0;
	test1 1;
	test1 2;
	test1 3;
	test2 "" (-1);
	test2 "" 0;
	test2 "" 1;
	test2 "" 2;
	test2 "" 3;
	test2 "a" (-1);
	test2 "a" 0;
	test2 "a" 1;
	test2 "a" 2;
	test2 "a" 3;
	test2 "whatwhatwhat" (-1);
	test2 "aaaaa" 0;
	test2 "xx" 1;
	test2 "Toto" 2;
	test2 "Error" 3;
