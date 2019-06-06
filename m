Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C736DF8
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 09:59:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KJ3M59DCzDqgb
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 17:59:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S35RsHeh"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KJ2t6L3zzDqNL
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 17:59:18 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 20so896506pgr.4
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 00:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DLbDx+gjfIVU66Ioz5679W7GWPRX/A8cVqY5qHpNraw=;
 b=S35RsHehDYyXOru/8z1PscX4YLwe+dUeOsnt7xxVy6GGihs4A3TnPDPLhyfq3F1VJd
 Q/vSYoAjV4zQoAipU6Rh2D382aTDofKwUUuLIndDW/fx1m/d45FRuXoHKLcZdbJL+ih9
 DkH0Lz5bdF7aU0sR3w6gzcjKgd1fXYfkaCd7JHbQJ7w/jW2KqO6+0iDdTHIgeJh3UGML
 +N4hV+1xsYy98EtP2Q5pdCQN8ejzn0hoP24/ysVqebK14Cxf2AOHmhzD0ssrXkf5D2ow
 cAUKdbp8+EI8dg/C/wZzLvEtTz8K8hqz+dBinSfHaVSRCDdLkHyayrQmFnfMBoLh3HGP
 eijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DLbDx+gjfIVU66Ioz5679W7GWPRX/A8cVqY5qHpNraw=;
 b=puiza9P0/6IDpBK+sPlMmd780txhfHsUTnc+Tk8xgFBcOHbTYqjQWIiu1Vc0Jov178
 2TYu0sr9FLHWZ93yU017eOzAt1AwlQkAnWXYl9piz6pEei4Gxfi3odljwcOgRmHBV3TL
 azOeDmuuIYZqSLbYDm/C2Pbd68cgHsViNYfIPGYLp1226G2fo8D+TFXXXWGovVJpyCa6
 cO6RJoOnVuffEoIsLP5xVaFUgvQDX18SNNNeqTG5QNt/FQgiWL3hD3QjatY4c1Van9SK
 WRQ3EhvMecwReht6Q2p6EGHfYkD+InI2mhOMiXR4qvFqX4N6FzTVo6s4XC1OIjVLv+ri
 FdZw==
X-Gm-Message-State: APjAAAUu3V7yTpF60tUhHFFw87cOrO17Y52hWUP02ppEngmD/VqWwU+o
 scMP+JkWBlZBDPbgyynuV6IkJdJI
X-Google-Smtp-Source: APXvYqz+K1un4qcCkMcWX/e8Ri0E1KpUHNPq5wgNayJekd6iieXHCyM9HGnD4AE9qpC5xp0xWoyvUg==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr2134150pgm.158.1559807954860; 
 Thu, 06 Jun 2019 00:59:14 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id b8sm1976416pfr.93.2019.06.06.00.59.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 00:59:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.1] ARM: config: npcm7xx: Refresh and add EDAC
Date: Thu,  6 Jun 2019 17:29:06 +0930
Message-Id: <20190606075906.17136-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Avi Fishman <avifishman70@gmail.com>,
 George Hung <george.hung@quantatw.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This regenerates the defconfig on a 5.1 kernel tree, and adds the newly
merged EDAC driver to the configuration.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/npcm7xx_defconfig | 42 +++++++++++++-----------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/arch/arm/configs/npcm7xx_defconfig b/arch/arm/configs/npcm7xx_defconfig
index 62aaffdba4dd..7577a53847b4 100644
--- a/arch/arm/configs/npcm7xx_defconfig
+++ b/arch/arm/configs/npcm7xx_defconfig
@@ -9,16 +9,16 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_SYSCTL_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEFAULT_DEADLINE=y
 CONFIG_ARCH_NPCM=y
 CONFIG_ARCH_NPCM7XX=y
 CONFIG_SMP=y
 CONFIG_VMSPLIT_3G_OPT=y
 CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_CRYPTO=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -53,8 +53,6 @@ CONFIG_BROADCOM_PHY=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_NPCM750_OTP=y
-CONFIG_NPCM750_OTP_WRITE_ENABLE=y
 CONFIG_NPCM7XX_KCS_IPMI_BMC=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
@@ -67,12 +65,12 @@ CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NPCM7XX=y
+CONFIG_SENSORS_PECI_CPUTEMP=y
+CONFIG_SENSORS_PECI_DIMMTEMP=y
 CONFIG_SENSORS_TMP102=y
 CONFIG_WATCHDOG=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_NPCM750_VCD=y
-CONFIG_NPCM750_ECE=y
 CONFIG_USB_HIDDEV=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
@@ -83,18 +81,21 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_GADGET=y
-CONFIG_USB_GADGET_NPCMX50_USB2=y
 CONFIG_USB_CONFIGFS=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_EDM_KBD_MOUSE=m
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_NPCM750=y
+CONFIG_EDAC=y
+# CONFIG_EDAC_LEGACY_SYSFS is not set
+CONFIG_EDAC_NPCM7XX=y
 CONFIG_IIO=y
 CONFIG_NPCM_ADC=y
 CONFIG_IIO_MUX=y
+CONFIG_RAS=y
 CONFIG_MUX_MMIO=y
+CONFIG_PECI=y
+CONFIG_PECI_NPCM=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
@@ -106,6 +107,11 @@ CONFIG_CIFS_XATTR=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_REDUCED=y
@@ -113,15 +119,3 @@ CONFIG_READABLE_ASM=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_FUNCTION_TRACER=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CRC32C=y
-CONFIG_CRYPTO_DEFLATE=y
-CONFIG_CRYPTO_LZO=y
-CONFIG_CRYPTO_USER_API_SKCIPHER=y
-CONFIG_CRYPTO_DEV_NPCMX50=y
-CONFIG_ARM_CRYPTO=y
-CONFIG_PECI=y
-CONFIG_PECI_NPCM=y
-CONFIG_MFD_INTEL_PECI_CLIENT=y
-CONFIG_SENSORS_PECI_CPUTEMP=y
-CONFIG_SENSORS_PECI_DIMMTEMP=y
-- 
2.20.1

