---
header-includes: |
  \usepackage{fontspec}
  \usepackage{xeCJK}
  \setCJKmainfont{Noto Sans SC}
---

# Dockerized Markdown-to-PDF Converter

To convert all Markdown files in a directory, say `~/my_artwork`, into
PDF files, please run the following command:

```bash
docker run --rm -v $HOME/my_artwork:/work cxwangyi/pandoc
```

## GraphViz

```dot
digraph G {
  bgcolor="#ffffff00"
  rankdir=LR

  subgraph cluster_0 {
    style="filled, rounded";
    color="#E6EAF2"
    node [style=filled,color=white];
    a0 -> a1;
  }

  subgraph cluster_1 {
    node [style=filled color="#E6EAF2"];
    b3;
    label = "System B";
    style="dashed, rounded"
    color=blue
  }

  start -> a0;
  start -> b3;
  a1 -> b3;

  start [label="load" shape=folder];
}
```

## Math

$$\oiint_V f(s,t) \,ds\,dt$$

## Tables

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|   12  |  12  |    12   |    12  |
|   12  |  12  |    12   |    12  |
|   12  |  12  |    12   |    12  |
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

## CJK

- 这段话是简体中文
- 這段話是繁體中文
- この一節は日本語です

