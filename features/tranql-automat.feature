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

    Scenario:  Test TranQL's answer to include some genes and gene families and information content entities using automat
      Given the TranQL query:
      """
      select gene->gene_family<-gene2:gene->chemical_substance->information_content_entity->clinical_modifier
      from "/schema"
      where gene='NCBIGene:64241'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then  the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:64241"
      # previous panther family is missing in from our source 'PANTHER.FAMILY:PTHR48041:SF71'
      # ftp://ftp.pantherdb.org/sequence_classifications/14.1/PANTHER_Sequence_Classification_files/PTHR14.1_human_
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HGNC.FAMILY:811"
      # 'cholesterol' id
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "CHEBI:16113"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "TOPMED.VAR:phv00001589.v1.p10"

    Scenario:  Test TranQL's answer to include some genes and gene families and information content entity using automat
      Given the TranQL query:
      """
      select gene->gene_family<-gene2:gene->chemical_substance->information_content_entity
      from "/schema"
      where gene='NCBIGene:5948'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then  the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "NCBIGene:83758"
      # FATTY ACID BINDING PROTEIN
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "PANTHER.FAMILY:PTHR11955"
      # 'all-trans-retinol' chebi
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "CHEBI:17336"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Medication/supplement use"
