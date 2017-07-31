(* Declare eventTarget FFI from bs-webapi-incubator *)
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

(* Make Event_target interface.  *)
module Make(T:TYPE) = struct
  external asEventTarget: T.t -> Dom.eventTarget = "%identity"

  external addEventListener: string -> (Dom.event -> unit) -> unit = "addEventListener" [@@bs.send.pipe:T.t]
  external removeEventListener: string -> (Dom.event -> unit) -> unit = "removeEventListener" [@@bs.send.pipe:T.t]
  external dispatchEvent: Dom.event -> unit = "dispatchEvent" [@@bs.send.pipe:T.t]
end

type t = Dom.eventTarget
include Make(struct type nonrec t = t end)

