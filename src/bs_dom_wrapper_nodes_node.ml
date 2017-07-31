(* Declare Node FFI from bs-webapi-incubator *)
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

module type TYPE = sig
  type t
end

(* Functor for implement Node interface *)
module Make(T:TYPE) = struct

  external baseURI: T.t -> string = "" [@@bs.get]
  external childNodes: T.t -> Dom.nodeList = "" [@@bs.get]
  external firstChild: T.t -> Dom.node option = "" [@@bs.get] [@@bs.return null_to_opt]
  external lastChild: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external nextSibling: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external nodeName: T.t -> string = "" [@@bs.get]
  external nodeType: T.t -> int = "" [@@bs.get]

  external nodeValue: T.t -> string option = "" [@@bs.get] [@@bs.return null_to_opt]
  external setNodeValue: T.t -> string -> unit = "nodeValue" [@@bs.set]

  external ownerDocument: T.t -> Dom.document = "" [@@bs.get]
  external parentNode: T.t -> Dom.node option = "" [@@bs.get] [@@bs.return null_to_opt]
  external previousSibling: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external textContent: T.t -> string = "" [@@bs.get]
  external setTextContent: T.t -> string -> unit = "textContent" [@@bs.set]

  external appendChild: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]
  external cloneNode: T.t = "" [@@bs.send.pipe:T.t]
  external contains: 'a Dom.node_like -> bool = "" [@@bs.send.pipe:T.t]
  external hasChildNodes: bool = "" [@@bs.send.pipe:T.t]
  external insertBefore: 'a Dom.node_like -> 'b Dom.node_like -> 'a Dom.node_like = "" [@@bs.send.pipe:T.t]

  external isDefaultNamespace: string -> bool = "" [@@bs.send.pipe:T.t]
  external isEqualNode: 'a Dom.node_like -> bool = "" [@@bs.send.pipe:T.t]
  external isSameNode: 'a Dom.node_like -> bool = "" [@@bs.send.pipe:T.t]
  external lookupPrefix: string = "" [@@bs.send.pipe:T.t]
  external lookupNamespaceURI: string option = "" [@@bs.send.pipe:T.t][@@bs.return null_to_opt]
  external normalize: unit = "" [@@bs.send.pipe:T.t]
  external removeChild: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]

(* Not implemented list below.
   - replaceChild
   - getRootNode
   - compareDocumentPosision
 *)
end

include Bs_dom_wrapper_nodes_event_target.Make(struct type t = Dom.node end)
include Make(struct type t = Dom.node end)
