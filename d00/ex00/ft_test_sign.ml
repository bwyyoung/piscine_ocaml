(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 09:04:29 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 09:35:05 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign i =
	if i < 0 then
		print_endline "negative"
	else
		print_endline "positive"

let test_function i =
	ft_test_sign i

let () =
	test_function (-42);
	test_function (-1);
	test_function 0;
	test_function 1;
	test_function 42
