(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 12:52:23 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 18:27:26 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_sum f x n =
	let rec callback i acc =
	if i > n then
		acc
	else
		callback (i + 1) (acc +. f i)
	in
	if n < x then
		nan
	else
		callback x 0.

let testone f fname x n =
	Printf.printf "Test with [\027[35m%-19s\027[0m %d %d] = %f\n%!" fname x n (ft_sum f x n)

let testoneprime x y =
	testone (fun i -> float_of_int (i * i)) "(fun i -> float_of_int (i * i))" x y;
	testone (fun i -> float_of_int i ** 3.14) "(fun i -> float_of_int i ** 3.14)" x y

let () =
	testoneprime (-5) 5;
	testoneprime 0 0;
	testoneprime 0 1;
	testoneprime 1 0;
	testoneprime 0 2;
	testoneprime 0 3;
	testoneprime 0 4;
	testoneprime 1 2;
	testoneprime 1 3;
	testoneprime 1 4;
	testoneprime 2 2;
	testoneprime 2 3;
	testoneprime 2 4;
