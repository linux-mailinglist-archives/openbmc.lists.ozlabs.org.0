Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B27545E1B
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:04:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKD4y1K9Hz3brj
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:04:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XrBLaRYl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XrBLaRYl;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKD1f3dsWz3blR
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:01:26 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 129so24105542pgc.2
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HS0T8DF/puBFQpQ7Nf2JujCFHXT/b8CJvMKWAj0HBks=;
        b=XrBLaRYlkD3LyzNzpy1+fEJ6bnTYTxS77T/Qf7+rJet6lQpH6ZePlXT1kEY4eoOX9r
         bDQSY+VlFI4OVioFB+zpx3lnqP2sh4T4jW0uS7a+TrVA3dCgvlekf4rnKOysE23G3IVi
         QmlekUtlfd9PG/0iUMQRfrfB0zu2bUcrLlkK7LTDzlHRIuU+dWtiJlJz5sRqvXfx4QYs
         sJLe48myGZ+XKytSl/8AGqGXQsGxQ1YgyBSalHhWlGk4YguO0uL+NbykqLAduLYqNrbk
         jQxU/kNVK3uILVTpEaqga2z22IZKkxJ59j+0C9WQSjHk8od9i5t7tm70yFHpTiTV+N3g
         hI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=HS0T8DF/puBFQpQ7Nf2JujCFHXT/b8CJvMKWAj0HBks=;
        b=skn7EoTaW4gxjT6MqYqww4cS9aqNxtQERbeO/NSDYjBRMMl1lFsSKztjzeWANBkdUg
         j/QzNY6tZtK2BxI6A4OmnmETsROlHXqUl2UnhBMhh0FXFVMtl+D3IYnAZZsU6VQ8+vkI
         v8I1nYpwkM29qSywYtDeRppQT5uZI7Esa/5Gds4dIog2cRE98vKHwIkgVbcDy1q576uX
         7L3pA/DkXf3Z/Fi0mmHT3Pj0GD1h0Rm9C3UqLJVqTC9kLV7L3XRlz2Zha3wHAmf2FA66
         7V/3knvvN5ic6PA+uJdESFWfJD+brel+dXeTmQDdiUmmO6Jtc4itwKLCi2Aa4aONIJ9O
         QL7Q==
X-Gm-Message-State: AOAM533BlPDOXbKlOTEkCZEhNdZj+UYAbr7IN+OZHW4+6yMlLuaJruL1
	s/QM72CF5k5j17dU30MpP2AtXwwrxhc=
X-Google-Smtp-Source: ABdhPJz/ghJByGl3HuE3cyHFZTzf3wdKmHi9LqRfC9bL9oCSO13dHM1j2G6kcB01PVn24Wq8xiHH5A==
X-Received: by 2002:a62:6407:0:b0:519:3571:903e with SMTP id y7-20020a626407000000b005193571903emr49731715pfb.30.1654848083406;
        Fri, 10 Jun 2022 01:01:23 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b0050dc7628162sm18830661pfp.60.2022.06.10.01.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:01:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] config: aspeed: Enable NCSI support
Date: Fri, 10 Jun 2022 17:30:59 +0930
Message-Id: <20220610080059.2333501-5-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610080059.2333501-1-joel@jms.id.au>
References: <20220610080059.2333501-1-joel@jms.id.au>
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Now that NCSI can be enabled without breaking non-NCSI systems, enable
it in all defconfigs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600-pfr_defconfig            | 1 +
 configs/ast2600_openbmc_defconfig        | 1 +
 configs/evb-ast2400_defconfig            | 1 +
 configs/evb-ast2500-spl_defconfig        | 1 +
 configs/evb-ast2500_defconfig            | 1 +
 configs/evb-ast2600-cot_defconfig        | 1 +
 configs/evb-ast2600_defconfig            | 1 +
 configs/evb-ast2600a0-cot_defconfig      | 1 +
 configs/evb-ast2600a0-spl_defconfig      | 1 +
 configs/evb-ast2600a0_defconfig          | 1 +
 configs/evb-ast2600a1-cot_defconfig      | 1 +
 configs/evb-ast2600a1-ecc_defconfig      | 1 +
 configs/evb-ast2600a1-emmc-cot_defconfig | 1 +
 configs/evb-ast2600a1-emmc_defconfig     | 1 +
 configs/evb-ast2600a1-spl-ecc_defconfig  | 1 +
 configs/evb-ast2600a1-spl_defconfig      | 1 +
 configs/evb-ast2600a1_defconfig          | 1 +
 17 files changed, 17 insertions(+)

