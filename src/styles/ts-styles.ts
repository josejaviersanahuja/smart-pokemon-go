import { Work_Sans, Nothing_You_Could_Do, Cabin } from '@next/font/google'

export const ffHeaders = Work_Sans({ 
  subsets: ['latin'],
  weight: '800'
})

export const ffSpecial = Nothing_You_Could_Do({ 
  subsets: ['latin'],
  weight: '400'
})

export const ffBody = Cabin({ 
  subsets: ['latin'],
  weight: ['400', '700']
})

/* WAY TO USE LOCAL FONTS
import localFont from '@next/font/local'
const ffLocal = localFont({
  src: '/fonts/Inter-Regular.woff2',
})
 */
