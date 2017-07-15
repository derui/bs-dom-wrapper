
module Event_type = struct
  type t =
    DOMContentLoaded
  | Submit

  let to_string = function
    | DOMContentLoaded -> "DOMContentLoaded"
    | Submit -> "submit"
end

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
