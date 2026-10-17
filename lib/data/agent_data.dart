import '../model/agent.dart';

final List<Agent> dataAgents = [
  Agent(
    name: 'Jett',
    image: 'assets/jett.png',
    role: 'Duelist',
    description: 'Jett is a swift and agile agent who excels at taking out enemies with her precision and speed.',
    abilities: [
      'Tailwind - Dash in the direction you are moving.',
      'Updraft - Propel yourself upwards to reach high ground.',
      'Cloudburst - Throw a smoke grenade that obscures vision.',
      'Blade Storm - Equip a set of throwing knives that deal high damage.',
    ],
  ),
  Agent(
    name: 'Phoenix',
    image: 'assets/phoenix.png',
    role: 'Duelist',
    description: 'Phoenix is a fiery agent who can control flames to damage enemies and heal himself.',
    abilities: [
      'Hot Hands - Throw a fireball that explodes after a delay or on impact.',
      'Blaze - Create a wall of fire that blocks vision and damages enemies.',
      'Curveball - Throw a flare orb that curves around corners, blinding enemies.',
      'Run It Back - Mark your current location; if you die during this ability, you will respawn at the marked location.',
    ],
  ),
  Agent(
    name: 'Sage',
    image: 'assets/sage.png',
    role: 'Sentinel',
    description: 'Sage is a calm support agent who protects her team by healing allies, blocking paths, and slowing down enemy pushes.',
    abilities: [
      'Barrier Orb - Place a solid wall that blocks movement and bullets.',
      'Slow Orb - Throw an orb that creates a field slowing anyone inside it.',
      'Healing Orb - Heal an ally or yourself over a short time.',
      'Resurrection - Bring a fallen teammate back into the round.',
    ],
  ),
  Agent(
    name: 'Brimstone',
    image: 'assets/brimstone.png',
    role: 'Controller',
    description: 'Brimstone is a veteran commander who uses long-range support tools to control the battlefield and push objectives.',
    abilities: [
      'Incendiary - Launch a grenade that creates a damaging fire zone.',
      'Sky Smoke - Call down smoke clouds at locations you choose on the map.',
      'Stim Beacon - Drop a beacon that boosts the fire rate of allies nearby.',
      'Orbital Strike - Call in a powerful strike on a targeted area.',
    ],
  ),
  Agent(
    name: 'Sova',
    image: 'assets/sova.png',
    role: 'Initiator',
    description: 'Sova is a tracker who gathers information with drones and arrows, then punishes enemies from a distance.',
    abilities: [
      'Owl Drone - Pilot a drone to scout and mark enemies.',
      'Shock Bolt - Fire an explosive arrow that damages enemies on impact.',
      'Recon Bolt - Fire a bolt that reveals enemy positions in its area.',
      "Hunter's Fury - Fire energy blasts that can hit enemies through walls.",
    ],
  ),
  Agent(
    name: 'Omen',
    image: 'assets/omen.png',
    role: 'Controller',
    description: 'Omen is a shadowy agent who hunts from the dark, blinding enemies and teleporting across the map.',
    abilities: [
      'Shrouded Step - Teleport a short distance to a spot you can see.',
      'Paranoia - Send a shadow forward that blinds enemies it passes through.',
      'Dark Cover - Place shadow orbs that block vision like smokes.',
      'From the Shadows - Teleport to anywhere on the map after a short delay.',
    ],
  ),
  Agent(
    name: 'Cypher',
    image: 'assets/cypher.png',
    role: 'Sentinel',
    description: 'Cypher is an information broker who locks down areas with traps and cameras, keeping tabs on every enemy move.',
    abilities: [
      'Cyber Cage - Place a cage that blocks vision when activated.',
      'Spycam - Place a camera that you can control and use to mark enemies.',
      'Trapwire - Set a hidden tripwire that reveals and restrains enemies.',
      'Neural Theft - Reveal the locations of all enemies after scanning a fallen foe.',
    ],
  ),
];
    