Feature: Test dug queries
  # ----------------- Disease -> Phenotypic feature ------------
  Scenario: Test TranQL's answer when querying robokop with disease (intracerebral hemorrhage) from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0013792"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Phenotypic abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormality of blood circulation"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal cardiovascular system physiology"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0004968"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0011029"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012443"

  Scenario: Test TranQL's answer when querying schema with disease (intracerebral hemorrhage)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/schema"
         WHERE disease="MONDO:0013792"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Phenotypic abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormality of blood circulation"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal cardiovascular system physiology"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0004968"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0011029"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012443"

   Scenario: Test TranQL's answer when querying robokjop with disease (hypertensive disorder)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005044"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Fetal distress"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Heart murmur"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Anasarca"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0100735"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000875"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000017"

   Scenario: Test TranQL's answer when querying schema with disease (hypertensive disorder)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/schema"
         WHERE disease="MONDO:0005044"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Fetal distress"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Heart murmur"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Anasarca"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0100735"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000875"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000017"
   # ---------- End  Disease -> phenotypic_feature -------------------

   # ---------- start Phenotypic_feature -> disease -------------------
   Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0002140/Ischemic stroke) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "brain ischemia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "stroke disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "pulmonary arteriovenous malformation (disease)"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0014936"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0008535"
  Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0002140/Ischemic stroke) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/schema"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "brain ischemia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "stroke disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "pulmonary arteriovenous malformation (disease)"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0014936"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0008535"

  Scenario: Test TranQL's answer when querying robokop with phenotypic feature (HP:0001907/Thromboembolism) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0001907"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hematologic disease"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0019959"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0010602"


  Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0001907/Thromboembolism) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/schema"
         WHERE phenotypic_feature="HP:0001907"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hematologic disease"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0019959"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0010602"

  # ---------- end  Phenotypic_feature -> disease -------------------

  # ---------- start disease -> anatomical_entity -------------------

  Scenario: Test TranQL's answer when querying robokop with disease  (MONDO:0005275/lung disease) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005275"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "trunk"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0000915"

  Scenario: Test TranQL's answer when querying schema with disease  (MONDO:0005275/lung disease) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/schema"
         WHERE disease="MONDO:0005275"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "trunk"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0000915"

  Scenario: Test TranQL's answer when querying robokop with disease  (MONDO:0005098/stroke disorder) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005098"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "vessel"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0003499"

  Scenario: Test TranQL's answer when querying schema with disease  (MONDO:0005098/stroke disorder) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/schema"
         WHERE disease="MONDO:0005098"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "vessel"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0003499"



  # --------- end disease -> anatomical_entity ---------------------
  # --------- start chemical_substance -> disease ---------------------
  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:16737/creatinine) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/graph/gamma/quick"
         WHERE chemical_substance="CHEBI:16737"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cystic fibrosis"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0009563"

  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:16737/creatinine) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/schema"
         WHERE chemical_substance="CHEBI:16737"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cystic fibrosis"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0009563"

  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:17855/triglyceride) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/graph/gamma/quick"
         WHERE chemical_substance="CHEBI:17855"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "metabolic disease"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "treats"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004946"


  Scenario: Test TranQL's answer when querying schema with chemical substance  (CHEBI:17855/triglyceride) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/schema"
         WHERE chemical_substance="CHEBI:17855"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "metabolic disease"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "treats"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004946"


  # --------- end chemical_substance -> disease ---------------------

  #---------- start phenotypic_feature -> anatomical_entity --------------
  Scenario: Test TranQL's answer when querying schema with phenotypic feature  from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
    # here no data seems to available in gamma for such hop

  Scenario: Test TranQL's answer when querying schema with phenotypic feature from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->anatomical_entity
          FROM "/schema"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"




  #---------- end phenotypic_feature -> anatomical_entity --------------

  #-------------- start anatomical_entity -> disease ---------------
  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0000948/heart) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0000948"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "myocardial disorder"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002869"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005310"

  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0000948/heart) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0000948"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "myocardial disorder"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002869"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005310"

  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (CL:0000738/leukocyte) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="CL:0000738"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hemophagocytic syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "gastric mucosa-associated lymphoid tissue lymphoma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "located_in"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002724"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005402"

  Scenario: Test TranQL's answer when querying schema with anatomical entity  (CL:0000738/leukocyte) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/schema"
         WHERE anatomical_entity="CL:0000738"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hemophagocytic syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "gastric mucosa-associated lymphoid tissue lymphoma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002724"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005402"

  #-------------- end anatomical_entity -> disease ---------------

  #-------------- start anatomical_entity -> phenotypic_feature ---------------
  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0001621/coronary artery) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0001621"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery calcification"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery raised atherosclerotic lesion"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0004723"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0005616"


  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0001621/coronary artery) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0001621"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery calcification"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery raised atherosclerotic lesion"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0004723"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0005616"


  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0001088/urine) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0001088"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal urinary copper concentration"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Increased urinary glycerol"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012127"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0010473"


  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0001088/urine) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0001088"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal urinary copper concentration"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Increased urinary glycerol"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012127"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0010473"
  #-------------- end anatomical_entity -> phenotypic_feature ---------------