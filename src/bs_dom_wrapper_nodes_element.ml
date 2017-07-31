(* Declare Element FFI from bs-webapi-incubator *)
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

module Make(T:TYPE) = struct

  external attributes: T.t -> Dom.namedNodeMap = "" [@@bs.get]
  external classList: T.t -> Dom.domTokenList = "" [@@bs.get]

  external className: T.t -> string = "" [@@bs.get]
  external setClassName: T.t -> string -> unit = "className" [@@bs.set]

  external computedName: T.t -> string = "" [@@bs.get]
  external computedRole: T.t -> string = "" [@@bs.get]

  external id: T.t -> string = "" [@@bs.get]
  external setId: T.t -> string -> unit = "id" [@@bs.set]

  external innerHTML: T.t -> string = "" [@@bs.get]
  external setInnerHTML: T.t -> string -> unit = "innerHTML" [@@bs.set]

  external localName: T.t -> string = "" [@@bs.get]
  external namespaceURI: T.t -> string option = "" [@@bs.get] [@@bs.return null_to_opt]
  external prefix: T.t -> string = "" [@@bs.get]

  external tagName: T.t -> string = "" [@@bs.get]


  (* methods *)
  external animate: 'a Js.t -> Dom.animation = "" [@@bs.send.pipe: T.t]
  external animateWithOption: 'a Js.t -> 'a Js.t -> Dom.animation = "" [@@bs.send.pipe: T.t]
  external closest: string -> Dom.element option = "" [@@bs.send.pipe: T.t]
                                                     [@@bs.return null_to_opt]
  external getAttribute: string -> string option = "" [@@bs.send.pipe: T.t]
                                                     [@@bs.return null_to_opt]
  external getAttributeNames: string -> string array = "" [@@bs.send.pipe: T.t]
  external getAttributeNS: string -> string -> string option = "" [@@bs.send.pipe: T.t]
                                                                 [@@bs.return null_to_opt]
  external getBoundingClientRect: Dom.domRect = "" [@@bs.send.pipe: T.t]
  external getClientRects: Dom.domRect array = "" [@@bs.send.pipe: T.t]
  external getElementsByClassName: string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]
  external getElementsByTagName: string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]
  external getElementsByTagNameNS: string -> string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]

  external hasAttribute: string -> bool = "" [@@bs.send.pipe: T.t]
  external hasAttributeNS: string -> string -> bool = "" [@@bs.send.pipe: T.t]
  external hasAttributes: bool = "" [@@bs.send.pipe: T.t]
  external matches: string -> bool = "" [@@bs.send.pipe: T.t]
  external remove: unit = "" [@@bs.send.pipe: T.t]
  external removeAttribute: string -> unit = "" [@@bs.send.pipe: T.t]
  external removeAttributeNS: string -> string -> unit = "" [@@bs.send.pipe: T.t]
  external setAttribute: string -> string -> unit = "" [@@bs.send.pipe: T.t]
  external setAttributeNS: string -> string -> string -> unit = "" [@@bs.send.pipe: T.t]

(* not implemented list in Element
   - client*
   - outerHTML
   - scroll*
   - shadowRoot
   - slot
   - ongotpointercapture
   - onlostpointercapture
   - onwheel
 *)

end

include Bs_dom_wrapper_nodes_event_target.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_nodes_node.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_nodes_parent_node.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_nodes_child_node.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_nodes_non_document_type_child_node.Make(struct type t = Dom.element end)
include Make(struct type t = Dom.element end)
