(* Declare UIEvent FFI *)

(* The type interface for functor *)
module type TYPE = sig
  type t
end

(* Functor to make event module specified type.
     This module is often used to implement an event.
 *)
module Make(T:TYPE) = struct
  external detail : T.t -> int = "" [@@bs.get]
  external layerX : T.t -> int = "" [@@bs.get]
  external layerY : T.t -> int = "" [@@bs.get]
  external pageX : T.t -> int = "" [@@bs.get]
  external pageY : T.t -> int = "" [@@bs.get]
  external whicn: T.t -> int = "" [@@bs.get]
end

(* Implement default event interface *)
type t = Dom.uiEvent
include Bs_dom_wrapper_events_event.Make(struct type nonrec t = t end)
include Make(struct type nonrec t = t end)

external make: string -> t = "UIEvent" [@@bs.new]
external makeWithOption: string -> 'a Js.t -> t = "UIEvent" [@@bs.new]
