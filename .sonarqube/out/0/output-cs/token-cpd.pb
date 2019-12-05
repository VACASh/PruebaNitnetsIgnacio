�
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Business\ReservationBusiness.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Business '
{ 
public 

class 
ReservationBusiness $
{ 
public		 
List		 
<		 
Pistas		 
>		 
CourtsAvailable		 +
(		+ ,
Reservas		, 4
reservation		5 @
)		@ A
{

 	
if 
( 
reservation 
. 
DateReservation +
.+ ,
	TimeOfDay, 5
.5 6

TotalHours6 @
>=A C
	ConstantsD M
.M N
MINHOURN U
&& 
reservation 
. 
DateReservation .
.. /
	TimeOfDay/ 8
.8 9

TotalHours9 C
<=D F
	ConstantsG P
.P Q
MAXHOURQ X
)X Y
{ 
if 
( 
ReservationDac "
." # 
NumberOfReservations# 7
(7 8
reservation8 C
.C D
IdMemberD L
)L M
<N O
$numP Q
)Q R
{ 
if 
( 
! 
ReservationDac '
.' (.
"HaveMemberOtherReservationSameHour( J
(J K
reservationK V
.V W
IdMemberW _
,_ `
reservationa l
.l m
DateReservationm |
)| }
)} ~
{ 
return 
	CourtsDac (
.( )*
getAllCourtsWhitoutReservation) G
(G H
reservationH S
)S T
;T U
} 
} 
} 
return 
null 
; 
} 	
} 
} �7
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\CourtsController.cs
	namespace		 	 
PruebaNitnetsIgnacio		
 
.		 
Controllers		 *
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
CourtsController !
:" #
ControllerBase$ 2
{ 
[ 	
HttpPost	 
( 
$str )
)) *
]* +
public 
List 
< 
Pistas 
> 
CourtsAvailable +
(+ ,
Reservas, 4
reservas5 =
)= >
{ 	
ReservationBusiness 
reservationbusiness  3
=4 5
new6 9
ReservationBusiness: M
(M N
)N O
;O P
return 
reservationbusiness &
.& '
CourtsAvailable' 6
(6 7
reservas7 ?
)? @
;@ A
} 	
[## 	
HttpGet##	 
(## 
$str## 
)##  
]##  !
public$$ 
IActionResult$$ 
	GetCourts$$ &
($$& '
int$$' *

numberPage$$+ 5
)$$5 6
{%% 	
if&& 
(&& 
	CourtsDac&& 
.&& 
	GetCourts&& #
(&&# $

numberPage&&$ .
)&&. /
.&&/ 0
TotalItemCount&&0 >
>&&? @

numberPage&&A K
)&&K L
return'' 
Ok'' 
('' 
	CourtsDac'' #
.''# $
	GetCourts''$ -
(''- .

numberPage''. 8
)''8 9
)''9 :
;'': ;
else(( 
return)) 

BadRequest)) !
())! "
)))" #
;))# $
}** 	
[11 	
HttpPut11	 
]11 
public22 
IActionResult22 
InsertNewCourt22 +
(22+ ,
Pistas22, 2
court223 8
)228 9
{33 	
if44 
(44 

VerifyJson44 
(44 
court44  
)44  !
)44! "
{55 
Deportes66 
kindSportExist66 '
=66( )
	SportsDac66* 3
.663 4
getOneSports664 @
(66@ A
court66A F
.66F G
	KindSport66G P
)66P Q
;66Q R
try77 
{88 
if99 
(99 
kindSportExist99 &
!=99' )
null99* .
)99. /
{:: 
	CourtsDac;; !
.;;! "
InsertNewCourt;;" 0
(;;0 1
court;;1 6
);;6 7
;;;7 8
return<< 
Ok<< !
(<<! "
)<<" #
;<<# $
}== 
else>> 
{?? 
return@@ 

BadRequest@@ )
(@@) *
)@@* +
;@@+ ,
}AA 
}CC 
catchDD 
(DD 
	ExceptionDD  
exDD! #
)DD# $
{EE 
returnGG 
ConflictGG #
(GG# $
)GG$ %
;GG% &
}HH 
}II 
elseJJ 
{KK 
returnLL 
ConflictLL 
(LL  
)LL  !
;LL! "
}MM 
}NN 	
[UU 	

HttpDeleteUU	 
]UU 
publicVV 
IActionResultVV 
DeleteCourtVV (
(VV( )
PistasVV) /
courtVV0 5
)VV5 6
{WW 	
PistasXX 

courtExistXX 
=XX 
	CourtsDacXX  )
.XX) *
GetCourtXX* 2
(XX2 3
courtXX3 8
.XX8 9
IdCourtXX9 @
)XX@ A
;XXA B
ListYY 
<YY 
ReservasYY 
>YY 
reservationListYY *
;YY* +
reservationListZZ 
=ZZ 
ReservationDacZZ ,
.ZZ, -$
GetAllReservationsCourtsZZ- E
(ZZE F
courtZZF K
.ZZK L
IdCourtZZL S
)ZZS T
;ZZT U
if[[ 
([[ 

courtExist[[ 
!=[[ 
null[[ "
&&[[# %
([[& '
reservationList[[' 6
==[[7 9
null[[: >
||[[? A
reservationList[[B Q
.[[Q R
Count[[R W
==[[X Z
$num[[[ \
)[[\ ]
)[[] ^
{\\ 
	CourtsDac]] 
.]] 
DeleteCourt]] %
(]]% &
court]]& +
)]]+ ,
;]], -
return^^ 
Ok^^ 
(^^ 
)^^ 
;^^ 
}__ 
else`` 
{aa 
returnbb 

BadRequestbb !
(bb! "
)bb" #
;bb# $
}cc 
}ee 	
[kk 	
HttpPostkk	 
]kk 
publicll 
IActionResultll 
UpdateCourtll (
(ll( )
Pistasll) /
courtll0 5
)ll5 6
{mm 	
Pistasnn 

courtExistnn 
=nn 
	CourtsDacnn  )
.nn) *
GetCourtnn* 2
(nn2 3
courtnn3 8
.nn8 9
IdCourtnn9 @
)nn@ A
;nnA B
Listoo 
<oo 
Reservasoo 
>oo 
reservationListoo *
;oo* +
reservationListpp 
=pp 
ReservationDacpp ,
.pp, -$
GetAllReservationsCourtspp- E
(ppE F
courtppF K
.ppK L
IdCourtppL S
)ppS T
;ppT U
ifqq 
(qq 

courtExistqq 
!=qq 
nullqq "
&&qq# %
(qq& '
reservationListqq' 6
==qq7 9
nullqq: >
||qq? A
reservationListqqB Q
.qqQ R
CountqqR W
==qqX Z
$numqq[ \
)qq\ ]
)qq] ^
{rr 
	CourtsDacss 
.ss 
UpdateCourtss %
(ss% &
courtss& +
)ss+ ,
;ss, -
returntt 
Oktt 
(tt 
)tt 
;tt 
}uu 
elsevv 
{ww 
returnxx 

BadRequestxx !
(xx! "
)xx" #
;xx# $
}yy 
}{{ 	
private}} 
bool}} 

VerifyJson}} 
(}}  
Pistas}}  &
courtToVerify}}' 4
)}}4 5
{~~ 	
return 
( 
! 
string 
. 
IsNullOrEmpty )
() *
courtToVerify* 7
.7 8
	KindSport8 A
)A B
&&
�� 
courtToVerify
��  
.
��  !
IdCourt
��! (
!=
��) +
$num
��, -
)
��- .
?
��/ 0
true
��1 5
:
��6 7
false
��8 =
;
��= >
}
�� 	
}
�� 
}�� �.
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\LoginController.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
LoginController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
LoginController 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
[ 	
HttpPost	 
] 
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
Usuarios/ 7
	userLogin8 A
)A B
{ 	
var   
	_userInfo   
=   
await   !"
AutenticarUsuarioAsync  " 8
(  8 9
	userLogin  9 B
)  B C
;  C D
if!! 
(!! 
	_userInfo!! 
!=!! 
null!! !
)!!! "
{"" 
return## 
Ok## 
(## 
new## 
{## 
token##  %
=##& '
GenerarTokenJWT##( 7
(##7 8
	_userInfo##8 A
)##A B
}##C D
)##D E
;##E F
}$$ 
else%% 
{&& 
return'' 
Unauthorized'' #
(''# $
)''$ %
;''% &
}(( 
})) 	
private,, 
async,, 
Task,, 
<,, 
Usuarios,, #
>,,# $"
AutenticarUsuarioAsync,,% ;
(,,; <
Usuarios,,< D
	userLogin,,E N
),,N O
{-- 	
Usuarios.. 
user.. 
=.. 
new.. 
Usuarios..  (
(..( )
)..) *
;..* +
using00 
(00 $
DataBaseSportClubContext00 +
	dbContext00, 5
=006 7
new008 ;$
DataBaseSportClubContext00< T
(00T U
)00U V
)00V W
{11 
user22 
=22 
UserDac22 
.22 
ReadUser22 '
(22' (
	userLogin22( 1
)221 2
;222 3
}33 
return55 
user55 
;55 
}66 	
private99 
string99 
GenerarTokenJWT99 &
(99& '
Usuarios99' /
usuarioInfo990 ;
)99; <
{:: 	
var<< !
_symmetricSecurityKey<< %
=<<& '
new<<( + 
SymmetricSecurityKey<<, @
(<<@ A
Encoding== 
.== 
UTF8== !
.==! "
GetBytes==" *
(==* +
configuration==+ 8
[==8 9
$str==9 H
]==H I
)==I J
)>> 
;>> 
var?? 
_signingCredentials?? #
=??$ %
new??& )
SigningCredentials??* <
(??< =!
_symmetricSecurityKey@@ )
,@@) *
SecurityAlgorithms@@+ =
.@@= >

HmacSha256@@> H
)AA 
;AA 
varBB 
_HeaderBB 
=BB 
newBB 
	JwtHeaderBB '
(BB' (
_signingCredentialsBB( ;
)BB; <
;BB< =
varEE 
_ClaimsEE 
=EE 
newEE 
[EE 
]EE 
{EE  !
newFF 
ClaimFF 
(FF #
JwtRegisteredClaimNamesFF 1
.FF1 2
JtiFF2 5
,FF5 6
GuidFF7 ;
.FF; <
NewGuidFF< C
(FFC D
)FFD E
.FFE F
ToStringFFF N
(FFN O
)FFO P
)FFP Q
,FFQ R
newGG 
ClaimGG 
(GG #
JwtRegisteredClaimNamesGG 1
.GG1 2
NameIdGG2 8
,GG8 9
usuarioInfoGG: E
.GGE F
NameGGF J
.GGJ K
ToStringGGK S
(GGS T
)GGT U
)GGU V
,GGV W
newHH 
ClaimHH 
(HH 
$strHH "
,HH" #
usuarioInfoHH$ /
.HH/ 0
LoginHH0 5
)HH5 6
,HH6 7
}JJ 
;JJ 
varMM 
_PayloadMM 
=MM 
newMM 

JwtPayloadMM )
(MM) *
issuerNN 
:NN 
configurationNN )
[NN) *
$strNN* 6
]NN6 7
,NN7 8
audienceOO 
:OO 
configurationOO +
[OO+ ,
$strOO, :
]OO: ;
,OO; <
claimsPP 
:PP 
_ClaimsPP #
,PP# $
	notBeforeQQ 
:QQ 
DateTimeQQ '
.QQ' (
UtcNowQQ( .
,QQ. /
expiresSS 
:SS 
DateTimeSS %
.SS% &
UtcNowSS& ,
.SS, -
AddHoursSS- 5
(SS5 6
$numSS6 8
)SS8 9
)TT 
;TT 
varWW 
_TokenWW 
=WW 
newWW 
JwtSecurityTokenWW -
(WW- .
_HeaderXX 
,XX 
_PayloadYY 
)ZZ 
;ZZ 
return\\ 
new\\ #
JwtSecurityTokenHandler\\ .
(\\. /
)\\/ 0
.\\0 1

WriteToken\\1 ;
(\\; <
_Token\\< B
)\\B C
;\\C D
}]] 	
}^^ 
}__ �#
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\MembersController.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
MembersController "
:# $
ControllerBase% 3
{ 
public 
MembersController  
(  !
)! "
{ 	
}	 

[ 	
HttpGet	 
( 
$str 
)  
]  !
public 
IActionResult 

GetMembers '
(' (
int) ,

numberPage- 7
)7 8
{ 	
if 
( 

MembersDac 
. 
GetAllMembers (
(( )

numberPage) 3
)3 4
.4 5
TotalItemCount5 C
>D E

numberPageF P
)P Q
return 
Ok 
( 

MembersDac $
.$ %
GetAllMembers% 2
(2 3

numberPage3 =
)= >
)> ?
;? @
else 
return 

BadRequest !
(! "
)" #
;# $
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
CreateNewMember ,
(, -
Socios- 3
member4 :
): ;
{ 	
if 
( 

MembersDac 
. 
CreateMember '
(' (
member( .
). /
)/ 0
{   
return!! 
Ok!! 
(!! 
)!! 
;!! 
}"" 
else## 
{$$ 
return%% 
Unauthorized%% #
(%%# $
)%%$ %
;%%% &
}&& 
}'' 	
[** 	
HttpPut**	 
(** 
)** 
]** 
public++ 
IActionResult++ 
UpdateMember++ )
(++) *
Socios++* 0
member++1 7
)++7 8
{,, 	
Socios-- 
memberExist-- 
=--  

MembersDac--! +
.--+ ,
	GetMember--, 5
(--5 6
member--6 <
.--< =
IdMember--= E
)--E F
;--F G
if// 
(// 
memberExist// 
!=// 
null// #
)//# $
{00 

MembersDac11 
.11 
UpdateMember11 '
(11' (
member11( .
)11. /
;11/ 0
return22 
Ok22 
(22 
)22 
;22 
}33 
else44 
{55 
return66 

BadRequest66 !
(66! "
)66" #
;66# $
}77 
}88 	
[;; 	

HttpDelete;;	 
(;; 
);; 
];; 
public<< 
IActionResult<< 
DeleteMember<< )
(<<) *
Socios<<* 0
member<<1 7
)<<7 8
{== 	
Socios>> 
memberExist>> 
=>>  

MembersDac>>! +
.>>+ ,
	GetMember>>, 5
(>>5 6
member>>6 <
.>>< =
IdMember>>= E
)>>E F
;>>F G
List?? 
<?? 
Reservas?? 
>??  
reservationsByMember?? /
=??0 1
ReservationDac??2 @
.??@ A"
GetReservationByMember??A W
(??W X
member??X ^
.??^ _
IdMember??_ g
)??g h
;??h i
if@@ 
(@@ 
memberExist@@ 
!=@@ 
null@@ #
&&@@$ &
(@@' ( 
reservationsByMember@@( <
.@@< =
Count@@= B
==@@C E
$num@@F G
||@@H J 
reservationsByMember@@K _
==@@` b
null@@c g
)@@g h
)@@h i
{AA 
	CourtsDacBB 
.BB 
DeleteMemberBB &
(BB& '
memberBB' -
)BB- .
;BB. /
returnCC 
OkCC 
(CC 
)CC 
;CC 
}DD 
elseEE 
{FF 
returnGG 

BadRequestGG !
(GG! "
)GG" #
;GG# $
}HH 
}II 	
}JJ 
}KK �-
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\RegisterController.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
RegisterController #
:$ %
ControllerBase& 4
{ 
public 
RegisterController !
(! "
)" #
{ 	
} 	
[ 	
HttpPost	 
] 
[ 	
AllowAnonymous	 
] 
public 
IActionResult 

Createuser '
(' (
Usuarios( 0
userToRegister1 ?
)? @
{ 	
bool 
isUserRegisted 
;  
bool 
isEmailRegisted  
;  !
bool 
isDniRegisted 
; 
bool 
isCorrectJson 
; 
Usuarios 
userRegisteered $
;$ %
isCorrectJson 
= 

VerifyJson &
(& '
userToRegister' 5
)5 6
;6 7
isUserRegisted 
= 
RegisterUserLogin .
(. /
userToRegister/ =
.= >
Login> C
)C D
;D E
if   
(   
!   
isCorrectJson   
)   
{!! 
return"" 

BadRequest"" !
(""! "
)""" #
;""# $
}## 
else$$ 
{%% 
if&& 
(&& 
isUserRegisted&& "
)&&" #
{'' 
return(( 
Unauthorized(( '
(((' (
)((( )
;(() *
})) 
else** 
{++ 
isDniRegisted,, !
=,," #
RegisterUserDni,,$ 3
(,,3 4
userToRegister,,4 B
.,,B C
Dni,,C F
),,F G
;,,G H
if-- 
(-- 
isDniRegisted-- %
)--% &
{.. 
return// 
Unauthorized// +
(//+ ,
)//, -
;//- .
}00 
else11 
{22 
isEmailRegisted33 '
=33( )
RegisterUserEmail33* ;
(33; <
userToRegister33< J
.33J K
Email33K P
)33P Q
;33Q R
if55 
(55 
isEmailRegisted55 +
)55+ ,
{66 
return77 "
Unauthorized77# /
(77/ 0
)770 1
;771 2
}88 
else99 
{:: 
userRegisteered;; +
=;;, -
UserDac;;. 5
.;;5 6

CreateUser;;6 @
(;;@ A
userToRegister;;A O
);;O P
;;;P Q
if== 
(==  
userRegisteered==  /
====0 2
null==3 7
)==7 8
{>> 
return??  &
Conflict??' /
(??/ 0
)??0 1
;??1 2
}@@ 
elseAA  
{BB 
returnCC  &
OkCC' )
(CC) *
)CC* +
;CC+ ,
}DD 
}FF 
}GG 
}II 
}JJ 
}LL 	
privateNN 
boolNN 

VerifyJsonNN 
(NN  
UsuariosNN  (
userToRegisterNN) 7
)NN7 8
{OO 	
returnPP 
!PP 
stringPP 
.PP 
IsNullOrEmptyPP (
(PP( )
userToRegisterPP) 7
.PP7 8
DniPP8 ;
)PP; <
&&QQ 
!QQ 
stringQQ 
.QQ 
IsNullOrEmptyQQ (
(QQ( )
userToRegisterQQ) 7
.QQ7 8
EmailQQ8 =
)QQ= >
&&RR 
!RR 
stringRR 
.RR 
IsNullOrEmptyRR (
(RR( )
userToRegisterRR) 7
.RR7 8
LoginRR8 =
)RR= >
&&SS 
!SS 
stringSS 
.SS 
IsNullOrEmptySS (
(SS( )
userToRegisterSS) 7
.SS7 8
PasswordSS8 @
)SS@ A
&&TT 
!TT 
stringTT 
.TT 
IsNullOrEmptyTT (
(TT( )
userToRegisterTT) 7
.TT7 8
NameTT8 <
)TT< =
;TT= >
}UU 	
privateWW 
boolWW 
RegisterUserLoginWW &
(WW& '
stringWW' -
loginWW. 3
)WW3 4
{XX 	
boolYY 
isUserRegistredYY  
=YY! "
UserDacYY# *
.YY* +
ExistUserLoginYY+ 9
(YY9 :
loginYY: ?
)YY? @
;YY@ A
return[[ 
isUserRegistred[[ "
;[[" #
}\\ 	
private^^ 
bool^^ 
RegisterUserEmail^^ &
(^^& '
string^^' -
email^^. 3
)^^3 4
{__ 	
bool`` 
isUserRegistred``  
=``! "
UserDac``# *
.``* +
ExistUserEmail``+ 9
(``9 :
email``: ?
)``? @
;``@ A
returnbb 
isUserRegistredbb "
;bb" #
}cc 	
privatedd 
booldd 
RegisterUserDnidd $
(dd$ %
stringdd% +
dnidd, /
)dd/ 0
{ee 	
boolff 
isUserRegistredff  
=ff! "
UserDacff# *
.ff* +
ExistUserDniff+ 7
(ff7 8
dniff8 ;
)ff; <
;ff< =
returnhh 
isUserRegistredhh "
;hh" #
}ii 	
}kk 
}ll �N
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\ReservationCourtsController.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class '
ReservationCourtsController ,
:- .
ControllerBase/ =
{ 
public '
ReservationCourtsController *
(* +
)+ ,
{ 	
} 	
[ 	
HttpGet	 
] 
public 
List 
< 
Reservas 
> 
ReservationList -
(- .
Reservas. 6
reservas7 ?
)? @
{ 	
List 
< 
Reservas 
> 
reservationsDay *
=+ ,
new- 0
List1 5
<5 6
Reservas6 >
>> ?
(? @
)@ A
;A B
DateTime 
dayReservations $
;$ %
dayReservations 
= 
JsonDateIsCorrect /
(/ 0
reservas0 8
.8 9
DateReservation9 H
)H I
;I J
try 
{ 
reservationsDay 
=  !
ReservationDac" 0
.0 1
GetReservationsDay1 C
(C D
dayReservationsD S
)S T
;T U
return 
reservationsDay &
;& '
} 
catch   
(   
	Exception   
e   
)   
{!! 
return"" 
null"" 
;"" 
}$$ 
}%%	 

['' 	
HttpPost''	 
]'' 
public(( 
IActionResult(( 
ReservationCourt(( -
(((- .
Reservas((. 6
reservas((7 ?
)((? @
{)) 	
ReservationBusiness** 
reservationBusiness**  3
=**4 5
new**6 9
ReservationBusiness**: M
(**M N
)**N O
;**O P
List++ 
<++ 
Pistas++ 
>++ 
availableCourts++ (
=++) *
new+++ .
List++/ 3
<++3 4
Pistas++4 :
>++: ;
(++; <
)++< =
;++= >
availableCourts,, 
=,, 
reservationBusiness,, 1
.,,1 2
CourtsAvailable,,2 A
(,,A B
reservas,,B J
),,J K
;,,K L
Pistas-- 
court-- 
=-- 
	CourtsDac-- $
.--$ %
GetCourt--% -
(--- .
reservas--. 6
.--6 7
IdCourt--7 >
)--> ?
;--? @
bool.. 
isAvilableCourt..  
=..! "
false..# (
;..( )
foreach00 
(00 
Pistas00 
courtsToReserve00 +
in00, .
availableCourts00/ >
)00> ?
{11 
if22 
(22 
court22 
.22 
IdCourt22 !
==22" $
courtsToReserve22% 4
.224 5
IdCourt225 <
)22< =
{33 
isAvilableCourt44 #
=44$ %
true44& *
;44* +
break55 
;55 
}66 
}88 
if:: 
(:: 
availableCourts:: 
!=::  "
null::# '
&&::( *
isAvilableCourt::+ :
)::: ;
{;; 
ReservationDac<< 
.<< 
ReserveCourt<< +
(<<+ ,
reservas<<, 4
)<<4 5
;<<5 6
return== 
Ok== 
(== 
)== 
;== 
}>> 
else?? 
{@@ 
returnAA 
UnauthorizedAA #
(AA# $
)AA$ %
;AA% &
}BB 
}CC 	
[EE 	

HttpDeleteEE	 
]EE 
publicFF 
IActionResultFF 
DeleteReservationFF .
(FF. /
ReservasFF/ 7
reservationFF8 C
)FFC D
{GG 	
ReservasII 
reservationToDeleteII (
=II) *
ReservationDacII+ 9
.II9 :
GetReservationII: H
(IIH I
reservationIII T
.IIT U
IdReservationIIU b
)IIb c
;IIc d
ifJJ 
(JJ 
reservationToDeleteJJ #
!=JJ$ &
nullJJ' +
&&JJ, .
reservationToDeleteJJ/ B
.JJB C
DateReservationJJC R
.JJR S
DateJJS W
>JJX Y
DateTimeJJZ b
.JJb c
NowJJc f
.JJf g
DateJJg k
)JJk l
{KK 
ReservationDacLL 
.LL 
DeleteReservationLL 0
(LL0 1
reservationLL1 <
.LL< =
IdReservationLL= J
)LLJ K
;LLK L
returnMM 
OkMM 
(MM 
)MM 
;MM 
}NN 
elseOO 
{PP 
returnQQ 

BadRequestQQ !
(QQ! "
)QQ" #
;QQ# $
}RR 
}SS 	
[UU 	
HttpPutUU	 
]UU 
publicVV 
IActionResultVV 
ModifyReservationVV .
(VV. /
ReservasVV/ 7
reservasVV8 @
)VV@ A
{WW 	
ReservasXX 
reservationXX  
=XX! "
ReservationDacXX# 1
.XX1 2
GetReservationXX2 @
(XX@ A
reservasXXA I
.XXI J
IdReservationXXJ W
)XXW X
;XXX Y
PistasYY 
courtYY 
=YY 
	CourtsDacYY $
.YY$ %
GetCourtYY% -
(YY- .
reservasYY. 6
.YY6 7
IdCourtYY7 >
)YY> ?
;YY? @
ListZZ 
<ZZ 
ReservasZZ 
>ZZ 
reservationListDaysZZ .
=ZZ/ 0
newZZ1 4
ListZZ5 9
<ZZ9 :
ReservasZZ: B
>ZZB C
(ZZC D
)ZZD E
;ZZE F
reservationListDays[[ 
=[[  !
ReservationList[[" 1
([[1 2
reservas[[2 :
)[[: ;
;[[; <
bool\\ 
isBadRequest\\ 
;\\ 
bool]] 
isCorrectTime]] 
;]] 
isBadRequest__ 
=__ 
(__ 
court__ !
==__" $
null__% )
||__* ,
court__- 2
.__2 3
	KindSport__3 <
!=__= ?
reservas__@ H
.__H I
	KindSport__I R
||__S U
reservation__V a
==__b d
null__e i
||__j l
reservation__m x
.__x y
IdMember	__y �
!=
__� �
reservas
__� �
.
__� �
IdMember
__� �
)
__� �
;
__� �
isCorrectTime`` 
=`` 
(`` 
reservas`` %
.``% &
DateReservation``& 5
.``5 6
	TimeOfDay``6 ?
.``? @

TotalHours``@ J
>=``K M
	Constants``N W
.``W X
MINHOUR``X _
&&aa 
reservasaa 
.aa  
DateReservationaa  /
.aa/ 0
	TimeOfDayaa0 9
.aa9 :

TotalHoursaa: D
<=aaE G
	ConstantsaaH Q
.aaQ R
MAXHOURaaR Y
)aaY Z
;aaZ [
ifcc 
(cc 
isBadRequestcc 
||cc 
!cc  !
isCorrectTimecc! .
)cc. /
{dd 
returnee 
Unauthorizedee #
(ee# $
)ee$ %
;ee% &
}ff 
elsegg 
{hh 
ifii 
(ii 
reservationListDaysii '
.ii' (
Findii( ,
(ii, -
rjj 
=>jj 
rjj 
.jj 
IdCourtjj 
==jj  
reservasjj! )
.jj) *
IdCourtjj* 1
&&kk 
rkk 
.kk 
DateReservationkk #
==kk$ &
reservaskk' /
.kk/ 0
DateReservationkk0 ?
)kk? @
!=ll 
nullll 
||ll 
courtll 
==ll  "
nullll# '
||ll( *
reservationll+ 6
==ll7 9
nullll: >
)ll> ?
{mm 
returnnn 
Unauthorizednn '
(nn' (
)nn( )
;nn) *
}oo 
elsepp 
{qq 
tryrr 
{ss 
ReservationDactt &
.tt& '
UpdateReservationtt' 8
(tt8 9
reservastt9 A
)ttA B
;ttB C
returnuu 
Okuu !
(uu! "
)uu" #
;uu# $
}vv 
catchww 
(ww 
	Exceptionww $
exww% '
)ww' (
{xx 
returnzz 
Conflictzz '
(zz' (
)zz( )
;zz) *
}{{ 
}}} 
}~~ 
}
�� 	
private
�� 
DateTime
�� 
JsonDateIsCorrect
�� *
(
��* +
DateTime
��+ 3
dateTimeToReserve
��4 E
)
��E F
{
�� 	
DateTime
�� 
dayReservations
�� $
=
��% &
new
��' *
DateTime
��+ 3
(
��3 4
)
��4 5
;
��5 6
try
�� 
{
�� 
dayReservations
�� 
=
��  !
Convert
��" )
.
��) *

ToDateTime
��* 4
(
��4 5
dateTimeToReserve
��5 F
)
��F G
;
��G H
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
}
�� 
return
�� 
dayReservations
�� "
;
��" #
}
�� 	
}
�� 
}�� �
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\SportsControllar.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
SportsController !
:" #
ControllerBase$ 2
{ 
public 
SportsController 
(  
)  !
{ 	
}	 

[ 	
HttpPost	 
] 
public 
IActionResult 
NewSport %
(% &
Deportes& .
sports/ 5
)5 6
{ 	
if 
( 
	SportsDac 
. 
InsertNewSports )
() *
sports* 0
)0 1
)1 2
{ 
return 
Ok 
( 
) 
; 
} 
else 
{ 
return   

BadRequest   !
(  ! "
)  " #
;  # $
}!! 
}"" 	
[$$ 	
HttpGet$$	 
($$ 
$str$$ 
)$$  
]$$  !
public&& 
IActionResult&& 
GetAllSports&& )
(&&) *
int&&* -

numberPage&&. 8
)&&8 9
{'' 	
if(( 
((( 
	SportsDac(( 
.(( 
GetAllSports(( &
(((& '

numberPage((' 1
)((1 2
.((2 3
TotalItemCount((3 A
>((B C

numberPage((D N
)((N O
return)) 
Ok)) 
()) 
	SportsDac)) #
.))# $
GetAllSports))$ 0
())0 1

numberPage))1 ;
))); <
)))< =
;))= >
else** 
return++ 

BadRequest++ !
(++! "
)++" #
;++# $
},, 	
[// 	
HttpGet//	 
]// 
[00 	
Route00	 
(00 
$str00  
)00  !
]00! "
public11 
Deportes11 
Get11 
(11 
string11 "
	kindSport11# ,
)11, -
{22 	
return33 
	SportsDac33 
.33 
getOneSports33 )
(33) *
	kindSport33* 3
)333 4
;334 5
}44 	
[66 	

HttpDelete66	 
]66 
public77 
IActionResult77 
Delete77 #
(77# $
Deportes77$ ,
sport77- 2
)772 3
{88 	
if99 
(99 
	SportsDac99 
.99 
DeleteSport99 %
(99% &
sport99& +
.99+ ,
	KindSport99, 5
)995 6
)996 7
{:: 
return;; 
Ok;; 
(;; 
);; 
;;; 
}<< 
else== 
{>> 
return?? 
Unauthorized?? #
(??# $
)??$ %
;??% &
}@@ 
}AA 	
[CC 	
HttpPutCC	 
]CC 
publicDD 
IActionResultDD 
PutDD  
(DD  !
DeportesDD! )
sportDD* /
)DD/ 0
{EE 	
ifFF 
(FF 
	SportsDacFF 
.FF 
UpdateSportFF %
(FF% &
sportFF& +
)FF+ ,
)FF, -
{GG 
returnHH 
OkHH 
(HH 
)HH 
;HH 
}II 
elseJJ 
{KK 
returnLL 
UnauthorizedLL #
(LL# $
)LL$ %
;LL% &
}MM 
}NN 	
}RR 
}SS �
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Controllers\UsersController.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
UsersController 
( 
IConfiguration -
configuration. ;
); <
{ 	
this 
. 
configuration 
=  
configuration! .
;. /
} 	
[ 	
HttpGet	 
( 
$str 
)  
]  !
public 
IActionResult 
GetAllUsers (
(( )
int) ,

numberPage- 7
)7 8
{ 	
if 
( 
UserDac 
. 
GetAllUsers #
(# $

numberPage$ .
). /
./ 0
TotalItemCount0 >
>? @

numberPageA K
)K L
return 
Ok 
( 
UserDac !
.! "
GetAllUsers" -
(- .

numberPage. 8
)8 9
)9 :
;: ;
else   
return!! 

BadRequest!! !
(!!! "
)!!" #
;!!# $
}"" 	
[$$ 	

HttpDelete$$	 
]$$ 
public%% 
IActionResult%% 
Delete%% #
(%%# $
Usuarios%%$ ,
usuario%%- 4
)%%4 5
{&& 	
if'' 
('' 
UserDac'' 
.'' 

DeleteUser'' "
(''" #
usuario''# *
)''* +
)''+ ,
{(( 
return)) 
Ok)) 
()) 
))) 
;)) 
}** 
else++ 
{,, 
return-- 
Unauthorized-- #
(--# $
)--$ %
;--% &
}.. 
}// 	
[00 	
HttpPut00	 
]00 
public11 
IActionResult11 
Put11  
(11  !
Usuarios11! )
usuario11* 1
)111 2
{22 	
if33 
(33 
UserDac33 
.33 

UpdateUser33 "
(33" #
usuario33# *
)33* +
)33+ ,
{44 
return55 
Ok55 
(55 
)55 
;55 
}66 
else77 
{88 
return99 

BadRequest99 !
(99! "
)99" #
;99# $
}:: 
};; 	
}>> 
}?? �O
xC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Dac\CourtsDac.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Dac "
{		 
public

 

class

 
	CourtsDac

 
{ 
internal 
static 
List 
< 
Pistas #
># $!
getAllCourtsKindSport% :
(: ;
string; A
	kindSportB K
)K L
{ 	
List 
< 
Pistas 
>  
allCourtsByKindSport -
=. /
new0 3
List4 8
<8 9
Pistas9 ?
>? @
(@ A
)A B
;B C
using 
( $
DataBaseSportClubContext +
dataBaseSportClub, =
=> ?
new@ C$
DataBaseSportClubContextD \
(\ ]
)] ^
)^ _
{  
allCourtsByKindSport $
=% &
dataBaseSportClub' 8
.8 9
Pistas9 ?
. 
Where 
( 
r 
=> 
r  !
.! "
	KindSport" +
==, .
	kindSport/ 8
)8 9
. 
ToList 
( 
) 
; 
return  
allCourtsByKindSport +
;+ ,
} 
} 	
internal 
static 
List 
< 
Pistas #
># $*
getAllCourtsWhitoutReservation% C
(C D
ReservasD L
reservationM X
)X Y
{ 	
List 
< 
Pistas 
>  
allCourtsByKindSport -
=. /
new0 3
List4 8
<8 9
Pistas9 ?
>? @
(@ A
)A B
;B C
using 
( $
DataBaseSportClubContext +
dataBaseSportClub, =
=> ?
new@ C$
DataBaseSportClubContextD \
(\ ]
)] ^
)^ _
{    
allCourtsByKindSport$$ $
=$$% &
dataBaseSportClub$$' 8
.$$8 9
Pistas$$9 ?
.$$? @
Where$$@ E
($$E F
p$$F G
=>$$H J
p$$K L
.$$L M
	KindSport$$M V
==$$W Y
reservation$$Z e
.$$e f
	KindSport$$f o
)$$o p
.$$p q
ToList$$q w
($$w x
)$$x y
;$$y z
List%% 
<%% 
Reservas%% 
>%% $
sportsWhitoutReservation%% 7
=%%8 9
new%%: =
List%%> B
<%%B C
Reservas%%C K
>%%K L
(%%L M
)%%M N
;%%N O$
sportsWhitoutReservation(( (
=(() *
dataBaseSportClub)) %
.))% &
Reservas))& .
.)). /
Where))/ 4
())4 5
r))5 6
=>))7 9
r** 
.** 
DateReservation** !
==**" $
reservation**% 0
.**0 1
DateReservation**1 @
&&++ 
r++ 
.++ 
	KindSport++ 
==++ !
reservation++" -
.++- .
	KindSport++. 7
)++7 8
.++8 9
ToList++9 ?
(++? @
)++@ A
;++A B
foreach-- 
(-- 
Reservas-- !
courtForRemove--" 0
in--1 3$
sportsWhitoutReservation--4 L
)--L M
{..  
allCourtsByKindSport// (
.//( )
	RemoveAll//) 2
(//2 3
s//3 4
=>//5 7
s//8 9
.//9 :
IdCourt//: A
==//B D
courtForRemove//E S
.//S T
IdCourt//T [
)//[ \
;//\ ]
}00 
return11  
allCourtsByKindSport11 +
;11+ ,
}33 
}44 	
internal66 
static66 
Pistas66 
GetCourt66 '
(66' (
int66( +
idCourt66, 3
)663 4
{77 	
using88 
(88 $
DataBaseSportClubContext88 +
dataBaseSportClub88, =
=88> ?
new88@ C$
DataBaseSportClubContext88D \
(88\ ]
)88] ^
)88^ _
{99 
return:: 
dataBaseSportClub:: (
.::( )
Pistas::) /
.::/ 0
Find::0 4
(::4 5
idCourt::5 <
)::< =
;::= >
};; 
}<< 	
internal>> 
static>> 

IPagedList>> "
<>>" #
Pistas>># )
>>>) *
	GetCourts>>+ 4
(>>4 5
int>>5 8
pagina>>9 ?
)>>? @
{?? 	
using@@ 
(@@ $
DataBaseSportClubContext@@ +
dataBaseSportClub@@, =
=@@> ?
new@@@ C$
DataBaseSportClubContext@@D \
(@@\ ]
)@@] ^
)@@^ _
{AA 
returnBB 
dataBaseSportClubBB (
.BB( )
PistasBB) /
.BB/ 0
ToPagedListBB0 ;
(BB; <
paginaBB< B
,BBB C
	ConstantsBBD M
.BBM N
NITEMSPERPAGEBBN [
)BB[ \
;BB\ ]
}CC 
}DD 	
internalFF 
staticFF 
boolFF 
InsertNewCourtFF +
(FF+ ,
PistasFF, 2
courtFF3 8
)FF8 9
{GG 	
usingHH 
(HH $
DataBaseSportClubContextHH +
dataBaseSportClubHH, =
=HH> ?
newHH@ C$
DataBaseSportClubContextHHD \
(HH\ ]
)HH] ^
)HH^ _
{II 
tryJJ 
{KK 
dataBaseSportClubLL %
.LL% &
PistasLL& ,
.LL, -
AddRangeLL- 5
(LL5 6
courtMM 
)NN 
;NN 
returnOO 
dataBaseSportClubOO ,
.OO, -
SaveChangesOO- 8
(OO8 9
)OO9 :
>OO; <
$numOO= >
?OO? @
trueOOA E
:OOF G
falseOOH M
;OOM N
}PP 
catchQQ 
(QQ 
	ExceptionQQ  
exQQ! #
)QQ# $
{RR 
returnTT 
falseTT  
;TT  !
}UU 
}WW 
}XX 	
internalZZ 
staticZZ 
boolZZ 
DeleteMemberZZ )
(ZZ) *
SociosZZ* 0
memberZZ1 7
)ZZ7 8
{[[ 	
using\\ 
(\\ $
DataBaseSportClubContext\\ +
dataBaseSportClub\\, =
=\\> ?
new\\@ C$
DataBaseSportClubContext\\D \
(\\\ ]
)\\] ^
)\\^ _
{]] 
try^^ 
{__ 
dataBaseSportClub`` %
.``% &
Socios``& ,
.``, -
Remove``- 3
(``3 4
memberaa 
)bb 
;bb 
returncc 
dataBaseSportClubcc ,
.cc, -
SaveChangescc- 8
(cc8 9
)cc9 :
>cc; <
$numcc= >
?cc? @
trueccA E
:ccF G
falseccH M
;ccM N
}dd 
catchee 
(ee 
	Exceptionee  
exee! #
)ee# $
{ff 
returnhh 
falsehh  
;hh  !
}ii 
}kk 
}ll 	
internalnn 
staticnn 
boolnn 
DeleteCourtnn (
(nn( )
Pistasnn) /
courtnn0 5
)nn5 6
{oo 	
usingpp 
(pp $
DataBaseSportClubContextpp +
dataBaseSportClubpp, =
=pp> ?
newpp@ C$
DataBaseSportClubContextppD \
(pp\ ]
)pp] ^
)pp^ _
{qq 
tryrr 
{ss 
dataBaseSportClubtt %
.tt% &
Pistastt& ,
.tt, -
Removett- 3
(tt3 4
courtuu 
)vv 
;vv 
returnww 
dataBaseSportClubww ,
.ww, -
SaveChangesww- 8
(ww8 9
)ww9 :
>ww; <
$numww= >
?ww? @
truewwA E
:wwF G
falsewwH M
;wwM N
}xx 
catchyy 
(yy 
	Exceptionyy  
exyy! #
)yy# $
{zz 
return|| 
false||  
;||  !
}}} 
} 
}
�� 	
internal
�� 
static
�� 
bool
�� 
UpdateCourt
�� (
(
��( )
Pistas
��) /
court
��0 5
)
��5 6
{
�� 	
Pistas
�� 
courtToModify
��  
=
��! "
new
��# &
Pistas
��' -
(
��- .
)
��. /
;
��/ 0
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dataBaseSportClub
��, =
=
��> ?
new
��@ C&
DataBaseSportClubContext
��D \
(
��\ ]
)
��] ^
)
��^ _
{
�� 
try
�� 
{
�� 
courtToModify
�� !
=
��" #
dataBaseSportClub
��$ 5
.
��5 6
Pistas
��6 <
.
��< =
Find
��= A
(
��A B
court
��B G
.
��G H
IdCourt
��H O
)
��O P
;
��P Q
courtToModify
�� !
.
��! "
	KindSport
��" +
=
��, -
court
��. 3
.
��3 4
	KindSport
��4 =
;
��= >
return
�� 
dataBaseSportClub
�� ,
.
��, -
SaveChanges
��- 8
(
��8 9
)
��9 :
>
��; <
$num
��= >
?
��? @
true
��A E
:
��F G
false
��H M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �5
yC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Dac\MembersDac.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Dac "
{ 
public		 

class		 

MembersDac		 
{

 
internal 
static 

IPagedList "
<" #
Socios# )
>) *
GetAllMembers+ 8
(8 9
int9 <
pagina= C
)C D
{ 	

IPagedList 
< 
Socios 
> 

allMembers )
;) *
using 
( $
DataBaseSportClubContext +
dataBaseSportClub, =
=> ?
new@ C$
DataBaseSportClubContextD \
(\ ]
)] ^
)^ _
{ 

allMembers 
= 
dataBaseSportClub .
.. /
Socios/ 5
.5 6
ToPagedList6 A
(A B
paginaB H
,H I
	ConstantsJ S
.S T
NITEMSPERPAGET a
)a b
;b c
return 

allMembers !
;! "
} 
} 	
internal 
static 
bool 
CreateMember )
() *
Socios* 0
	newMember1 :
): ;
{ 	
Socios 
memberRegistered #
=$ %
new& )
Socios* 0
(0 1
)1 2
;2 3
using 
( $
DataBaseSportClubContext +
dbSportContext, :
=; <
new= @$
DataBaseSportClubContextA Y
(Y Z
)Z [
)[ \
{ 
try 
{ 
dbSportContext "
." #
Socios# )
.) *
Add* -
(- .
new. 1
Socios2 8
{ 
AddressFloor $
=% &
	newMember' 0
.0 1
AddressFloor1 =
,= >
AddressStreet   %
=  & '
	newMember  ( 1
.  1 2
AddressStreet  2 ?
,  ? @
AdressNumber!! $
=!!% &
	newMember!!' 0
.!!0 1
AdressNumber!!1 =
,!!= >
Email"" 
="" 
	newMember""  )
."") *
Email""* /
,""/ 0
Name## 
=## 
	newMember## (
.##( )
Name##) -
,##- .
FirstSurname$$ $
=$$% &
	newMember$$' 0
.$$0 1
FirstSurname$$1 =
,$$= >
SecondSurname%% %
=%%& '
	newMember%%( 1
.%%1 2
SecondSurname%%2 ?
,%%? @
ZipCode&& 
=&&  !
	newMember&&" +
.&&+ ,
ZipCode&&, 3
,&&3 4
IdentityNumber'' &
=''' (
	newMember'') 2
.''2 3
IdentityNumber''3 A
}(( 
)(( 
;(( 
return)) 
dbSportContext)) )
.))) *
SaveChanges))* 5
())5 6
)))6 7
>))8 9
$num)): ;
?))< =
true))> B
:))C D
false))E J
;))J K
}** 
catch++ 
(++ 
	Exception++  
ex++! #
)++# $
{,, 
return-- 
false--  
;--  !
}// 
}11 
}22 	
internal44 
static44 
bool44 
UpdateMember44 )
(44) *
Socios44* 0
member441 7
)447 8
{55 	
Socios66 
memberToModify66 !
=66" #
new66$ '
Socios66( .
(66. /
)66/ 0
;660 1
using77 
(77 $
DataBaseSportClubContext77 +
dataBaseSportClub77, =
=77> ?
new77@ C$
DataBaseSportClubContext77D \
(77\ ]
)77] ^
)77^ _
{88 
try99 
{:: 
memberToModify;; "
=;;# $
dataBaseSportClub;;% 6
.;;6 7
Socios;;7 =
.;;= >
Find;;> B
(;;B C
member;;C I
.;;I J
IdMember;;J R
);;R S
;;;S T
memberToModify== "
.==" #
AddressFloor==# /
===0 1
member==2 8
.==8 9
AddressFloor==9 E
;==E F
memberToModify>> "
.>>" #
AddressStreet>># 0
=>>1 2
member>>3 9
.>>9 :
AddressStreet>>: G
;>>G H
memberToModify?? "
.??" #
AdressNumber??# /
=??0 1
member??2 8
.??8 9
AdressNumber??9 E
;??E F
memberToModify@@ "
.@@" #
Email@@# (
=@@) *
member@@+ 1
.@@1 2
Email@@2 7
;@@7 8
memberToModifyAA "
.AA" #
NameAA# '
=AA( )
memberAA* 0
.AA0 1
NameAA1 5
;AA5 6
memberToModifyBB "
.BB" #
FirstSurnameBB# /
=BB0 1
memberBB2 8
.BB8 9
FirstSurnameBB9 E
;BBE F
memberToModifyCC "
.CC" #
SecondSurnameCC# 0
=CC1 2
memberCC3 9
.CC9 :
SecondSurnameCC: G
;CCG H
memberToModifyDD "
.DD" #
IdMemberDD# +
=DD, -
memberDD. 4
.DD4 5
IdMemberDD5 =
;DD= >
memberToModifyEE "
.EE" #
ZipCodeEE# *
=EE+ ,
memberEE- 3
.EE3 4
ZipCodeEE4 ;
;EE; <
returnGG 
dataBaseSportClubGG ,
.GG, -
SaveChangesGG- 8
(GG8 9
)GG9 :
>GG; <
$numGG= >
?GG? @
trueGGA E
:GGF G
falseGGH M
;GGM N
}II 
catchJJ 
(JJ 
	ExceptionJJ  
exJJ! #
)JJ# $
{KK 
returnLL 
falseLL  
;LL  !
}MM 
}NN 
}OO 	
internalQQ 
staticQQ 
SociosQQ 
	GetMemberQQ (
(QQ( )
intQQ) ,
idMemberQQ- 5
)QQ5 6
{RR 	
usingSS 
(SS $
DataBaseSportClubContextSS +
dataBaseSportClubSS, =
=SS> ?
newSS@ C$
DataBaseSportClubContextSSD \
(SS\ ]
)SS] ^
)SS^ _
{TT 
returnUU 
dataBaseSportClubUU (
.UU( )
SociosUU) /
.UU/ 0
FindUU0 4
(UU4 5
idMemberUU5 =
)UU= >
;UU> ?
}VV 
}WW 	
}XX 
}YY �p
}C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Dac\ReservationDac.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Dac "
{ 
public		 

class		 
ReservationDac		 
{

 
internal 
static 
List 
< 
Reservas %
>% &
GetReservationsDay' 9
(9 :
DateTime: B
dateReservationC R
)R S
{ 	
List 
< 
Reservas 
> 
reservationsDay *
;* +
using 
( $
DataBaseSportClubContext +
dbSportContext, :
=; <
new= @$
DataBaseSportClubContextA Y
(Y Z
)Z [
)[ \
{ 
reservationsDay 
=  !
dbSportContext" 0
.0 1
Reservas1 9
.9 :
Where 
( 
s 
=> 
s  
.  !
DateReservation! 0
.0 1
Date1 5
==6 8
dateReservation9 H
.H I
DateI M
)M N
. 
ToList 
( 
) 
; 
} 
return 
reservationsDay "
;" #
} 	
internal 
static 
Reservas  
GetReservation! /
(/ 0
int0 3
idReservation4 A
)A B
{ 	
using 
( $
DataBaseSportClubContext +
dbSportContext, :
=; <
new= @$
DataBaseSportClubContextA Y
(Y Z
)Z [
)[ \
{ 
return   
dbSportContext   %
.  % &
Reservas  & .
.  . /
Find  / 3
(  3 4
idReservation  4 A
)  A B
;  B C
}"" 
}## 	
internal%% 
static%% 
List%% 
<%% 
Reservas%% %
>%%% &
listCourtsByMember%%' 9
(%%9 :
int%%: =
idMember%%> F
,%%F G
DateTime%%H P
dateReservation%%Q `
)%%` a
{&& 	
List'' 
<'' 
Reservas'' 
>'' #
courtsReserverdByMember'' 2
=''3 4
new''5 8
List''9 =
<''= >
Reservas''> F
>''F G
(''G H
)''H I
;''I J
using)) 
()) $
DataBaseSportClubContext)) +
dataBaseSportClub)), =
=))> ?
new))@ C$
DataBaseSportClubContext))D \
())\ ]
)))] ^
)))^ _
{** #
courtsReserverdByMember++ '
=++( )
dataBaseSportClub++* ;
.++; <
Reservas++< D
.,, 
Where,, 
(,, 
r,, 
=>,, 
r,,  !
.,,! "
IdMember,," *
==,,+ -
idMember,,. 6
&&,,7 9
r,,: ;
.,,; <
DateReservation,,< K
.,,K L
Date,,L P
==,,Q S
dateReservation,,T c
.,,c d
Date,,d h
),,h i
.-- 
ToList-- 
(-- 
)-- 
;-- 
return.. #
courtsReserverdByMember.. .
;... /
}// 
}00 	
internal33 
static33 
int33  
NumberOfReservations33 0
(330 1
int331 4
idMember335 =
)33= >
{44 	
List55 
<55 
Reservas55 
>55 #
courtsReserverdByMember55 2
=553 4
new555 8
List559 =
<55= >
Reservas55> F
>55F G
(55G H
)55H I
;55I J
using77 
(77 $
DataBaseSportClubContext77 +
dataBaseSportClub77, =
=77> ?
new77@ C$
DataBaseSportClubContext77D \
(77\ ]
)77] ^
)77^ _
{88 #
courtsReserverdByMember99 '
=99( )
dataBaseSportClub99* ;
.99; <
Reservas99< D
.:: 
Where:: 
(:: 
r:: 
=>:: 
r::  !
.::! "
IdMember::" *
==::+ -
idMember::. 6
)::6 7
.;; 
ToList;; 
(;; 
);; 
;;; 
return<< #
courtsReserverdByMember<< .
.<<. /
Count<</ 4
;<<4 5
}== 
}>> 	
internal@@ 
static@@ 
bool@@ .
"HaveMemberOtherReservationSameHour@@ ?
(@@? @
int@@@ C
idMember@@D L
,@@L M
DateTime@@N V
dateReservation@@W f
)@@f g
{AA 	
ListBB 
<BB 
ReservasBB 
>BB #
courtsReserverdByMemberBB 2
=BB3 4
newBB5 8
ListBB9 =
<BB= >
ReservasBB> F
>BBF G
(BBG H
)BBH I
;BBI J
usingDD 
(DD $
DataBaseSportClubContextDD +
dataBaseSportClubDD, =
=DD> ?
newDD@ C$
DataBaseSportClubContextDDD \
(DD\ ]
)DD] ^
)DD^ _
{EE #
courtsReserverdByMemberFF '
=FF( )
dataBaseSportClubFF* ;
.FF; <
ReservasFF< D
.GG 
WhereGG 
(GG 
rGG 
=>GG 
rGG  !
.GG! "
IdMemberGG" *
==GG+ -
idMemberGG. 6
&&GG7 9
rGG: ;
.GG; <
DateReservationGG< K
.GGK L
DateGGL P
==GGQ S
dateReservationGGT c
.GGc d
DateGGd h
)GGh i
.HH 
ToListHH 
(HH 
)HH 
;HH 
returnII #
courtsReserverdByMemberII .
.II. /
CountII/ 4
==II5 7
$numII8 9
?II: ;
falseII< A
:IIB C
trueIID H
;IIH I
}JJ 
}KK 	
internalMM 
staticMM 
ListMM 
<MM 
ReservasMM %
>MM% &"
GetReservationByMemberMM' =
(MM= >
intMM> A
idMemberMMB J
)MMJ K
{NN 	
ListOO 
<OO 
ReservasOO 
>OO #
courtsReserverdByMemberOO 2
=OO3 4
newOO5 8
ListOO9 =
<OO= >
ReservasOO> F
>OOF G
(OOG H
)OOH I
;OOI J
usingQQ 
(QQ $
DataBaseSportClubContextQQ +
dataBaseSportClubQQ, =
=QQ> ?
newQQ@ C$
DataBaseSportClubContextQQD \
(QQ\ ]
)QQ] ^
)QQ^ _
{RR #
courtsReserverdByMemberSS '
=SS( )
dataBaseSportClubSS* ;
.SS; <
ReservasSS< D
.TT 
WhereTT 
(TT 
rTT 
=>TT 
rTT  !
.TT! "
IdMemberTT" *
==TT+ -
idMemberTT. 6
)TT7 8
.UU 
ToListUU 
(UU 
)UU 
;UU 
returnVV #
courtsReserverdByMemberVV .
;VV. /
}WW 
}XX 	
internalZZ 
staticZZ 
ListZZ 
<ZZ 
ReservasZZ &
>ZZ& '$
GetAllReservationsCourtsZZ( @
(ZZ@ A
intZZA D
idCourtZZE L
)ZZL M
{[[ 	
using\\ 
(\\ $
DataBaseSportClubContext\\ +
dbSportContext\\, :
=\\; <
new\\= @$
DataBaseSportClubContext\\A Y
(\\Y Z
)\\Z [
)\\[ \
{]] 
return^^ 
dbSportContext^^ %
.^^% &
Reservas^^& .
.^^. /
Where^^/ 4
(^^4 5
r^^5 6
=>^^7 9
r^^; <
.^^< =
IdCourt^^= D
==^^E G
idCourt^^H O
)^^O P
.^^P Q
ToList^^Q W
(^^W X
)^^X Y
;^^Y Z
}`` 
}aa 	
internalcc 
staticcc 
Listcc 
<cc 
Reservascc %
>cc% &%
getReservationsDayAndHourcc' @
(cc@ A
ReservasccA I
reservasccJ R
)ccR S
{dd 	
Listee 
<ee 
Reservasee 
>ee )
courtsReserverdBySportAndHouree 8
=ee9 :
newee; >
Listee? C
<eeC D
ReservaseeD L
>eeL M
(eeM N
)eeN O
;eeO P
usinggg 
(gg $
DataBaseSportClubContextgg +
dataBaseSportClubgg, =
=gg> ?
newgg@ C$
DataBaseSportClubContextggD \
(gg\ ]
)gg] ^
)gg^ _
{hh )
courtsReserverdBySportAndHourii -
=ii. /
dataBaseSportClubii0 A
.iiA B
ReservasiiB J
.jj 
Wherejj 
(jj 
rjj 
=>jj 
rjj  
.jj  !
DateReservationjj! 0
==jj1 3
reservasjj4 <
.jj< =
DateReservationjj= L
&&jjM O
rjjP Q
.jjQ R
	KindSportjjR [
==jj\ ^
reservasjj_ g
.jjg h
	KindSportjjh q
)jjq r
.kk 
ToListkk 
(kk 
)kk 
;kk 
returnmm )
courtsReserverdBySportAndHourmm 4
;mm4 5
}nn 
}oo 	
internalqq 
staticqq 
boolqq 
DeleteReservationqq .
(qq. /
intqq/ 2
idReservationqq3 @
)qq@ A
{rr 	
Reservasss 
reservationtoDeletess (
=ss) *
newss+ .
Reservasss/ 7
(ss7 8
)ss8 9
;ss9 :
usingtt 
(tt $
DataBaseSportClubContexttt +
dataBaseSportClubtt, =
=tt> ?
newtt@ C$
DataBaseSportClubContextttD \
(tt\ ]
)tt] ^
)tt^ _
{uu 
tryvv 
{ww 
reservationtoDeletexx '
=xx( )
dataBaseSportClubxx* ;
.xx; <
Reservasxx< D
.xxD E
FindxxE I
(xxI J
idReservationxxJ W
)xxW X
;xxX Y
dataBaseSportClubyy %
.yy% &
Reservasyy& .
.yy. /
Removeyy/ 5
(yy5 6
reservationtoDeleteyy6 I
)yyI J
;yyJ K
returnzz 
dataBaseSportClubzz ,
.zz, -
SaveChangeszz- 8
(zz8 9
)zz9 :
>zz; <
$numzz= >
?zz? @
truezzA E
:zzF G
falsezzH M
;zzM N
}|| 
catch}} 
(}} 
	Exception}}  
ex}}! #
)}}# $
{~~ 
return 
false  
;  !
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
UpdateReservation
�� .
(
��. /
Reservas
��/ 7
reservas
��8 @
)
��@ A
{
�� 	
Reservas
�� !
reservationToModify
�� (
=
��) *
new
��+ .
Reservas
��/ 7
(
��7 8
)
��8 9
;
��9 :
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dataBaseSportClub
��, =
=
��> ?
new
��@ C&
DataBaseSportClubContext
��D \
(
��\ ]
)
��] ^
)
��^ _
{
�� 
try
�� 
{
�� !
reservationToModify
�� '
=
��( )
dataBaseSportClub
��* ;
.
��; <
Reservas
��< D
.
��D E
Find
��E I
(
��I J
reservas
��J R
.
��R S
IdReservation
��S `
)
��` a
;
��a b!
reservationToModify
�� '
.
��' (
IdCourt
��( /
=
��0 1
reservas
��2 :
.
��: ;
IdCourt
��; B
;
��B C!
reservationToModify
�� '
.
��' (
	KindSport
��( 1
=
��2 3
reservas
��4 <
.
��< =
	KindSport
��= F
;
��F G!
reservationToModify
�� '
.
��' (
DateReservation
��( 7
=
��8 9
reservas
��: B
.
��B C
DateReservation
��C R
;
��R S
return
�� 
dataBaseSportClub
�� ,
.
��, -
SaveChanges
��- 8
(
��8 9
)
��9 :
>
��; <
$num
��= >
?
��? @
true
��A E
:
��F G
false
��H M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
ReserveCourt
�� )
(
��) *
Reservas
��* 2
reservas
��3 ;
)
��; <
{
�� 	
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dataBaseSportClub
��, =
=
��> ?
new
��@ C&
DataBaseSportClubContext
��D \
(
��\ ]
)
��] ^
)
��^ _
{
�� 
try
�� 
{
�� 
dataBaseSportClub
�� %
.
��% &
Reservas
��& .
.
��. /
Add
��/ 2
(
��2 3
reservas
�� 
)
�� 
;
�� 
return
�� 
dataBaseSportClub
�� ,
.
��, -
SaveChanges
��- 8
(
��8 9
)
��9 :
>
��; <
$num
��= >
?
��? @
true
��A E
:
��F G
false
��H M
;
��M N
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
return
�� 
false
��  
;
��  !
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �.
xC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Dac\SportsDac.cs
	namespace		 	 
PruebaNitnetsIgnacio		
 
.		 
Dac		 "
{

 
public 

class 
	SportsDac 
{ 
internal 
static 

IPagedList "
<" #
Deportes# +
>+ ,
GetAllSports- 9
(9 :
int: =
pagina> D
)D E
{ 	
using 
( $
DataBaseSportClubContext +
dataBaseSportClub, =
=> ?
new@ C$
DataBaseSportClubContextD \
(\ ]
)] ^
)^ _
{ 
return 
dataBaseSportClub (
.( )
Deportes) 1
.1 2
ToPagedList2 =
(= >
pagina> D
,D E
	Constants> G
.G H
NITEMSPERPAGEH U
)U V
;V W
} 
} 	
internal 
static 
Deportes  
getOneSports! -
(- .
string. 4
	kindSport5 >
)> ?
{ 	
Deportes 
sport 
= 
new  
Deportes! )
() *
)* +
;+ ,
using 
( $
DataBaseSportClubContext +
dataBaseSportClub, =
=> ?
new@ C$
DataBaseSportClubContextD \
(\ ]
)] ^
)^ _
{ 
sport 
= 
dataBaseSportClub )
.) *
Deportes* 2
.2 3
Find3 7
(7 8
	kindSport8 A
)A B
;B C
return 
sport 
; 
} 
} 	
internal   
static   
bool   
DeleteSport   (
(  ( )
string  ) /
	kindSport  0 9
)  9 :
{!! 	
Deportes"" 
sportToDelete"" "
=""# $
new""% (
Deportes"") 1
(""1 2
)""2 3
;""3 4
try## 
{$$ 
using%% 
(%% $
DataBaseSportClubContext%% /
dbSportContext%%0 >
=%%? @
new%%A D$
DataBaseSportClubContext%%E ]
(%%] ^
)%%^ _
)%%_ `
{&& 
sportToDelete'' !
=''" #
dbSportContext''$ 2
.''2 3
Deportes''3 ;
.''; <
Find''< @
(''@ A
	kindSport''A J
)''J K
;''K L
dbSportContext(( "
.((" #
Remove((# )
((() *
sportToDelete((* 7
)((7 8
;((8 9
return** 
dbSportContext** )
.**) *
SaveChanges*** 5
(**5 6
)**6 7
>**8 9
$num**: ;
?**< =
true**> B
:**C D
false**E J
;**J K
}++ 
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)--  
{.. 
return// 
false// 
;// 
}00 
}22 	
internal44 
static44 
bool44 
UpdateSport44 (
(44( )
Deportes44) 1
updateSport442 =
)44= >
{55 	
Deportes66 
sport66 
=66 
new66  
Deportes66! )
(66) *
)66* +
;66+ ,
try88 
{99 
using:: 
(:: $
DataBaseSportClubContext:: /
dataBaseSportClub::0 A
=::B C
new::D G$
DataBaseSportClubContext::H `
(::` a
)::a b
)::b c
{;; 
sport<< 
=<< 
dataBaseSportClub<< -
.<<- .
Deportes<<. 6
.<<6 7
Find<<7 ;
(<<; <
updateSport<<< G
.<<G H
	KindSport<<H Q
)<<Q R
;<<R S
sport== 
.== 
	DescSport== #
===$ %
updateSport==& 1
.==1 2
	DescSport==2 ;
;==; <
return>> 
dataBaseSportClub>> ,
.>>, -
SaveChanges>>- 8
(>>8 9
)>>9 :
>>>; <
$num>>= >
?>>? @
true>>A E
:>>F G
false>>H M
;>>M N
}?? 
}@@ 
catchAA 
(AA 
	ExceptionAA 
)AA 
{BB 
returnDD 
falseDD 
;DD 
}EE 
}GG 	
internalII 
staticII 
boolII 
InsertNewSportsII ,
(II, -
DeportesII- 5
newSportII6 >
)II> ?
{JJ 	
DeportesKK 
sportKK 
=KK 
newKK  
DeportesKK! )
(KK) *
)KK* +
;KK+ ,
tryMM 
{NN 
usingOO 
(OO $
DataBaseSportClubContextOO /
dataBaseSportClubOO0 A
=OOB C
newOOD G$
DataBaseSportClubContextOOH `
(OO` a
)OOa b
)OOb c
{PP 
dataBaseSportClubQQ %
.QQ% &
DeportesQQ& .
.QQ. /
AddQQ/ 2
(QQ2 3
newSportQQ3 ;
)QQ; <
;QQ< =
returnRR 
dataBaseSportClubRR ,
.RR, -
SaveChangesRR- 8
(RR8 9
)RR9 :
>RR; <
$numRR= >
?RR? @
trueRRA E
:RRF G
falseRRH M
;RRM N
}SS 
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
returnXX 
falseXX 
;XX 
}YY 
}[[ 	
}\\ 
}^^ �b
vC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Dac\UserDac.cs
	namespace		 	 
PruebaNitnetsIgnacio		
 
.		 
Dac		 "
{

 
public 

class 
UserDac 
{ 
internal 
static 
Usuarios  

CreateUser! +
(+ ,
Usuarios, 4
userToRegister5 C
)C D
{ 	
Usuarios 
userRegistered #
=$ %
new& )
Usuarios* 2
(2 3
)3 4
;4 5
using 
( $
DataBaseSportClubContext +
dbSportContext, :
=; <
new= @$
DataBaseSportClubContextA Y
(Y Z
)Z [
)[ \
{ 
dbSportContext 
. 
Usuarios '
.' (
Add( +
(+ ,
new, /
Usuarios0 8
{ 
Dni 
= 
userToRegister (
.( )
Dni) ,
,, -
Email 
= 
userToRegister *
.* +
Email+ 0
,0 1
Login 
= 
userToRegister *
.* +
Login+ 0
,0 1
Password 
= 
userToRegister -
.- .
Password. 6
,6 7
Name 
= 
userToRegister )
.) *
Name* .
} 
) 
; 
if 
( 
dbSportContext "
." #
SaveChanges# .
(. /
)/ 0
>1 2
$num3 4
)4 5
{ 
return 
userToRegister )
;) *
} 
else   
{!! 
return"" 
null"" 
;""  
}## 
}$$ 
}%% 	
internal'' 
static'' 
Usuarios''  
ReadUser''! )
('') *
Usuarios''* 2
user''3 7
)''7 8
{(( 	
Usuarios)) 
	userLogin)) 
=))  
new))! $
Usuarios))% -
())- .
))). /
;))/ 0
try** 
{++ 
using,, 
(,, $
DataBaseSportClubContext,, /
dbSportContext,,0 >
=,,? @
new,,A D$
DataBaseSportClubContext,,E ]
(,,] ^
),,^ _
),,_ `
{-- 
	userLogin.. 
=.. 
dbSportContext..  .
.... /
Usuarios../ 7
...7 8
Where..8 =
(..= >
s..> ?
=>..@ B
s..C D
...D E
Login..E J
==..K M
user..N R
...R S
Login..S X
&&..Y [
s..\ ]
...] ^
Password..^ f
==..g i
user..j n
...n o
Password..o w
)..w x
...x y
FirstOrDefault	..y �
(
..� �
)
..� �
;
..� �
}// 
return11 
	userLogin11  
;11  !
}22 
catch33 
(33 
DbException33 
ex33 !
)33! "
{44 
return66 
null66 
;66 
}77 
}99 	
internal;; 
static;; 

IPagedList;; "
<;;" #
Usuarios;;# +
>;;+ ,
GetAllUsers;;- 8
(;;8 9
int;;9 <
pagina;;= C
);;C D
{<< 	
try== 
{>> 
using?? 
(?? $
DataBaseSportClubContext?? /
dbSportContext??0 >
=??? @
new??A D$
DataBaseSportClubContext??E ]
(??] ^
)??^ _
)??_ `
{@@ 
returnAA 
dbSportContextAA )
.AA) *
UsuariosAA* 2
.AA2 3
ToPagedListAA3 >
(AA> ?
paginaAA? E
,AAE F
	ConstantsBB> G
.BBG H
NITEMSPERPAGEBBH U
)BBU V
;BBV W
}CC 
}EE 
catchFF 
(FF 
DbExceptionFF 
exFF !
)FF! "
{GG 
returnII 
nullII 
;II 
}JJ 
}LL 	
internalNN 
staticNN 
boolNN 

UpdateUserNN '
(NN' (
UsuariosNN( 0
userNN1 5
)NN5 6
{OO 	
UsuariosPP 
	userLoginPP 
=PP  
newPP! $
UsuariosPP% -
(PP- .
)PP. /
;PP/ 0
tryQQ 
{RR 
usingSS 
(SS $
DataBaseSportClubContextSS /
dbSportContextSS0 >
=SS? @
newSSA D$
DataBaseSportClubContextSSE ]
(SS] ^
)SS^ _
)SS_ `
{TT 
	userLoginUU 
=UU 
dbSportContextUU  .
.UU. /
UsuariosUU/ 7
.UU7 8
FindUU8 <
(UU< =
userUU= A
.UUA B
LoginUUB G
)UUG H
;UUH I
ifVV 
(VV 
	userLoginVV !
!=VV" $
nullVV% )
)VV) *
{WW 
	userLoginXX !
.XX! "
DniXX" %
=XX& '
userXX( ,
.XX, -
DniXX- 0
!=XX1 3
nullXX4 8
?XX9 :
userXX; ?
.XX? @
DniXX@ C
:XXD E
	userLoginXXF O
.XXO P
DniXXP S
;XXS T
	userLoginYY !
.YY! "
EmailYY" '
=YY( )
userYY* .
.YY. /
EmailYY/ 4
!=YY5 7
nullYY8 <
?YY= >
userYY? C
.YYC D
EmailYYD I
:YYJ K
	userLoginYYL U
.YYU V
EmailYYV [
;YY[ \
	userLoginZZ !
.ZZ! "
NameZZ" &
=ZZ' (
userZZ) -
.ZZ- .
NameZZ. 2
!=ZZ3 5
nullZZ6 :
?ZZ; <
userZZ= A
.ZZA B
NameZZB F
:ZZG H
	userLoginZZI R
.ZZR S
NameZZS W
;ZZW X
	userLogin[[ !
.[[! "
Password[[" *
=[[+ ,
user[[- 1
.[[1 2
Password[[2 :
!=[[; =
null[[> B
?[[C D
user[[E I
.[[I J
Password[[J R
:[[S T
	userLogin[[U ^
.[[^ _
Password[[_ g
;[[g h
return^^ 
dbSportContext^^ -
.^^- .
SaveChanges^^. 9
(^^9 :
)^^: ;
>^^< =
$num^^> ?
?^^@ A
true^^B F
:^^G H
false^^I N
;^^N O
}__ 
else`` 
{aa 
returnbb 
falsebb $
;bb$ %
}cc 
}ff 
}gg 
catchhh 
(hh 
DbExceptionhh 
exhh !
)hh! "
{ii 
returnkk 
falsekk 
;kk 
}ll 
}nn 	
internalpp 
staticpp 
boolpp 

DeleteUserpp '
(pp' (
Usuariospp( 0
userpp1 5
)pp5 6
{qq 	
Usuariosrr 
	userLoginrr 
=rr  
newrr! $
Usuariosrr% -
(rr- .
)rr. /
;rr/ 0
tryss 
{tt 
usinguu 
(uu $
DataBaseSportClubContextuu /
dbSportContextuu0 >
=uu? @
newuuA D$
DataBaseSportClubContextuuE ]
(uu] ^
)uu^ _
)uu_ `
{vv 
	userLoginww 
=ww 
dbSportContextww  .
.ww. /
Usuariosww/ 7
.ww7 8
Findww8 <
(ww< =
userww= A
.wwA B
LoginwwB G
)wwG H
;wwH I
dbSportContextxx "
.xx" #
Removexx# )
(xx) *
	userLoginxx* 3
)xx3 4
;xx4 5
returnzz 
dbSportContextzz )
.zz) *
SaveChangeszz* 5
(zz5 6
)zz6 7
>zz8 9
$numzz: ;
?zz< =
truezz> B
:zzC D
falsezzE J
;zzJ K
}{{ 
}|| 
catch}} 
(}} 
DbException}} 
ex}} !
)}}! "
{~~ 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
ExistUserLogin
�� +
(
��+ ,
string
��, 2
login
��3 8
)
��8 9
{
�� 	
Usuarios
�� 
user
�� 
=
�� 
new
�� 
Usuarios
��  (
(
��( )
)
��) *
;
��* +
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dbSportContext
��, :
=
��; <
new
��= @&
DataBaseSportClubContext
��A Y
(
��Y Z
)
��Z [
)
��[ \
{
�� 
user
�� 
=
�� 
dbSportContext
�� %
.
��% &
Usuarios
��& .
.
��. /
Where
��/ 4
(
��4 5
s
��5 6
=>
��7 9
s
��: ;
.
��; <
Login
��< A
==
��B D
login
��E J
)
��J K
.
��K L
FirstOrDefault
��L Z
(
��Z [
)
��[ \
;
��\ ]
}
�� 
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
ExistUserEmail
�� +
(
��+ ,
string
��, 2
email
��3 8
)
��8 9
{
�� 	
Usuarios
�� 
user
�� 
=
�� 
new
�� 
Usuarios
��  (
(
��( )
)
��) *
;
��* +
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dbSportContext
��, :
=
��; <
new
��= @&
DataBaseSportClubContext
��A Y
(
��Y Z
)
��Z [
)
��[ \
{
�� 
user
�� 
=
�� 
dbSportContext
�� %
.
��% &
Usuarios
��& .
.
��. /
Where
��/ 4
(
��4 5
s
��5 6
=>
��7 9
s
��: ;
.
��; <
Email
��< A
==
��B D
email
��E J
)
��J K
.
��K L
FirstOrDefault
��L Z
(
��Z [
)
��[ \
;
��\ ]
}
�� 
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
static
�� 
bool
�� 
ExistUserDni
�� )
(
��) *
string
��* 0
dni
��1 4
)
��4 5
{
�� 	
Usuarios
�� 
user
�� 
=
�� 
new
�� 
Usuarios
��  (
(
��( )
)
��) *
;
��* +
using
�� 
(
�� &
DataBaseSportClubContext
�� +
dbSportContext
��, :
=
��; <
new
��= @&
DataBaseSportClubContext
��A Y
(
��Y Z
)
��Z [
)
��[ \
{
�� 
user
�� 
=
�� 
dbSportContext
�� %
.
��% &
Usuarios
��& .
.
��. /
Where
��/ 4
(
��4 5
s
��5 6
=>
��7 9
s
��: ;
.
��; <
Dni
��< ?
==
��@ B
dni
��C F
)
��F G
.
��G H
FirstOrDefault
��H V
(
��V W
)
��W X
;
��X Y
}
�� 
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �
{C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Constants.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

class 
	Constants 
{		 
public

 
const

 
int

 
MINHOUR

  
=

! "
$num

# $
;

$ %
public 
const 
int 
MAXHOUR  
=! "
$num# %
;% &
public 
const 
int 
NITEMSPERPAGE &
=' (
$num) *
;* +
} 
} ��
�C:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\DataBaseSportClubContext.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class $
DataBaseSportClubContext 1
:2 3
	DbContext4 =
{ 
public		 $
DataBaseSportClubContext		 '
(		' (
)		( )
{

 	
} 	
public $
DataBaseSportClubContext '
(' (
DbContextOptions( 8
<8 9$
DataBaseSportClubContext9 Q
>Q R
optionsS Z
)Z [
: 
base 
( 
options 
) 
{ 	
} 	
public 
virtual 
DbSet 
< 
Deportes %
>% &
Deportes' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DbSet 
< 
Pistas #
># $
Pistas% +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
DbSet 
< 
Reservas %
>% &
Reservas' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DbSet 
< 
Socios #
># $
Socios% +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
DbSet 
< 
Usuarios %
>% &
Usuarios' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{ 	
if 
( 
! 
optionsBuilder 
.  
IsConfigured  ,
), -
{ 
optionsBuilder 
. 
UseSqlServer +
(+ ,
$str	, �
)
� �
;
� �
} 
} 	
	protected!! 
override!! 
void!! 
OnModelCreating!!  /
(!!/ 0
ModelBuilder!!0 <
modelBuilder!!= I
)!!I J
{"" 	
modelBuilder## 
.## 
Entity## 
<##  
Deportes##  (
>##( )
(##) *
entity##* 0
=>##1 3
{$$ 
entity%% 
.%% 
HasKey%% 
(%% 
e%% 
=>%%  "
e%%# $
.%%$ %
	KindSport%%% .
)%%. /
.&& 
HasName&& 
(&& 
$str&& =
)&&= >
;&&> ?
entity(( 
.(( 
Property(( 
(((  
e((  !
=>((" $
e((% &
.((& '
	KindSport((' 0
)((0 1
.)) 
HasMaxLength)) !
())! "
$num))" $
)))$ %
.** 
	IsUnicode** 
(** 
false** $
)**$ %
;**% &
entity,, 
.,, 
Property,, 
(,,  
e,,  !
=>,," $
e,,% &
.,,& '
	DescSport,,' 0
),,0 1
.-- 
HasMaxLength-- !
(--! "
$num--" %
)--% &
... 
	IsUnicode.. 
(.. 
false.. $
)..$ %
;..% &
}// 
)// 
;// 
modelBuilder11 
.11 
Entity11 
<11  
Pistas11  &
>11& '
(11' (
entity11( .
=>11/ 1
{22 
entity33 
.33 
HasKey33 
(33 
e33 
=>33  "
e33# $
.33$ %
IdCourt33% ,
)33, -
.44 
HasName44 
(44 
$str44 =
)44= >
;44> ?
entity66 
.66 
Property66 
(66  
e66  !
=>66" $
e66% &
.66& '
	KindSport66' 0
)660 1
.77 

IsRequired77 
(77  
)77  !
.88 
HasMaxLength88 !
(88! "
$num88" $
)88$ %
.99 
	IsUnicode99 
(99 
false99 $
)99$ %
;99% &
entity;; 
.;; 
HasOne;; 
(;; 
d;; 
=>;;  "
d;;# $
.;;$ %
KindSportNavigation;;% 8
);;8 9
.<< 
WithMany<< 
(<< 
p<< 
=><<  "
p<<# $
.<<$ %
Pistas<<% +
)<<+ ,
.== 
HasForeignKey== "
(==" #
d==# $
=>==% '
d==( )
.==) *
	KindSport==* 3
)==3 4
.>> 
OnDelete>> 
(>> 
DeleteBehavior>> ,
.>>, -
ClientSetNull>>- :
)>>: ;
.?? 
HasConstraintName?? &
(??& '
$str??' =
)??= >
;??> ?
}@@ 
)@@ 
;@@ 
modelBuilderBB 
.BB 
EntityBB 
<BB  
ReservasBB  (
>BB( )
(BB) *
entityBB* 0
=>BB1 3
{CC 
entityDD 
.DD 
HasKeyDD 
(DD 
eDD 
=>DD  "
eDD# $
.DD$ %
IdReservationDD% 2
)DD2 3
.EE 
HasNameEE 
(EE 
$strEE =
)EE= >
;EE> ?
entityGG 
.GG 
PropertyGG 
(GG  
eGG  !
=>GG" $
eGG% &
.GG& '
DateReservationGG' 6
)GG6 7
.GG7 8
HasColumnTypeGG8 E
(GGE F
$strGGF P
)GGP Q
;GGQ R
entityII 
.II 
PropertyII 
(II  
eII  !
=>II" $
eII% &
.II& '
IdCourtII' .
)II. /
.II/ 0
HasColumnNameII0 =
(II= >
$strII> G
)IIG H
;IIH I
entityKK 
.KK 
PropertyKK 
(KK  
eKK  !
=>KK" $
eKK% &
.KK& '
	KindSportKK' 0
)KK0 1
.LL 

IsRequiredLL 
(LL  
)LL  !
.MM 
HasMaxLengthMM !
(MM! "
$numMM" $
)MM$ %
.NN 
	IsUnicodeNN 
(NN 
falseNN $
)NN$ %
;NN% &
entityPP 
.PP 
HasOnePP 
(PP 
dPP 
=>PP  "
dPP# $
.PP$ %
IdCourtNavigationPP% 6
)PP6 7
.QQ 
WithManyQQ 
(QQ 
pQQ 
=>QQ  "
pQQ# $
.QQ$ %
ReservasQQ% -
)QQ- .
.RR 
HasForeignKeyRR "
(RR" #
dRR# $
=>RR% '
dRR( )
.RR) *
IdCourtRR* 1
)RR1 2
.SS 
OnDeleteSS 
(SS 
DeleteBehaviorSS ,
.SS, -
ClientSetNullSS- :
)SS: ;
.TT 
HasConstraintNameTT &
(TT& '
$strTT' ;
)TT; <
;TT< =
entityVV 
.VV 
HasOneVV 
(VV 
dVV 
=>VV  "
dVV# $
.VV$ %
IdMemberNavigationVV% 7
)VV7 8
.WW 
WithManyWW 
(WW 
pWW 
=>WW  "
pWW# $
.WW$ %
ReservasWW% -
)WW- .
.XX 
HasForeignKeyXX "
(XX" #
dXX# $
=>XX% '
dXX( )
.XX) *
IdMemberXX* 2
)XX2 3
.YY 
OnDeleteYY 
(YY 
DeleteBehaviorYY ,
.YY, -
ClientSetNullYY- :
)YY: ;
.ZZ 
HasConstraintNameZZ &
(ZZ& '
$strZZ' =
)ZZ= >
;ZZ> ?
entity\\ 
.\\ 
HasOne\\ 
(\\ 
d\\ 
=>\\  "
d\\# $
.\\$ %
KindSportNavigation\\% 8
)\\8 9
.]] 
WithMany]] 
(]] 
p]] 
=>]]  "
p]]# $
.]]$ %
Reservas]]% -
)]]- .
.^^ 
HasForeignKey^^ "
(^^" #
d^^# $
=>^^% '
d^^( )
.^^) *
	KindSport^^* 3
)^^3 4
.__ 
OnDelete__ 
(__ 
DeleteBehavior__ ,
.__, -
ClientSetNull__- :
)__: ;
.`` 
HasConstraintName`` &
(``& '
$str``' ?
)``? @
;``@ A
}aa 
)aa 
;aa 
modelBuildercc 
.cc 
Entitycc 
<cc  
Socioscc  &
>cc& '
(cc' (
entitycc( .
=>cc/ 1
{dd 
entityee 
.ee 
HasKeyee 
(ee 
eee 
=>ee  "
eee# $
.ee$ %
IdMemberee% -
)ee- .
.ff 
HasNameff 
(ff 
$strff =
)ff= >
;ff> ?
entityhh 
.hh 
Propertyhh 
(hh  
ehh  !
=>hh" $
ehh% &
.hh& '
AddressStreethh' 4
)hh4 5
.ii 

IsRequiredii 
(ii  
)ii  !
.jj 
HasMaxLengthjj !
(jj! "
$numjj" $
)jj$ %
.kk 
	IsUnicodekk 
(kk 
falsekk $
)kk$ %
;kk% &
entitymm 
.mm 
Propertymm 
(mm  
emm  !
=>mm" $
emm% &
.mm& '
AdressNumbermm' 3
)mm3 4
.nn 

IsRequirednn 
(nn  
)nn  !
.oo 
HasMaxLengthoo !
(oo! "
$numoo" $
)oo$ %
.pp 
	IsUnicodepp 
(pp 
falsepp $
)pp$ %
;pp% &
entityrr 
.rr 
Propertyrr 
(rr  
err  !
=>rr" $
err% &
.rr& '
Emailrr' ,
)rr, -
.ss 

IsRequiredss 
(ss  
)ss  !
.tt 
HasMaxLengthtt !
(tt! "
$numtt" %
)tt% &
.uu 
	IsUnicodeuu 
(uu 
falseuu $
)uu$ %
;uu% &
entityww 
.ww 
Propertyww 
(ww  
eww  !
=>ww" $
eww% &
.ww& '
FirstSurnameww' 3
)ww3 4
.xx 

IsRequiredxx 
(xx  
)xx  !
.yy 
HasMaxLengthyy !
(yy! "
$numyy" $
)yy$ %
.zz 
	IsUnicodezz 
(zz 
falsezz $
)zz$ %
;zz% &
entity|| 
.|| 
Property|| 
(||  
e||  !
=>||" $
e||% &
.||& '
IdentityNumber||' 5
)||5 6
.}} 

IsRequired}} 
(}}  
)}}  !
.~~ 
HasMaxLength~~ !
(~~! "
$num~~" $
)~~$ %
. 
	IsUnicode 
( 
false $
)$ %
;% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Name
��' +
)
��+ ,
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
SecondSurname
��' 4
)
��4 5
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
ZipCode
��' .
)
��. /
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
Usuarios
��  (
>
��( )
(
��) *
entity
��* 0
=>
��1 3
{
�� 
entity
�� 
.
�� 
HasKey
�� 
(
�� 
e
�� 
=>
��  "
e
��# $
.
��$ %
Login
��% *
)
��* +
.
�� 
HasName
�� 
(
�� 
$str
�� =
)
��= >
;
��> ?
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Login
��' ,
)
��, -
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Dni
��' *
)
��* +
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Email
��' ,
)
��, -
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Name
��' +
)
��+ ,
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Password
��' /
)
��/ 0
.
�� 

IsRequired
�� 
(
��  
)
��  !
.
�� 
HasMaxLength
�� !
(
��! "
$num
��" $
)
��$ %
.
�� 
	IsUnicode
�� 
(
�� 
false
�� $
)
��$ %
;
��% &
}
�� 
)
�� 
;
�� $
OnModelCreatingPartial
�� "
(
��" #
modelBuilder
��# /
)
��/ 0
;
��0 1
}
�� 	
partial
�� 
void
�� $
OnModelCreatingPartial
�� +
(
��+ ,
ModelBuilder
��, 8
modelBuilder
��9 E
)
��E F
;
��F G
}
�� 
}�� �
zC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Deportes.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class 
Deportes !
{ 
public 
Deportes 
( 
) 
{		 	
Pistas

 
=

 
new

 
HashSet

  
<

  !
Pistas

! '
>

' (
(

( )
)

) *
;

* +
Reservas 
= 
new 
HashSet "
<" #
Reservas# +
>+ ,
(, -
)- .
;. /
} 	
public 
string 
	KindSport 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	DescSport 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 
ICollection "
<" #
Pistas# )
>) *
Pistas+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
virtual 
ICollection "
<" #
Reservas# +
>+ ,
Reservas- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} �

xC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Pistas.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class 
Pistas 
{ 
public 
Pistas 
( 
) 
{		 	
Reservas

 
=

 
new

 
HashSet

 "
<

" #
Reservas

# +
>

+ ,
(

, -
)

- .
;

. /
} 	
public 
int 
IdCourt 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	KindSport 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 
Deportes 
KindSportNavigation  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
ICollection "
<" #
Reservas# +
>+ ,
Reservas- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} �
zC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Reservas.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class 
Reservas !
{ 
public 
int 
IdReservation  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
int		 
IdCourt		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
int

 
IdMember

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
DateTime 
DateReservation '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
	KindSport 
{  !
get" %
;% &
set' *
;* +
}, -
public 
virtual 
Pistas 
IdCourtNavigation /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
Socios 
IdMemberNavigation 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
virtual 
Deportes 
KindSportNavigation  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} �
xC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Socios.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class 
Socios 
{ 
public 
Socios 
( 
) 
{		 	
Reservas

 
=

 
new

 
HashSet

 "
<

" #
Reservas

# +
>

+ ,
(

, -
)

- .
;

. /
} 	
public 
int 
IdMember 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
FirstSurname "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
SecondSurname #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
IdentityNumber $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
AddressStreet #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
AdressNumber "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
AddressFloor  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
ICollection "
<" #
Reservas# +
>+ ,
Reservas- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} �
zC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Models\Usuarios.cs
	namespace 	 
PruebaNitnetsIgnacio
 
. 
Models %
{ 
public 

partial 
class 
Usuarios !
{ 
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Dni 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �

rC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Program.cs
	namespace

 	 
PruebaNitnetsIgnacio


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} �#
rC:\Users\ialberol\Desktop\NV\2.0\PruebaNitnetsIgnacio\3.0\4.0\PruebaNitnetsIgnacio\PruebaNitnetsIgnacio\Startup.cs
	namespace 	 
PruebaNitnetsIgnacio
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public   
void   
ConfigureServices   %
(  % &
IServiceCollection  & 8
services  9 A
)  A B
{!! 	
services"" 
."" 
AddOpenApiDocument"" '
(""' (
)""( )
;"") *
services$$ 
.$$ 
AddAuthentication$$ &
($$& '
JwtBearerDefaults$$' 8
.$$8 9 
AuthenticationScheme$$9 M
)$$M N
.%% 
AddJwtBearer%% 
(%% 
options%% %
=>%%& (
{&& 
options'' 
.'' %
TokenValidationParameters'' 5
=''6 7
new''8 ;%
TokenValidationParameters''< U
(''U V
)''V W
{(( 
ValidateIssuer)) &
=))' (
true))) -
,))- .
ValidateAudience** (
=**) *
true**+ /
,**/ 0
ValidateLifetime++ (
=++) *
true+++ /
,++/ 0$
ValidateIssuerSigningKey,, 0
=,,1 2
true,,3 7
,,,7 8
ValidIssuer-- #
=--$ %
Configuration--& 3
[--3 4
$str--4 @
]--@ A
,--A B
ValidAudience.. %
=..& '
Configuration..( 5
[..5 6
$str..6 D
]..D E
,..E F
IssuerSigningKey// (
=//) *
new//+ . 
SymmetricSecurityKey/// C
(//C D
Encoding00 $
.00$ %
UTF800% )
.00) *
GetBytes00* 2
(002 3
Configuration003 @
[00@ A
$str00A P
]00P Q
)00Q R
)11 
}22 
;22 
}33 
)33 
;33 
services55 
.55 
AddMvc55 
(55 
)55 
.55 #
SetCompatibilityVersion55 5
(555 6 
CompatibilityVersion556 J
.55J K
Version_3_055K V
)55V W
;55W X
services77 
.77 
AddDbContext77 !
<77! "$
DataBaseSportClubContext77" :
>77: ;
(77; <
options77< C
=>77D F
options88 
.88 
UseSqlServer88 (
(88( )
Configuration88) 6
.886 7
GetConnectionString887 J
(88J K
$str88K e
)88e f
)88f g
)88g h
;88h i
}:: 	
public== 
void== 
	Configure== 
(== 
IApplicationBuilder== 1
app==2 5
,==5 6
IWebHostEnvironment==7 J
env==K N
)==N O
{>> 	
if?? 
(?? 
env?? 
.?? 
IsDevelopment?? !
(??! "
)??" #
)??# $
{@@ 
appAA 
.AA %
UseDeveloperExceptionPageAA -
(AA- .
)AA. /
;AA/ 0
}BB 
appDD 
.DD 
UseHttpsRedirectionDD #
(DD# $
)DD$ %
;DD% &
appFF 
.FF 
UseAuthenticationFF !
(FF! "
)FF" #
;FF# $
appHH 
.HH 

UseRoutingHH 
(HH 
)HH 
;HH 
appJJ 
.JJ 
UseAuthorizationJJ  
(JJ  !
)JJ! "
;JJ" #
appLL 
.LL 
UseEndpointsLL 
(LL 
	endpointsLL &
=>LL' )
{MM 
	endpointsNN 
.NN 
MapControllersNN (
(NN( )
)NN) *
;NN* +
}OO 
)OO 
;OO 
appQQ 
.QQ 

UseOpenApiQQ 
(QQ 
)QQ 
;QQ 
appRR 
.RR 
UseSwaggerUi3RR 
(RR 
)RR 
;RR  
}SS 	
}TT 
}UU 