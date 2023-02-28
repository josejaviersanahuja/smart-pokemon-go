export const POKEMON_TYPES : {
  [index: string] : {
    image: string
    type: string
  }
}= {
  "Bug": {
    image: "/Pokemon_Type_Icon_Bug.svg",
    type: "Bicho"
  },
  "Dark": {
    image: "/Okemon_Type_Icon_Dark.svg",
    type: "Siniestro"
  },
  "Dragon": {
    image: "/Pokemon_Type_Icon_Dragon.svg",
    type: "Dragón"
  },
  "Electric": {
    image: "/Pokemon_Type_Icon_Electric.svg",
    type: "Eléctrico"
  },
  "Fairy": {
    image: "/Pokemon_Type_Icon_Fairy.svg",
    type: "Hada"
  },
  "Fighting": {
    image: "/Pokemon_Type_Icon_Fighting.svg",
    type: "Lucha"
  },
  "Fire": {
    image: "/Pokemon_Type_Icon_Fire.svg",
    type: "Fuego"
  },
  "Flying": {
    image: "/Pokemon_Type_Icon_Flying.svg",
    type: "Volador"
  },
  "Ghost": {
    image: "/Pokemon_Type_Icon_Ghost.svg",
    type: "Fantasma"
  },
  "Grass": {
    image: "/Pokemon_Type_Icon_Grass.svg",
    type: "Planta"
  },
  "Ground": {
    image: "/Pokemon_Type_Icon_Ground.svg",
    type: "Tierra"
  },
  "Ice": {
    image: "/Pokemon_Type_Icon_Ice.svg",
    type: "Hielo"
  },
  "Normal": {
    image: "/Pokemon_Type_Icon_Normal.svg",
    type: "Normal"
  },
  "Poison": {
    image: "/Pokemon_Type_Icon_Poison.svg",
    type: "Veneno"
  },
  "Psychic": {
    image: "/Pokemon_Type_Icon_Psychic.svg",
    type: "Psíquico"
  },
  "Rock": {
    image: "/Pokemon_Type_Icon_Rock.svg",
    type: "Roca"
  },
  "Steel": {
    image: "/Pokemon_Type_Icon_Steel.svg",
    type: "Acero"
  },
  "Water": {
    image: "/Pokemon_Type_Icon_Water.svg",
    type: "Agua"
  }
}

export type AttackType = {
  move_id: number
  name: string
  type: string
  power: number
  energy_delta: number
  turn_duration: number
  buffs?: string | null
  attacking_type: string
  vs_bug: number
  vs_dark: number
  vs_dragon: number
  vs_electric: number
  vs_fairy: number
  vs_fighting: number
  vs_fire: number
  vs_flying: number
  vs_ghost: number
  vs_grass: number
  vs_ground: number
  vs_ice: number
  vs_normal: number
  vs_poison: number
  vs_psychic: number
  vs_rock: number
  vs_steel: number
  vs_water: number
}

export const getKeyValue = <U extends keyof T, T extends object>(key: U) => (obj: T) =>
  obj[key];