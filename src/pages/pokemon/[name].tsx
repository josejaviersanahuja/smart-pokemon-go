import PokemonForms from '@/components/PokemonForms'
import { AttackType, getKeyValue, POKEMON_TYPES, TypeObject } from '@/constants'
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
  const [typeAllForms, setTypeAllForms] = useState<TypeObject[]>([])

  useEffect(() => {
    try {
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

      fetch(`/api/types?pokemon=${name}`)
        .then((res) => res.json())
        .then((data) => {
          setTypeAllForms(data)
        })
    } catch (error) {
      console.error(error);
    }

  }, [name])

  const forms = allForms.map((pok, i) => {
    return {
      form: pok.form,
      isActive: currentForm?.form === pok.form,
      index: i,
      type: typeAllForms.find((type) => type.form === pok.form)?.type,
    }
  })

  const stats = {
    base_attack: currentForm?.base_attack,
    base_defense: currentForm?.base_defense,
    base_stamina: currentForm?.base_stamina,
  }

  const fastMoves = currentForm?.fast_moves.map((attack) => {
    const refactor = new RefactorTypeEffectiveness(attack)
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      strongAgainst: refactor.getStrongAgainst(),
      weakAgainst: refactor.getWeakAgainst(),
      veryWeakAgainst: refactor.getVeryWeakAgainst(),
    }
  })

  const chargeMoves = currentForm?.charged_moves.map((attack) => {
    const refactor = new RefactorTypeEffectiveness(attack)
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      strongAgainst: refactor.getStrongAgainst(),
      weakAgainst: refactor.getWeakAgainst(),
      veryWeakAgainst: refactor.getVeryWeakAgainst(),
      buffs: attack.buffs,
    }
  })

  const eliteFastMoves = currentForm?.elite_fast_moves.map((attack) => {
    if (!attack) return null
    const refactor = new RefactorTypeEffectiveness(attack)
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      strongAgainst: refactor.getStrongAgainst(),
      weakAgainst: refactor.getWeakAgainst(),
      veryWeakAgainst: refactor.getVeryWeakAgainst(),
    }
  })

  const eliteChargeMoves = currentForm?.elite_charged_moves.map((attack) => {
    if (!attack) return null
    const refactor = new RefactorTypeEffectiveness(attack)
    return {
      name: attack.name,
      type: POKEMON_TYPES[attack.type],
      power: attack.power,
      energy_delta: attack.energy_delta,
      duration: attack.turn_duration * 0.5,
      strongAgainst: refactor.getStrongAgainst(),
      weakAgainst: refactor.getWeakAgainst(),
      veryWeakAgainst: refactor.getVeryWeakAgainst(),
      buffs: attack.buffs,
    }
  })

  return (<>
    <Head>
      <title>{name}</title>
    </Head>
    <main className='main'>
      <h1>{name}</h1>
      <PokemonForms forms={forms} image={image} />
    </main>
  </>
  )

}

class RefactorTypeEffectiveness {
  strongAgainst: any[]
  weakAgainst: any[]
  veryWeakAgainst: any[]
  constructor(attack: AttackType) {
    this.strongAgainst = []
    this.weakAgainst = []
    this.veryWeakAgainst = []
    Object.keys(attack).forEach((key) => {
      if (key.substring(0, 3) !== "vs_") return
      const type = key.substring(3, 4).toUpperCase() + key.substring(4)

      switch (getKeyValue<keyof AttackType, AttackType>(key as keyof AttackType)(attack)) {
        case 1.6:
          this.strongAgainst.push(POKEMON_TYPES[type])
          break;
        case 0.625:
          this.weakAgainst.push(POKEMON_TYPES[type])
          break;
        case 0.390625:
          this.veryWeakAgainst.push(POKEMON_TYPES[type])
          break;

        default:
          break;
      }
    })
  }

  getStrongAgainst() {
    return this.strongAgainst
  }
  getWeakAgainst() {
    return this.weakAgainst
  }
  getVeryWeakAgainst() {
    return this.veryWeakAgainst
  }

}