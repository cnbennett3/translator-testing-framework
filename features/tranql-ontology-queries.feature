Feature: Test ontological queries
  Scenario: Test TranQL's answer when querying robokop with children where clause
      Given the TranQL query:
      """
        select chemical_substance->gene->disease
          FROM "/graph/gamma/quick"
         WHERE disease=children("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "adenosine"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "nitric oxide"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005405"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
  Scenario: Test TranQL's answer when querying schema with children where clause
      Given the TranQL query:
      """
        select disease<-gene<-chemical_substance
          FROM "/schema"
         WHERE disease=children("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "adenosine"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "nitric oxide"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005405"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
  Scenario: Test TranQL's answer when querying robokop with descendants where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/graph/gamma/quick"
         WHERE disease=descendants("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004784"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005405"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:2515"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"


  Scenario: Test TranQL's answer when querying schema with descendants where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/schema"
         WHERE disease=descendants("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004784"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005405"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:2515"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"


  Scenario: Test TranQL's answer when querying robokop with parents where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/graph/gamma/quick"
         WHERE disease=parents("MONDO:0005405")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # look for asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004979"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"


  Scenario: Test TranQL's answer when querying schema with parents where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/schema"
         WHERE disease=parents("MONDO:0005405")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004979"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"


  Scenario: Test TranQL's answer when querying robokop with sibilings where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/graph/gamma/quick"
         WHERE disease=siblings("MONDO:0005405")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "gene_associated_with_condition"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004784"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:5775"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:2515"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"

  Scenario: Test TranQL's answer when querying schema with sibilings where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/schema"
         WHERE disease=siblings("MONDO:0005405")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "intrinsic asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "gene_associated_with_condition"
      # Some subclasses of asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004766"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004784"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0022742"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:5775"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:2515"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004765"


  Scenario: Test TranQL's answer when querying schema with parents where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/schema"
         WHERE disease=exact_match("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # look for asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004979"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"


  Scenario: Test TranQL's answer when querying schema with parents where clause
      Given the TranQL query:
      """
        select gene->disease
          FROM "/schema"
         WHERE disease=exact_match("MONDO:0004979")
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "asthma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      # look for asthma
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004979"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:79899"