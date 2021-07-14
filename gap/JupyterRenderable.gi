
InstallMethod( JupyterRender, "default fallback"
             , [ IsObject ],
function(obj)
    local str;
    # Use the strings corresponding to 'ViewObj'
    # until enough 'ViewString' methods are available.
    str := StringView(obj);
    RemoveCharacters(str, "\<\>\n");
    return Objectify( JupyterRenderableType
                    , rec( data := rec( text\/plain := str )
                         , metadata := rec( text\/plain := "") ) );
end);

InstallMethod( JupyterRender, "default fallback"
               , [ IsJupyterRenderableRep ],
               IdFunc);

InstallMethod( JupyterRenderableData, "for a JupyterRenderable"
               , [  IsJupyterRenderableRep ]
               , x -> x!.data );

InstallMethod( JupyterRenderableMetadata, "for a JupyterRenderable"
               , [  IsJupyterRenderableRep ]
               , x -> x!.metadata );

InstallMethod( ViewString, "for a JupyterRenderable"
               , [  IsJupyterRenderableRep ]
               , x -> "<jupyter renderable>" );

InstallMethod( JupyterRenderable, "for a record and a record"
               , [ IsObject, IsObject ],
function(data, metadata)
    return Objectify( JupyterRenderableType
                    , rec( data := data, metadata := metadata ) );
end);
