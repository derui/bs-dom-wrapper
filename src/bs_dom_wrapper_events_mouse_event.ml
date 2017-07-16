module Types = Bs_dom_wrapper_events_types

module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct

  external altKey: T.t -> bool = "" [@@bs.get]
  external button: T.t -> int = "" [@@bs.get]
  let button t = button t |> Types.Button.of_int
  external clientX: T.t -> int = "" [@@bs.get]
  external clientY: T.t -> int = "" [@@bs.get]
  external ctrlKey: T.t -> bool = "" [@@bs.get]
  external metaKey: T.t -> bool = "" [@@bs.get]
  external movementX: T.t -> int = "" [@@bs.get]
  external movementY: T.t -> int = "" [@@bs.get]
  external offsetX: T.t -> int = "" [@@bs.get]
  external offsetY: T.t -> int = "" [@@bs.get]
  external pageX: T.t -> int = "" [@@bs.get]
  external pageY: T.t -> int = "" [@@bs.get]
  external region: T.t -> string option = "" [@@bs.get] [@@bs.return null_to_opt]
  external relatedTarget: T.t -> Dom.eventTarget option = "" [@@bs.get] [@@bs.return null_to_opt]
  external screenX: T.t -> int = "" [@@bs.get]
  external screenY: T.t -> int = "" [@@bs.get]
  external shiftKey: T.t -> bool = "" [@@bs.get]
  external which: T.t -> int = "" [@@bs.get]
end

type base = Dom._baseClass Dom._mouseEvent
type t = Dom.mouseEvent

include Bs_dom_wrapper_events_event.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_events_ui_event.Make(struct type nonrec t = t end)
include Make(struct type nonrec t = t end)

(* define constructor for this event *)
external make: string -> t = "MouseEvent" [@@bs.new]
external makeWithOption: string -> 'a Js.t -> t = "MouseEvent" [@@bs.new]
