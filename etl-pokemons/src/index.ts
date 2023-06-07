import {
  seedPokemonAllMoves,
  seedPokemonPvpChargeMoves,
  seedPokemonPvpFastMoves,
  seedPokemons,
  seedPokemonStats,
  seedPokemonTypes,
  seedTypeEffectiveness,
  testUpdatePokemon
} from './pokemons'

// run npm i && npx prisma migrate dev --name init

const main = async () => {
  // await testUpdatePokemon()
  // await seedPokemons()
  await seedPokemonStats()
  // await seedPokemonTypes()
  // await seedTypeEffectiveness()
  // await seedPokemonAllMoves()
  // await seedPokemonPvpFastMoves()
  // await seedPokemonPvpChargeMoves()
}

main()