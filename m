Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49E52A21D
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bfk29Bqz3c7w
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DjYDgjgc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DjYDgjgc; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3N1pLJz3bqR
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:11:58 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id q7so5497030plx.3
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkTRZ6J4nz1IazWIkYQ8lrxwI0vxdTjV3HhYpyhKWHk=;
 b=DjYDgjgcSC/bcNm05ZGmpgYxI0LcM5bYtSjVab3ShHtq8kCLyIAUC5zpE5oxW9DYiO
 Sm9NQK4zBAQFEVsBx7Sy3EQkIEBk4N3m7o48lKFLkeUXNyJIIhqCmZOfnCkU91NSV5Zs
 Rop/S1ljOInPtxQ5b0WW16IsivGyhNRTBuT7tJtZHkTH1LT98OC8vNmuuocKufipHX+k
 JI8t0Yhdc3Tb8zbfj+JWu/B7zm90p4bds5D0w4VgMG+kynpUeC/T8dnwCbE38Oe4GpCy
 WxH+Sx7NU2XQbRuI+c5dl6eO9HsTT/Nsn9jGAer2Qp0Ra+UQcUNJVg01nEsZH/N/SrHl
 9VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkTRZ6J4nz1IazWIkYQ8lrxwI0vxdTjV3HhYpyhKWHk=;
 b=Fxz/AdWdz7txVe49zMNjIU7ExLwkw4XMWBJGVJRYCDlQf759J3MZljcckz6s7WLoEa
 Esb0o6HbdDgMstNG14R1wjNTskyOALKLIlfzliMdauf3G4TARJD9TbhfU3y+wridYnm1
 NwkptRd21IqU7D3MzuV2VhTIL6dWPESWJHSRjsAXFT4BXmQGX7Ee12S02U4pgZ4vj90T
 0/BBGt680n1oogHyK0nxPUEcJr5q0BB3fOHG0u/fSLVesOL69s9yNUY3WCA6AIUz1/c+
 Vw56zfw309vWSSiuUaqgALdCnZvkrEEF0P/r3vr+6vdFIf7OrgVIGbabUg/5ty9q2vEU
 Vunw==
X-Gm-Message-State: AOAM5329rvcvK5CnMfsipwmR13+FWjR74Uo97lSp96lO8eIWmBGaDMTl
 3PW6s/C2nv68t0gC9dx7UA==
X-Google-Smtp-Source: ABdhPJz/YlKbVfMuxNEm3/Q/9AoIqoclOeyZ0WODTabygG6G1k89loa6G3yO1f/dYGhlI60zatr2Kg==
X-Received: by 2002:a17:902:b58b:b0:15f:4421:ba5e with SMTP id
 a11-20020a170902b58b00b0015f4421ba5emr21280278pls.103.1652782315720; 
 Tue, 17 May 2022 03:11:55 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 h188-20020a62dec5000000b0050dc762816esm8478832pfg.72.2022.05.17.03.11.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:11:55 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 00/10] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Tue, 17 May 2022 18:11:32 +0800
Message-Id: <20220517101142.28421-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
 - Krzysztof Kozlowski : https://www.spinics.net/lists/linux-i2c/
   msg56795.html
 - Andy Shevchenko : https://lkml.org/lkml/2022/5/10/297
 - Wolfram Sang : https://lkml.org/lkml/2022/5/17/38
 - Andy Shevchenko : https://lkml.org/lkml/2022/5/10/306
 - Andy Shevchenko : https://lkml.org/lkml/2022/5/10/309

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

Tali Perry (6):
  i2c: npcm: Change the way of getting GCR regmap
  i2c: npcm: Remove unused variable clk_regmap
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (4):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845
  i2c: npcm: Capitalize the one-line comment

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 +-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 277 +++++++++++-------
 4 files changed, 194 insertions(+), 118 deletions(-)

-- 
2.17.1

