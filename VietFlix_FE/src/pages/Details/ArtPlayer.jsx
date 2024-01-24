import { useEffect, useRef } from "react";
import Artplayer from "artplayer";

// eslint-disable-next-line react/prop-types
export default function Player({ option, getInstance, ...rest }) {
  const artRef = useRef();

  useEffect(() => {
    const art = new Artplayer({
      ...option,
      container: artRef.current,
    });

    if (getInstance && typeof getInstance === "function") {
      getInstance(art);
    }

    return () => {
      if (art && art.destroy) {
        art.destroy(false);
      }
    };
  }, [option, getInstance]);

  return <div ref={artRef} {...rest}></div>;
}