diff --git a/configs/ast2600-pfr_defconfig b/configs/ast2600-pfr_defconfig
index 398e55d0f3d4..dbe87e35a635 100644
--- a/configs/ast2600-pfr_defconfig
+++ b/configs/ast2600-pfr_defconfig
@@ -120,6 +120,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/ast2600_openbmc_defconfig b/configs/ast2600_openbmc_defconfig
index de8fca770674..4565c2953460 100644
--- a/configs/ast2600_openbmc_defconfig
+++ b/configs/ast2600_openbmc_defconfig
@@ -116,6 +116,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2400_defconfig b/configs/evb-ast2400_defconfig
index f92dbfd668cd..46f9a9467929 100644
--- a/configs/evb-ast2400_defconfig
+++ b/configs/evb-ast2400_defconfig
@@ -56,6 +56,7 @@ CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2500-spl_defconfig b/configs/evb-ast2500-spl_defconfig
index 0f6780b5e4e8..3467ae6cda2d 100644
--- a/configs/evb-ast2500-spl_defconfig
+++ b/configs/evb-ast2500-spl_defconfig
@@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 91921cf76e62..d692a0811109 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -57,6 +57,7 @@ CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600-cot_defconfig b/configs/evb-ast2600-cot_defconfig
index b656e528c855..06fc84b139a4 100644
--- a/configs/evb-ast2600-cot_defconfig
+++ b/configs/evb-ast2600-cot_defconfig
@@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
index 3e302e51ef2f..d0d867adb0e8 100644
--- a/configs/evb-ast2600_defconfig
+++ b/configs/evb-ast2600_defconfig
@@ -75,6 +75,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a0-cot_defconfig b/configs/evb-ast2600a0-cot_defconfig
index 1a377736ea4a..826e7b34e22a 100644
--- a/configs/evb-ast2600a0-cot_defconfig
+++ b/configs/evb-ast2600a0-cot_defconfig
@@ -91,6 +91,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a0-spl_defconfig b/configs/evb-ast2600a0-spl_defconfig
index 69548bcddeda..a88a14411f7b 100644
--- a/configs/evb-ast2600a0-spl_defconfig
+++ b/configs/evb-ast2600a0-spl_defconfig
@@ -92,6 +92,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a0_defconfig b/configs/evb-ast2600a0_defconfig
index 51cf6ac3ca35..358c31511297 100644
--- a/configs/evb-ast2600a0_defconfig
+++ b/configs/evb-ast2600a0_defconfig
@@ -69,6 +69,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-cot_defconfig b/configs/evb-ast2600a1-cot_defconfig
index b656e528c855..06fc84b139a4 100644
--- a/configs/evb-ast2600a1-cot_defconfig
+++ b/configs/evb-ast2600a1-cot_defconfig
@@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-ecc_defconfig b/configs/evb-ast2600a1-ecc_defconfig
index c637bac65472..cda88addfa43 100644
--- a/configs/evb-ast2600a1-ecc_defconfig
+++ b/configs/evb-ast2600a1-ecc_defconfig
@@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-emmc-cot_defconfig b/configs/evb-ast2600a1-emmc-cot_defconfig
index 68ac56cf170c..552bb6b104a3 100644
--- a/configs/evb-ast2600a1-emmc-cot_defconfig
+++ b/configs/evb-ast2600a1-emmc-cot_defconfig
@@ -101,6 +101,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-emmc_defconfig b/configs/evb-ast2600a1-emmc_defconfig
index ce3bd5e07dba..b7e4e9df9646 100644
--- a/configs/evb-ast2600a1-emmc_defconfig
+++ b/configs/evb-ast2600a1-emmc_defconfig
@@ -102,6 +102,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-spl-ecc_defconfig b/configs/evb-ast2600a1-spl-ecc_defconfig
index 245dee329eb7..530199913d28 100644
--- a/configs/evb-ast2600a1-spl-ecc_defconfig
+++ b/configs/evb-ast2600a1-spl-ecc_defconfig
@@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1-spl_defconfig b/configs/evb-ast2600a1-spl_defconfig
index be6a1d8a2328..4be5b6c95b41 100644
--- a/configs/evb-ast2600a1-spl_defconfig
+++ b/configs/evb-ast2600a1-spl_defconfig
@@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
diff --git a/configs/evb-ast2600a1_defconfig b/configs/evb-ast2600a1_defconfig
index 68ff5547b789..c0db1d56db26 100644
--- a/configs/evb-ast2600a1_defconfig
+++ b/configs/evb-ast2600a1_defconfig
@@ -73,6 +73,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
-- 
2.35.1

