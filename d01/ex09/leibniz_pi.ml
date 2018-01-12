(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   leibniz_pi.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/16 14:09:16 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 18:30:08 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let leibniz_pi dt =
	let pi4 = atan 1. in
	let compare dt' =
	if dt' <= dt then
		true
	else
		false
	in
	let found v =
	let dt' = (v -. pi4) *. 4. in
	if dt' >= 0. then
		compare dt'
	else
		compare (-. dt')
	in

	let formula i =
	(-1.) ** i /. (2. *. i +. 1.)
	in
	let rec callback i acc =
	if found acc then
		i
	else
		callback (i + 1) (acc +. formula (float_of_int i))
	in
	
	if dt < 0. then
		-1
	else
	callback 0 0.

let testone dt =
	Printf.printf "Test with [%.15f] = %!" dt;
	Printf.printf "%d\n%!" (leibniz_pi dt)

let () =
	testone (1.				);
	testone (0.1			);
	testone (0.01			);
	testone (0.001			);
	testone (0.0001			);
	testone (0.00001		);
	testone (0.000001		);
	testone (0.0000001		);
	testone (0.00000001		);
	testone (0.000_000_001	);
