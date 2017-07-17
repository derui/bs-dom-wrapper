
type t = Dom.window

external atob: string -> int array = "" [@@bs.send.pipe:t]
external btoa: 'a Js.Array.t -> string = "" [@@bs.send.pipe:t]
