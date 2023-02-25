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
    
    let middleX
    if (window.innerWidth <= 1000) {
      middleX = window.innerWidth - 32 - (offsetWidth / 2)     
    } else {
      middleX = window.innerWidth - 32 - (window.innerWidth - 1000) /2 - (offsetWidth / 2)     
    }
    const middleY = window.innerHeight - 16 - (offsetHeight / 2)
        
    
    const x = (clientX - middleX) * 105 / middleX
    const y = (clientY - middleY) * 105 / middleY
    
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