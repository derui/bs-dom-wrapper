
module Context_type = struct
  type t =
    Context2D
  | ContextWebGL
  | ContextWebGL2
  | BitmapRenderer

  let to_string = function
    | Context2D -> "2d"
    | ContextWebGL -> "webgl"
    | ContextWebGL2 -> "webgl2"
    | BitmapRenderer -> "bigmaprenderer"

end

(* types for type of HTMLInputElement *)
module Input_type = struct
  type t =
    Checkbox
  | Radio
  | Text
  | File

  let to_string = function
    | Checkbox -> "checkbox"
    | Radio -> "radio"
    | Text -> "text"
    | File -> "file"

  let of_string = function
    | "checkbox" -> Checkbox
    | "radio" -> Radio
    | "text" | "" -> Text
    | "file" -> File
    | _ -> failwith "Unknown input type"
end
