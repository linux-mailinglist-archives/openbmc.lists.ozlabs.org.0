Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6D4CB8F6
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PNm6Lppz3c3T
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S6CtsfUZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S6CtsfUZ; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNP1JYlz3bg2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:31:49 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id a5so4146201pfv.9
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4+a81i4/FwqFWCQQwaGMX+OknTM79jrm4CHit9fHIU=;
 b=S6CtsfUZ6tGsP4RWc03eGal1v41L86zKqse8e2BxVa1Yej1V4K9NC3LAie0DLzY6WH
 QiS8MqCMwP9VPv27Nh+M5QRRNE7aFdbBy91qDwLSo+1fP5+eAk+kgrKrd9qccQKiTftM
 xx0JhshzSdil0hzu6Lpjda9I/K5l8r52cUWC/nhNoxte6m/eSEAzao95e2E8lFww+w+x
 /Km6ZQeH00f/WgUKPxsHyEauqJSG0kcCEn10Wtu0r5J2/OYFf05NisMXIf7E5KN3bU01
 L8g6Vaqup5XBbpqn3p0yI1dw5JdcjXB4OTDoqB+c33LxC7PxVA4PhOhGwtam6i7p5xUw
 kydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4+a81i4/FwqFWCQQwaGMX+OknTM79jrm4CHit9fHIU=;
 b=l6zkkn1SajkKTzA32aOfceLnHi0FJylFFQRXy6uZrK+pMpSNygC+17mKp5IwFe86l5
 aP5cHXuNyqEhKFDPwA4jF+eC+ssofJJOBVuWLriVRvzuTIUTR071bWpGL9BRJnGwgWVv
 IUvZZ+oIkHYFRFri+JOIJsZIMqUOlRewqKvdB6FTzgrDGGBPhwdWH6haHDALzFIjMn3R
 8QF6vfcJXTZXzM5PhJ1L0rz8yMRZvkghIkLC/RPd8qu8c9Npaoe84XqRyNkMqMpAdeM/
 MwWtAcTQmuQyh/3zwI8qMadnzlnUs+H/mDFznU+JanK3MmkRohwF3gB7ul27EC6uYauN
 qHlQ==
X-Gm-Message-State: AOAM532L7pHehJGcNIjYuMqyX9Qr9MyyBeFmyrPkm2Cm4jfnw1lPjkwF
 KemGOduRG85sBMoW20wePg==
X-Google-Smtp-Source: ABdhPJzRW212yGX1lOcQ4NKFw8lHn01VNtegjIdJxQWlPv0j0N5TvzdqQhz5izdtNS5j5HtOXLHYUg==
X-Received: by 2002:a63:4d8:0:b0:373:cf6d:40e3 with SMTP id
 207-20020a6304d8000000b00373cf6d40e3mr29425592pge.590.1646296306997; 
 Thu, 03 Mar 2022 00:31:46 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056a000b8100b004f111c21535sm1758909pfj.80.2022.03.03.00.31.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:46 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Thu,  3 Mar 2022 16:31:30 +0800
Message-Id: <20220303083141.8742-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/21/129
 - Wolfram Sang : https://lore.kernel.org/lkml/Yh536s%2F7bm6Xt6o3@ninjato/
 - Rob Herring : https://lkml.org/lkml/2022/2/20/425
 - Rob Herring : https://lkml.org/lkml/2022/2/22/945
 - Krzysztof Kozlowski : https://www.spinics.net/lists/linux-i2c/
                         msg55903.html
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/21/500
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/20/49

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

Tali Perry (7):
  i2c: npcm: Fix client address calculation
  i2c: npcm: Change the way of getting GCR regmap
  i2c: npcm: Remove unused variable clk_regmap
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (4):
  arm: dts: add new property for NPCM i2c module
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  26 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  16 +
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 291 +++++++++++-------
 5 files changed, 221 insertions(+), 122 deletions(-)

-- 
2.17.1

