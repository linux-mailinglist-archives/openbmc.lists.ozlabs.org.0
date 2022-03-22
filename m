Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75E4E3729
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 04:02:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMx9b2k8Zz2ymS
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 14:02:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZdIUakBn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZdIUakBn; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMx9937GFz2xfT
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 14:02:04 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id n15so14358151plh.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npO/c36OLuX8ktgimEwxNyS0embKrdq4vN/kIDV+XbE=;
 b=ZdIUakBnmgbr5X9tmq4wlQZUoUxKRJ6uCAdlPLslkIiEpy714ZQXAbiAWqYuXuWEb5
 xcOjCyxTbpgT21AkSI5bpjYylo802lUy3Oe9Eg6sDGBT8OHFQ15s3VvYOSVNkbcZ+ESu
 5NGXWnYTi3fDFQhyTZIV2JVORzy0qAsGZuIumTAyqFebZhO3hI0TzyDiojQkHO0ihkkm
 jPyXQTCMbj+oMqwQy9C07Zw8P6JF5/oJ8j0XbE8A554j7L8Kmtt7SB9WOPuPAYOlZLuM
 XGFQRCHmmz/mxzkMsOjFg/JfbIxLejbg+QVz8NJxWu1yYsG+USoB57pwIOAhj1bLfABg
 uuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npO/c36OLuX8ktgimEwxNyS0embKrdq4vN/kIDV+XbE=;
 b=I88yHafo6qxjbB+UWuOTNpUckVT1gA2CKGGvQXV7ClIdvGsglVAYDCoX3qoh7W/AiW
 SbuXENZMREOXimy0AHvi3J/ZrWzYaUqPhwGyOqIOSQB6SFtytbEGdqTsRuYfpsIXw01G
 PfzVqbNEaBDjAIxMceV97vfsYiwjNiOsZFgEzWLCTRT5+J7uVo5n2jHAX2zK/Z9lcfp4
 97CiyeeGBv6EX+JsR46YEVLqvXiZ5u1ZpvrvWty1AX+84IUMHk/PoLULihrQJd+0PPlR
 cey7SIIPx6Ut2QJoIDbHVVqGZ9LHaS/FACULfxHZgcXiQljL1ndi4NXxPytz3gsr/myb
 /Muw==
X-Gm-Message-State: AOAM532e6PA/O5eMe28Wargab1qBL1Rv105YZysH3OZ4HqhWVznDTGE9
 RtptiVSrfqa2f3HoZ4Hg1+0=
X-Google-Smtp-Source: ABdhPJxAvLAnAZU7lVSyZ74gisM0GmFwTqK5nu4eceiJcUBU5Jo1s01SYQGPx4H2XmeiOwkChN1aCA==
X-Received: by 2002:a17:90a:4e87:b0:1c7:49c:2e3f with SMTP id
 o7-20020a17090a4e8700b001c7049c2e3fmr2441997pjh.191.1647918121329; 
 Mon, 21 Mar 2022 20:02:01 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.152])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056a0022ce00b004fabe9fac23sm16660pfj.151.2022.03.21.20.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 20:02:00 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v6 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Tue, 22 Mar 2022 11:01:49 +0800
Message-Id: <20220322030152.19018-1-ctcchien@nuvoton.com>
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

 .../edac/nuvoton,npcm-memory-controller.yaml  |  62 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 706 ++++++++++++++++++
 5 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

