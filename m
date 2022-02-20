Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314E4BD4FA
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29RH52cRz3cCt
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:12:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P9X9sMyI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P9X9sMyI; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1WpR5xHgz30Dy
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:02 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id w20so10223089plq.12
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGpYslQLZPwISm1nPTwx+q6e8M94h8NxJolstJ+8zQM=;
 b=P9X9sMyI7X93Ba8SNlRossbnpsMILrGKyaJrgVRXG/RSlV5ONnsyZsco/sXQbmZwhG
 wBJMF2PpkVn7aWFaQygvPLr/IXjyIkh42fd5ziaE5LnsJw0jSAYN29LPgk5vJpN+S2mo
 D8Png8rM+rMH4zh6IBRe2SUnYwVgSqAm/xplXvGxpFtLlZ7xhTK2N7LuKso+LCAdboqv
 pRcj+jups7UYUp1RSCTNmAN4F2LxmVDtHnTSWeg5L7sxpuTWY0B1cDaoHCKWHbJZosqO
 f4Gn8r7SvybllTAObt8VHoEMpB/AbsHjr+jMNse9EQR6eqaaA8P9lWI7rFTJoM7y+1rD
 BfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGpYslQLZPwISm1nPTwx+q6e8M94h8NxJolstJ+8zQM=;
 b=Fwj1dCniWtm6qg3pb0TGNAOyLHq/mDqy3GYW6Kdxr70XrW4YffBtv4wDJVPJxTviSE
 KkEwdpS7G4nWTlPS7loxsdyPjETXtbqEWR00C0G8Y5ycVXmfy0D1sa+uU3cv76CQrjLN
 M+eQq8xvVu/sltsVEtA/Xon7uVwIHR0cxt9y2qTVsdPPbt0nPYmjx0gs/DdC8osGavhy
 KDC6/5iUpTUhEgwFnUCAZfI5YML0IPKszvhAS8X9vW0fPeeMF0MDo5Key7xXZg52l1Z5
 ZOQryE/I6+1qQ4kSjREVYMS415A+KcyA5J77eJwzPPtsAVNni09jr07dbKw0EqBEe1ZE
 F9ew==
X-Gm-Message-State: AOAM531kKYYjr1MOUVhjHGPO70xDoGmoSRTv9RdbRQ1dfm1KPao6H1yG
 f9AQpoeknaboDEgXfrWZpQ==
X-Google-Smtp-Source: ABdhPJwGgQQH415hnEbc4rho2GZhnPF17sXaRpaHqfTkpT+EBgslDBF0FKkp3zbIQ+e3Wj/O715rfw==
X-Received: by 2002:a17:903:24d:b0:14f:84dd:babb with SMTP id
 j13-20020a170903024d00b0014f84ddbabbmr6823923plh.47.1645329418805; 
 Sat, 19 Feb 2022 19:56:58 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id k21sm2687921pff.25.2022.02.19.19.56.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:56:58 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Sun, 20 Feb 2022 11:53:10 +0800
Message-Id: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/670
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
 - Rob Herring : https://lkml.org/lkml/2022/2/7/1166
                 https://lkml.org/lkml/2022/2/11/711
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/742
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/934
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/947
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/1057
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/1192
 - kernel test robot : https://lore.kernel.org/all/
                       202202072020.toQ349pg-lkp@intel.com/
 
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
  i2c: npcm: Update gcr property name
  i2c: npcm: Remove unused clock node
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (4):
  arm: dts: add new property for NPCM i2c module
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Correct register access width
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  17 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  16 ++
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 251 +++++++++++-------
 5 files changed, 193 insertions(+), 101 deletions(-)

-- 
2.17.1

