/** @jsx jsx */
import { FC } from "react";
import { jsx } from "@emotion/core";

import { ArticleLayoutProps } from "types/components/organisms";

const Dialog: FC<ArticleLayoutProps> = ({ children }) => {
  return (
    <article
      css={{
        width: "80%",
        margin: "40px auto 0 auto",
        h3: { marginTop: 40 },
        p: { marginTop: 20 },
        ol: { margin: "20px 0 0 50px", listStylePosition: "outside" },
        ul: { margin: "20px 0 0 50px", listStylePosition: "outside" },
      }}
    >
      {children}
    </article>
  );
};

export default Dialog;
