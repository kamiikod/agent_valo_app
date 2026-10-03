import '../model/agent.dart';

final List<Agent> agents = [
  Agent(
    name: 'Jett',
    image: 'assets/images/jett.png',
    role: 'Duelist',  
    description:
        'Jett is a swift and agile agent who excels at taking out enemies with her precision and speed.',
    abilities: [
      'Tailwind - Dash in the direction you are moving.',
      'Updraft - Propel yourself upwards to reach high ground.',
      'Cloudburst - Throw a smoke grenade that obscures vision.',
      'Blade Storm - Equip a set of throwing knives that deal high damage.',
    ],
  ),
  Agent(
    name: 'Phoenix',
    image: 'assets/images/phoenix.png',
    role: 'Duelist',
    description:
        'Phoenix is a fiery agent who can control flames to damage enemies and heal himself.',
    abilities: [
      'Hot Hands - Throw a fireball that explodes after a delay or on impact.',
      'Blaze - Create a wall of fire that blocks vision and damages enemies.',
      'Curveball - Throw a flare orb that curves around corners, blinding enemies.',
      'Run It Back - Mark your current location; if you die during this ability, you will respawn at the marked location.',
    ],
  ),
  // Add more agents as needed
];