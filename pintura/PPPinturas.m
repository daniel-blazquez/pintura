//
//  PPPinturas.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PPPinturas.h"
#import "PV.h"

@implementation PPPinturas
@synthesize level1, level2, level3, level4;

-(PPPintura *) randomPinturaForLevel: (int) level{
     
    switch (level) {
        case 1: {
            int i = ((arc4random() % (level1.count)));
            return [level1 objectAtIndex:i];
        }
        case 2: {
            int i = ((arc4random() % (level2.count)));
            return [level2 objectAtIndex:i];
        }
        case 3: {
            int i = ((arc4random() % (level3.count)));
            return [level3 objectAtIndex:i];
        }
    }
    return nil;
}

-(PPPinturas*)init{
    self = [super init];
    
    
    if ([[[PV sharedInstance] language] isEqual:@"ES"]){
    
    PPPintura  *p1 = [[PPPintura alloc] initWithEls:@"tahull.jpeg" :
                            [NSArray arrayWithObjects: @"Maiestas Domine", @"Yoda Master", @"Cristo Rey", @"Carlos Jesus", nil] :
                            [NSArray arrayWithObjects: @"Yavhe", @"Berruguete", @"Velazquez", @"Goya", nil] :
                            [NSArray arrayWithObjects: @"Románico", @"Renacimiento", @"Barroco", @"Manierismo", nil] :
                            [NSArray arrayWithObjects: @"s.X",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p2 = [[PPPintura alloc] initWithEls:@"mariae-b.jpg" :
                      [NSArray arrayWithObjects: @"Maiestas Mariae", @"Santa Catalina", @"La Asuncion", @"Virgencita", nil] :
                      [NSArray arrayWithObjects: @"Autor desconocido", @"Fray Juan", @"Velazquez", @"Goya", nil] :
                      [NSArray arrayWithObjects: @"Románico", @"Renacimiento", @"Barroco", @"Manierismo", nil] :
                      [NSArray arrayWithObjects: @"s.X",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p3 = [[PPPintura alloc] initWithEls:@"santaana.jpg" :
                      [NSArray arrayWithObjects: @"Santa Ana", @"Santa Catalina", @"Santa María", @"Virgencita", nil] :
                      [NSArray arrayWithObjects: @"Ramón Destorrents", @"El Greco", @"Picasso", @"Berruguete", nil] :
                      [NSArray arrayWithObjects: @"Gótico", @"Renacimiento", @"Barroco", @"Manierismo", nil] :
                      [NSArray arrayWithObjects: @"s.XIV",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p4 = [[PPPintura alloc] initWithEls:@"sanpedro.jpg" :
                      [NSArray arrayWithObjects: @"San Pedro salvado de las aguas", @"El Bautismo", @"El Milagro de San Matías", @"El Santo Chapuzón", nil] :
                      [NSArray arrayWithObjects: @"Luis Borrassá", @"El Greco", @"Ramón Destorrents", @"Berruguete", nil] :
                      [NSArray arrayWithObjects: @"Gótico", @"Renacimiento", @"Barroco", @"Manierismo", nil] :
                      [NSArray arrayWithObjects: @"s.XIV",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    
    PPPintura  *p5 = [[PPPintura alloc] initWithEls:@"santacatalina.jpg" :
                      [NSArray arrayWithObjects: @"Catalina de Alejandría", @"Santa Ana", @"Santa María", @"Bárbara de Sicila", nil] :
                      [NSArray arrayWithObjects: @"Fernando Yáñez", @"El Greco", @"Autor desconocido", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Renacimiento", @"Gótico", @"Barroco", @"Manierismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVI",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p6 = [[PPPintura alloc] initWithEls:@"lactante.jpg" :
                      [NSArray arrayWithObjects: @"Virgen de la Leche", @"Santa Ana", @"Santa María", @"Catalina de Alejandría", nil] :
                      [NSArray arrayWithObjects: @"Luís de Morales", @"El Greco", @"Autor desconocido", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Gótico", @"Renacimiento", @"Barroco", @"Manierismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVI",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p7 = [[PPPintura alloc] initWithEls:@"caballero.jpg" :
                      [NSArray arrayWithObjects: @"Caballero de la  mano en el pecho", @"El Conde de Orgaz", @"Autoretrato de El Greco", @"Pipín de Torres", nil] :
                      [NSArray arrayWithObjects: @"El Greco", @"Luís de Morales", @"Fernando Yáñez", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Manierismo", @"Renacimiento", @"Barroco", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p8 = [[PPPintura alloc] initWithEls:@"entierro.jpg" :
                      [NSArray arrayWithObjects: @"El Entierro del Conde de Orgaz", @"Reunión de Poetas", @"Resurreción de Marianín", @"Reunión de Artistas", nil] :
                      [NSArray arrayWithObjects: @"El Greco", @"Luís de Morales", @"Fernando Yáñez", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Manierismo", @"Renacimiento", @"Barroco", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p9 = [[PPPintura alloc] initWithEls:@"fragua.jpg" :
                      [NSArray arrayWithObjects: @"La Fragua de Vulcano", @"Asalto de los Mamelucos", @"La Fragua de San Alonso", @"Persistencia de la Fuerza", nil] :
                      [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Barroco", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p10 = [[PPPintura alloc] initWithEls:@"espejo.jpg" :
                      [NSArray arrayWithObjects: @"La Venus del Espejo", @"La Maja Desnuda", @"La Maja del Espejo", @"Volatineros", nil] :
                      [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Miró", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Barroco", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p11 = [[PPPintura alloc] initWithEls:@"meninas.jpg" :
                      [NSArray arrayWithObjects: @"Las Meninas", @"Familia Real", @"Las Infantas", @"Las Infantas", nil] :
                      [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Barroco", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p12 = [[PPPintura alloc] initWithEls:@"fusilamientos.jpg" :
                      [NSArray arrayWithObjects: @"Los Fusilamientos del Tres de Mayo", @"Asalto de los Mamelucos", @"La Fragua de Vulcano", @"Los Comuneros", nil] :
                      [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Velazquez", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Guerra de la Independencia", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p13 = [[PPPintura alloc] initWithEls:@"vestida.jpg" :
                      [NSArray arrayWithObjects: @"La maja vestida", @"La maja desnuda", @"La Venus del espejo", @"La maja desnuda", nil] :
                      [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                      [NSArray arrayWithObjects: @"Retrato", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                      [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p14 = [[PPPintura alloc] initWithEls:@"lechera.jpg" :
                       [NSArray arrayWithObjects: @"La lechera de Burdeos", @"La maja vestida", @"La Venus del espejo", @"Demoiselles d'Avignon", nil] :
                       [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                       [NSArray arrayWithObjects: @"Exilio de Goya", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p15 = [[PPPintura alloc] initWithEls:@"sopa.jpg" :
                       [NSArray arrayWithObjects: @"Viejos comiendo sopa", @"Aún dicen que el pescado es caro", @"Botella de Pernod", @"Los Comuneros", nil] :
                       [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Picasso", @"Luis Borrassá", nil] :
                       [NSArray arrayWithObjects: @"Retrato", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p16 = [[PPPintura alloc] initWithEls:@"vestida.jpg" :
                       [NSArray arrayWithObjects: @"La maja vestida", @"La Venus del espejo", @"La lechera de Burdeos", @"La maja desnuda", nil] :
                       [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Zuloaga", @"Luis Borrassá", nil] :
                       [NSArray arrayWithObjects: @"Retrato", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];

    PPPintura  *p17 = [[PPPintura alloc] initWithEls:@"desnuda.jpg" :
                       [NSArray arrayWithObjects: @"La maja desnuda", @"La Venus del espejo", @"La lechera de Burdeos", @"La maja vestida", nil] :
                       [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Picasso", @"Luis Borrassá", nil] :
                       [NSArray arrayWithObjects: @"Retrato", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p18 = [[PPPintura alloc] initWithEls:@"vilches.jpg" :
                       [NSArray arrayWithObjects: @"La Condesa de Vilches", @"La Marquesa de Chinchón", @"La lechera de Burdeos", @"La maja vestida", nil] :
                       [NSArray arrayWithObjects: @"Kuntz", @"Velázquez", @"Picasso", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Romanticismo", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p19 = [[PPPintura alloc] initWithEls:@"pescador.jpg" :
                       [NSArray arrayWithObjects: @"El Pescador", @"El Paseo", @"Aún dicen que el pescado es caro", @"Niños en la playa", nil] :
                       [NSArray arrayWithObjects: @"Sorolla", @"Kuntz", @"Ramón Casas", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Impresionismo tardío", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p20 = [[PPPintura alloc] initWithEls:@"paseo.jpg" :
                       [NSArray arrayWithObjects: @"Paseo a orillas del mar", @"Las señoritas de Avignon", @"La lechera de Burdeos", @"Las condesas", nil] :
                       [NSArray arrayWithObjects: @"Sorolla", @"Kuntz", @"Picasso", @"Zuloaga", nil] :
                       [NSArray arrayWithObjects: @"Impresionismo tardío", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p21 = [[PPPintura alloc] initWithEls:@"playa.jpg" :
                       [NSArray arrayWithObjects: @"Niños en la playa", @"El Pescador", @"", @"Las condesas", nil] :
                       [NSArray arrayWithObjects: @"Sorolla", @"Miró", @"Ramón Casas", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Impresionismo tardío", @"Renacimiento", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p22 = [[PPPintura alloc] initWithEls:@"moulin.jpg" :
                       [NSArray arrayWithObjects: @"Au Moulin de la Galette", @"Marie", @"", @"La condesa de Vilches", nil] :
                       [NSArray arrayWithObjects: @"Ramón Casas", @"Miró", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Modernismo", @"Renacimiento", @"Impresionismo", @"Romanticismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];

    PPPintura  *p23 = [[PPPintura alloc] initWithEls:@"guirtarrista.jpg" :
                       [NSArray arrayWithObjects: @"El guitarrista ciego", @"El Pescador", @"Au Moulin de la Galette", @"Las condesas", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Etapa Azul", @"Renacimiento", @"Impresionismo", @"Romanticismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p24 = [[PPPintura alloc] initWithEls:@"volatineros.jpg" :
                       [NSArray arrayWithObjects: @"Los Volatineros", @"Los Saltinbamquis", @"Au Moulin de la Galette", @"Los Borrachos", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Etapa Rosa", @"Etapa Azul", @"Impresionismo", @"Romanticismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p25 = [[PPPintura alloc] initWithEls:@"demoiselles.jpg" :
                       [NSArray arrayWithObjects: @"Les Demoiselles D'Avignon", @"La venus en el espejo", @"Mujer con mandolina", @"Los Borrachos", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Cubismo", @"Etapa Azul", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p26 = [[PPPintura alloc] initWithEls:@"mandolina.jpg" :
                       [NSArray arrayWithObjects: @"Mujer con mandolina", @"La venus en el espejo", @"Santa Casilda", @"Los Borrachos", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Dalí", nil] :
                       [NSArray arrayWithObjects: @"Cubismo", @"Etapa Azul", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p27 = [[PPPintura alloc] initWithEls:@"pernod.jpg" :
                       [NSArray arrayWithObjects: @"Botella de Pernod", @"Volumen deconstruído", @"Veterano contando historias", @"Los Borrachos", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Dalí", nil] :
                       [NSArray arrayWithObjects: @"Cubismo", @"Etapa Azul", @"Impresionismo", @"Surrealismo", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];

    PPPintura  *p28 = [[PPPintura alloc] initWithEls:@"guernica.jpg" :
                       [NSArray arrayWithObjects: @"Guernica", @"Horrores de la Guerra", @"La guerra civil", @"Los Fusilamientos del 3 de Mayo", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Surrealismo", @"Etapa Azul", @"Impresionismo", @"Etapa Rosa", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p29 = [[PPPintura alloc] initWithEls:@"meninasp.jpg" :
                       [NSArray arrayWithObjects: @"Las Meninas (de Velázquez)", @"La Familía de Carlos IV", @"Interior Holandés", @"Estudio del pintor", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Dalí", @"Zurbarán", nil] :
                       [NSArray arrayWithObjects: @"Postguerra", @"Etapa Azul", @"Impresionismo", @"Etapa Rosa", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];

    PPPintura  *p30 = [[PPPintura alloc] initWithEls:@"pablo.jpg" :
                       [NSArray arrayWithObjects: @"Autoretrato", @"El pescador", @"Van Gogh", @"San Hugo", nil] :
                       [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Velázquez", nil] :
                       [NSArray arrayWithObjects: @"Cubismo", @"Etapa Azul", @"Impresionismo", @"Etapa Rosa", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p31 = [[PPPintura alloc] initWithEls:@"persistencia.jpg" :
                       [NSArray arrayWithObjects: @"La Persistencia de la memoria", @"Botella de Pernod", @"La cuenta atrás", @"La Relatividad", nil] :
                       [NSArray arrayWithObjects: @"Dalí", @"Miró", @"Sorolla", @"Murillo", nil] :
                       [NSArray arrayWithObjects: @"Surrealismo", @"Cubismo", @"Impresionismo", @"Etapa Azul", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p32 = [[PPPintura alloc] initWithEls:@"crucifixion.jpg" :
                       [NSArray arrayWithObjects: @"Crucifixión", @"El hipercubo", @"La penitencia", @"Resurrección", nil] :
                       [NSArray arrayWithObjects: @"Dalí", @"Zurbarán", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Surrealismo", @"Cubismo", @"Impresionismo", @"Renacimiento", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p33 = [[PPPintura alloc] initWithEls:@"masia.jpg" :
                       [NSArray arrayWithObjects: @"La Masía", @"Interior Holandés", @"Finca de Gaucín", @"El Caserío de Breda", nil] :
                       [NSArray arrayWithObjects: @"Miró", @"Zurbarán", @"Sorolla", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Surrealismo", @"Cubismo", @"Impresionismo", @"Etapa Rosa", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];

    PPPintura  *p34 = [[PPPintura alloc] initWithEls:@"baco.jpg" :
                       [NSArray arrayWithObjects: @"El triunfo de baco", @"La fragua de Vulcano", @"Finca de Gaucín", @"El Caserío de Breda", nil] :
                       [NSArray arrayWithObjects: @"Velázquez", @"Zurbarán", @"Murillo", @"Goya", nil] :
                       [NSArray arrayWithObjects: @"Barroco", @"Cubismo", @"Impresionismo", @"Renacimiento", nil] :
                       [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.XIX", @"s.XII", @"s.XIII", nil]];
    
    PPPintura  *p35 = [[PPPintura alloc] initWithEls:@"interior.jpg" :
                       [NSArray arrayWithObjects: @"Interior Holandés", @"La fragua de Vulcano", @"Finca de Gaucín", @"El Caserío de Breda", nil] :
                       [NSArray arrayWithObjects: @"Miró", @"Zurbarán", @"Murillo", @"Picasso", nil] :
                       [NSArray arrayWithObjects: @"Surrealismo", @"Cubismo", @"Impresionismo", @"Renacimiento", nil] :
                       [NSArray arrayWithObjects: @"s.XX",@"s.XXI", @"s.XIX", @"s.XVII", @"s.XVIII", nil]];
    
    self.level1 = [NSArray arrayWithObjects: p7, p8, p11, p12, p13, p16, p17, p28, p30, p31, p34, nil];
    self.level2 = [NSArray arrayWithObjects: p9, p10, p14, p15, p18, p20, p21, p23, p25, p27, p32, p33, nil];
    self.level3 = [NSArray arrayWithObjects: p1, p2, p3, p4, p5, p6, p19, p22, p24, p26, p29, p35, nil];
        
    }
    if ([[[PV sharedInstance] language] isEqual:@"EN"]){
        
        PPPintura  *p1 = [[PPPintura alloc] initWithEls:@"tahull.jpeg" :
                          [NSArray arrayWithObjects: @"Maiestas Domine", @"Yoda Master", @"Jesus Christ", @"God's Son", nil] :
                          [NSArray arrayWithObjects: @"Yavhe", @"Berruguete", @"Velazquez", @"Goya", nil] :
                          [NSArray arrayWithObjects: @"Romanesque", @"Reinassance", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.X",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p2 = [[PPPintura alloc] initWithEls:@"mariae-b.jpg" :
                          [NSArray arrayWithObjects: @"Maiestas Mariae", @"Saint Katherine", @"The Assumption", @"Virgin Mary", nil] :
                          [NSArray arrayWithObjects: @"Unknown Author", @"Fray John", @"Velazquez", @"Goya", nil] :
                          [NSArray arrayWithObjects: @"Romanesque", @"Reinassance", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.X",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p3 = [[PPPintura alloc] initWithEls:@"santaana.jpg" :
                          [NSArray arrayWithObjects: @"Saint Anna", @"Saint Katherine", @"Virgin Mary", @"The Assumption", nil] :
                          [NSArray arrayWithObjects: @"Ramón Destorrents", @"El Greco", @"Picasso", @"Berruguete", nil] :
                          [NSArray arrayWithObjects: @"Gothic", @"Reinassance", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.XIV",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p4 = [[PPPintura alloc] initWithEls:@"sanpedro.jpg" :
                          [NSArray arrayWithObjects: @"Saint Peter rescued from the waters", @"The Bautism", @"Matthew's miracle", @"Holy Dip", nil] :
                          [NSArray arrayWithObjects: @"Luis Borrassá", @"El Greco", @"Ramón Destorrents", @"Berruguete", nil] :
                          [NSArray arrayWithObjects: @"Gothic", @"Reinassance", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.XIV",@"s.XI", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        
        PPPintura  *p5 = [[PPPintura alloc] initWithEls:@"santacatalina.jpg" :
                          [NSArray arrayWithObjects: @"Saint Katherin of Alexandria", @"Saint Anna", @"Mary and the wheel", @"Mary of Sicily", nil] :
                          [NSArray arrayWithObjects: @"Fernando Yáñez", @"El Greco", @"Unknown Author", @"Luis Borrassá", nil] :
                          [NSArray arrayWithObjects: @"Reinassance", @"Gothic", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.XVI",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p6 = [[PPPintura alloc] initWithEls:@"lactante.jpg" :
                          [NSArray arrayWithObjects: @"Virgen de la Leche", @"Santa Ana", @"Santa María", @"Catalina de Alejandría", nil] :
                          [NSArray arrayWithObjects: @"Luís de Morales", @"El Greco", @"Unknown Author", @"Luis Borrassá", nil] :
                          [NSArray arrayWithObjects: @"Gothic", @"Reinassance", @"Baroque", @"Mannerism", nil] :
                          [NSArray arrayWithObjects: @"s.XVI",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p7 = [[PPPintura alloc] initWithEls:@"caballero.jpg" :
                          [NSArray arrayWithObjects: @"Nobleman with his hand on his chest", @"Count of Orgaz", @"Count of El Greco", @"El Greco, self portrait", nil] :
                          [NSArray arrayWithObjects: @"El Greco", @"Luís de Morales", @"Fernando Yáñez", @"Luis Borrassá", nil] :
                          [NSArray arrayWithObjects: @"Mannerism", @"Reinassance", @"Baroque", @"Surrealismo", nil] :
                          [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p8 = [[PPPintura alloc] initWithEls:@"entierro.jpg" :
                          [NSArray arrayWithObjects: @"The Burial of the count of Orgaz", @"A meeting of poets", @"The Resurrection", @"The meet up", nil] :
                          [NSArray arrayWithObjects: @"El Greco", @"Luís de Morales", @"Fernando Yáñez", @"Luis Borrassá", nil] :
                          [NSArray arrayWithObjects: @"Mannerism", @"Reinassance", @"Baroque", @"Surrealism", nil] :
                          [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p9 = [[PPPintura alloc] initWithEls:@"fragua.jpg" :
                          [NSArray arrayWithObjects: @"Apollo in the forge of Vulcan", @"The forge of the nobleman", @"Count of Orgaz forging", @"Apollo in his forgery", nil] :
                          [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                          [NSArray arrayWithObjects: @"Baroque", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                          [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p10 = [[PPPintura alloc] initWithEls:@"espejo.jpg" :
                           [NSArray arrayWithObjects: @"Rokeby Venus", @"The naked Maja", @"The Maja and the Mirror", @"The clothed Maja", nil] :
                           [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Miró", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Baroque", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p11 = [[PPPintura alloc] initWithEls:@"meninas.jpg" :
                           [NSArray arrayWithObjects: @"Las Meninas", @"Royal Family", @"Las Infants", @"The Family of Philip", nil] :
                           [NSArray arrayWithObjects: @"Velázquez", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Baroque", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p12 = [[PPPintura alloc] initWithEls:@"fusilamientos.jpg" :
                           [NSArray arrayWithObjects: @"The Third of May of 1808", @"The Charge of the Mamelukes", @"Apollo in the forge of Vulcan", @"The Communards", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Velazquez", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"War of Independence", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p13 = [[PPPintura alloc] initWithEls:@"vestida.jpg" :
                           [NSArray arrayWithObjects: @"The clothed Maja", @"The naked Maja", @"Rokeby Venus", @"The Maja and the Mirror", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Portraiture", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p14 = [[PPPintura alloc] initWithEls:@"lechera.jpg" :
                           [NSArray arrayWithObjects: @"The milkmaid of Bordeaux", @"The clothed Maja", @"Rokeby Venus", @"Demoiselles d'Avignon", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Luís de Morales", @"Sorolla", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Goya's exile", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p15 = [[PPPintura alloc] initWithEls:@"sopa.jpg" :
                           [NSArray arrayWithObjects: @"Two old men eating soup", @"They still say that the fish is expensive", @"Pernod bottle", @"The Communards", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Picasso", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Portraiture", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p16 = [[PPPintura alloc] initWithEls:@"vestida.jpg" :
                           [NSArray arrayWithObjects: @"The clothed Maja", @"Rokey Venus", @"The Milkmaid of Bordeaux", @"The naked Maja", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Zuloaga", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Portraiture", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p17 = [[PPPintura alloc] initWithEls:@"desnuda.jpg" :
                           [NSArray arrayWithObjects: @"The naked Maja", @"Rokey Venus", @"The Milkmaid of Bordeaux", @"The clothed Maja", nil] :
                           [NSArray arrayWithObjects: @"Goya", @"Velázquez", @"Picasso", @"Luis Borrassá", nil] :
                           [NSArray arrayWithObjects: @"Portraiture", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p18 = [[PPPintura alloc] initWithEls:@"vilches.jpg" :
                           [NSArray arrayWithObjects: @"Countess of Vilches", @"Countess of Aragon", @"The milkmaid of Bordeaux", @"The clothed Maja", nil] :
                           [NSArray arrayWithObjects: @"Kuntz", @"Velázquez", @"Picasso", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Romanticism", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XIX",@"s.XVII", @"s.IX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p19 = [[PPPintura alloc] initWithEls:@"pescador.jpg" :
                           [NSArray arrayWithObjects: @"El fisherman", @"A walk on the beach", @"They still say that the fish is expensive", @"Boy at the beach", nil] :
                           [NSArray arrayWithObjects: @"Sorolla", @"Kuntz", @"Ramón Casas", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Late Impressionism", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p20 = [[PPPintura alloc] initWithEls:@"paseo.jpg" :
                           [NSArray arrayWithObjects: @"A walk on the beach", @"Demoiselles d'Avignon", @"The milkmaid of Bordeaux", @"The countess of Vilches", nil] :
                           [NSArray arrayWithObjects: @"Sorolla", @"Kuntz", @"Picasso", @"Zuloaga", nil] :
                           [NSArray arrayWithObjects: @"Late Impressionism", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p21 = [[PPPintura alloc] initWithEls:@"playa.jpg" :
                           [NSArray arrayWithObjects: @"Kids on the beach", @"The fisherman", @"A walk on the beach", @"Patrick", nil] :
                           [NSArray arrayWithObjects: @"Sorolla", @"Miró", @"Ramón Casas", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Late Impressionism", @"Reinassance", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p22 = [[PPPintura alloc] initWithEls:@"moulin.jpg" :
                           [NSArray arrayWithObjects: @"Au Moulin de la Galette", @"Marie", @"Rokey Venus", @"The countess of Vilches", nil] :
                           [NSArray arrayWithObjects: @"Ramón Casas", @"Miró", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Modernism", @"Reinassance", @"Impresionismo", @"Romanticism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p23 = [[PPPintura alloc] initWithEls:@"guirtarrista.jpg" :
                           [NSArray arrayWithObjects: @"The old guitarrist", @"The fisherman", @"Au Moulin de la Galette", @"The count of Vilches", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Blue Period", @"Reinassance", @"Impressionism", @"Romanticism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p24 = [[PPPintura alloc] initWithEls:@"volatineros.jpg" :
                           [NSArray arrayWithObjects: @"Family of acrobats", @"The three clowns", @"Au Moulin de la Galette", @"Circus group", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Pink Period", @"Blue Period", @"Impresionismo", @"Romanticism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p25 = [[PPPintura alloc] initWithEls:@"demoiselles.jpg" :
                           [NSArray arrayWithObjects: @"Les Demoiselles D'Avignon", @"Rokey Venus", @"Girl with a Mandoline", @"Au Moulin de la Galette", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Cubism", @"Blue Period", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p26 = [[PPPintura alloc] initWithEls:@"mandolina.jpg" :
                           [NSArray arrayWithObjects: @"Girl with a Mandoline", @"Les Demoiselles D'Avignon", @"Saint Anna", @"Au Moulin de la Galette", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Dalí", nil] :
                           [NSArray arrayWithObjects: @"Cubism", @"Blue Period", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p27 = [[PPPintura alloc] initWithEls:@"pernod.jpg" :
                           [NSArray arrayWithObjects: @"Table in a cafe", @"Deconstructed volume", @"Au Moulin de la Galette", @"A cafe in Paris", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Dalí", nil] :
                           [NSArray arrayWithObjects: @"Cubism", @"Etapa Azul", @"Impressionism", @"Surrealism", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p28 = [[PPPintura alloc] initWithEls:@"guernica.jpg" :
                           [NSArray arrayWithObjects: @"Guernica", @"Horrors of the war", @"The civil war", @"The civil war", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Surrealism", @"Blue Period", @"Impressionism", @"Pink Period", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p29 = [[PPPintura alloc] initWithEls:@"meninasp.jpg" :
                           [NSArray arrayWithObjects: @"Las Meninas (of Velázquez)", @"The family Charles IV", @"Royal family", @"Painter's office", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Dalí", @"Zurbarán", nil] :
                           [NSArray arrayWithObjects: @"Postwar", @"Blue Period", @"Impressionism", @"Pink Period", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p30 = [[PPPintura alloc] initWithEls:@"pablo.jpg" :
                           [NSArray arrayWithObjects: @"Self portrait", @"The fisherman", @"Van Gogh", @"Sait Hugo", nil] :
                           [NSArray arrayWithObjects: @"Picasso", @"Miró", @"Sorolla", @"Velázquez", nil] :
                           [NSArray arrayWithObjects: @"Cubism", @"Blue Period", @"Impressionism", @"Pink Period", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p31 = [[PPPintura alloc] initWithEls:@"persistencia.jpg" :
                           [NSArray arrayWithObjects: @"The persistence of memory", @"Table in a cafe", @"The countdown", @"Relativiy", nil] :
                           [NSArray arrayWithObjects: @"Dalí", @"Miró", @"Sorolla", @"Murillo", nil] :
                           [NSArray arrayWithObjects: @"Surrealism", @"Cubism", @"Impressionism", @"Blue Period", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p32 = [[PPPintura alloc] initWithEls:@"crucifixion.jpg" :
                           [NSArray arrayWithObjects: @"Christ of Sain John of the cross", @"Hypercubus", @"Penitence", @"Resurrection", nil] :
                           [NSArray arrayWithObjects: @"Dalí", @"Zurbarán", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Surrealism", @"Cubism", @"Impressionism", @"Reinassance", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p33 = [[PPPintura alloc] initWithEls:@"masia.jpg" :
                           [NSArray arrayWithObjects: @"The farm", @"The Dutch Interiors", @"Gaucín Estate", @"The Dutch Interiors", nil] :
                           [NSArray arrayWithObjects: @"Miró", @"Zurbarán", @"Sorolla", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Surrealism", @"Cubism", @"Impressionism", @"Pink Period", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XVII", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p34 = [[PPPintura alloc] initWithEls:@"baco.jpg" :
                           [NSArray arrayWithObjects: @"The triumph of Bacchus", @"Apollo working in Vulcan;s forge", @"Gaucín Estate", @"Joy de Vivre", nil] :
                           [NSArray arrayWithObjects: @"Velázquez", @"Zurbarán", @"Murillo", @"Goya", nil] :
                           [NSArray arrayWithObjects: @"Baroque", @"Cubism", @"Impressionism", @"Reinassance", nil] :
                           [NSArray arrayWithObjects: @"s.XVII",@"s.XV", @"s.XIX", @"s.XII", @"s.XIII", nil]];
        
        PPPintura  *p35 = [[PPPintura alloc] initWithEls:@"interior.jpg" :
                           [NSArray arrayWithObjects: @"The Dutch interiors", @"Deconstructed interior", @"Surreal interiors", @"Color", nil] :
                           [NSArray arrayWithObjects: @"Miró", @"Zurbarán", @"Murillo", @"Picasso", nil] :
                           [NSArray arrayWithObjects: @"Surrealism", @"Cubism", @"Impressionism", @"Reinassance", nil] :
                           [NSArray arrayWithObjects: @"s.XX",@"s.XXI", @"s.XIX", @"s.XVII", @"s.XVIII", nil]];
        
        self.level1 = [NSArray arrayWithObjects: p7, p8, p11, p12, p13, p16, p17, p28, p30, p31, p34, nil];
        self.level2 = [NSArray arrayWithObjects: p9, p10, p14, p15, p18, p20, p21, p23, p25, p27, p32, p33, nil];
        self.level3 = [NSArray arrayWithObjects: p1, p2, p3, p4, p5, p6, p19, p22, p24, p26, p29, p35, nil];
        
        
        
    }
    
    
    return self;
}

@end
