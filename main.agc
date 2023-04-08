
// Project: Highway Idiot!

SetErrorMode(2)

SetWindowTitle( "Highway Idiot!" )
SetWindowSize( 1050, 715, 0 )
SetWindowAllowResize( 0 ) 

SetDisplayAspect ( 4.0 / 3.0 )
SetVirtualResolution( 1050, 715 ) 
SetOrientationAllowed( 1, 1, 1, 1 ) 
SetSyncRate( 60, 0 )  

menu:
do
	if menu = 0
		   musica = LoadSound("Powerup.wav")
		   PlaySound ( musica, 35,1 )
		   font = LoadFont("29Makina.ttf")

		    SetDefaultWrapU(1)
		    SetVSync(1)
			backG = CreateSprite(LoadImage("Pista.png"))
			setspritesize(backG, 1050,715)
			verIN = CreateSprite(LoadImage("Ver inv.png"))
			SetSpriteSize(verIN, 180, -1)
			SetSpritePosition(verIN, 50, 240)
		
				//Area de texto
				MenuP = CreateSprite(LoadImage("titulo.png"))
				SetSpritePosition(MenuP,340,50)
				SetSpriteVisible(MenuP,1)
				SetSpriteDepth(MenuP,1)
		
				sText = CreateText("Start")
				eText = CreateText("Exit")
				controles = CreateText("Controles WASD")
		
				SetTextPosition(sText,450,285)
				SetTextPosition(eText,450,330)
				SetTextPosition(controles, 0, 585)
				SetTextSize(controles, 55)
		
				SetTextFont(sText, font)
				SetTextFont(eText, font)
				SetTextFont(controles, font)
		
			menu = 1
		
	endif
	
		xscroll# = xscroll#+.01
		SetSpriteUVOffset(backG, xscroll#,0)
		
	if GetTextHitTest(sText,GetPointerX(),GetPointerY())
		SetTextSize(sText,55)
		if GetPointerPressed() = 1
			SetSpriteVisible(MenuP,0)
			SetTextPosition(sText,-1500,-1500)
			SetTextPosition(eText,-1500,-1500)
			DeleteSound(musica)
			SetTextPosition(controles, -1500, -1500)
			gosub main
		endif
		else
			SetTextSize(sText,50)		
	endif
	if GetTextExists(eText)
		if GetTextHitTest(eText,GetPointerX(),GetPointerY())
			SetTextSize(eText,55)	
			if GetPointerPressed() = 1
				end
			endif
			else
			SetTextSize(eText,50)
		endif
	endif
	Sync()
loop

main:
//Area de telas
SetDefaultWrapU(1)
SetVSync(1)
backG=LoadImage("Pista.png" )
backG=CreateSprite(backG)
setspritesize(backG, 1050, 715)

font = LoadFont("29Makina.ttf")

//Area de setamento de sprites
ver = CreateSprite(LoadImage("ver.png"))
SetSpriteSize ( ver, 180, -1 )
SetSpritePosition ( ver, 1000, 110 )

camu = CreateSprite(LoadImage("cam.png"))
SetSpriteSize ( camu, 195, -1 )
SetSpritePosition ( camu, 1300, 240 )

azul = CreateSprite(LoadImage("azul.png"))
SetSpriteSize ( azul, 255, -1 )
SetSpritePosition ( azul, 1000, 367 )

rde = CreateSprite(LoadImage("verde.png"))
SetSpriteSize ( rde, 180, -1 )
SetSpritePosition ( rde, 1600, 515 )

jogador = CreateSprite(LoadImage("w1.png"))
SetSpriteSize ( jogador, 50, -1 )
SetSpritePosition ( jogador, 100, 300 )

AddSpriteAnimationFrame ( jogador, LoadImage ( "w2.png" ) )

AddSpriteAnimationFrame ( jogador, LoadImage ( "w3.png" ) )

AddSpriteAnimationFrame ( jogador, LoadImage ( "w4.png" ) )

AddSpriteAnimationFrame ( jogador, LoadImage ( "w5.png" ) )

AddSpriteAnimationFrame ( jogador, LoadImage ( "w6.png" ) )

//Musica
musica = LoadSound("Asturias.wav")
PlaySound ( musica, 35,1 )

//Variaveis
sorteio = Random(1,5)
velo1 = 4
velo2 = 6
velo3 = 8
velo4 = 9
Milagres = 10
Pontos = 0
i = 0

do
	 //Area de controle do jogo
	if(i = 0 and pontos < 50)
		sorteio = Random(1,5)
	  i = 120
	 endif
	 
	 if(i = 0 and pontos > 50 and pontos < 100)
		sorteio = Random(1,5)
	  i = 100
	 endif
	 
	 if(i = 0 and pontos > 100)
		sorteio = Random(1,5)
	  i = 80
	 endif
	 
	if(pontos>12)
		velo1 = 6
		velo2 = 8
		velo3 = 9
		velo4 = 10
	endif
	
	if(pontos>40)
		velo1 = 8
		velo2 = 9
		velo3 = 10
		velo4 = 11
	endif
	
	if(pontos>70)
		velo1 = 9 
		velo2 = 8
		velo3 = 11
		velo4 = 12		
	endif
	
	if(pontos>100)
		velo1 = 10
		velo2 = 11
		velo3 = 12
		velo4 = 13
	endif
	if(pontos>150)
		velo1 = 12
		velo2 = 13
		velo3 = 14
		velo4 = 15
	endif
	if(pontos>200)
		velo1 = 14
		velo2 = 15
		velo3 = 16
		velo4 = 18
	endif
		
	if(Milagres = 0)
		deleteSound(musica)
		DeleteSprite(jogador)
		DeleteSprite(rde)
		DeleteSprite(ver)
		DeleteSprite(azul)
		DeleteSprite(camu)
		menu = 0
		gosub menu
	endif
	
	Print("Pontos: ")
	Print(Pontos)
	
	Print("Milagres: ")
	Print(Milagres)
      i = i - 1
	   
   //Area de controles
       controleX# = GetJoystickX (  ) 
       controleY# = GetJoystickY (  )
        x1# = x# - controleX#
        y1# = y# - controleY#
        
              angulo = ATanFull ( x1# - x#, y1# - y# )
              x# = GetSpriteX ( jogador )
              y# = GetSpriteY ( jogador )
              SetSpriteAngle ( jogador, angulo )
           
              SetSpritePosition (jogador, GetSpriteX(jogador)+(controleX#/0.1), GetSpriteY( jogador )+(controleY#/0.1))
    //Area de limites
              if(GetSpriteX(jogador) < 0)
				  SetSpritePosition(jogador, 0, getspritey(jogador))
			  endif
			  if(GetSpriteX(jogador) > 1000)
				  SetSpritePosition(jogador, 1000, getspritey(jogador))
			  endif
			  if(GetSpriteY(jogador) < 85)
				  SetSpritePosition(jogador, GetSpriteX(jogador), 85)
			  endif
			  if(GetSpriteY(jogador) > 585)
				  SetSpritePosition(jogador, getspritex(jogador), 585)
			  endif

       if(controleX# = 0.0 and controleY# = 0.0 )
            StopSprite ( jogador )
            SetSpriteFrame ( jogador, 3)
       else
        if ( GetSpritePlaying ( jogador ) = 0 )
			PlaySprite ( jogador, 10, 1, 1, 6 )
         endif
       endif
  
 //Area de geração, sorteios e fisíca

	if( sorteio = 1 )
		SetSpritePosition( ver, GetspriteX(ver)-velo4, 110)
		SetSpritePosition( azul, GetspriteX(azul)-velo3, 367)
		SetSpritePosition(rde, GetSpriteX(rde)-velo2, 515)
		SetSpritePosition(camu, GetspriteX(camu)-velo3, 240 )
		   if(GetSpriteX(ver) < -150 and GetSpriteX(azul) < -150 and GetSpriteX(rde) < -50)
	     	  SetSpritePosition(ver, 1000, 110)
	     	  SetSpritePosition(azul, 1100, 367)
	     	  SetSpritePosition(rde, 1300, 515)
		          Pontos = Pontos + 4
		   endif
		       if(GetSpriteCollision(ver, jogador)=1)
			      SetSpritePosition(ver, 1100, 110)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        
		        if(GetSpriteCollision(azul, jogador)=1)
			      SetSpritePosition(azul, 1200, 367)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
			    endif
		        
		        if(GetSpriteCollision(rde, jogador)=1)
			      SetSpritePosition(rde, 1400, 515)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        if(GetSpriteCollision(camu, jogador)=1)
			      SetSpritePosition(camu, 1300, 240)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
	 endif
	
	if( sorteio = 2)
		SetSpritePosition( rde, GetspriteX(rde)-velo4, 515)
		SetSpritePosition( camu, GetspriteX(camu)-velo4, 240)
		SetSpritePosition( azul, GetspriteX(azul)-velo2, 367 )
		SetSpritePosition( ver, GetspriteX(ver)-velo3, 110)
		  if(GetSpriteX(camu) < -250 and GetSpriteX(rde) < -50)
	     	  SetSpritePosition(rde, 1300, 515)
	     	  SetSpritePosition(camu, 1200, 240)
		         Pontos = Pontos + 3
		  endif 
		         if(GetSpriteCollision(azul, jogador)=1)
			      SetSpritePosition(azul, -1400, 367)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        
		        if(GetSpriteCollision(camu, jogador)=1)
			      SetSpritePosition(camu, 1300, 240)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        if(GetSpriteCollision(rde, jogador)=1)
			      SetSpritePosition(rde, 1400, 515)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        if(GetSpriteCollision(ver, jogador)=1)
			      SetSpritePosition(ver, 1100, 110)
			       Milagres = Milagres - 1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
	  endif
  
	if( sorteio = 3 )
		SetSpritePosition( ver, GetspriteX(ver)-velo4, 110)
		SetSpritePosition( azul, GetspriteX(azul)-velo2, 367)
		SetSpritePosition( camu, GetspriteX(camu)-velo3, 240)
		SetSpritePosition(rde, GetSpriteX(rde)-velo3, 515)
		  if(GetSpriteX(camu) < -250 and GetSpriteX(azul) < -150 and GetSpriteX(ver) < -150)
	     	  SetSpritePosition(ver, 1000, 110)
	     	  SetSpritePosition(azul, 1100, 367)
	     	  setspriteposition(camu, 1200, 240)
		         Pontos = Pontos + 5
		   endif     
		         if(GetSpriteCollision(ver, jogador)=1)
			      SetSpritePosition(ver, 1100, 110)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
			      endif
			      
			     if(GetSpriteCollision(azul, jogador)=1)
			      SetSpritePosition(azul, 1200, 367)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		          endif
		          
		        if(GetSpriteCollision(camu, jogador)=1)
			      SetSpritePosition(camu, 1300, 240)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		        if(GetSpriteCollision(rde, jogador)=1)
			      SetSpritePosition(rde, 1400, 515)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
   endif
		    
	 if( sorteio = 4)
		SetSpritePosition( rde, GetspriteX(rde)-velo4, 515 )
		SetSpritePosition( ver, GetspriteX(ver)-velo2, 110 )
		SetSpritePosition( camu, GetspriteX(camu)-velo3, 240 )
		SetSpritePosition( azul, GetspriteX(azul)-velo2, 367 )
		   if(GetSpriteX(rde) < -50 and GetSpriteX(ver) < -150 and GetSpriteX(camu) < -250)
	     	  SetSpritePosition(ver, 1000, 110)
	     	  SetSpritePosition(rde, 1300, 515)
	     	  setspriteposition(camu, 1200, 240)
		          Pontos = Pontos + 5
		   endif
		   
		         if(GetSpriteCollision(rde, jogador)=1)
			        SetSpritePosition(rde, -1400, 515)
			         Milagres = Milagres -1
			         Oof = LoadSound("Oof.wav")
                     PlaySound ( Oof, 60,0 )
		         endif
		     
		        if(GetSpriteCollision(ver, jogador)=1)
			        SetSpritePosition(ver, 1100, 110)
			         Milagres = Milagres -1
			         Oof = LoadSound("Oof.wav")
                     PlaySound ( Oof, 60,0 )
		        endif
		        if(GetSpriteCollision(camu, jogador)=1)
			        SetSpritePosition(camu, 1300, 240)
		    	    Milagres = Milagres -1
		    	    Oof = LoadSound("Oof.wav")
                    PlaySound ( Oof, 60,0 )
		         endif 
		         if(GetSpriteCollision(azul, jogador)=1)
			      SetSpritePosition(azul, 1400, 367)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
	endif
	
	if( sorteio = 5)
		SetSpritePosition( rde, GetspriteX(rde)-velo4, 515 )
		 SetSpritePosition( azul, GetspriteX(azul)-velo3, 367 )
		 SetSpritePosition(camu, GetspriteX(camu)-velo1, 240 )
		 SetSpritePosition( ver, GetspriteX(ver)-velo2, 110)
		   if(GetSpriteX(rde) < -50 and GetSpriteX(azul) < -150 and GetSpriteX(camu) < -250)
	     	  SetSpritePosition(azul, 1100, 367)
	     	  SetSpritePosition(rde, 1300, 515)
	     	  setspriteposition(camu, 1200, 240)
		         Pontos = Pontos + 5
		   endif
		       if(GetSpriteCollision(rde, jogador)=1)
			      SetSpritePosition(rde, -1400, 515)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif
		         if(GetSpriteCollision(azul, jogador)=1)
			      SetSpritePosition(azul, -1200, 367)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
	              endif
	              if(GetSpriteCollision(camu, jogador)=1)
			        SetSpritePosition(camu, -1300, 240)
		    	    Milagres = Milagres -1
		    	    Oof = LoadSound("Oof.wav")
                    PlaySound ( Oof, 60,0 )
		          endif	  
		          if(GetSpriteCollision(ver, jogador)=1)
			      SetSpritePosition(ver, -1100, 110)
			       Milagres = Milagres -1
			       Oof = LoadSound("Oof.wav")
                   PlaySound ( Oof, 60,0 )
		        endif 
	endif

   // Print( ScreenFPS() )
    Sync()
loop
