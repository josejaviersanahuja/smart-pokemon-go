import Link from 'next/link'
import { useRouter } from 'next/router'
import React from 'react'
import styles from './Buttons.module.css'

type BtnProps = {
  onClick: () => void
  title: string
  styleType?: 'primary' | 'secondary'
}

export function Button({onClick, title, styleType = 'primary'}: BtnProps) {
  return (
    <button
    onClick={onClick}
    className={styles[`btn-${styleType}`]}
    >
      {title}
    </button>
  )
}

type LinkProps = {
  href: string // | { pathname: string; query: { [key: string]: string }
  title: string
  styleType?: 'primary' | 'secondary'
}
export function LinkButton({href, title, styleType = 'primary'}: LinkProps) {

  const {pathname} = useRouter()
  
  const className = pathname === href 
    ? `${styles[`link-${styleType}`]} ${styles.active}`
    : styles[`link-${styleType}`]

  return (
    <Link
      href={href}
      className={className} 
    >
      {title}
    </Link>
  )
}