(* Event wrapper and accessor from bs-webapi-incubator *)
(*
MIT License

Copyright (c) 2017 reasonml-community

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 *)

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
