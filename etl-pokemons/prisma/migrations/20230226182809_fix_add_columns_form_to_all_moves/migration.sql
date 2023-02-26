/*
  Warnings:

  - The primary key for the `pokemon_charge_moves` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `pokemon_elite_charge_moves` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `pokemon_elite_fast_moves` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `pokemon_fast_moves` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `form` to the `pokemon_charge_moves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `form` to the `pokemon_elite_charge_moves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `form` to the `pokemon_elite_fast_moves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `form` to the `pokemon_fast_moves` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "pokemon_charge_moves" DROP CONSTRAINT "pokemon_charge_moves_pkey",
ADD COLUMN     "form" TEXT NOT NULL,
ADD CONSTRAINT "pokemon_charge_moves_pkey" PRIMARY KEY ("pokemon_id", "charge_move_id", "form");

-- AlterTable
ALTER TABLE "pokemon_elite_charge_moves" DROP CONSTRAINT "pokemon_elite_charge_moves_pkey",
ADD COLUMN     "form" TEXT NOT NULL,
ADD CONSTRAINT "pokemon_elite_charge_moves_pkey" PRIMARY KEY ("pokemon_id", "charge_move_id", "form");

-- AlterTable
ALTER TABLE "pokemon_elite_fast_moves" DROP CONSTRAINT "pokemon_elite_fast_moves_pkey",
ADD COLUMN     "form" TEXT NOT NULL,
ADD CONSTRAINT "pokemon_elite_fast_moves_pkey" PRIMARY KEY ("pokemon_id", "fast_move_id", "form");

-- AlterTable
ALTER TABLE "pokemon_fast_moves" DROP CONSTRAINT "pokemon_fast_moves_pkey",
ADD COLUMN     "form" TEXT NOT NULL,
ADD CONSTRAINT "pokemon_fast_moves_pkey" PRIMARY KEY ("pokemon_id", "fast_move_id", "form");
