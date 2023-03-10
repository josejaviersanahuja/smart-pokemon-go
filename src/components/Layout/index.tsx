import Image from 'next/image'
import Link from 'next/link'
import React from 'react'
import styles from './Layout.module.css'
import { ffHeaders } from '@/styles/ts-styles'
import { LinkButton } from '../Buttons'
import PresentationCard from '../PresentationCard'

type Props = {
  children: React.ReactNode
}

const ffTitle = ffHeaders.className

export default function Layout({ children }: Props) {

  return (
    <>
      <header className={styles.header}>
        <Link
          href='/'
        >
          <Image
            src="/logo512.svg"
            alt="Logo"
            width={72}
            height={72}
          />
        </Link>
        <h1 className={`${styles.title} ${ffHeaders.className}`}>Smart Pokemon Go</h1>
        <nav>
          <ul className={styles.navHeader}>
            <li>
              <LinkButton
                href="/"
                title='Btn1'
              />
            </li>
            <li><LinkButton href="/a" title='Btn2' /></li>
            <li><LinkButton href="/a" title='Btn3' /></li>
            <li><LinkButton href="/a" title='Btn4' /></li>
          </ul>
        </nav>
      </header>
      {children}
      <footer className={styles.footer}>
        <div className={styles.sn_icons}>
          <a
            href='https://www.fiverr.com/JoseJSanahuja'
            target={'_blank'}
            rel={'noreferrer'}
          >
            <div>
              <Image
                src="/fiverr.svg"
                alt='fiver'
                width={48}
                height={48}
              />
            </div>
          </a>
          <a
            href='https://www.github.com/josejaviersanahuja'
            target={'_blank'}
            rel={'noreferrer'}
          >
            <div>
              <Image
                src="/github.svg"
                alt='fiver'
                width={48}
                height={48}
              />
            </div>
          </a>
          <a
            href='mailto:zitrojj@gmail.com'
            target={'_blank'}
            rel={'noreferrer'}
          >
            <div>
              <Image
                src="/email.svg"
                alt='fiver'
                width={48}
                height={48}
              />
            </div>
          </a>
        </div>
        <nav>
          <ul className={styles.columns}>

            <li><Link href="/">nav1</Link></li>
            <li><Link href="/">nav2</Link></li>
            <li><Link href="/">nav3</Link></li>

          </ul>
          <ul className={styles.columns}>

            <li><Link href="/">nav1</Link></li>
            <li><Link href="/">nav2</Link></li>
            <li><Link href="/">nav3</Link></li>

          </ul>
        </nav>
        <div>
          <PresentationCard />
        </div>
      </footer>
    </>
  )
}