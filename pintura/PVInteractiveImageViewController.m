//
//  PVInteractiveImageViewController.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVInteractiveImageViewController.h"
#import "PVBubble.h"
#import "PVBubbleLabel.h"
#import "PV.h"
#import <QuartzCore/QuartzCore.h>

@interface PVInteractiveImageViewController ()

@end

@implementation PVInteractiveImageViewController

@synthesize imageId;
@synthesize navigationTitle;
@synthesize minimumZoomScale;

UIScrollView *scrollImageView;
UIImageView *image;
NSMutableArray *bubbles;
double width, height, scale;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
     //NSLog(@"Interactive Image: %@", self.imageId);
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor =[UIColor whiteColor];
    label.text=self.navigationTitle;
    self.navigationItem.titleView = label;
    self.navigationItem.backBarButtonItem.title = @"Volver";
    
    
    // Load image
    UIImage *imageToDisplay = [UIImage imageNamed:self.imageId];
    bubbles = [[NSMutableArray alloc] init];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:11];

    if ([self.imageId isEqual: @"tahull.jpeg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.34;
        bubble0.y = 0.12;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:1];
        //bubble0.text = @"Mandorla, una especie de cenefa en forma de almendra que encierra la figura del Pantocrator";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.35;
        bubble1.y = 0.18;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:2];
        //bubble1.text = @"Letra griega alfa (primera del abecedario griego), que junto a la letra omega simboliza el origen y final de todas las cosas";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.65;
        bubble2.y = 0.21;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:2];
        //bubble2.text = @"Letra griega omega (ultima letra del abecedario griego)";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.7;
        bubble3.y = 0.7;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:3];
        //bubble3.text = @"Lucas, simbolizado por el toro";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.08;
        bubble4.y = 0.55;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:4];
        //bubble4.text = @"Juan, simbolizado por el aguila";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.13;
        bubble5.y = 0.65;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:5];
        //bubble5.text = @"Mateo, simbolizado por el angel";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.85;
        bubble6.y = 0.7;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:1 bubble:6];
        //bubble6.text = @"Marcos, simbolizado por el leon";
        
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
    }
    
    if ([self.imageId isEqual: @"bestiario.jpg"]) {
    
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.82;
        bubble0.y = 0.25;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:1];
        //bubble0.text = @"Cerdos comiendo bellotas";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.77;
        bubble1.y = 0.75;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:2];
        //bubble1.text = @"Cabras y ovejas pacen";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.7;
        bubble2.y = 0.22;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:3];
        //bubble2.text = @"Un mastín bebe leche del plato de un pastor";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.7;
        bubble3.y = 0.7;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:4];
       // bubble3.text = @"Dos machos cabríos se enfrentan";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.1;
        bubble4.y = 0.3;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:5];
        //bubble4.text = @"Este pastor toca un cuerno";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.5;
        bubble5.y = 0.75;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:2 bubble:6];
        //bubble5.text = @"Este otro pastor toca el caramillo";
    
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
    }
        
    if ([self.imageId isEqual: @"avia.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.45;
        bubble0.y = 0.20;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:1];
        //bubble0.text = @"El espacio central del frontal está presidido por la Virgen y el Niño";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.6;
        bubble1.y = 0.5;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:2];
        //bubble1.text = @"La perspectiva jerárquica es muy propia del románico, pero incluye ciertas novedades góticas como una cierta expresividad gestual y un dinamismo y movimiento desusados hasta entonces";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.2;
        bubble2.y = 0.55;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:3];
        //bubble2.text = @"Escena mariana titulada \"Gozos de la Virgen\"";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.8;
        bubble3.y = 0.55;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:4];
        //bubble3.text = @"Escena mariana que representa la \"Anunciación y Visitación\"";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.2;
        bubble4.y = 0.85;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:5];
        //bubble4.text = @"Escena mariana titulada \"Nacimiento\"";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.8;
        bubble5.y = 0.95;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:3 bubble:6];
        //bubble5.text = @"Esta escena mariana recoge la \"Epifanía\"";
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        
    }

    if ([self.imageId isEqual: @"santacatalina.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.25; bubble0.y = 0.95;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:1];
        bubble0.text = @"Ruedas guarnecidas con cuchillas afiladas que debían rodar sobre el cuerpo de Catalina. Las ruedas se rompieron al tocarla";

        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.12; bubble1.y = 0.75;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:2];
        //bubble1.text = @"Al no surtir efecto la ruedas, se usó una espada como instrumento cortante para intentar decapitarla";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.5; bubble2.y = 0.24;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:3];
        //bubble2.text = @"Del tajo producido por la decapitación mana, no un chorro de sangre, sino de leche";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.6; bubble3.y = 0.12;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:4];
        //bubble3.text = @"Se representa a la santa con una aureola tricolor: blanca (simbolizando su virginidad); verde (por su sabiduría; roja (por su martirio)";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.9; bubble4.y = 0.11;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:5];
        //bubble4.text = @"Alusión a la realeza a que pertenece. Sus padres, Costo y Sabinela, fueron reyes de Sicilia";
    
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.1; bubble5.y = 0.12;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:6];
        //bubble5.text = @"Libro, como símbolo de su sabiduría. Derrotó intelectualmente a la comisión de sabios enviada por el Emperador";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.34; bubble6.y = 0.12;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:7];
        //bubble6.text = @"Lirios, palmas, azucenas, símbolos de la virginidad";
        
        PVBubble *bubble7 = [[PVBubble alloc]init];
        bubble7.x = 0.34; bubble7.y = 0.12;
        bubble7.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:8];
        //bubble7.text = @"Su nombre Catalina procede del griego KATHARINA (pura)";
        
        PVBubble *bubble8 = [[PVBubble alloc]init];
        bubble8.x = 0.34; bubble8.y = 0.12;
        bubble8.text = [[PV sharedInstance] bubbleContentForPainting:4 bubble:9];
        //bubble8.text = @"Fiesta, el 25 de Noviembre; por ser vísperas del frio invierno, estos refranes: \"Por Santa Catalina, nieve en la cocina\"; \"Por Santa Catalina, prevente de leña y harina\"";
        
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        
        
    }
    
    if ([self.imageId isEqual: @"pajarito.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.04; bubble0.y = 0.85;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:1];
        //bubble0.text = @"De aquí sale el haz de luz que, en diagonal, ilumina los personajes: perrito, Niño Jesús y rostro de San José";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.02; bubble1.y = 0.7;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:2];
        //bubble1.text = @"La blanca ropa del cesto de labores de la Virgen ilumina, a su vez, el rostro de María";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.2; bubble2.y = 0.1;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:3];
        //bubble2.text = @"El resto de la estancia permanece en  penumbra. Es una aproximación al “tenebrismo”, que será perfeccionado por José de Ribera “El Spagnoleto”";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.3; bubble3.y = 0.5;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:4];
        //bubble3.text = @"La total ausencia de motivos sagrados presenta una escena cotidiana de una familia normal, en la que el pequeño de la casa resulta travieso, tentando y engañando al perrito";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.3; bubble4.y = 0.2;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:5];
        //bubble4.text = @"La rueca o torno de hilar es un instrumento para hilar fibras textiles. La rueda y la devanadora son sus piezas principales";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.7; bubble5.y = 0.1;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:5 bubble:6];
        //bubble5.text = @"En vez de aureolas, coronas u otros elementos divinos, Murillo rodea a la Sagrada Familia de objetos e instrumentos propios del trabajo de San José (banco de carpintero, sierra y mazo) y de ella misma (cesto y devanadora). Realza así el carácter profano de la composición";
        
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        
        
    }
 
    if ([self.imageId isEqual: @"baco.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.72; bubble0.y = 0.55;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:1];
        //bubble0.text = @"Velázquez lleva pocos años en Madrid y perduran los recuerdos de su etapa sevillana. El tono del manto y su rostro, rememoran el “Aguador de Sevilla”";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.7; bubble1.y = 0.1;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:2];
        //bubble1.text = @"La abigarrada composición, el empaste denso y el tímido claroscuro que se observa en el grupo formado por las seis figuras de la derecha rememoran el “Aguador de Sevilla”";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.6; bubble2.y = 0.73;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:3];
        //bubble2.text = @"La jarra y vaso de agua dan un aire del tan usado bodegón de su época sevillana";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.3; bubble3.y = 0.5;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:4];
        //bubble3.text = @"Uno de los primeros desnudos que Velázquez pinta. El dios queda poco favorecido, fofo y grasiento, en comparación del musculoso compañero";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.5; bubble4.y = 0.03;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:5];
        //bubble4.text = @"Novedad técnica y compositiva del cuadro: primer intento de creación de “aire velazqueño” que, posteriormente, alcanzará de una forma magistral";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.55; bubble5.y = 0.18;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:6];
        //bubble5.text = @"Chispeante y alegre, representa el deseo de la liberación del hombre frente a su esclavitud de la vida diaria";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.58; bubble6.y = 0.9;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:6 bubble:7];
        //bubble6.text = @"¡Qué decir de los vinos de la época! Gruesos y espesos en el trasiego, broncos y ásperos en el buquet, purgantes e imprevisibles en sus efectos.";

        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        
    }
    
    if ([self.imageId isEqual: @"entierro.jpg"]){
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.41; bubble0.y = 0.86;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:1];
        //bubble0.text = @"Cuando D. Gonzalo Ruiz de Toledo falleció en diciembre de 1.323, no era conde, pues la Villa de Orgaz no sería condado hasta 1.522";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.9; bubble1.y = 0.75;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:2];
        //bubble1.text = @"Por testamento del conde, los vecinos debían pagar \"cada año para el cura, ministros y pobres de la parroquia 2 carneros, 8 pares de gallinas, 2 pellejos de vino, 2 cargas de leña y 800 maravedises\"";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.5; bubble2.y = 0.7;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:3];
        //bubble2.text = @"San Esteban y San Agustín pertenecen la orden agustina, muy beneficiada por la generosidad del Señor de Orgaz";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.4; bubble3.y = 0.5;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:4];
        //bubble3.text = @"La composición con parte terrenal y otra celestial ya aparece en el cartulario \"Libro de los Testamentos\" de la catedral de Oviedo, del siglo XII, de la mano de un miniaturista llamado \"Pelagius\"";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.75; bubble4.y = 0.55;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:5];
        //bubble4.text = @"Blancos, dorados y negros predominan en la parte terrenal";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.4; bubble5.y = 0.1;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:6];
        //bubble5.text = @"Las cuatro figuras más importantes de la parte celestial, Jesucristo, la Virgen, San Juan Bautista y el angel, se disponen en el centro ocupando los ángulos de un rombo que divide esa parte celestial";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.5; bubble6.y = 0.05;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:7];
        //bubble6.text = @"Los azules (eternidad), rojos (martirio) y blancos (pureza) son clásicos de la Escuela Veneciana. Los amarillos, verdes, naranjas, malvas son genuinos del Manierismo de El Greco";
        
        PVBubble *bubble7 = [[PVBubble alloc]init];
        bubble7.x = 0.75; bubble7.y = 0.28;
        bubble7.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:8];
        //bubble7.text = @"En los espacios libres que dejan las cuatro figura centrales son reconocibles: San Pedro (con las llaves de la Iglesia); David (con el arpa); Moisés (con las Tablas de la Ley) y Noé (con el arca). A la derecha, Santo Tomás (con la escuadra) y Felipe II (con gola)";
        
        PVBubble *bubble8 = [[PVBubble alloc]init];
        bubble8.x = 0.6;
        bubble8.y = 0.54;
        bubble8.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:9];
        //bubble8.text = @"La transición de la parte celestial del cuadro desde la terrenal se facilita por la luz que viene de arriba, por la esbelta cruz procesional de la derecha, por los velos anaranjados del angel, por la luz de los seis hachones terrenales";
        
        
        PVBubble *bubble9 = [[PVBubble alloc]init];
        bubble9.x = 0.1;
        bubble9.y = 0.62;
        bubble9.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:10];
        //bubble9.text = @"La galería de retratos es de auténticos y reales personajes coetáneos del pintor: Andrés Núñez de Madrid (oficiante); Antonio de Covarrubias (de perfil con barba blanca y frente despejada); Marqués de Montemayor, Francisco de Pisa, Juan L. de la Cuadra, su hijo Jorge Manuel, y el mismísimo autor que nos mira de frente, descaradamente";
        
        PVBubble *bubble10 = [[PVBubble alloc]init];
        bubble10.x = 0.5;
        bubble10.y = 0.8;
        bubble10.text = [[PV sharedInstance] bubbleContentForPainting:7 bubble:11];
        //bubble10.text = @"El Greco recibió 100 ducados para meteriales. Luego, los tasadores oficiales del gremio, valoraron el cuadro en 1.200 Ducados. Al párroco le parecieros muchos y pidió nueva tasación, que se fue a 1.600. Por evitar pleitos quedaron en los 1.200 primeros, que fue cobrando anárquicamente y a plazos, incluso con especie (una custodia de plata)";
    
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        [bubbles addObject:bubble7];
        [bubbles addObject:bubble8];
        [bubbles addObject:bubble9];
        [bubbles addObject:bubble10];
        
    }
    
    if ([self.imageId isEqual: @"meninas.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.5;
        bubble0.y = 0.81;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:1];
        //bubble0.text = @"La escena está presidida por la infanta Margarita de Austria y a su lado se sitúan sus jóvenes damas Mª Agustina de Sarmiento e Isabel de Velasco";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.2;
        bubble1.y = 0.8;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:2];
        //bubble1.text = @"En la izquierda se encuentra Velázquez, con sus pinceles, ante un enorme lienzo cuyo bastidor podemos observar";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.9;
        bubble2.y = 0.8;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:3];
        //bubble2.text = @"Dos enanos y bufones de palacio: Mari Barbola y Nicolasín Pertusato -con el pie apoyado en el perro";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.65;
        bubble3.y = 0.75;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:4];
        //bubble3.text = @"Tras la infanta, la dueña Dª Marcela Ulloa y el guardadamas D. Diego Ruíz de Ascona";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.35;
        bubble4.y = 0.5;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:5];
        //bubble4.text = @"Reflejadas en el espejo están las efigies de Felipe IV y su esposa Mariana de Austria";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.58;
        bubble5.y = 0.5;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:6];
        //bubble5.text = @"La composición se cierra con la figura del mayordomo (aposentador) D. José Nieto";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.75;
        bubble6.y = 0.5;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:7];
        //bubble6.text = @"La infanta y su pequeña corte dan la impresión de que pasaban por allí y que entran a ver el trabajo de El Sevillano";
        
        PVBubble *bubble7 = [[PVBubble alloc]init];
        bubble7.x = 0.18;
        bubble7.y = 0.6;
        bubble7.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:8];
        //bubble7.text = @"Velázquez nos deja intrigados por lo que realmente está pintando en el gran bastidor";
        
        PVBubble *bubble8 = [[PVBubble alloc]init];
        bubble8.x = 0.7;
        bubble8.y = 0.2;
        bubble8.text = [[PV sharedInstance] bubbleContentForPainting:8 bubble:9];
        //bubble8.text = @"La iluminación tenebrista domina la obra, que aporta un claro efecto claroscuro";
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        [bubbles addObject:bubble7];
        [bubbles addObject:bubble8];
        
    }

    if ([self.imageId isEqual: @"paseo.jpg"]){
        
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.7; bubble0.y = 0.03;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:9 bubble:1];
        //bubble0.text = @"He aquí, pòr fuerza, el único tono oscuro que se utiliza en este paseo. Y, además, aparece mitigado, iluminado, por la blanca  cresta de la ola que avanza a su altura";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.5; bubble1.y = 0.39;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:9 bubble:2];
        //bubble1.text = @"Este velo, por lógica, debería estar inundado por la sombra (oscura) que proyecta la madre. Sin embargo, Sorolla utiliza distintos tonos de malva para no contrarrestar la luminosidad del ambiente";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.8; bubble2.y = 0.8;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:9 bubble:3];
        //bubble2.text = @"Los pies no corresponde con la verticalidad del cuerpo que sustentan, que aparece un tanto vencido hacia adelante, por efecto de la oposición al viento y del siguiente paso, lo que confiere movimiento  al conjunto";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.1; bubble3.y = 0.22;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:9 bubble:4];
       // bubble3.text = @"Sujetando ambos la pamela y y el echarpe, que disimula su rostro, de la brisa que viene de la mar, imprimiendo al cuadro un dinamismo añadido, además de mostrar la pericia del autor en las veladuras de sutil pincelada";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.9; bubble4.y = 0.08;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:9 bubble:5];
        //bubble4.text = @"Expresión de sorpresa al verse sorprendida en la soledad de la playa por el atrevido e inesperado paparazzi de la época, que capta el intimismo de madre e hija en su relajado paseo";
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];

    }
    
    if ([self.imageId isEqual: @"lactante.jpg"]){
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.3; bubble0.y = 0.05;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:1];
        //bubble0.text = @"Los ojos bajos, boca pequeña, y rostro ovalado son influencias del prototipo de mujer renancestista creado por Donatello y Rafael";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.45; bubble1.y = 0.85;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:2];
        //bubble1.text = @"La piel blanca de las encarnaduras, el alargamiento de las figuras, y las manos de largos y huesudos dedos separados de tan peculiar manera son propias de Luís Morales, y más tarde, influirán en la obra de El Greco";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.25; bubble2.y = 0.38;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:3];
        //bubble2.text = @"Se aprecia una mirada íntima, casi mística, entre madre e hijo";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.8; bubble3.y = 0.6;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:4];
        //bubble3.text = @"Las vírgenes lactantes, muy frecuentes en la época, descubren su pecho en la pintura europea, no así en la española ante la vigilancia de la Inquisición";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.1; bubble4.y = 0.8;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:5];
        //bubble4.text = @"Un brillante contraste en el colorido del ropaje: rojo bermellón en la camisa, verde muy oscuro en el manto y blanco en la veladura, casi imposible, que cubre su cabeza";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.75;
        bubble5.y = 0.25;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:10 bubble:6];
        //bubble5.text = @"La composición es sencilla y ocupa el centro, dejando el resto en penumbra. Los perfiles de la imagen aparecen difuminados al estilo leonardesco; ambas circunstancias anuncian el tenebrismo tan usado en el Barroco";
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        
        
    }
    
    if ([self.imageId isEqual: @"fusilamientos.jpg"]){
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.28; bubble0.y = 0.72;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:1];
        //bubble0.text = @"\"En medio de charcos de sangre vimos una porción de cadáveres, unos boca abajo, otros boca arriba, en la postura del que estando arrodillado, besa la tierra, otro con las manos levantadas al cielo, pidiendo venganza o tal vez misericordia\" -Relato de un testigo en el que se basó Goya al componer el cuadro";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.1; bubble1.y = 0.3;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:2];
        //bubble1.text = @"No existe la épica, el oropel, la mística de la pintura histórica neoclasicista. Sólo los anónimos ejecutados y sus anónimos ejecutadores. Tanto unos como otros, resultan indiferentes a la heroicidad o a la gloria futura de sus actos";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.75; bubble2.y = 0.18;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:3];
        //bubble2.text = @"La oscuridad reinante, poco contrarrestada por la luz del farol, así como la silueta desdibujada de algún edificio en lontananza, incrementa la sensación de soledad, desamparo y tragedia";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.4; bubble3.y = 0.65;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:4];
        //bubble3.text = @"Grupo anónimo que representa al pueblo llano: un religioso en actitud de oración, un hombre con gorra que aguarda su destino, el hombre de camisa blanca que alza sus manos al cielo,y la insólita presencia de una mujer";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.38; bubble4.y = 0.6;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:5];
        //bubble4.text = @"Énfasis en la transición desde los ya muertos, los que estan siendo fusilados y los que esperan su turno";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.5; bubble5.y = 0.5;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:6];
        //bubble5.text = @"Composición simple, con una perfecta simetría vertical que hace coincidir la máquina gris de matar de los ejecutadores con el grupo doliente de sus víctimas";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.25; bubble6.y = 0.38;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:7];
        //bubble6.text = @"Se dice que este hombre, con los brazos abiertos y un estigma en su mano derecha, recuerda la crucifixión de Cristo";
        
        PVBubble *bubble7 = [[PVBubble alloc]init];
        bubble7.x = 0.75; bubble7.y = 0.75;
        bubble7.text = [[PV sharedInstance] bubbleContentForPainting:11 bubble:8];
        //bubble7.text = @"Cincuenta años más tarde, Manet, relevante figura del Impresionismo, se inspira en este soldado para su \"Ejecución del Emperador Maximiliano I de México\"";

        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        [bubbles addObject:bubble7];
        

    }
    
    if ([self.imageId isEqual: @"guernica.jpg"]){
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.28; bubble0.y = 0.35;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:1];
        //bubble0.text = @"El uso de negros, grises y blancos acentúa el dramatismo y la crueldad humana  que Picasso quiere transmitir a los espectadores. Es este un cuadro simbólico, más que narrativo, en el que Picasso confía en la interpretación de cada uno de sus espectadores";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.3; bubble1.y = 0.8;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:2];
        //bubble1.text = @"El autor hizo en esta obra una recapitulación de todo su potencial plástico anterior, dando una mayor relevancia al cubismo y al surrealismo";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.85; bubble2.y = 0.85;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:3];
        //bubble2.text = @"Este pedazo de suelo con baldosas alude al recinto del pabellón español donde se ubicaba la obra";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.8; bubble3.y = 0.15;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:4];
        //bubble3.text = @"Medio centenar de estudios preparatorios sirvieron para estudiar cada uno de los fragmentos que, a modo de mosaico o puzzle, conforman la obra. Todo el proceso fue fotografiado minuciosamente por Dora Maar";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.1; bubble4.y = 0.5;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:5];
        //bubble4.text = @"Se reúnen en el cuadro personajes recurrentes de la obra de Picasso: minotauros, toros, niños y mujeres dolientes";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.25; bubble5.y = 0.05;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:6];
        //bubble5.text = @"Primera fuente de iluminación. En lugar de la luz natural, cálida y diáfana del sol, se nos presenta esta bombilla que presta otra artificial, fría y tenue luz aserrada que ensombrece el lienzo";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.5; bubble6.y = 0.05;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:7];
        //bubble6.text = @"Segunda fuente de iluminación. El quinqué portado con determinación por la mujer aumenta la luz. Con ello, la mujer parece pretender dejar fiel y amarga constancia de lo que sucede a su alrededor";
        
        PVBubble *bubble7 = [[PVBubble alloc]init];
        bubble7.x = 0.08; bubble7.y = 0.28;
        bubble7.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:8];
        //bubble7.text = @"El toro, eterno mito y esencia de lo español, se muestra desconcertado y desafiante con lo nunca visto. Su cabeza y cuello se retuercen sobre su cuerpo casi ciento ochenta grados";

        PVBubble *bubble8 = [[PVBubble alloc]init];
        bubble8.x = 0.33;
        bubble8.y = 0.28;
        bubble8.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:9];
        //bubble8.text = @"El caballo, cuya cabeza es una exquisita muestra cubista, aún malherido, ofrece su última, enconada y agresiva resistencia. Siguiendo el ejemplo del toro también retuerce su cabeza sobre su cuerpo";

        
        PVBubble *bubble9 = [[PVBubble alloc]init];
        bubble9.x = 0.7;
        bubble9.y = 0.5;
        bubble9.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:10];
        //bubble9.text = @"Cuatro mujeres protagonistas: la portadora del quinqué; la que huye del fuego; la que se arrastra con llamativos pezones en forma de chupete y la que alza el rostro con su hijo muerto. Todas ellas muestran, expresivamente, sus sentimientos: determinación, pánico, dolor y angustia";

        PVBubble *bubble10 = [[PVBubble alloc]init];
        bubble10.x = 0.085;
        bubble10.y = 0.37;
        bubble10.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:11];
        //bubble10.text = @"El predominio de la presencia femenina convierte al \"Guernica\"  en la imagen de una humanidad inocente e indefensa, conscientemente masacrada";

        PVBubble *bubble11 = [[PVBubble alloc]init];
        bubble11.x = 0.55;
        bubble11.y = 0.8;
        bubble11.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:12];
        //bubble11.text = @"La espada rota empuñada por el brazo roto de un guerrero descuartizado, simboliza la violencia y crueldad de la agresión. La florecilla que de ella surge alumbra una debil esperanza, a la par que un militante pacifismo";

        PVBubble *bubble12 = [[PVBubble alloc]init];
        bubble12.x = 0.2;
        bubble12.y = 0.38;
        bubble12.text = [[PV sharedInstance] bubbleContentForPainting:12 bubble:13];
        //bubble12.text = @"Este pájaro, tan asustado y dolorido como los demás, según denotan sus ojos en forma de lágrimas, es el noveno personaje. Posteriormente, evolucionaría hacia el universal símbolo de la paloma de la paz";

        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        [bubbles addObject:bubble7];
        [bubbles addObject:bubble8];
        [bubbles addObject:bubble9];
        [bubbles addObject:bubble10];
        [bubbles addObject:bubble11];
        [bubbles addObject:bubble12];
        
    }
    
    if ([self.imageId isEqual: @"persistencia.jpg"]){
        PVBubble *bubble0 = [[PVBubble alloc]init];
        bubble0.x = 0.1; bubble0.y = 0.78;
        bubble0.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:1];
        //bubble0.text = @"La maquinaria del reloj, un artilugio que mide el tiempo, es invadida por legiones de hormigas, que para Dalí son simbolo de muerte y deseo sexual. Si se destruye el reloj se niega el tiempo y con él la obsesión que domina al autor";
        
        PVBubble *bubble1 = [[PVBubble alloc]init];
        bubble1.x = 0.6; bubble1.y = 0.8;
        bubble1.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:2];
        //bubble1.text = @"Esta masa viscosa, con su ojo, sus pestañas y su gran nariz, autorretrato del artista, carga con el paso del tiempo representado en el reloj blando. Alegoría del triunfo de los sueños y de los deseos de Dalí sobre las angustias existencialistas del hombre. Importa la vivencia pasional e irracional.";
        
        PVBubble *bubble2 = [[PVBubble alloc]init];
        bubble2.x = 0.25; bubble2.y = 0.5;
        bubble2.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:3];
       // bubble2.text = @"La mesa es un ser material, sensible, se ve, se toca, existe. El reloj blando, como símbolo de algo inmaterial, inexistente, como es el tiempo, no sirve, no funciona. El insecto que se posa en su superficie lo destruirá en un proceso de putrefacción";
        
        PVBubble *bubble3 = [[PVBubble alloc]init];
        bubble3.x = 0.8; bubble3.y = 0.28;
        bubble3.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:4];
        //bubble3.text = @"Tiempo inexistente en el espacio inexistente. Dalí pinte en frente un magnífico pedazo de la costa acantilada de Portlligat, como contraposición de algo real. La costa existe y es algo material, el tiempo y el espacio resultan entelequias obsesivas y paranoicas";
        
        PVBubble *bubble4 = [[PVBubble alloc]init];
        bubble4.x = 0.6; bubble4.y = 0.6;
        bubble4.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:5];
       //bubble4.text = @"Este fragmento de la composición queda ubicado en el centro de la misma. Dalí fue un artista ególatra y egocéntrico que, mostrándose en el centro del cuadro, hace alarde de la victoria de sus deseos sobre la presencia obsesiva del tiempo";
        
        PVBubble *bubble5 = [[PVBubble alloc]init];
        bubble5.x = 0.45; bubble5.y = 0.15;
        bubble5.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:6];
        //bubble5.text = @"Tanto este tramo de costa acantilada, como el árbol seco de cuya rama pende el reloj, son elementos reales y conocidos por Dalí en sus paseos vespertinos por el pueblecito de Portlligat, donde tenía una casa, refugio de su trepidante vida americana o parisina";
        
        PVBubble *bubble6 = [[PVBubble alloc]init];
        bubble6.x = 0.25; bubble6.y = 0.10;
        bubble6.text = [[PV sharedInstance] bubbleContentForPainting:13 bubble:7];
        //bubble6.text = @"Las técnicas del dibujo y del color, insuperables, son seña de identidad De Salvador Dalí. Los ocres claros y brillantes, los azules añil degradados, los amarillos limón, prestan una calidez y luminosidad deslumbrantes a cualquiera de sus obras";
        
        
        [bubbles addObject:bubble0];
        [bubbles addObject:bubble1];
        [bubbles addObject:bubble2];
        [bubbles addObject:bubble3];
        [bubbles addObject:bubble4];
        [bubbles addObject:bubble5];
        [bubbles addObject:bubble6];
        
        
    }

    
    // Prepare scroll
    width = imageToDisplay.size.width;
    height = imageToDisplay.size.height;
    if (width > height) scale = (1024-50)/width; else scale = (768-50)/height;
    image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    [image setImage:imageToDisplay];
    
    
    scrollImageView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, 1024-60, 724-60)];
    
    scrollImageView.delegate = self;
    scrollImageView.contentSize = CGSizeMake(width, height);
    scrollImageView.minimumZoomScale=scale;
    self.minimumZoomScale = scale;
    scrollImageView.maximumZoomScale=6.0;
    scrollImageView.zoomScale = scale;
    [scrollImageView addSubview:image];
    
    
    UITapGestureRecognizer *dblRecognizer;
    dblRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapFrom:)];
    [dblRecognizer setNumberOfTapsRequired:2];
    [scrollImageView addGestureRecognizer:dblRecognizer];
    
    
    [self.view addSubview:scrollImageView];
    
    
    NSEnumerator *e = [bubbles objectEnumerator];
    id object;
    double curScale = scrollImageView.zoomScale;
    while (object = [e nextObject]) {
        PVBubble *b = object;
        PVBubble *circleicon =  [[PVBubble alloc] initWithFrame:CGRectMake(floor(width*curScale*b.x), floor(height*curScale*b.y), 30, 30)];
        circleicon.x=b.x; circleicon.y=b.y;circleicon.text=b.text;
        [circleicon setImage:[UIImage imageNamed:@"circleicon.png"]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [circleicon addGestureRecognizer:tap];
        [circleicon setUserInteractionEnabled:YES];
        
        // Label
        PVBubbleLabel *bubbleLabel = [[PVBubbleLabel alloc] initWithFrame:CGRectMake(floor(width*curScale*b.x+30), floor(height*curScale*b.y+30), 380, 120)];
        bubbleLabel.text = b.text;
        bubbleLabel.backgroundColor = [UIColor blackColor];
        bubbleLabel.textColor = [UIColor whiteColor];
        
        bubbleLabel.layer.cornerRadius = 8;
        bubbleLabel.numberOfLines = 4;
        bubbleLabel.hidden = YES;
        bubbleLabel.alpha = 0;
        bubbleLabel.font = font;
        circleicon.label = bubbleLabel;
        
        [scrollImageView addSubview:circleicon];
        [scrollImageView addSubview:bubbleLabel];

    }

    
}

