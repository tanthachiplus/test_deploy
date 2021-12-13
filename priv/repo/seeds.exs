# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TestDeploy.Repo.insert!(%TestDeploy.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TestDeploy.Repo
# TseModels.Market.Stock
# |> Repo.insert_all(
#   [
#     %{id: 1, exchng: "HSX", no: "SSI", close_price: 100.0},
#     %{id: 2, exchng: "HSX", no: "VIC", close_price: 70.0},
#     %{id: 3, exchng: "HSX", no: "VNM", close_price: 85.0},
#     %{id: 4, exchng: "HSX", no: "FLC", close_price: 125.5},
#     %{id: 5, exchng: "HNX", no: "APP", close_price: 50.0},
#     %{id: 6, exchng: "HNX", no: "APC", close_price: 40.5}
#   ]
# )

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "SSI",
  price: 100_000,
  ceiling_price: 107_000,
  floor_price: 93_000,
  market_id: "VN",
  session_id: "LO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "VIC",
  price: 70_000,
  ceiling_price: 75_000,
  floor_price: 65_000,
  market_id: "VN",
  session_id: "ATO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "VJC",
  price: 98_000,
  ceiling_price: 104_000,
  floor_price: 92_000,
  market_id: "VN",
  session_id: "PRE"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "GAS",
  price: 95_000,
  ceiling_price: 109_000,
  floor_price: 92_000,
  market_id: "VN",
  session_id: "ITM"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "VNM",
  price: 85_000,
  ceiling_price: 91_000,
  floor_price: 79_000,
  market_id: "VN",
  session_id: "ATO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HSX",
  no: "FLC",
  price: 111_500,
  ceiling_price: 128_500,
  floor_price: 111_500,
  market_id: "VN",
  session_id: "LO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HNX",
  no: "APP",
  price: 50_000,
  ceiling_price: 55_000,
  floor_price: 45_000,
  market_id: "VN",
  session_id: "ATC"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HNX",
  no: "APC",
  price: 40_000,
  ceiling_price: 44_000,
  floor_price: 36_000,
  market_id: "VN",
  session_id: "LO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "HNX",
  no: "AMV",
  price: 14_000,
  ceiling_price: 15_500,
  floor_price: 12_000,
  market_id: "VN",
  session_id: "ITM"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "UPC",
  no: "ABI",
  price: 70,
  ceiling_price: 83_000,
  floor_price: 57_000,
  market_id: "VN",
  session_id: "LO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "DER",
  no: "VN30F2111",
  price: 100_500,
  ceiling_price: 107_300,
  floor_price: 92_700,
  market_id: "VNFE",
  session_id: "ATO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "DER",
  no: "VN30F2112",
  price: 40_500,
  ceiling_price: 43_800,
  floor_price: 37_300,
  market_id: "VNFE",
  session_id: "LO"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "DER",
  no: "VN30F2201",
  price: 50_000,
  ceiling_price: 55_000,
  floor_price: 45_000,
  market_id: "VNFE",
  session_id: "PRE"
})
|> Repo.insert()

%TseModels.Market.Stock{}
|> TseModels.Market.Stock.changeset(%{
  exchng: "DER",
  no: "VN30F2202",
  price: 95_000,
  ceiling_price: 109_000,
  floor_price: 92_000,
  market_id: "VNFE",
  session_id: "ITM"
})
|> Repo.insert()
