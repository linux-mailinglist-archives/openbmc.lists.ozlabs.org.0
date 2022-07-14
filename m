Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FF574442
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 07:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk2bd17ttz3c42
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 15:09:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxCXn8Ct;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxCXn8Ct;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk2Yw2z2pz3c44
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 15:08:03 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id p9so1478592pjd.3
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 22:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7shujGDIveFVwJdWCNKSyJuEjlQQTyIUlSE0rnsxb4E=;
        b=VxCXn8CtmPOaP4eNJCMH07DpzqrLQb5Yn+rZsT3dFUR6HSqQEVCk1tXgOl7K/7z2kf
         bH7bRDKpAgqThNuEoZldf+pdmdUeLfs4GmP64oe6RB+QCKH8vxA3d4sBDyk78YGhiQxj
         jICMA1CeSDmvuEDwv2wayDTwZlFyZxio5WrtOXlAEc+UAdXHpEptT2oSW1J46j4wICd0
         d9hfIq/t+Q8/bBg0U0yAAo7xmsONz9GLdKtl7joVxFlX+osZhUy34MgAScIVq11OfYVj
         Lnv6YQoIlOibISa9XLbEucICvrlVKpViSXaBGeB5v9Yu0md+HignqfjQo27syAPxZbJD
         60iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7shujGDIveFVwJdWCNKSyJuEjlQQTyIUlSE0rnsxb4E=;
        b=IIbc0bJenlni11Ly7QuotPDxB2KnqLCXn7mvWg98aF/snl/uHryUFcZxCzLkp3Uvk1
         o0sj98kVtkGAjcT9T2+Jd/49NNbPiT2giaapJrpKqyoQFOEvsN4/DXxE2Bv9Sy38i/ma
         nYG9Lb7J9q+/hqs9cK+lQ9xWvuAqX/7WWmbUKghP4h/L9Rm3W04e4q3wIckVyi1yru1A
         RIznIDvE8/cJ3OgYX70+F0XTMSZOfmiTxgFWkWY5yeFvOR5SVTXQoCfeeMerlSceOO4v
         oalD0Tv5vWfD/t4PtlI+BahGGsozww6LhCwg0bkivVPCvger2Jq5WNJ+bT/Bj44zjMcP
         BF9g==
X-Gm-Message-State: AJIora+ei6WDynKEE48W4c3q/JmlMA4z8wpXBfaE8aceBLtBCGtp1K7R
	pt9/GwLXAnM+DA98SZEBbT3qLIhYZQM=
X-Google-Smtp-Source: AGRyM1uRTMesqYo2OxP5so9DYQrZWUwMfoEoKJWoWoY7KFM86s8h4BXqZl9uRU5s+xUlbdyNT/rfvA==
X-Received: by 2002:a17:90b:3a84:b0:1f0:56d5:4604 with SMTP id om4-20020a17090b3a8400b001f056d54604mr7656062pjb.41.1657775281558;
        Wed, 13 Jul 2022 22:08:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b0015e8d4eb26esm356059pla.184.2022.07.13.22.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 22:08:00 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] config/ast-evb: Enable NCSI
Date: Thu, 14 Jul 2022 14:37:44 +0930
Message-Id: <20220714050744.572275-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714050744.572275-1-joel@jms.id.au>
References: <20220714050744.572275-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Now that the NCSI code can be used on both direct attached PHY and NCSI
setups, enable it by default.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/evb-ast2400_defconfig     | 2 ++
 configs/evb-ast2500_defconfig     | 2 ++
 configs/evb-ast2600-spl_defconfig | 2 ++
 configs/evb-ast2600_defconfig     | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/configs/evb-ast2400_defconfig b/configs/evb-ast2400_defconfig
index f92dbfd668cd..0706c384c3cf 100644
--- a/configs/evb-ast2400_defconfig
+++ b/configs/evb-ast2400_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_SF=y
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
+CONFIG_CMD_NCSI=y
 CONFIG_DEFAULT_DEVICE_TREE="ast2400-evb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
@@ -56,6 +57,7 @@ CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 91921cf76e62..b83c315e5057 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_SF=y
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
+CONFIG_CMD_NCSI=y
 CONFIG_DEFAULT_DEVICE_TREE="ast2500-evb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
@@ -57,6 +58,7 @@ CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600-spl_defconfig b/configs/evb-ast2600-spl_defconfig
index 340299733115..6aa304a73996 100644
--- a/configs/evb-ast2600-spl_defconfig
+++ b/configs/evb-ast2600-spl_defconfig
@@ -67,6 +67,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
+CONFIG_CMD_NCSI=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_EXT4=y
 CONFIG_CMD_EXT4_WRITE=y
@@ -115,6 +116,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
index e9662bd97fba..1c2cb92da345 100644
--- a/configs/evb-ast2600_defconfig
+++ b/configs/evb-ast2600_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
+CONFIG_CMD_NCSI=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_EXT4=y
 CONFIG_CMD_EXT4_WRITE=y
@@ -74,6 +75,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
-- 
2.35.1

