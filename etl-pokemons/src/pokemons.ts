import axios from 'axios'
import { prisma } from './prisma'

export const testUpdatePokemon = () => {
  prisma.pokemon_stats.update({
    where: {
      pokemon_id_form: {
        form: "Adventure_hat_2020",
        pokemon_id: 25
      }
    },
    data: {
      name: "Pikachu JJ"
    }
  }).then(res => {
    console.log(res);
  })
}

type Type = 'Bug' | 'Dark' | 'Dragon' | 'Electric' | 'Fairy' | 'Fighting' |
  'Fire' | 'Flying' | 'Ghost' | 'Grass' | 'Ground' | 'Ice' | 'Normal' |
  'Poison' | 'Psychic' | 'Rock' | 'Steel' | 'Water'

export const seedPokemons = async () => {
  const pokemons = await axios.get('https://pogoapi.net/api/v1/pokemon_names.json')

  type Pokemon = {
    name: string
    id: number
  }

  const pokemonList: Array<Pokemon> = Object.values(pokemons.data);

  const res = await prisma.pokemons.createMany({
    data: pokemonList.map((pokemon) => ({
      name: pokemon.name,
      id: pokemon.id,
    })),
  })

}

export const seedPokemonStats = async () => {
  const pokemonStats = await axios.get('https://pogoapi.net/api/v1/pokemon_stats.json')

  type PokemonStat = {
    pokemon_id: number
    pokemon_name: string
    base_attack: number
    base_defense: number
    base_stamina: number
    form: string
  }

  const pokemonStatList: Array<PokemonStat> = Object.values(pokemonStats.data);

  const res = await prisma.pokemon_stats.createMany({
    data: pokemonStatList.map((pokemonStat) => ({
      pokemon_id: pokemonStat.pokemon_id,
      name: pokemonStat.pokemon_name,
      base_attack: pokemonStat.base_attack,
      base_defense: pokemonStat.base_defense,
      base_stamina: pokemonStat.base_stamina,
      form: pokemonStat.form,
    })),
  })
}

// prisma ignore typescript error due to Json type
export const seedPokemonTypes = async () => {
  const pokemonTypes = await axios.get('https://pogoapi.net/api/v1/pokemon_types.json')

  type PokemonType = {
    pokemon_id: number
    pokemon_name: string
    type: Type[]
    form: string
  }
  type PokemonTypeFinal = {
    pokemon_id: number
    pokemon_name: string
    type: string
    form: string
  }

  const pokemonTypeList: Array<PokemonType> = Object.values(pokemonTypes.data);

  const pokemonTypeListFinal: Array<PokemonTypeFinal> = pokemonTypeList.map((pokemonType) => ({
    pokemon_id: pokemonType.pokemon_id,
    pokemon_name: pokemonType.pokemon_name,
    type: JSON.stringify(pokemonType.type),
    form: pokemonType.form,
  }))

  const res = await prisma.pokemon_types.createMany({
    data: pokemonTypeListFinal.map((pokemonType) => ({
      pokemon_id: pokemonType.pokemon_id,
      form: pokemonType.form,
      type: pokemonType.type,
      pokemon_name: pokemonType.pokemon_name,
    })),
  })
}