- (void)tap:(UITapGestureRecognizer *)recognizer {
    UIView *theView = recognizer.view;
    if ([theView isKindOfClass:[PVBubble class]]){
        PVBubble *bubble = (PVBubble *)theView;
        [scrollImageView bringSubviewToFront:bubble.label];
        if (bubble.label.hidden){
            bubble.label.hidden=NO;
            [UIView animateWithDuration:0.2
                             animations:^{
                                 bubble.label.alpha = 0.80;
                             }];
            
        } else {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 bubble.label.alpha = 0;
                             } completion:^(BOOL finished){
                                 bubble.label.hidden=YES;
                             }];
            
            
        }
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSEnumerator *e1 = [scrollView.subviews objectEnumerator];
    id obj;
    double curScale = scrollImageView.zoomScale;
    while (obj = [e1 nextObject]){
        if ([obj isKindOfClass:[PVBubble class]]){
            PVBubble *bubble = (PVBubble *) obj;
            bubble.frame = CGRectMake((width*curScale*bubble.x), (height*curScale*bubble.y), 30, 30);
            bubble.label.frame = CGRectMake(floor(width*curScale*bubble.x+30), floor(height*curScale*bubble.y+30), 380, 120);
        }
    }

}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    zoomRect.size.height = [image frame].size.height / scale;
    zoomRect.size.width  = [image frame].size.width  / scale;
    
    center = [image convertPoint:center fromView:self.view];
    
    zoomRect.origin.x    = center.x - ((zoomRect.size.width / 2.0));
    zoomRect.origin.y    = center.y - ((zoomRect.size.height / 2.0));
    
    return zoomRect;
}

- (void)handleDoubleTapFrom:(UITapGestureRecognizer *)recognizer {
    
    //NSLog(@"Double tap");
    
    float newScale = [scrollImageView zoomScale] * 4.0;
    
    if ([scrollImageView zoomScale] > self.minimumZoomScale) {
        //NSLog(@"zoom scale: %f Minimum: %f", [scrollImageView zoomScale], self.minimumZoomScale);
        [scrollImageView setZoomScale:self.minimumZoomScale animated:YES];
    }
    else {
        //NSLog(@"2");
        CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[recognizer locationInView:recognizer.view]];
        [scrollImageView zoomToRect:zoomRect animated:YES];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return image;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Interactive"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
