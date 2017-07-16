module Types = Bs_dom_wrapper_events_types

type base = Dom._dragEvent
type t = Dom.dragEvent

include Bs_dom_wrapper_events_event.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_events_ui_event.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_events_mouse_event.Make(struct type nonrec t = t end)

(* define constructor for this event *)
external make: string -> t = "DragEvent" [@@bs.new]
external makeWithOption: string -> 'a Js.t -> t = "DragEvent" [@@bs.new]

(* Define getter for this event *)
external dataTransfer: t -> Dom.dataTransfer = "" [@@bs.get]
