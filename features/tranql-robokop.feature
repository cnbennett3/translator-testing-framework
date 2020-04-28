Feature: Test TranQL's answer from a given TranQL query that uses specific reasoners

    @availability
    Scenario: Test TranQL's answer when querying Gamma for disease to gene
      Given the TranQL query:
      """
        set disease = "MONDO:0016419"
        SELECT disease->gene
          FROM "/graph/gamma/quick"
        WHERE disease=$disease
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hereditary breast carcinoma"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "HMMR"



   Scenario: Test TranQL's answer when querying Gamma for disease to phenotypic_feature
      Given the TranQL query:
      """
        set disease = "MONDO:0005737"
        SELECT disease->phenotypic_feature
          FROM "/graph/gamma/quick"
        WHERE disease=$disease
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Ebola hemorrhagic fever"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Gingival bleeding"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Acute hepatic failure"
#      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Gastrointestinal hemorrhage"
#      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal bleeding"


    Scenario: Test TranQL's answer when querying Gamma for chemical substance to disease
      Given the TranQL query:
      """
        set chemical = "PUBCHEM:10182969"
        SELECT chemical_substance->disease
          FROM "/graph/gamma/quick"
        WHERE chemical_substance=$chemical
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "stroke disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "myocardial infarction (disease)"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "prevents"



    Scenario: Test TranQL's answer when querying Gamma for chemical_substance to disease
      Given the TranQL query:
      """
        set chemical = "CHEMBL:CHEMBL3"
        SELECT chemical_substance->disease
          FROM "/graph/gamma/quick"
        WHERE chemical_substance=$chemical
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "(S)-nicotine"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "prevents"

