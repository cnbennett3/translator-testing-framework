Feature: Test TranQL's answer from a given TranQL query that uses specific reasoners

    Scenario: Test TranQL's answer when querying only ICEES
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '0-2'
           AND icees.feature.EstResidentialDensity < 1
           AND icees.maximum_p_value = 1
           AND drug_exposure !=~ '^(SCTID.*|rxcui.*|CAS.*|SMILES.*|umlscui.*)$'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cohort"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "population_of_individual_organisms"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "drug"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "association"


    Scenario: Test TranQL's answer when querying only ICEES
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '3-17'
           AND icees.feature.EstResidentialDensity = 3
           AND icees.maximum_p_value = 1
           AND drug_exposure !=~ '^(SCTID.*|rxcui.*|CAS.*|SMILES.*|umlscui.*)$'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "population_of_individual_organisms"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "AvgDailyOzoneExposure_StudyMax"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "Prednisone"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "Diphenhydramine"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "Theophylline"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "association"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "drug"


    Scenario: Test TranQL's answer when querying only ICEES
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '0-2'
           AND icees.feature.EstResidentialDensity = 1
           AND icees.feature.Race = 'African American'
           AND icees.maximum_p_value = 1
           AND icees.feature.AsthmaDx = 1
           AND drug_exposure = 'PUBCHEM:5865'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cohort"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "population_of_individual_organisms"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "drug"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "association"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "AvgDailyOzoneExposure"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Prednisone"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Fluticasone"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Albuterol"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Theophylline"


