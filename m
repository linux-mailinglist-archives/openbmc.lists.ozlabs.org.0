Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBC509786
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 08:29:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkSLK32s7z305j
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 16:29:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fbPmb7Xe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fbPmb7Xe; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkSKw53wgz2xZB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 16:28:50 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id q19so3828902pgm.6
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 23:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DEfkqCgw3vETZaUlrccz8XAbbh3VHlSfznVx6i0XsJA=;
 b=fbPmb7XexPeO+5C0cFMM9dkkAnaobFwFYz23maFjCWlk64GlweEEqmv7GlukDwTFIh
 y/aTbXD5xYb53Zgm4ePr9MtcU/hBhG6g27fXKdSvQgb8lbzM2fN9rge3QV6VNTA8RYUk
 cq2VVonCDIjwv776yULVviYsQM7ekjLG4ofRWnR0qqtdgdQ7YK7k9RjRzzLYdtCgVn06
 hilZ+jrNFRMQ62jUVOXOA0mmEN0El4rpcK1LZ63W7bkpnUQs076CVNgzaAymJ6dak7j7
 LmRwouLGkRIFLRTQYnezRZMoph6SmkrmdD4y6at8YmPuxQ0BAeYVcNWHzAYuu0HhxbFy
 iY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DEfkqCgw3vETZaUlrccz8XAbbh3VHlSfznVx6i0XsJA=;
 b=3ikaeFHQ5zM+pouJYbANV2iiqIL0pLDpFsq1282C1xFJLD8RtbzDIR/sJtWFnlC4J2
 VaWTqwr3wq5km+6wLtfyRI4nv5TcH03qmYkt5EX3ZGus3TABVzQDuPFShRzvBRMrpyDu
 QiXy0rUN42C3aUOya5LEeAhRRBg8xpTuZBEZ/OSZpR0TvMFxrf5qObaMfBYs10vxvq5E
 QYrXg7PK0q9azzxaBq0/BYYIN9fJ6pNiw2Fp0bHR7SYCrZXNPksuLeL3VPvcfb0njXVc
 9uy39OroSbQIJXVzHg/Zgf9gVOtv4lH4nbmUS2AbRJywyXyqxMJnGLtO+KewuK5izxxH
 Bn4w==
X-Gm-Message-State: AOAM532HhBHymJN4DAnDpSEx89zEKKsIWy4YurnO95nBLA0yKNeXWu/F
 d1S36rzLMkFdlHkMMW9c+EE=
X-Google-Smtp-Source: ABdhPJyuZwmX0LcjxhTIT6sWFL8Km060Fm7pVLJI+PkCGyOf9RPl+BLJ0ZnjUC69KYrCQaWSVHme9A==
X-Received: by 2002:a62:685:0:b0:50a:5870:10b1 with SMTP id
 127-20020a620685000000b0050a587010b1mr24659440pfg.61.1650522526873; 
 Wed, 20 Apr 2022 23:28:46 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.153.245])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090adf9700b001d6e0fe8d28sm273305pjv.22.2022.04.20.23.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:28:46 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v7 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Thu, 21 Apr 2022 14:28:33 +0800
Message-Id: <20220421062836.16662-1-ctcchien@nuvoton.com>
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
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support memory controller for Nuvoton NPCM SoC.

Addressed comments from:
 - Rob Herring : https://lkml.org/lkml/2022/2/25/1103
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/27/63
 - Rob Herring : https://lkml.org/lkml/2022/3/2/828
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/294
 - Jonathan Neuschäfer : https://lkml.org/lkml/2022/3/11/1167
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/293
 - Rob Herring : https://lkml.org/lkml/2022/3/11/575
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/11/305
 - Avi Fishman : https://lkml.org/lkml/2022/3/13/339
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/14/93
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/14/95
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/3/15/378
 - Boris Petkov : https://lkml.org/lkml/2022/3/17/561
 - Paul Menzel : https://lkml.org/lkml/2022/4/9/47
 - Paul Menzel : https://lkml.org/lkml/2022/4/11/182
 - Borislav Petkov : https://lkml.org/lkml/2022/4/8/871
 - Paul Menzel : https://lkml.org/lkml/2022/4/9/51
 - Paul Menzel : https://lkml.org/lkml/2022/4/9/65

Changes since version 7:
 - Refactor npcm_edac.c.
 - Sort strings in npcm_edac.c.
 - Reflow code for 75 characters per line.
 - Summarize errors and warnings reported by kernel test robot.
 - Shorten name of values to make them become more readable in npcm_edac.c..
 - Put spaces between the * and the text in npcm_edac.c.

Changes since version 6:
 - Fix warnings in npcm_edac.c.
 - Add information reported by kernel test robot <lkp@intel.com>.

Changes since version 5:
 - Update commit message of dt-bindings: edac: nuvoton: add NPCM memory controller.
 
Changes since version 4:
 - Update filename in nuvoton,npcm-memory-controller.yaml.
 - Add COMPILE_TEST in Kconfig.
 - Fix errors in npcm_edac.c.
 - Remove unnecessary checking after of_match_device() and of_device_get_match_data().

Changes since version 3:
 - Rename npcm-edac.yaml as nuvoton,npcm-memory-controller.yaml.
 - Drop 'EDAC' in title of nuvoton,npcm-memory-controller.yaml.
 - Update compatible in nuvoton,npcm-memory-controller.yaml.

Changes since version 2:
 - Update description and compatible in npcm-edac.yaml.
 - Remove address-cells and size-cells in npcm-edac.yaml.
 - Reorder the items of examples in npcm-edac.yaml.
 - Reorder header file in driver.

Changes since version 1:
 - Add nuvoton,npcm750-memory-controller property in NPCM devicetree.
 - Add new property in edac binding document.
 - Add new driver for nuvoton NPCM memory controller.

Medad CChien (3):
  ARM: dts: nuvoton: Add memory controller node
  dt-bindings: edac: nuvoton: add NPCM memory controller
  EDAC: nuvoton: Add NPCM memory controller driver

Medad CChien (3):
  ARM: dts: nuvoton: Add memory controller node
  dt-bindings: edac: nuvoton: add NPCM memory controller
  EDAC: nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  61 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 681 ++++++++++++++++++
 5 files changed, 759 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

