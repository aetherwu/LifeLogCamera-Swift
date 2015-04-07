# LifeLogCamera

Just another proof of concept. This is the camera part of the services.

```
┌─────────────────┐        ┌────────────────┐ 
│ LifeLog Server  │───────▶│  LifeLog CDN   │.
└─────────────────┘░       └────────────────┘.
 ░░░░░░░░▲░░░░░░░░░░        ........▲.........
         └───┐                      └─┐       
             │                        ▼       
┌────────────────────────┐      ┌──iPhone───┐ 
│     LifeLogCamera      │▓     │┌─────────┐│░
└────────────────────────┘▓     ││  ◲ ◲ ◲  ││░
 ▓▓▓▓▓▓▓▓▓▓▓▓▲▓▓▓▓▓▓▓▓▓▓▓▓▓     ││         ││░
            ┌┘                  ││  ◲ ◲ ◲  ││░
            │                   ││         ││░
            ▼               ┌──▶││  ◲ ◲ ◲  ││░
┌───────────────────────┐   │   ││         ││░
│ MultipeerConnectivity │◀──┘   ││         ││░
└───────────────────────┘       │└─────────┘│░
                                │     O     │░
┌───Watch──┐                    └───────────┘░
│          │                     ░░░░░▲░░░░░░░
│  *    *  │   ┌────────────┐         │       
│          │◀──│  Wormhole  │─────────┘       
│    ◡     │   └────────────┘                 
│          │                                  
└──────────┘                                  
```

This code is distributed under the terms and conditions of the MIT license.