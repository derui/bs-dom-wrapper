(* Event wrapper and accessor *)

(* The type interface for functor *)
module type TYPE = sig
  type t
end


(* Functor to make event module specified type.
     This module is often used to implement an event.
 *)
module Make(T:TYPE) = struct
  external bubbles : T.t -> bool = "" [@@bs.get]
  external cancelable : T.t -> bool = "" [@@bs.get]
  external composed : T.t -> bool = "" [@@bs.get]
  external currentTarget : T.t -> Dom.eventTarget = "" [@@bs.get]
  external defaultPrevented : T.t -> bool = "" [@@bs.get]
  external eventPhase : T.t -> int = "" [@@bs.get]
  external target : T.t -> Dom.eventTarget = "" [@@bs.get]
  external timeStamp : T.t -> float = "" [@@bs.get]
  external _type : T.t -> string = "type" [@@bs.get]
  external isTrusted : T.t -> bool = "" [@@bs.get]

  external preventDefault: unit -> unit = "" [@@bs.send.pipe:T.t]
  external stopPropagation: unit -> unit = "" [@@bs.send.pipe:T.t]
  external stopImmediatePropagation: unit -> unit = "" [@@bs.send.pipe:T.t]
end

(* Implement default event interface *)
type t = Dom.event
include Make(struct type nonrec t = t end)

external make: string -> Dom.event = "Event" [@@bs.new]
external make_with_option: string -> 'a Js.t -> Dom.event = "Event" [@@bs.new]
