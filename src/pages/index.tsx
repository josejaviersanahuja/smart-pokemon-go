import Head from 'next/head'
import Image from 'next/image'
import styles from '@/styles/Home.module.css'
import { Button } from '@/components/Buttons'
import { ffBody } from '@/styles/ts-styles'
import { useState } from 'react'
import { useRouter } from 'next/router'

type Pokemon = {
  name: string
  id: number
}

export const getStaticProps = async ()
  : Promise<{
    props: {
      pokemons: Pokemon[];
    };
  }> => {

  try {
    const res = await fetch('https://pogoapi.net/api/v1/pokemon_names.json')
    const data = await res.json()
    if (Object.values(data) instanceof Array<Pokemon>) {
      return {
        props: {
          pokemons: Object.values(data)
        }
      }
    }
    return {
      props: {
        pokemons: []
      }
    }
  } catch (error) {
    return {
      props: {
        pokemons: []
      }
    }
  }
}

export default function Home({ pokemons }: { pokemons: Pokemon[] }) {
  const [selectedPokemon, setSelectedPokemon] = useState('')
  const router = useRouter()
  const onSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    router.push(`/pokemon/${selectedPokemon}`)
  }
  
  return (
    <>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="Busca cualquier pokemon" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <main className={`main ${ffBody.className}`}>
        <section className={styles.section}>
          <Image
            src="/homepic.svg"
            alt="HomePic"
            width={518}
            height={388}
          />
          <article className={styles.article}>
            <h1>Smart Pokemon Go es:</h1>
            <p>Una aplicación que nos ayudará a ver las estadísticas de los pokemones, los tiempos de carga de sus ataques y nos ayudará a entender la cantidad de daño por segundo que generan.</p>
          </article>
        </section>

        <form className={styles.form} onSubmit={onSubmit}>
          <input
            type="text"
            placeholder="Pokemon"
            list='pokemons'
            onChange={(e) => setSelectedPokemon(e.target.value)}
          />
          <datalist id='pokemons'>
            {pokemons.map(pokemon => (
              <option key={pokemon.id} value={pokemon.name} />
            ))}
          </datalist>
          <Button
            onClick={() => console.log('click')}
            title='Buscar'
            styleType='secondary'
            type='submit'
          />
        </form>

      </main>
    </>
  )
}
