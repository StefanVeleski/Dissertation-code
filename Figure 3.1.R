#### Oral transmission of narratives ####
library(DiagrammeR)
library(DiagrammeRsvg)
grViz("digraph flowchart {
      # node definitions with substituted label text
      node [fontname = Helvetica, shape = egg]        
      tab1 [label = '@@1']
      node [fontname = Helvetica, shape = box]        
      tab2 [label = '@@2']
            node [fontname = Helvetica, shape = oval]        
      tab3 [label = '@@3']
      tab4 [label = '@@4']
      tab5 [label = '@@5']
      tab6 [label = '@@6']

      # edge definitions with the node IDs
    edge [arrowhead = dot, label = creation]        
      tab1 -> tab2;
    edge [color = grey, arrowhead = normal,  dir = both, label = reading] 
      tab2 -> tab3;
      tab2 -> tab4;
      tab2 -> tab5;
      tab2 -> tab6;
    edge [color = black, arrowhead = normal, dir = forward, label = transmission]
      tab3 -> tab4 -> tab5 -> tab6;
      }

      [1]: 'The author'
      [2]: 'The novel'
      [3]: 'Recipient 1'
      [4]: 'Recipient 2'
      [5]: 'Recipient 3'
      [6]: 'Recipient 4'
      ")%>% 
  export_svg() %>% 
  charToRaw() %>% 
  rsvg::rsvg_pdf("Figure 3.1 (1) (raw).pdf")

#### Recommendation-based transmission chains ####

graph <- grViz("digraph flowchart {
      # node definitions with substituted label text
      node [fontname = Helvetica, shape = oval]        
      tab1 [label = '@@1']
      tab2 [label = '@@2']
      tab3 [label = '@@3']
      tab4 [label = '@@4']

    edge [color = black, arrowhead = normal, dir = forward, label = transmission]
      tab1 -> tab2 -> tab3 -> tab4;
      }

      [1]: 'Recipient 1'
      [2]: 'Recipient 2'
      [3]: 'Recipient 3'
      [4]: 'Recipient 4'
      ")%>% 
  export_svg() %>% 
  charToRaw() %>% 
  rsvg::rsvg_pdf("Figure 3.1 (2) (raw).pdf")