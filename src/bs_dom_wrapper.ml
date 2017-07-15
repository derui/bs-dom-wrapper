(* Wrapper *)

module Events = Bs_dom_wrapper_events

external create_element : Dom.document -> string -> Dom.node = "createElement" [@@bs.send]

(* binding document.createTextNode *)
external create_text_node : Dom.document -> string -> Dom.node = "createTextNode" [@@bs.send]

external get_by_id : Dom.document -> string -> Dom.node option =
  "getElementById" [@@bs.send] [@@bs.return null_to_opt]

external query_selector : Dom.document -> string -> Dom.node option =
  "querySelector" [@@bs.send] [@@bs.return null_to_opt]
