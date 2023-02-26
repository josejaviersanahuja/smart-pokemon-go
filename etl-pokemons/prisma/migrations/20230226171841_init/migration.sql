-- CreateEnum
CREATE TYPE "Type" AS ENUM ('Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting', 'Fire', 'Flying', 'Ghost', 'Grass', 'Ground', 'Ice', 'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water');

-- CreateTable
CREATE TABLE "pokemons" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "pokemons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pokemon_stats" (
    "pokemon_id" INTEGER NOT NULL,
    "base_stamina" INTEGER NOT NULL,
    "base_attack" INTEGER NOT NULL,
    "base_defense" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "form" TEXT NOT NULL,

    CONSTRAINT "pokemon_stats_pkey" PRIMARY KEY ("pokemon_id","form")
);

-- CreateTable
CREATE TABLE "fast_moves" (
    "name" TEXT NOT NULL,
    "type" "Type" NOT NULL,
    "power" INTEGER NOT NULL,
    "energy_delta" INTEGER NOT NULL,
    "duration" INTEGER NOT NULL,
    "stamina_loss_scaler" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "fast_moves_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "charge_moves" (
    "name" TEXT NOT NULL,
    "type" "Type" NOT NULL,
    "power" INTEGER NOT NULL,
    "energy_delta" INTEGER NOT NULL,
    "duration" INTEGER NOT NULL,
    "stamina_loss_scaler" DOUBLE PRECISION NOT NULL,
    "critical_chance" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "charge_moves_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "pokemon_types" (
    "pokemon_id" INTEGER NOT NULL,
    "form" TEXT NOT NULL,
    "type" JSONB NOT NULL,
    "pokemon_name" TEXT NOT NULL,

    CONSTRAINT "pokemon_types_pkey" PRIMARY KEY ("pokemon_id","form")
);

-- CreateTable
CREATE TABLE "type_effectiveness" (
    "attacking_type" "Type" NOT NULL,
    "vs_bug" DOUBLE PRECISION NOT NULL,
    "vs_dark" DOUBLE PRECISION NOT NULL,
    "vs_dragon" DOUBLE PRECISION NOT NULL,
    "vs_electric" DOUBLE PRECISION NOT NULL,
    "vs_fairy" DOUBLE PRECISION NOT NULL,
    "vs_fighting" DOUBLE PRECISION NOT NULL,
    "vs_fire" DOUBLE PRECISION NOT NULL,
    "vs_flying" DOUBLE PRECISION NOT NULL,
    "vs_ghost" DOUBLE PRECISION NOT NULL,
    "vs_grass" DOUBLE PRECISION NOT NULL,
    "vs_ground" DOUBLE PRECISION NOT NULL,
    "vs_ice" DOUBLE PRECISION NOT NULL,
    "vs_normal" DOUBLE PRECISION NOT NULL,
    "vs_poison" DOUBLE PRECISION NOT NULL,
    "vs_psychic" DOUBLE PRECISION NOT NULL,
    "vs_rock" DOUBLE PRECISION NOT NULL,
    "vs_steel" DOUBLE PRECISION NOT NULL,
    "vs_water" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "type_effectiveness_pkey" PRIMARY KEY ("attacking_type")
);

-- CreateTable
CREATE TABLE "pokemon_fast_moves" (
    "pokemon_id" INTEGER NOT NULL,
    "fast_move_id" TEXT NOT NULL,

    CONSTRAINT "pokemon_fast_moves_pkey" PRIMARY KEY ("pokemon_id","fast_move_id")
);

-- CreateTable
CREATE TABLE "pokemon_charge_moves" (
    "pokemon_id" INTEGER NOT NULL,
    "charge_move_id" TEXT NOT NULL,

    CONSTRAINT "pokemon_charge_moves_pkey" PRIMARY KEY ("pokemon_id","charge_move_id")
);

-- CreateTable
CREATE TABLE "pokemon_elite_fast_moves" (
    "pokemon_id" INTEGER NOT NULL,
    "fast_move_id" TEXT NOT NULL,

    CONSTRAINT "pokemon_elite_fast_moves_pkey" PRIMARY KEY ("pokemon_id","fast_move_id")
);

-- CreateTable
CREATE TABLE "pokemon_elite_charge_moves" (
    "pokemon_id" INTEGER NOT NULL,
    "charge_move_id" TEXT NOT NULL,

    CONSTRAINT "pokemon_elite_charge_moves_pkey" PRIMARY KEY ("pokemon_id","charge_move_id")
);

-- CreateTable
CREATE TABLE "pvp_fast_moves" (
    "move_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" "Type" NOT NULL,
    "power" INTEGER NOT NULL,
    "energy_delta" INTEGER NOT NULL,
    "turn_duration" INTEGER NOT NULL,

    CONSTRAINT "pvp_fast_moves_pkey" PRIMARY KEY ("move_id")
);

-- CreateTable
CREATE TABLE "pvp_charge_moves" (
    "move_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" "Type" NOT NULL,
    "power" INTEGER NOT NULL,
    "energy_delta" INTEGER NOT NULL,
    "turn_duration" INTEGER NOT NULL,
    "buffs" JSONB NOT NULL,

    CONSTRAINT "pvp_charge_moves_pkey" PRIMARY KEY ("move_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "pvp_fast_moves_name_key" ON "pvp_fast_moves"("name");

-- CreateIndex
CREATE UNIQUE INDEX "pvp_charge_moves_name_key" ON "pvp_charge_moves"("name");

-- AddForeignKey
ALTER TABLE "pokemon_stats" ADD CONSTRAINT "pokemon_stats_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_types" ADD CONSTRAINT "pokemon_types_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_fast_moves" ADD CONSTRAINT "pokemon_fast_moves_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_fast_moves" ADD CONSTRAINT "pokemon_fast_moves_fast_move_id_fkey" FOREIGN KEY ("fast_move_id") REFERENCES "fast_moves"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_charge_moves" ADD CONSTRAINT "pokemon_charge_moves_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_charge_moves" ADD CONSTRAINT "pokemon_charge_moves_charge_move_id_fkey" FOREIGN KEY ("charge_move_id") REFERENCES "charge_moves"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_elite_fast_moves" ADD CONSTRAINT "pokemon_elite_fast_moves_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_elite_fast_moves" ADD CONSTRAINT "pokemon_elite_fast_moves_fast_move_id_fkey" FOREIGN KEY ("fast_move_id") REFERENCES "fast_moves"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_elite_charge_moves" ADD CONSTRAINT "pokemon_elite_charge_moves_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemon_elite_charge_moves" ADD CONSTRAINT "pokemon_elite_charge_moves_charge_move_id_fkey" FOREIGN KEY ("charge_move_id") REFERENCES "charge_moves"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