export const seedTypeEffectiveness = async () => {
  const typeEffectiveness = await axios.get('https://pogoapi.net/api/v1/type_effectiveness.json')

  type TypeEffectiveness = {
    attacking_type: string,
    vs_bug: number,
    vs_dark: number,
    vs_dragon: number,
    vs_electric: number,
    vs_fairy: number,
    vs_fighting: number,
    vs_fire: number,
    vs_flying: number,
    vs_ghost: number,
    vs_grass: number,
    vs_ground: number,
    vs_ice: number,
    vs_normal: number,
    vs_poison: number,
    vs_psychic: number,
    vs_rock: number,
    vs_steel: number,
    vs_water: number,
  }

  const array1: [string, { [index: string]: number }][] = Object.entries(typeEffectiveness.data);

  const array2: TypeEffectiveness[] = array1.map((item) => {
    return {
      attacking_type: item[0],
      vs_bug: item[1].Bug,
      vs_dark: item[1].Dark,
      vs_dragon: item[1].Dragon,
      vs_electric: item[1].Electric,
      vs_fairy: item[1].Fairy,
      vs_fighting: item[1].Fighting,
      vs_fire: item[1].Fire,
      vs_flying: item[1].Flying,
      vs_ghost: item[1].Ghost,
      vs_grass: item[1].Grass,
      vs_ground: item[1].Ground,
      vs_ice: item[1].Ice,
      vs_normal: item[1].Normal,
      vs_poison: item[1].Poison,
      vs_psychic: item[1].Psychic,
      vs_rock: item[1].Rock,
      vs_steel: item[1].Steel,
      vs_water: item[1].Water,
    }
  })

  // console.log(array2);

  const res = await prisma.type_effectiveness.createMany({
    data: array2.map((typeEffectiveness) => ({
      attacking_type: typeEffectiveness.attacking_type as Type,
      vs_bug: typeEffectiveness.vs_bug,
      vs_dark: typeEffectiveness.vs_dark,
      vs_dragon: typeEffectiveness.vs_dragon,
      vs_electric: typeEffectiveness.vs_electric,
      vs_fairy: typeEffectiveness.vs_fairy,
      vs_fighting: typeEffectiveness.vs_fighting,
      vs_fire: typeEffectiveness.vs_fire,
      vs_flying: typeEffectiveness.vs_flying,
      vs_ghost: typeEffectiveness.vs_ghost,
      vs_grass: typeEffectiveness.vs_grass,
      vs_ground: typeEffectiveness.vs_ground,
      vs_ice: typeEffectiveness.vs_ice,
      vs_normal: typeEffectiveness.vs_normal,
      vs_poison: typeEffectiveness.vs_poison,
      vs_psychic: typeEffectiveness.vs_psychic,
      vs_rock: typeEffectiveness.vs_rock,
      vs_steel: typeEffectiveness.vs_steel,
      vs_water: typeEffectiveness.vs_water,
    })),
  })
}

