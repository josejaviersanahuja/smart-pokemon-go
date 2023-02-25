import Head from 'next/head'
import { useRouter } from 'next/router'
import React from 'react'

type Props = {}

export default function Pokemon({}) {
  const { name } = useRouter().query
  
  return (<>
    <Head>
      <title>{name}</title>
    </Head>
    <main className='main'>
      <h1>{name}</h1>
    </main>
  </>
  )
}