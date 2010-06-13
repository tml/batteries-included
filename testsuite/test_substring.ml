open OUnit
open BatSubstring
open BatPervasives

let test_dropr =
  let aeq = assert_equal ~printer:identity in
  [
    begin "dropr empty" >:: fun () ->
      aeq "" (to_string (dropr (const true) (of_string "")));
      aeq "" (to_string (dropr (const false) (of_string "")))
    end;
    begin "dropr none" >:: fun () ->
      aeq "foo" (to_string (dropr (const false) (of_string "foo")))
    end;
    begin "dropr all" >:: fun () ->
      aeq "" (to_string (dropr (const true) (of_string "foo")))
    end;
    begin "dropr some" >:: fun () ->
      aeq "f" (to_string (dropr ((=) 'o') (of_string "foo")))
    end;
  ];;

let test_dropl =
  let aeq = assert_equal ~printer:identity in
  [
    begin "dropl empty" >:: fun () ->
      aeq "" (to_string (dropl (const true) (of_string "")));
      aeq "" (to_string (dropl (const false) (of_string "")))
    end;
    begin "dropl none" >:: fun () ->
      aeq "foo" (to_string (dropl (const false) (of_string "foo")))
    end;
    begin "dropl all" >:: fun () ->
      aeq "" (to_string (dropl (const true) (of_string "foo")))
    end;
    begin "dropl some" >:: fun () ->
      aeq "oo" (to_string (dropl ((=) 'f') (of_string "foo")))
    end;
  ];;

let test_taker =
  let aeq = assert_equal ~printer:identity in
  [
    begin "taker empty" >:: fun () ->
      aeq "" (to_string (taker (const true) (of_string "")));
      aeq "" (to_string (taker (const false) (of_string "")))
    end;
    begin "taker none" >:: fun () ->
      aeq "" (to_string (taker (const false) (of_string "foo")))
    end;
    begin "taker all" >:: fun () ->
      aeq "foo" (to_string (taker (const true) (of_string "foo")))
    end;
    begin "taker some" >:: fun () ->
      aeq "oo" (to_string (taker ((=) 'o') (of_string "foo")))
    end;
  ];;

let test_takel =
  let aeq = assert_equal ~printer:identity in
  [
    begin "takel empty" >:: fun () ->
      aeq "" (to_string (takel (const true) (of_string "")));
      aeq "" (to_string (takel (const false) (of_string "")))
    end;
    begin "takel none" >:: fun () ->
      aeq "" (to_string (takel (const false) (of_string "foo")))
    end;
    begin "takel all" >:: fun () ->
      aeq "foo" (to_string (takel (const true) (of_string "foo")))
    end;
    begin "takel some" >:: fun () ->
      aeq "f" (to_string (takel ((=) 'f') (of_string "foo")))
    end;
  ];;

let to_strings = to_string *** to_string

let test_splitr =
  let printer (s1,s2) = Printf.sprintf "(%S,%S)" s1 s2 in
  let aeq = assert_equal ~printer in
  [
    begin "splitr empty" >:: fun () ->
      aeq ("","") (to_strings (splitr (const true) (of_string "")));
      aeq ("","") (to_strings (splitr (const false) (of_string "")))
    end;
    begin "splitr none" >:: fun () ->
      aeq ("foo","")
        (to_strings (splitr (const false) (of_string "foo")))
    end;
    begin "splitr all" >:: fun () ->
      aeq ("","foo") (to_strings (splitr (const true) (of_string "foo")))
    end;
    begin "splitr some" >:: fun () ->
      aeq ("f","oo") (to_strings (splitr ((=) 'o') (of_string "foo")))
    end;
  ];;

let test_splitl =
  let printer (s1,s2) = Printf.sprintf "(%S,%S)" s1 s2 in
  let aeq = assert_equal ~printer in
  [
    begin "splitl empty" >:: fun () ->
      aeq ("","") (to_strings (splitl (const true) (of_string "")));
      aeq ("","") (to_strings (splitl (const false) (of_string "")))
    end;
    begin "splitl none" >:: fun () ->
      aeq ("","foo")
        (to_strings (splitl (const false) (of_string "foo")))
    end;
    begin "splitl all" >:: fun () ->
      aeq ("foo","") (to_strings (splitl (const true) (of_string "foo")))
    end;
    begin "splitl some" >:: fun () ->
      aeq ("f","oo") (to_strings (splitl ((=) 'f') (of_string "foo")))
    end;
  ];;

let tests = "Substring" >::: [
  "dropr" >::: test_dropr;
  "dropl" >::: test_dropl;
  "taker" >::: test_taker;
  "takel" >::: test_takel;
  "splitr" >::: test_splitr;
  "splitl" >::: test_splitl;
];;
