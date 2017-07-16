module Types = Bs_dom_wrapper_events_types

type t = Dom.dragEvent

include Bs_dom_wrapper_events_event.Make(struct type nonrec t = t end)

(* define constructor for this event *)
external make: string -> t = "DragEvent" [@@bs.new]
external makeWithOption: string -> 'a Js.t -> t = "DragEvent" [@@bs.new]

(* Define getter for this event *)
external detail: t -> float = "" [@@bs.get]
external dataTransfer: t -> Dom.dataTransfer = "" [@@bs.get]
external screenX: t -> int = "" [@@bs.get]
external screenY: t -> int = "" [@@bs.get]
external clientX: t -> int = "" [@@bs.get]
external clientY: t -> int = "" [@@bs.get]
external button: t -> int = "" [@@bs.get]
let button t = button t |> Types.Button.of_int
external ctrlKey: t -> bool = "" [@@bs.get]
external shiftKey: t -> bool = "" [@@bs.get]
external altKey: t -> bool = "" [@@bs.get]
external metaKey: t -> bool = "" [@@bs.get]
