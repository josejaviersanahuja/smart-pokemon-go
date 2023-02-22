import Image from 'next/image'
import Link from 'next/link'
import React from 'react'
import styles from './Layout.module.css'
import { ffHeaders } from '@/styles/ts-styles'

type Props = {
  children: React.ReactNode
}

const ffTitle = ffHeaders.className

export default function Layout({ children }: Props) {

  console.log(ffTitle);

  return (
    <>
      <header className={styles.header}>
        <Image
          src="/logo512.svg"
          alt="Logo"
          width={72}
          height={72}
        />
        <h1 className={`${styles.title} ${ffHeaders.className}`}>Smart Pokemon Go</h1>
        <nav>
          <ul className={styles.navHeader}>
            <li><Link href="/">nav1</Link></li>
            <li><Link href="/">nav2</Link></li>
            <li><Link href="/">nav3</Link></li>
            <li><Link href="/">nav4</Link></li>
          </ul>
        </nav>
      </header>
      {children}
      <footer>
        <div>
          <p>iconos redes sociales</p>
        </div>
        <nav>
          <ul>
            <li><Link href="/">nav1</Link></li>
            <li><Link href="/">nav2</Link></li>
            <li><Link href="/">nav3</Link></li>
            <li><Link href="/">nav4</Link></li>
          </ul>
        </nav>
        <div>
          <p>Tarjeta</p>
        </div>
      </footer>
    </>
  )
}