// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from 'next'
import { Pool } from 'pg'
// import util from 'util'

export const client = new Pool({
  host: 'localhost',
  port: 5432,
  user: 'zitrojj',
  password: 'example',
  database: 'pokemons',
})

export type Data = {
  pokemon_id: number
  name: string
  form: string
  base_attack: number
  base_defense: number
  base_stamina: number
  fast_moves: {
    mone_id: number
    name: string
    type: string
    power: number
    energy_delta: number
    turn_duration: number
    attacking_type: string
    vs_bug: number
    vs_dark: number
    vs_dragon: number
    vs_electric: number
    vs_fairy: number
    vs_fight: number
    vs_fire: number
    vs_flying: number
    vs_ghost: number
    vs_grass: number
    vs_ground: number
    vs_ice: number
    vs_normal: number
    vs_poison: number
    vs_psychic: number
    vs_rock: number
    vs_steel: number
    vs_water: number
  }[]
  charged_moves: {
    move_id: number
    name: string
    type: string
    power: number
    energy_delta: number
    turn_duration: number
    buffs: string | null
    attacking_type: string
    vs_bug: number
    vs_dark: number
    vs_dragon: number
    vs_electric: number
    vs_fairy: number
    vs_fight: number
    vs_fire: number
    vs_flying: number
    vs_ghost: number
    vs_grass: number
    vs_ground: number
    vs_ice: number
    vs_normal: number
    vs_poison: number
    vs_psychic: number
    vs_rock: number
    vs_steel: number
    vs_water: number
  }[]
  elite_fast_moves: {
    mone_id: number
    name: string
    type: string
    power: number
    energy_delta: number
    turn_duration: number
    attacking_type: string
    vs_bug: number
    vs_dark: number
    vs_dragon: number
    vs_electric: number
    vs_fairy: number
    vs_fight: number
    vs_fire: number
    vs_flying: number
    vs_ghost: number
    vs_grass: number
    vs_ground: number
    vs_ice: number
    vs_normal: number
    vs_poison: number
    vs_psychic: number
    vs_rock: number
    vs_steel: number
    vs_water: number
  }[] | null[]
  elite_charged_moves: {
    move_id: number
    name: string
    type: string
    power: number
    energy_delta: number
    turn_duration: number
    buffs: string | null
    attacking_type: string
    vs_bug: number
    vs_dark: number
    vs_dragon: number
    vs_electric: number
    vs_fairy: number
    vs_fight: number
    vs_fire: number
    vs_flying: number
    vs_ghost: number
    vs_grass: number
    vs_ground: number
    vs_ice: number
    vs_normal: number
    vs_poison: number
    vs_psychic: number
    vs_rock: number
    vs_steel: number
    vs_water: number
  }[] | null[]
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data[]>
) {
  const { pokemon } = req.query;
  
  let mapped: Data[] = []

  client.query(`SELECT pokemondata('${pokemon}')`, (err, res2) => {
    if (err) {
      console.log(err.stack)
      res.status(502).json([])
    } else {

      mapped = res2.rows.map((row) => {
        return {
          ...row.pokemondata,
          fast_moves: row.pokemondata.fast_moves.map((move: any) => JSON.parse(move)),
          charged_moves: row.pokemondata.charged_moves.map((move: any) => JSON.parse(move)),
          elite_fast_moves: row.pokemondata.elite_fast_moves.map((move: any) => JSON.parse(move)),
          elite_charged_moves: row.pokemondata.elite_charged_moves.map((move: any) => JSON.parse(move)),
        }
      })
      // console.log(util.inspect(mapped, {showHidden: false, depth: null, colors: true}))

      res.status(200).json(mapped)
    }
  })
}

export const config = {
  api: {
    externalResolver: true,
  },
}