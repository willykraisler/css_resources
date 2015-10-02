
    create table COMPETITIONS (
        COMPETITIONS_ID number(10,0) not null,
        EVALUATE_FACTOR varchar2(255 char),
        SCORE number(10,0),
        primary key (COMPETITIONS_ID)
    );

    create table DEVELOPMENT_PLAN (
        PLAN_ID number(10,0) not null,
        EXECUTION_DATE timestamp,
        INDICATOR varchar2(255 char),
        SPECIFIC_ACTION varchar2(255 char),
        SUPPORT varchar2(255 char),
        primary key (PLAN_ID)
    );

    create table GENERAL_DATA (
        NUMBER_ID number(19,0) not null,
        PERFORMANCE_ID number(19,0),
        ACTUAL_CHARGE varchar2(255 char),
        BOSS varchar2(255 char),
        BOSS_CHARGE varchar2(255 char),
        DATE_ timestamp,
        EVALUATION_TYPE varchar2(255 char),
        NAMES varchar2(255 char),
        PERIOD varchar2(255 char),
        primary key (NUMBER_ID),
        unique (PERFORMANCE_ID)
    );

    create table MANAGERIAL_BEHAVIOR (
        MANAGERIAL_ID number(19,0) not null,
        AUTONOMY_1 number(19,0),
        AUTONOMY_2 number(19,0),
        AUTONOMY_3 number(19,0),
        CONFIDENCE_1 number(19,0),
        CONFIDENCE_2 number(19,0),
        CONFIDENCE_3 number(19,0),
        COOPERATION_1 number(19,0),
        COOPERATION_2 number(19,0),
        COOPERATION_3 number(19,0),
        OPPORTUNITIES varchar2(255 char),
        RESPONSABILITY_1 number(19,0),
        RESPONSABILITY_2 number(19,0),
        RESPONSABILITY_3 number(19,0),
        SCORE double precision,
        STRENGTHS varchar2(255 char),
        primary key (MANAGERIAL_ID)
    );

    create table PERFORMANCE (
        PERFORMANCE_ID number(10,0) not null,
        cedula number(10,0),
        finalScore double precision,
        primary key (PERFORMANCE_ID)
    );

    create table PROFESSIONAL_BEHAVIOR (
        PROFESSIONAL_ID number(19,0) not null,
        AMBITION_1 number(19,0),
        AMBITION_2 number(19,0),
        COMMMITMENT_1 number(19,0),
        COMMMITMENT_2 number(19,0),
        COMMMITMENT_3 number(19,0),
        CREATIVITY_1 number(19,0),
        CREATIVITY_2 number(19,0),
        REACTION_1 number(19,0),
        REACTION_2 number(19,0),
        primary key (PROFESSIONAL_ID)
    );

    create table STRATEGIC_OBJECTIVE (
        id number(10,0) not null,
        calculationFormula varchar2(255 char),
        fulfillment varchar2(255 char),
        goal number(10,0),
        objetive varchar2(255 char),
        score number(10,0),
        weighing number(10,0),
        performance_PERFORMANCE_ID number(10,0),
        primary key (id)
    );

    create table SURVEY (
        SURVEY_ID number(19,0) not null,
        COMPETITIONS_ID number(19,0),
        MANAGERIAL_ID number(19,0),
        NUMBER_ID number(19,0),
        PERFORMANCE_ID number(19,0),
        PLAN_ID number(19,0),
        PROFESSIONAL_ID number(19,0),
        TRAINING_ID number(19,0),
        primary key (SURVEY_ID),
        unique (MANAGERIAL_ID),
        unique (TRAINING_ID),
        unique (NUMBER_ID),
        unique (PERFORMANCE_ID),
        unique (PROFESSIONAL_ID),
        unique (COMPETITIONS_ID),
        unique (PLAN_ID)
    );

    create table TRAINING (
        TRAINING_ID number(19,0) not null,
        DETAIL varchar2(255 char),
        NEXT_REVIEW_DATE timestamp,
        primary key (TRAINING_ID)
    );

    alter table GENERAL_DATA 
        add constraint FKE45BC8C146E680D3 
        foreign key (PERFORMANCE_ID) 
        references PERFORMANCE;

    alter table STRATEGIC_OBJECTIVE 
        add constraint FKEBBE0CDA826778C2 
        foreign key (performance_PERFORMANCE_ID) 
        references PERFORMANCE;

    alter table SURVEY 
        add constraint FK92769B5A46E680D3 
        foreign key (PERFORMANCE_ID) 
        references PERFORMANCE;

    alter table SURVEY 
        add constraint FK92769B5A911BDB9C 
        foreign key (NUMBER_ID) 
        references GENERAL_DATA;

    alter table SURVEY 
        add constraint FK92769B5A77800D01 
        foreign key (TRAINING_ID) 
        references TRAINING;

    alter table SURVEY 
        add constraint FK92769B5ACCF95F41 
        foreign key (COMPETITIONS_ID) 
        references COMPETITIONS;

    alter table SURVEY 
        add constraint FK92769B5A15B11493 
        foreign key (MANAGERIAL_ID) 
        references MANAGERIAL_BEHAVIOR;

    alter table SURVEY 
        add constraint FK92769B5A835B398E 
        foreign key (PLAN_ID) 
        references DEVELOPMENT_PLAN;

    alter table SURVEY 
        add constraint FK92769B5A8695DAD3 
        foreign key (PROFESSIONAL_ID) 
        references PROFESSIONAL_BEHAVIOR;

    create sequence hibernate_sequence;
