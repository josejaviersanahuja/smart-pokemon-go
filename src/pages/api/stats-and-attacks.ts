// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { AttackType } from '@/constants'
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
  fast_moves: AttackType[]
  charged_moves: AttackType[]
  elite_fast_moves: AttackType[] | null[]
  elite_charged_moves: AttackType[] | null[]
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