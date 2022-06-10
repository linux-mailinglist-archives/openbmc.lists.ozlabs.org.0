Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67875545F88
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKDz32cGxz3bpY
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:44:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=osnoxH5c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=osnoxH5c;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKDyd5zCPz2yxj
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:43:51 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id g205so23270933pfb.11
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fnzztiv9XavT4IQNbT2bMnkx97CUI42MYbUmzR1Txe8=;
        b=osnoxH5cTtQfl6/nlBpHZXqOKwchJOW7c6MPa94k864V/AAgr3P3DwrNci01DQafpm
         fDQbtVzsLAwF9fIP3xHC1EOv/AGJea/tJ+39ydOMHEUSe1keNTiNsY8g8MzUBZ+9Fn/r
         ROp2MBqAyfmCRvCaGOeUIat8fLsvtZ0LkD0mEu5xC3mrgOOcZdXwO0TnVF7u/Myd1K5A
         alZvDpvEOPtcXYakblhG3iC5Mn1nVPTB1MCCYtsGNUUvYK31SPL3pFUyBgBY4fiSMVUQ
         7WUcrM6yd/pmxTfyluVHwiG5dlx68ynTmlXgXHffDN8PaSXTEQvq9x/wxRkTMPCWoZyD
         tlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fnzztiv9XavT4IQNbT2bMnkx97CUI42MYbUmzR1Txe8=;
        b=Hr5B4Oxg9XiNyWitz3tEYNb3S5FdwQK+/c4Qy/+P/LfFJQGokIZo+pUqIyLPtPVzna
         xSZYNrZtuH5bI5CeuKZKzT66qPeEf9eqOlov6oBTzmqcM5eL66dbdTuoaiw7Gklm3+tA
         bOeZid1kDYhTYYol5E28W2Pc1vh0STXvcMDJBmfG5EOfqN54bC5Kl8PgLNS2WnCLb44U
         kl8YZ0964yEW+DWJvQW5I4wf+0rM4KHrXdEqZqovnd4YfwCaZMTL6Q9MOP9Hx6X6y3P2
         +S3cwCicbIf/zX/kfwx9b5RMLdQpyj3L6JsoZ4WgZVoJwLMG/362owd+f+5hCmo4TASe
         kukw==
X-Gm-Message-State: AOAM533yUFRXPOL3Z+SUYJiz/FSQifNLajsA7QqLlpxAZRncabd6gh8O
	f2IQjF+bGHYXJQCUt4Bvd6Q=
X-Google-Smtp-Source: ABdhPJzEYrGovMTXImTbXk9YA87MxIb9ZVrue/3Zo4riO+iJWCIyynA12osskNdE0FBUUb1xsJE/1w==
X-Received: by 2002:a63:4726:0:b0:3fd:9e47:6b3f with SMTP id u38-20020a634726000000b003fd9e476b3fmr24629903pga.321.1654850628852;
        Fri, 10 Jun 2022 01:43:48 -0700 (PDT)
Received: from localhost.localdomain ([1.200.147.12])
        by smtp.gmail.com with ESMTPSA id c28-20020aa7953c000000b0051c01aa7d31sm11703568pfp.46.2022.06.10.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:43:48 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	ctcchien@nuvoton.com
Subject: [PATCH v12 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller driver
Date: Fri, 10 Jun 2022 16:43:37 +0800
Message-Id: <20220610084340.2268-1-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

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

Changes since version 12:
 - Pass ecc event count to edac_mc_handle_error.

Changes since version 11:
 - Update MAINTAINERS file

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
 - Shorten name of values to make them become more readable in npcm_edac.c.
 - Put spaces between the * and the text in npcm_edac.c.

Changes since version 6:
 - Fix warnings in npcm_edac.c.
 - Add information reported by kernel test robot <lkp@intel.com>.

Changes since version 5:
 - Update commit message for NPCM memory controller driver.

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
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  17 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 680 ++++++++++++++++++
 6 files changed, 769 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

