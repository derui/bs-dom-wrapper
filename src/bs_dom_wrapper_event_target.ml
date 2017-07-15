(* EventTarget is interface, and does not be provided constructor from browser. *)

(* The type interface for functor *)
module type TYPE = sig
  type t
end

(* Make Event_target interface.  *)
module Make(T:TYPE) = struct
  external as_event_target: T.t -> Dom.eventTarget = "%identity"

  external add_event_listener: string -> (Dom.event -> unit) -> unit = "addEventListener" [@@bs.send.pipe:T.t]
  external remove_event_listener: string -> (Dom.event -> unit) -> unit = "removeEventListener" [@@bs.send.pipe:T.t]
  external dispatch_event: Dom.event -> unit = "dispatchEvent" [@@bs.send.pipe:T.t]
end

type t = Dom.eventTarget
include Make(struct type nonrec t = t end)

