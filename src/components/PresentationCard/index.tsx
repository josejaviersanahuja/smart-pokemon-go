import Image from 'next/image'
import Link from 'next/link'
import React, { MouseEvent, useRef } from 'react'
import styles from './PresentationCard.module.css'

type Props = {}

export default function PresentationCard({ }: Props) {
  const container = useRef<HTMLDivElement | null>(null)

  const rotateElement = (e: MouseEvent) => {
    const { clientX, clientY } = e
    if (container.current === null) {
      return
    }
    const { offsetWidth, offsetHeight } = container.current
    console.log(clientX, clientY, offsetWidth, offsetHeight);
    const x = (clientX - offsetWidth / offsetWidth)
    const y = (clientY - offsetHeight / offsetHeight)
    
    container.current.style.transform = `rotateY(${x}deg) rotateX(${y}deg)`
  }

  return (
    <Link
      href="/"
    >
      <div 
        className={styles.container}
        ref={container}
        onMouseMove={rotateElement}
      >
        <Image
          src="/logocard.svg"
          alt="LogoCard"
          width={159}
          height={102}
        />
      </div>
    </Link>
  )
}