Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4961A3AE356
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 08:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7g1l6yV3z308T
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 16:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=beYwC9dy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=beYwC9dy; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7g0f702Vz3074
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 16:41:22 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 bv7-20020a17090af187b029016fb18e04cfso452349pjb.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 23:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t46YMJWD1CTXlpyKk5zGKDg/ntpG87aILasowPNa9TI=;
 b=beYwC9dyMThElPVa1CtqsRxd5NUNWeyzmgIRCgBCerKtFf99zk9E+SqzXPKwCItwCh
 4miAz8f3/Pouxr6iLOhRJLjXdUtltOt8eDkn2mnMGvnqXlycNgZIDy57BbCW2Zc28jS1
 xh9LsEx8nkZIYig9pFDwrjLkYLQPw6wxi81unM7hF6sdcqwz81Vkn90jKseL9McW15Qv
 ZnpidXS4wpj3n+VHqOvH8tYD4VVxEX3iZXE13VWfu2jA4x/1/t6/Hf5IsYPm7d8ckW2O
 D3oJhhF+umm+oE8n8iCkq8y3Mce+bWSIg1FiFVY82oBdPpYAulJCIZF9hl2ofAl/cBXG
 d59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t46YMJWD1CTXlpyKk5zGKDg/ntpG87aILasowPNa9TI=;
 b=mKLM55JDl3caixdRDvJZ8h4xJZpRv33pU3XeQJ3FCi+jKODlSD+QCrZb/0z084JW6o
 RrBcjmM4tfuNof2B5FqXD5b0sBmuujXNj6V5kEykO2suavTBXbFofHrpGXKBjHOPZsX3
 2WJ6jQ2FsMF5XGwPuHtBqz1ThxI4ceTE5a+y8Y5+4tcJFBzN5w+6Lw6k1qY/j7zJ3Wwy
 kuCndZ3Y+/yX0h5SAn24tFO/mMk3DGT6TFUGHauiL4djdnFJGmDSXIK9ZHo7OCo6xJ6g
 EXyeO39LaRLZBpXJSN2xU0kYzWYFofQ/SHDOTmCpyC6WuLFmQ0/m/WXBdlrOsu7mS0GK
 u6Xw==
X-Gm-Message-State: AOAM532TSZsVxzhNpBKy62nbsLNJvgVVRQaPnT+auXtj4eP6fnmOJKtk
 xchdwUC3H/aWy4ijE61lhzzh6NRmlzI=
X-Google-Smtp-Source: ABdhPJzP5srOc+RTy+UXBGCnN2JT4mPa4+e6fOvefvPn3JssrYFM14QnHM+6yMtZZkiXoK+lq0Fbkg==
X-Received: by 2002:a17:902:9049:b029:116:e060:c464 with SMTP id
 w9-20020a1709029049b0290116e060c464mr16611323plz.1.1624257679052; 
 Sun, 20 Jun 2021 23:41:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d16sm7865633pjs.33.2021.06.20.23.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:41:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ast2600: Add
 environment for booting from mmc
Date: Mon, 21 Jun 2021 16:11:02 +0930
Message-Id: <20210621064102.961633-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621064102.961633-1-joel@jms.id.au>
References: <20210621064102.961633-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds the default environment from the OpenBMC project.

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Add latest environment from openbmc
---
 board/aspeed/ast2600_openbmc_mmc.txt       | 11 +++++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt

diff --git a/board/aspeed/ast2600_openbmc_mmc.txt b/board/aspeed/ast2600_openbmc_mmc.txt
new file mode 100644
index 000000000000..15dd2f5227ee
--- /dev/null
+++ b/board/aspeed/ast2600_openbmc_mmc.txt
@@ -0,0 +1,11 @@
+bootargs=console=ttyS4,115200n8
+boota=setenv bootpart 2; setenv rootfs rofs-a; run bootmmc
+bootb=setenv bootpart 3; setenv rootfs rofs-b; run bootmmc
+bootcmd=setenv origbootargs ${bootargs}; run bootconfcmd; run bootsidecmd
+bootconfcmd=if test ${fitconfig} -n; then setenv bootmconf "#${fitconfig}"; fi
+bootdelay=2
+bootmmc=run setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage && bootm ${loadaddr}${bootmconf}; echo Error loading kernel FIT image with fitconfig ${fitconfig}; bootm ${loadaddr}; echo Error loading kernel FIT image
+bootside=a
+bootsidecmd=if test ${bootside} = b; then run bootb; run boota; else run boota; run bootb; fi
+loadaddr=0x83000000
+setmmcargs=setenv bootargs ${origbootargs} rootwait root=PARTLABEL=${rootfs}
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index c5d03721c97a..344a4d8f9c96 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -83,6 +83,8 @@ CONFIG_CMD_MTDPARTS=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_USE_DEFAULT_ENV_FILE=y
+CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_REGMAP=y
-- 
2.32.0

