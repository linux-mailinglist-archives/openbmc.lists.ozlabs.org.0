Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C56DD12E
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 06:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwYNK64BRz3cRW
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 14:52:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EWLYdTxt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EWLYdTxt;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwYKr1mgxz3c83
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:49:52 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a51ba7fdfcso8738635ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 21:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681188589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+P/zEy/f2mo1yylW6YWcxu4d/MCjM4jTEp2FMwxxk4=;
        b=EWLYdTxtptmT9S4wt8xWh7MaI7sM/hsqwqLZac1AnCUaSh2mk41PkoZnm9nf0ReZYi
         Za+VmySwgfzWnOpkrqtyRfq1jNsWI0pfb5fyM5vmKyKAZq9JnNYsxtlaDMu+HUaYjZFq
         DJ84aJJeEoH7DRYwSbMu5T0PaeDuFw0hXx0P7v0g2WvqzjG6WXi3BTLWJhAO4kerP93K
         4QaWwPcFfRJ6hAs1AC3QcpxUGi/4/6jdvv5UPZ/7beXc4NVijfRJ3Tw6hwEkfHQYyRrh
         YnSpA5xiMh2tkDevJUAUtfLbmTi2DjR2oWC5w57HKAGdBh5ZCM0BsfGB9I/4gkRD1GEF
         L/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681188589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+P/zEy/f2mo1yylW6YWcxu4d/MCjM4jTEp2FMwxxk4=;
        b=TZcVrfcLY1ca0tpDguYP465ySGXhN5rJ5waC9Zoi19zg+ZMj8lul0HCnTWh7hc8W6X
         mGhj42NEkw5dv5UkMP9APGAgs48NslJPKElCEJLeSjliBWldcNPzZym6zqqhP12FVreN
         b+6YN6hhuvu+T553JTIsEALtwSxF4SPR54xeyPUNXTmY60SuOTeGBxIN4UCYdapHs7AO
         458sc5tRdj5GGi/KvM929so1AswVbSyYTj499ir0/82eK2sLsXb2QbeApTGTpFjhDN2y
         9vFLjiVxgkXJ4wbYBwV/xanEtGzzVOnP8E1ONWrqK3x9GvgEAxretyRo3HOXiVjlTGnr
         wN/w==
X-Gm-Message-State: AAQBX9fP9xt2dLr0WOVCfOGDr2mjrc5DUnXFsFz89VFW01KUTdJnHEYq
	gxKkttZXs6ob4sN8Ivj1UkgG3PIav74=
X-Google-Smtp-Source: AKy350YM0uAxbeU9QoaWErA8SCOxIZ5TGK/BtoPun4OOJcsDBDhlIERQidDymEOVMzp38228cRI6OQ==
X-Received: by 2002:a62:5206:0:b0:626:444:bfa6 with SMTP id g6-20020a625206000000b006260444bfa6mr10252247pfb.26.1681188589440;
        Mon, 10 Apr 2023 21:49:49 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0062dc14ee2a7sm8663607pfm.211.2023.04.10.21.49.47
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 21:49:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 2/2] ARM: config: openbmc: Add HPE GPX and Nuvoton 7xx
Date: Tue, 11 Apr 2023 14:19:34 +0930
Message-Id: <20230411044935.22608-3-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411044935.22608-1-joel@jms.id.au>
References: <20230411044935.22608-1-joel@jms.id.au>
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

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/openbmc_defconfig | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/openbmc_defconfig b/arch/arm/configs/openbmc_defconfig
index 0c632427e41b..dac167cfc775 100644
--- a/arch/arm/configs/openbmc_defconfig
+++ b/arch/arm/configs/openbmc_defconfig
@@ -21,7 +21,10 @@ CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
 CONFIG_MACH_ASPEED_G6=y
-# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARCH_HPE=y
+CONFIG_ARCH_HPE_GXP=y
+CONFIG_ARCH_NPCM=y
+CONFIG_ARCH_NPCM7XX=y
 CONFIG_SMP=y
 # CONFIG_ARM_CPU_TOPOLOGY is not set
 CONFIG_VMSPLIT_2G=y
@@ -148,6 +151,7 @@ CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
+CONFIG_NPCM7XX_KCS_IPMI_BMC=y
 CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
 CONFIG_IPMI_KCS_BMC_SERIO=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
@@ -161,12 +165,16 @@ CONFIG_I2C_MUX_GPIO=y
 CONFIG_I2C_MUX_PCA9541=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_ASPEED=y
+CONFIG_I2C_GXP=y
+CONFIG_I2C_NPCM=y
 CONFIG_I2C_FSI=y
 CONFIG_I2C_SLAVE=y
 CONFIG_SPI=y
 CONFIG_SPI_ASPEED_SMC=y
 CONFIG_SPI_FSI=y
-CONFIG_GPIOLIB=y
+CONFIG_SPI_GXP=y
+CONFIG_SPI_NPCM_FIU=y
+CONFIG_SPI_NPCM_PSPI=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_ASPEED=y
 CONFIG_GPIO_ASPEED_SGPIO=y
@@ -178,9 +186,11 @@ CONFIG_W1_SLAVE_THERM=y
 CONFIG_SENSORS_SMPRO=y
 CONFIG_SENSORS_ADT7475=y
 CONFIG_SENSORS_ASPEED=y
+CONFIG_SENSORS_GXP_FAN_CTRL=y
 CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
+CONFIG_SENSORS_NPCM7XX=y
 CONFIG_SENSORS_OCC_P9_SBE=y
 CONFIG_PMBUS=y
 CONFIG_SENSORS_ADM1275=y
@@ -196,7 +206,9 @@ CONFIG_SENSORS_UCD9200=y
 CONFIG_SENSORS_SBTSI=y
 CONFIG_SENSORS_TMP421=y
 CONFIG_SENSORS_W83773G=y
+# CONFIG_THERMAL is not set
 CONFIG_WATCHDOG_SYSFS=y
+CONFIG_GXP_WATCHDOG=y
 CONFIG_MFD_SMPRO=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_SUPPORT_FILTER=y
@@ -224,6 +236,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_ASPEED=y
+CONFIG_MMC_SDHCI_NPCM=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
@@ -236,6 +249,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_EDAC=y
 CONFIG_EDAC_ASPEED=y
+CONFIG_EDAC_NPCM=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_PCF8523=y
@@ -246,6 +260,7 @@ CONFIG_RTC_DRV_ASPEED=y
 CONFIG_IIO=y
 CONFIG_ASPEED_ADC=y
 CONFIG_MAX1363=y
+CONFIG_NPCM_ADC=y
 CONFIG_SI7020=y
 CONFIG_BMP280=y
 CONFIG_DPS310=y
-- 
2.39.2

