CREATE FUNCTION `add_user`(_name VARCHAR(250), _email VARCHAR(250), _password TEXT, _confirmPassword TEXT) RETURNS TEXT
BEGIN
	
    DECLARE _message TEXT;
    SET _message = '';
    
	-- validacion
		
        -- Validar nombre
		IF (_name <> null AND _name <> '') THEN
        
        
            -- Validar email
            IF (_email <> null AND _email <> '') THEN
				IF () THEN -- USAR LOCATE
					IF () THEN -- VERIFICAR QUE NO EXISTA
                
                
						-- Validar password
						IF (_password <> null AND _password <> '') THEN
							IF (_password = _confirmPassword ) THEN -- COMPARAR QUE EL PASSWORD SEA IGUAL
								INSERT INTO `list_user` () VALUES () -- INSERTAR DATOS Y GUARDAR COMO MD5 LA CLAVE
                                -- Mensaje de exito
                                SET _message = '';
                            ELSE
								-- Error de password
								SET _message = 'Contraseña incorrecta!';
                            END IF;
						ELSE
							-- Error de password
							SET _message = '';
						END IF;
	
					
					ELSE
						-- Error de email
						SET _message = '';
                    END IF 
                ELSE
					-- Error de email
					SET _message = '';
                END IF;
            ELSE
				-- Error de email
				SET _message = '';
            END IF;
            
            
        ELSE
			-- Error de nombre
			SET _message = '';
        END IF;
    
    RETURN _message;

END