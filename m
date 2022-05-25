Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1F5335B6
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 05:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Gdc6v5sz3bWm
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 13:24:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pTRYfyFX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pTRYfyFX; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7GdH4wbpz2xKh
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 13:24:19 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id q4so17468162plr.11
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 20:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=PD/tHInjczHNg1z5c2Rt4gIr9ddVptl5dYEtEWg2i74=;
 b=pTRYfyFXhq/G+vSbxKuMwUW7CnBZ32P4Wn9QlcVYVGOoFNd1K6gKhrSJtdXn0lVJo3
 iYx+MKkAFty1i9Phz+dA7MvrC8KdIGyXgSHKAoKAPaQK3ZpJPRrCPKcZd2nOE7PXuVcI
 UiFTVEO7llLES5/ir+e+sqDEvNCzgyTOOpSc+Kh8+gnAHJtHwFeJOgfpoAI9MXUx1dCJ
 EQWtbdDdens1n9aIyk0WQ2KrqOchieLgRlbwEM3nCw0KJjn29Pg0tZ4ThfpvxZpaV19a
 npY5YgxsEXltuO4peEvH+4WzNcId3njzgCwWk4qQ9CFKQibm+Zz4qtv6TUtGI4P8lmyU
 cXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PD/tHInjczHNg1z5c2Rt4gIr9ddVptl5dYEtEWg2i74=;
 b=hNcOeNHG4/S9ifvXn7IgD/puuq2GA+OO1uzNIUcWEOphbh0zbY5X6HdPBtSW1EwSkf
 IylMwTTiSszDEctAQKD0zZKc7r4nWFK89Z0xTGQEcIes+d2aIVt+84+SzhuPPPEGJqoc
 mG07HPWXeYgLmHHX7U9M0RX1//b07s1AtH3Ok8mGxxVQAtA4VIGtoPxDbsXA76ej9MJG
 P9B4mq8i//WyGMMyprUxUt5v3jqNe1pUXiYUTT3J8IofoxnQ1F1xQK1WOMUDGt0FlZUo
 K0Oq7BGsW6JV2YFmUC+ubMpW3b6M/ZgWC/QmOZA6P+9rTnuXTon6dLovUwifh3W+n5Ml
 FmqA==
X-Gm-Message-State: AOAM532mFq/v0MSamrLWbJunV5BhRj6qH3+iTFfHkHL3oyCIExNUjIws
 U5FtBMb3/1QwtY30DEElhA==
X-Google-Smtp-Source: ABdhPJzOpq43xVt30v0+isBkmtEzD9PzbUElFki3AfULSLo+QTIwioOU1s2IKqehPpZszN9/3tdQGA==
X-Received: by 2002:a17:903:230e:b0:163:5942:164f with SMTP id
 d14-20020a170903230e00b001635942164fmr1033608plh.160.1653449056058; 
 Tue, 24 May 2022 20:24:16 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 c78-20020a621c51000000b0050dc76281fdsm10012126pfc.215.2022.05.24.20.24.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 May 2022 20:24:15 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
 sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Wed, 25 May 2022 11:23:36 +0800
Message-Id: <20220525032341.3182-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

This patchset includes the following fixes:

- Add dt-bindings description for NPCM845.
- Bug fix for timeout calculation.
- Better handling of spurious interrupts.
- Fix for event type in slave mode.
- Removal of own slave addresses [2:10].
- Support for next gen BMC (NPCM845).

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Addressed comments from:
 - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51

Changes since version 5:
 - Shorten npcm_i2caddr array since the number of supported i2c slave
   addresses is reduced.
 - Create a new patch from the original PATCH v5 08/10 to modify the slave
   transaction logic.

Changes since version 4:
 - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
   document.
 - Keep the "longer line first" order.
 - Correct the SoB chain.
 - Modify the if statement in one line and add new line characters.
 - Modify the commit message format in the patch Remove own slave
   addresses 2:10. Correct the if statement in one line and shorten the
   debug messages.
 - Create a new patch to capitalize the one-line comment in the driver.

Changes since version 3:
 - Correct the const format in if condition in i2c binding document.
 - Add the oops message statement and register information in register
   access width patch.
 - Add the occurring rate of the i2c spurious interrupt issue and more
   details in driver's behavior to overcome this issue.
 - Address Andy's comments in the patch to support NPCM845.
 
Changes since version 2:
 - Keep old code as fallback, if getting nuvoton,sys-mgr property fails.
 - Fix the error reported by running 'make DT_CHECKER_FLAGS=-m 
   dt_binding_check'.
 - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
 - Correct the patch's subject about changing the way of getting GCR
   regmap and add the description about keeping old code as fallback
   if getting nuvoton,sys-mgr property fails.
 - Correct the patch title and description about removing the unused 
   variable clk_regmap.
 - Use the data field directly instead of the macros since macros are
   not constants anymore in this patch.
 
Changes since version 1:
 - Add nuvoton,sys-mgr property in NPCM devicetree.
 - Describe the commit message in imperative mood.
 - Modify the description in i2c binding document to cover NPCM series.
 - Add new property in i2c binding document.
 - Create a new patch for client address calculation.
 - Create a new patch for updating gcr property name.
 - Create a new patch for removing unused clock node.
 - Explain EOB in the commit description.
 - Create a new patch for correcting NPCM register access width.
 - Remove some comment since the corresponding logic no longer exists.
 - Remove fixes tag while the patch adds an additional feature.
 - Use devicetree data field to support NPCM845.

Tali Perry (2):
  i2c: npcm: Remove own slave addresses 2:10
  i2c: npcm: Correct slave role behavior

Tyrone Ting (3):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Support NPCM845
  i2c: npcm: Capitalize the one-line comment

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
 4 files changed, 124 insertions(+), 87 deletions(-)

-- 
2.17.1

