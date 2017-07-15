(* Implement wrapper for node *)
module type TYPE = sig
  type t
end

(* Functor for implement Node interface *)
module Make(T:TYPE) = struct
  include Bs_dom_wrapper_event_target.Make(T)

  external baseURI: T.t -> string = "" [@@bs.get]
  external childNodes: T.t -> Dom.nodeList = "" [@@bs.get]
  external firstChild: T.t -> Dom.node option = "" [@@bs.get] [@@bs.return null_to_opt]
  external lastChild: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external nextSibling: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external nodeName: T.t -> string = "" [@@bs.get]
  external nodeType: T.t -> int = "" [@@bs.get]

  external nodeValue: T.t -> string option = "" [@@bs.get] [@@bs.return null_to_opt]
  external setNodeValue: T.t -> string -> unit = "" [@@bs.set]

  external ownerDocument: T.t -> Dom.document = "" [@@bs.get]
  external parentNode: T.t -> Dom.node option = "" [@@bs.get] [@@bs.return null_to_opt]
  external previousSibling: T.t -> Dom.node option = "" [@@bs.get][@@bs.return null_to_opt]
  external textContent: T.t -> string = "" [@@bs.get]
  external setTextContent: T.t -> string -> unit = "" [@@bs.set]

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

include Make(struct type t = Dom.node end)
