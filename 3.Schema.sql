-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Cardholder" (
    "holder" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Cardholder" PRIMARY KEY (
        "holder"
     )
);

CREATE TABLE "Creditcard" (
    "card_id" VARCHAR(20)   NOT NULL,
    "holder_id" INT   NOT NULL,
    CONSTRAINT "pk_Creditcard" PRIMARY KEY (
        "card_id"
     )
);

CREATE TABLE "Merchant" (
    "merchant_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "merchant_cat_id" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "Merchantcat" (
    "merchant_cat_id" INT   NOT NULL,
    "merchant_cat_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Merchantcat" PRIMARY KEY (
        "merchant_cat_id"
     )
);

CREATE TABLE "Transaction" (
    "transaction_id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "Creditcard" ADD CONSTRAINT "fk_Creditcard_holder_id" FOREIGN KEY("holder_id")
REFERENCES "Cardholder" ("holder");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_merchant_cat_id" FOREIGN KEY("merchant_cat_id")
REFERENCES "Merchantcat" ("merchant_cat_id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_card" FOREIGN KEY("card")
REFERENCES "Creditcard" ("card_id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "Merchant" ("merchant_id");

