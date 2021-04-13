Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFE35D9BF
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJJK2ZXyz3byH
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OKJtr+FK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OKJtr+FK; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJCK2SYbz2yxL
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:45 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id w8so5452051plg.9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjvgTHA+Tin2MEhCTbmUG5j0WAf9Ij8tWpp11lNb5G4=;
 b=OKJtr+FKexDEggdoYVAg6lDqMc6YdkYAEU0nhOuqKRMI8ojUQJ1pW3bPbGkJ+OWgh/
 9BUX0/EbQudijf2UyPfrtx38W+jrHQVL4ThujlyPYs5qUQpK48UA22MZA+bjpYQ8hmCf
 cC0NacWI9obm/K/6SlqUGmIlyvPEcqu2WRhOXSxAR2Ke3iJVhKeASRbpoQlukaWZ1yTu
 HOz5ODTrwZCcWV2h0PvHvkjAaJq4ub5jLxmGVaatqDUSA6AsMT5ZaDh4rB+xOwspyV0K
 oZqZ9KxqV7kBwlMU0omP/MdeQ3/SmaaICTCThE8Y1NOgdma/iLBi346CB3bfo1iDwqu0
 1IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EjvgTHA+Tin2MEhCTbmUG5j0WAf9Ij8tWpp11lNb5G4=;
 b=Ddt6tjLubIfImiai/kltM8+cfHarrxQa9aIOANELK+5ngAXvsWt+50CZyTYTzPnYJZ
 Daa4tALArFIqpZM4faEi2pyxhnkqSQIqSoKAdpHmBcm4FtiGxFcHVDAAiakDOyD6+gxW
 nL7dBwqhoKIks5vJbRMlv1DuJ7I9Wgu5XF2Zazk0DzqGpluoScXAImOjdpZiimAkrttW
 iSBZxc3CGEDDtOTnY0pmc2ljNGSwW8XQpdEjVQy96EiHeX6ruF1xvg9ZBxw8QkmlzXCP
 9KXnRGwspWDOQpm/b6neq9j2hQ5U+TOQqjrRCpD6OWQ60FFoiOVAkKe4MmePCb9MDKol
 F5nw==
X-Gm-Message-State: AOAM533Wmn35bkq//AHZSKC3b07aZ8m2ccOip5ettHLuuUg3jQyDIxiG
 j6o8d8mYXa5K2h+32ZQ+BtBwdlPpnOc=
X-Google-Smtp-Source: ABdhPJwbGzzKl0XM12BrWDjAWxbnTrxxa26gijBvtlDeKzEvQvMC/OiFWgX5eUsAmMktGpOgSokj+A==
X-Received: by 2002:a17:902:dac9:b029:ea:c77e:dc62 with SMTP id
 q9-20020a170902dac9b02900eac77edc62mr15501313plx.30.1618301322501; 
 Tue, 13 Apr 2021 01:08:42 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 11/11] configs/openbmc: Enable
 hw accelerated sha
Date: Tue, 13 Apr 2021 17:37:55 +0930
Message-Id: <20210413080755.73572-12-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SHA512 will be used by the openbmc secure boot implementation when
verifying FIT images of both u-boot proper and the kernel.

The hash command is useful, and adds only a small amount of binary size
given the algorithms are already included in the image.

Using hardware acceleration instead of a software implementation saves a
significant amount of binary size (approx. 12KB for the SPL).

Note that the hardware implementation is only useful when booting from a
payload in memory, as is the case with MMC or network boot. It cannot be
used when booting from SPI NOR.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index e59d3595ebf0..05069084cbc5 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -36,6 +36,7 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
+CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
@@ -53,6 +54,8 @@ CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
+CONFIG_SPL_SHA256_SUPPORT=y
+CONFIG_SPL_SHA512_SUPPORT=y
 CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -80,6 +83,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_NCSI=y
+CONFIG_CMD_HASH=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_EXT4=y
 CONFIG_CMD_EXT4_WRITE=y
@@ -97,6 +101,7 @@ CONFIG_SYSCON=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
+CONFIG_ASPEED_HACE=y
 CONFIG_DM_GPIO=y
 CONFIG_ASPEED_GPIO=y
 CONFIG_DM_I2C=y
@@ -135,4 +140,6 @@ CONFIG_USE_TINY_PRINTF=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPM=y
 CONFIG_SPL_TPM=y
+CONFIG_SHA_HW_ACCEL=y
+CONFIG_SHA_PROG_HW_ACCEL=y
 # CONFIG_EFI_LOADER is not set
-- 
2.30.2