export const seedPokemonAllMoves = async () => {
  const pokemonFastMoves = await axios.get('https://pogoapi.net/api/v1/current_pokemon_moves.json')

  type PokemonCurrentMoves = {
    pokemon_name: string
    pokemon_id: number
    form: string
    fast_moves: string[]
    charged_moves: string[]
    elite_fast_moves: string[]
    elite_charged_moves: string[]
  }

  const pokemonCurrentMove : PokemonCurrentMoves[] = pokemonFastMoves.data // Object.values(pokemonFastMoves.data);

  const pokemonFastMoveList: Array<{
    pokemon_id: number
    fast_move_id: string
    form: string
  }> = []
  
  const pokemonChargeMoveList: Array<{
    pokemon_id: number
    charge_move_id: string
    form: string
  }> = []
  
  const pokemonEliteFastMoveList: Array<{
    pokemon_id: number
    fast_move_id: string
    form: string
  }> = []
  
  const pokemonEliteChargeMoveList: Array<{
    pokemon_id: number
    charge_move_id: string
    form: string
  }> = []

  pokemonCurrentMove.forEach((pokemon) => {
    pokemon.fast_moves.forEach((fastMove) => {
      pokemonFastMoveList.push({
        pokemon_id: pokemon.pokemon_id,
        fast_move_id: fastMove,
        form: pokemon.form,
      })
    })
    pokemon.charged_moves.forEach((chargeMove) => {
      pokemonChargeMoveList.push({
        pokemon_id: pokemon.pokemon_id,
        charge_move_id: chargeMove,
        form: pokemon.form,
      })
    })
    pokemon.elite_fast_moves.forEach((eliteFastMove) => {
      pokemonEliteFastMoveList.push({
        pokemon_id: pokemon.pokemon_id,
        fast_move_id: eliteFastMove,
        form: pokemon.form,
      })
    })
    pokemon.elite_charged_moves.forEach((eliteChargeMove) => {
      pokemonEliteChargeMoveList.push({
        pokemon_id: pokemon.pokemon_id,
        charge_move_id: eliteChargeMove,
        form: pokemon.form,
      })
    })
  })

  /** There was an error in the api */
  const newPokemonChargeMoveList = new Array(...new Set(pokemonChargeMoveList.map((a) => JSON.stringify(a))))
    .map((e) => JSON.parse(e))
  
  const res = await prisma.pokemon_fast_moves.createMany({
    data: pokemonFastMoveList.map((pokemonFastMove) => ({
      pokemon_id: pokemonFastMove.pokemon_id,
      fast_move_id: pokemonFastMove.fast_move_id,
      form: pokemonFastMove.form,
    })),
  })
  const res2 = await prisma.pokemon_charge_moves.createMany({
    data: newPokemonChargeMoveList.map((pokemonChargeMove) => ({
      pokemon_id: pokemonChargeMove.pokemon_id,
      charge_move_id: pokemonChargeMove.charge_move_id,
      form: pokemonChargeMove.form,
    })),
  })
  const res3 = await prisma.pokemon_elite_fast_moves.createMany({
    data: pokemonEliteFastMoveList.map((pokemonEliteFastMove) => ({
      pokemon_id: pokemonEliteFastMove.pokemon_id,
      fast_move_id: pokemonEliteFastMove.fast_move_id,
      form: pokemonEliteFastMove.form,
    })),
  })
  const res4 = await prisma.pokemon_elite_charge_moves.createMany({
    data: pokemonEliteChargeMoveList.map((pokemonEliteChargeMove) => ({
      pokemon_id: pokemonEliteChargeMove.pokemon_id,
      charge_move_id: pokemonEliteChargeMove.charge_move_id,
      form: pokemonEliteChargeMove.form,
    })),
  })

}

export const seedPokemonPvpFastMoves = async () => {
  const pokemonFastMoves = await axios.get('https://pogoapi.net/api/v1/pvp_fast_moves.json')

  type PokemonPvpFastMoves = {
    move_id: number
    name: string
    type: Type
    power: number
    energy_delta: number
    turn_duration: number
  }

  const pokemonFastMove : PokemonPvpFastMoves[] = pokemonFastMoves.data // Object.values(pokemonFastMoves.data);
  
  const res = await prisma.pvp_fast_moves.createMany({
    data: pokemonFastMove.map((FastMove) => ({
      move_id: FastMove.move_id,
      name: FastMove.name,
      type: FastMove.type,
      power: FastMove.power,
      energy_delta: FastMove.energy_delta,
      turn_duration: FastMove.turn_duration,
    })),
  })
}

export const seedPokemonPvpChargeMoves = async () => {
  const pokemonChargeMoves = await axios.get('https://pogoapi.net/api/v1/pvp_charged_moves.json')

  type PokemonPvpChargeMoves = {
    move_id: number
    name: string
    type: Type
    power: number
    energy_delta: number
    turn_duration: number
    buffs: object | undefined
  }

  const pokemonChargeMove : PokemonPvpChargeMoves[] = pokemonChargeMoves.data // Object.values(pokemonChargeMoves.data);
  
  // console.log(pokemonChargeMove);
  
  const res = await prisma.pvp_charge_moves.createMany({
    data: pokemonChargeMove.map((ChargeMove) => ({
      move_id: ChargeMove.move_id,
      name: ChargeMove.name,
      type: ChargeMove.type,
      power: ChargeMove.power,
      energy_delta: ChargeMove.energy_delta,
      turn_duration: ChargeMove.turn_duration,
      buffs: ChargeMove.buffs ? JSON.stringify(ChargeMove.buffs): undefined,
    })),
  })
}