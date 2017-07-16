(* Implement DataTransfer object FFI *)
module File = Bs_dom_wrapper_file
module Types = Bs_dom_wrapper_events_types

type t = Dom.dataTransfer

(* properties *)
external dropEffect: t -> string = "" [@@bs.get]
let dropEffect t = dropEffect t |> Types.Drop_effect.of_string
external setDropEffect: t -> string -> unit = "dropEffect" [@@bs.set]
let setDropEffect t v = let v = Types.Drop_effect.to_string v in setDropEffect t v

external effectAllowed: t -> string = "" [@@bs.get]
let effectAllowed t = effectAllowed t |> Types.Effect_allowed.of_string
external setEffectAllowed: t -> string -> unit = "effectAllowed" [@@bs.set]
let setEffectAllowed t v = let v = Types.Effect_allowed.to_string v in setEffectAllowed t v

external files: t -> File.t array = "" [@@bs.get]
external types: t -> string array = "" [@@bs.get]

                                       (* Not implemented yet:
                                          - items
                                        *)

(* methods *)
external clearData: unit = "" [@@bs.send.pipe:t]
external getData: string -> string = "" [@@bs.send.pipe:t]
external setData: string -> string -> string = "" [@@bs.send.pipe:t]
