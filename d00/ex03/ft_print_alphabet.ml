(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 09:54:45 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 09:58:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec callback i =
	print_char (char_of_int i);
	if i < int_of_char 'z' then
		callback (i + 1)

let ft_print_alphabet () =
	callback (int_of_char 'a');
	print_char '\n'
		 
let () =
	ft_print_alphabet ();
	ft_print_alphabet ();
	ft_print_alphabet ();
	ft_print_alphabet ();
	ft_print_alphabet ();
	ft_print_alphabet ()
