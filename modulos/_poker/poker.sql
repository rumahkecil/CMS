CREATE  TABLE IF NOT EXISTS `poker_jogador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT(11) NOT NULL ,
  `nome` VARCHAR(250) NOT NULL ,
  `codigo` VARCHAR(150) NOT NULL ,
  `foto` VARCHAR(150) NULL ,
  `data_add` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_poker_jogador_users1` (`users_id` ASC) ,
  CONSTRAINT `fk_poker_jogador_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `poker_torneio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT(11) NOT NULL ,
  `status` CHAR(1) NOT NULL DEFAULT 0 ,
  `nome` VARCHAR(250) NOT NULL ,
  `total_etapas` INT(10) NOT NULL ,
  `realizada_etapas` INT(11) NULL DEFAULT 0 ,
  `maximo_pontos` INT(10) NOT NULL ,
  `imagem` VARCHAR(150) NULL ,
  `descricao` TEXT NULL ,
  `data_add` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_poker_torneio_users1` (`users_id` ASC) ,
  CONSTRAINT `fk_poker_torneio_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE IF NOT EXISTS `poker_relacao` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `torneio_id` INT(11) NOT NULL ,
  `jogador_id` INT(11) NOT NULL ,
  `pontos` INT(11) NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_poker_relacao_poker_jogador1` (`jogador_id` ASC) ,
  INDEX `fk_poker_relacao_poker_torneio1` (`torneio_id` ASC) ,
  CONSTRAINT `fk_poker_relacao_poker_jogador1`
    FOREIGN KEY (`jogador_id` )
    REFERENCES `poker_jogador` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poker_relacao_poker_torneio1`
    FOREIGN KEY (`torneio_id` )
    REFERENCES `poker_torneio` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert  into `users_rules`(`id`,`pai`,`hidden`,`nome`,`url`,`moduloAtivado`) values (34,0,'0','Poker','poker',1);
insert  into `users_rules`(`id`,`pai`,`hidden`,`nome`,`url`,`moduloAtivado`) values (35,34,'0','Novo Torneio','poker/novo',1);
insert  into `users_rules`(`id`,`pai`,`hidden`,`nome`,`url`,`moduloAtivado`) values (36,34,'1','Editar Torneio','poker/editar',1);
insert  into `users_rules`(`id`,`pai`,`hidden`,`nome`,`url`,`moduloAtivado`) values (37,34,'1','Inserir Jogador em Torneio','poker/inserirJogadorTorneio',1);
