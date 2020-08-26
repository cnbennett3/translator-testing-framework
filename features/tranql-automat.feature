Feature: Test TranQL's answer from a given TranQL when querying automat

    Scenario: Test TranQL's answer when querying only  automat topmed for an abstract entity
      Given the TranQL query:
      """
        SELECT chemical_substance->information_content_entity
          FROM "/graph/automat/topmed"
         WHERE chemical_substance='CHEBI:6495'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "HDL in blood"

    Scenario:  Test TranQL's answer to include some genes and gene families and abstact entities using automat
      Given the TranQL query:
      """
      select gene->gene_family<-gene2:gene->chemical_substance->information_content_entity->clinical_modifier
      from "/schema"
      where gene='NCBIGene:64241'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then  the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:64241"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "PANTHER.FAMILY:PTHR19241:SF239"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "CHOLESTEROL"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "TOPMED.VAR:phv00001589.v1.p10"

