#ifndef ERR_H
#define ERR_H
#include <stdlib.h>    /* Para definir NULL */

/**********************************************************
                C O N S T A N T E S
**********************************************************/
#define OK          0   /* No hay errores */
#define AP_INV      1   /* Recibe un apuntador nulo */
#define NO_MEM      2   /* malloc regresa NULL*/
/**********************************************************
                    M A C R O S
**********************************************************/

/* Verifica que un apuntador no tenga direcci�n nula*/
#define AP_VAL(p)   ((p)!=NULL)
/**********************************************************
                    T I P O    D E    D A T O S
**********************************************************/
#define DATO        char
#define FOR_DAT     "%4c"
#endif

/***************************************************************
 *          D E V E L O P E R S
 *              Flores Castañas Emilio
 *            Meza Benitez David EmoNuel
 *          Vaquera Aguilera Ethanol Emiliano
 *                      UWU
 * *************************************************************/
