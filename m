Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390852CCDB
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 09:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hGP2ylBz2yxx
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:25:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LgPneXHQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LgPneXHQ; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hFz1sDDz302c
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 17:25:10 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id s14so4025717plk.8
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 00:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7KTYEAzBj+UHeOYHPkQPvPY0nWRVQq1n8Qfv4AqkRw=;
 b=LgPneXHQcr5a2wUiKfofywt0n5ugbFygskIFcuyjBKNXMs+AZk/5MabsHL5IoJGvzY
 8k/q2hxkIuhEHovPPVupaRkOhh0GPIRzih9ZKMha8547f6EWsH3hjljN5B4JoqXPMXQQ
 dWUIgPph3HXR5zDsYrk0cLHbobI3HH16dtwtQoKH9RFOE2Ez6A1xdHYR0TE7gmCtvVkw
 /joO7RofkPky7H6xOHNgE/CiADNPGLvaD9qiazUJhe3l+Cu7J78MsqjkZU6ooV8gRty0
 g1O4guZmH0xLL7ebihegWWHv7p/9z5U1CH1mFR16M5m30OUXtK1v8trLO/h00HO87ZPo
 +oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7KTYEAzBj+UHeOYHPkQPvPY0nWRVQq1n8Qfv4AqkRw=;
 b=jvafPg9X/32BYgiaLECyM7kuJuyLomttojsfXCq+Pz6tsx86GJQZ0R2mhxtlIMaPgB
 6Q6wUerVYbnnCIyUykwwQRDeVZ6NTPi6KEU7qg3MHzG6jx6IaKtHIjgezysEdvMppdXY
 nFH2e8HlCDhfAB8lzKj7nO3x7IcO9+l/Z51LZFVDMnTBqlL0nFRbUPpRrhHYCnUAkUG5
 6hGfqUUcHcBkMdNrsZIXMKDIaPfTVA4vxJSX3ZUwiTjm/nPIkiEQnlGRWDbXpCWix+yM
 N9MLk5L+2yExSUX/dmFsJFuRjmzmGVnQwqPumaHsWhD+rR37rSR10hoe+NFGhTc3o/XN
 hgVA==
X-Gm-Message-State: AOAM5309yUPZAzRx+RM5o13BtNFQ9sQVGVtgSqIIFTkDm8BhcJAJtDDu
 /b6K6sDXz3D8BTWMXkJYRns=
X-Google-Smtp-Source: ABdhPJyjibq4qVCxGzg3BADkPXuKeH/EjdBmVyRnufxJ0q+nWEGOqMRD0p8wN5jCOOvjCoEZThfK3Q==
X-Received: by 2002:a17:902:aa85:b0:155:ceb9:3710 with SMTP id
 d5-20020a170902aa8500b00155ceb93710mr3574445plr.59.1652945104460; 
 Thu, 19 May 2022 00:25:04 -0700 (PDT)
Received: from localhost.localdomain ([116.89.141.50])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170902650c00b00161ac982b9esm2974159plk.185.2022.05.19.00.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:25:03 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v10 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Thu, 19 May 2022 15:24:51 +0800
Message-Id: <20220519072454.24063-1-ctcchien@nuvoton.com>
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
 - Rob Herring : https://lkml.org/lkml/2022/4/21/681
 - Paul Menzel : https://lkml.org/lkml/2022/5/3/307
 - Paul Menzel : https://lkml.org/lkml/2022/5/3/304
 - Borislav Petkov : https://lkml.org/lkml/2022/5/3/343
 - Paul Menzel https://lkml.org/lkml/2022/5/10/47
 - Paul Menzel https://lkml.org/lkml/2022/5/10/127

Changes since version 10:
 - Add one more maintainer.
 - Correct indentation in npcm_edac.c.
 - Add datasheet information in commit message.

Changes since version 9:
 - Add a necessary blank line in Kconfig for EDAC_NPCM.
 - Reflow for 75 characters per line in commit message of devicetree file.
 - Remove wrong tags in all the commit message.
 - Reorder content in commit message of NPCM memory controller driver.

Changes since version 8:
 - Add new line character at the end of file of yaml file

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
  dt-bindings: edac: nuvoton: add NPCM memory controller
  ARM: dts: nuvoton: Add memory controller node
  EDAC: nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  62 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  17 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 680 ++++++++++++++++++
 5 files changed, 767 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

