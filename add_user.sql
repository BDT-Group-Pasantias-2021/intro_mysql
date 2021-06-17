CREATE FUNCTION `add_user`(_name VARCHAR(250), _email VARCHAR(250), _password TEXT, _confirmPassword TEXT) RETURNS TEXT
BEGIN
	
    DECLARE _message TEXT;
    SET _message = '';
    
	-- validacion
		
        -- Validar nombre
		IF (_name <> null AND _name <> '') THEN
        
        
            -- Validar email
            IF (_email <> null AND _email <> '') THEN
				IF (LOCATE('@', _email)) THEN -- USAR LOCATE
					IF NOT EXISTS (SELECT * from `list_user` WHERE (email_user =_email)) THEN -- VERIFICAR QUE NO EXISTA
                
                
						-- Validar password
						IF (_password <> null AND _password <> '') THEN
							IF (_password = _confirmPassword ) THEN -- COMPARAR QUE EL PASSWORD SEA IGUAL
								
								INSERT INTO `list_user` (`name_user`, `email_user`,`password_user`) VALUES (_name, _email ,md5(_password) ) -- INSERTAR DATOS Y GUARDAR COMO MD5 LA CLAVE
                                -- Mensaje de exito
                                SET _message = 'Se ha agregado satisfactoriamente!';
                            ELSE
								-- Error de password
								SET _message = 'Contraseña incorrecta!';
                            END IF;
						ELSE
							-- Error de password
							SET _message = 'Ingrese una contraseña';
						END IF;
	
					
					ELSE
						-- Error de email
						SET _message = 'Este email ya se encuentra registrado.';
                    END IF 
                ELSE
					-- Error de email
					SET _message = 'Ingrese un email valido!';
                END IF;
            ELSE
				-- Error de email
				SET _message = 'Ingrese el email';
            END IF;
            
            
        ELSE
			-- Error de nombre
			SET _message = 'Ingrese un nombre';
        END IF;
    
    RETURN _message;

END