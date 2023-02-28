import { AttackType, POKEMON_TYPES } from '@/constants'
import assert from 'assert'
import Head from 'next/head'
import { useRouter } from 'next/router'
import React, { useEffect, useState } from 'react'
import { Data } from '../api/stats-and-attacks'

type Props = {}

export default function Pokemon({ }) {
  const { name } = useRouter().query
  
  const [allForms, setAllForms] = useState<Data[]>([])
  const [currentForm, setCurrentForm] = useState<Data | null>(null)
  const [image, setImage] = useState('')

  useEffect(() => {
    assert(typeof name === 'string')
    fetch(`/api/stats-and-attacks?pokemon=${name}`)
      .then((res) => res.json())
      .then((data) => { 
        setAllForms(data)
        setCurrentForm(data[0])
      })

    fetch(`https://pokeapi.co/api/v2/pokemon/${name.toLowerCase()}/`)
      .then((res) => res.json())
      .then((data) => {
        setImage(data.sprites?.other["official-artwork"]?.front_default)
      })
  }, [name])

  const forms = allForms.map((pok, i) => {
    return {
      form: pok.form,
      isActive: currentForm?.form === pok.form,
      index: i,
    }
  })

  const stats = {
    base_attack: currentForm?.base_attack,
    base_defense: currentForm?.base_defense,
    base_stamina: currentForm?.base_stamina,
  }

  let veryStrongAgainst = []
  let strongAgainst = []
  let weakAgainst = []
  let veryWeakAgainst = []
  const fastMoves = currentForm?.fast_moves.map((attack) => {

    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      // veryStrongAgainst: ,
      // strongAgainst: ,
      // weakAgainst: ,
      // veryWeakAgainst: ,
    }
  })

  const chargeMoves = currentForm?.charged_moves.map((attack) => {
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      // veryStrongAgainst: ,
      // strongAgainst: ,
      // weakAgainst: ,
      // veryWeakAgainst: ,
      buffs: attack.buffs,
    }
  })

  const eliteFastMoves = currentForm?.elite_fast_moves.map((attack) => {
    if (!attack) return null
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      // veryStrongAgainst: ,
      // strongAgainst: ,
      // weakAgainst: ,
      // veryWeakAgainst: ,
    }
  })

  const eliteChargeMoves = currentForm?.elite_charged_moves.map((attack) => {
    if (!attack) return null
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      // veryStrongAgainst: ,
      // strongAgainst: ,
      // weakAgainst: ,
      // veryWeakAgainst: ,
      buffs: attack.buffs,
    }
  })

  return (<>
    <Head>
      <title>{name}</title>
    </Head>
    <main className='main'>
      <h1>{name}</h1>
      {allForms.map((form, i) => <p key={i}>{form.form}</p>)}
      {currentForm && <pre>{image}</pre>}
      {currentForm && <pre>{JSON.stringify(forms)}</pre>}
      {currentForm && <pre>{JSON.stringify(stats)}</pre>}
      {currentForm && <pre>{JSON.stringify(fastMoves)}</pre>}
      {currentForm && <pre>{JSON.stringify(chargeMoves)}</pre>}
      {currentForm && <pre>{JSON.stringify(eliteFastMoves)}</pre>}
      {currentForm && <pre>{JSON.stringify(eliteChargeMoves)}</pre>}
    </main>
  </>
  )

  function refactorTypeEffectiveness(
    attack: AttackType,
    veryStrongAgainst : Array<any>,
    strongAgainst : Array<any>,
    weakAgainst : Array<any>,
    veryWeakAgainst : Array<any>
    ) {
      
    }
}