Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B852108E
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCB84dgRz3byZ
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DId4zWWE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DId4zWWE; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyC9m4wdHz3bdC
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:17:31 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id a11so14436474pff.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ohWrWKhb7DH4mWT2Vpbml6C/Yi2zU4//OgZmCLMHe0=;
 b=DId4zWWENPDBe803yDU0EgPlkAgQ9UTEmkZciNnfJlpTHSpfNoJI95GDoIEYDdCzwF
 YHykbhHXb2XRKqHpB7aVx36MRJIKNAptpmJv7s0vpEscKjGUS5eeqq8Ggj1ime0uBxdp
 rrSZVmNe84M0w85Bfp5hZMGBiBDkbYHQMlOLZA5mb/LSNAEv5nRnjnjJpoJX7Qw76f/3
 341Xvdhnm58Kr6i73uqCXDy3gwhmLHeYz/YDNhmuxC7BIvXIwm0NIYuGjh8XbS2e/rEe
 RGDcCUdqNhloApQSLjHHVPd4avvJ6ISxRxdsL5fogqd8Q2Zkgj2JWm+0kbuSl+y4xe0I
 U5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ohWrWKhb7DH4mWT2Vpbml6C/Yi2zU4//OgZmCLMHe0=;
 b=5+TP5ANdMbR1mwoVPUNRk4DsZIUjULH3Udhcfkl3BEWmWQls4ZuovtYbIB5sq3GQCl
 Dn6klsNwGmsDPznYhHfHbHk5jKSNQq4XNaPx2RRTg1aEGBFVA8udhRG74NJ1fY12j7m3
 z8iZoQOr5gm3rT3QsHvnf+bNFJq7nFlFL2ZkwyzXNXFPU+C9TCAriQy3g+vyFZRY+Oqp
 ipsmzmHeR8CJdCkeTuFN/a5CLkh6BBjARmuM//P6Fs7JQSv3HY01ZXk18qYKAMIOZOB1
 QfFHvunuV7NKBmHDbQR2yW7xrdICo/LyRXwS7VLXS0dpj6zZ7uM6XYpBPYu1/j1zSDS8
 J3XA==
X-Gm-Message-State: AOAM531/1ejqAuZiWCs63xahlHHzfELA2zioh7bPWix7HbOLirW0cr2Y
 +nE/IlshdLk2uBaFjy7N/A==
X-Google-Smtp-Source: ABdhPJzWUJ6bTi6v+qZvP1Qcqb96Ilp/dJd0/Q4FsknFBWSeSF9G2Go/2vlTzyKn+anKaKWYXTo9Ow==
X-Received: by 2002:a63:d312:0:b0:3c6:74a2:da72 with SMTP id
 b18-20020a63d312000000b003c674a2da72mr12651836pgg.16.1652174248702; 
 Tue, 10 May 2022 02:17:28 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 20-20020a17090a035400b001dcf49d92a1sm1283670pjf.28.2022.05.10.02.17.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:17:28 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 0/9] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Tue, 10 May 2022 17:16:45 +0800
Message-Id: <20220510091654.8498-1-warp5tw@gmail.com>
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
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/3/289
 - Andy Shevchenko : https://lkml.org/lkml/2022/3/3/286
 - Andy Shevchenko : https://lkml.org/lkml/2022/4/5/140
 - Andy Shevchenko : https://lkml.org/lkml/2022/3/3/295

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

Tyrone Ting (3):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 +-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 277 +++++++++++-------
 4 files changed, 196 insertions(+), 116 deletions(-)

-- 
2.17.1

