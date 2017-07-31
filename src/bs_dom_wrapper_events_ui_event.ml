(* UIEvent wrapper and accessor from bs-webapi-incubator *)
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
