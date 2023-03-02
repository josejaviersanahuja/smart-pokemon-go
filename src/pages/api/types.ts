// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from 'next'
import { client } from './stats-and-attacks'
import { TypeObject } from '../../constants'
// import util from 'util'

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<TypeObject[]>
) {
  const { pokemon } = req.query;
  
  let mapped: TypeObject[] = []
  
  client.query(`SELECT * FROM pokemon_types WHERE pokemon_name = '${pokemon}'`, (err, res2) => {
    if (err) {
      console.log(err.stack)
      res.status(502).json([])
    } else {    
      mapped = res2.rows.map((row) => {
        return {
          ...row,
          type: JSON.parse(row.type),
        }
      })
      res.status(200).json(mapped)
    }
  })
}

export const config = {
  api: {
    externalResolver: true,
  },
}