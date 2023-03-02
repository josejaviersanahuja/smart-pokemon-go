import Image from 'next/image'
import { useRouter } from 'next/router'
import React from 'react'
import { Button } from '../Buttons'

type Props = {
  forms: {
    form: string
    isActive: boolean
    index: number
    type: string[] | undefined
  }[],
  image: string
}

export default function PokemonForms({ forms, image }: Props) {
  const { name } = useRouter().query
  console.log(forms);

  return (
    <div>
      <Image
        alt={`${name} image`}
        src={image}
        width={200}
        height={200}
      />
      {forms.map((form) => <Button
        key={form.index}
        onClick={() => console.log(form.form)}
        title={form.form}
      />
      )}
    </div>
  )
}