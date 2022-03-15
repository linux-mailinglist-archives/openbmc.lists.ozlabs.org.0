Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D94D9434
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 06:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHjLj0PM2z30KL
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 16:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lcouch33;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lcouch33; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHjLH5Btsz300L
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 16:55:18 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id p8so17914970pfh.8
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 22:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV4CLPiAxFiZ9vJZfubS3i47B7zCkYU3tvd0pu0JO/Y=;
 b=Lcouch33BK7VsQZOzvwVm7+tfFF2P4ZBVrzYpbYiC++2XGF1kxTKqoIUOOarueI359
 YyBEdKPLcb79/SMvUjpXiTJHbqxCpRTdHHLB93bMYeZSfJUDfrWyrxWg92sMuTx76BjC
 GUxeHEpWd5+vcaB2Z7CuWmtL+ojktOXi/S1XVx1d2BzfAmu+9+UgPj4r5BFPbi0DEoEC
 Jyn+PtU8Vm88OYeqlokxmW9cnHQbuBXN29e7uWfooJUNDH6nr0PSNkPyn3eMMbU43qXq
 zsvL3w748Is89x0ABoo8C2RJl96bffbeZlHC1kE5GoJDiRAoYWp950GF4h0s78JZw+tB
 BPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV4CLPiAxFiZ9vJZfubS3i47B7zCkYU3tvd0pu0JO/Y=;
 b=W0SZOFBosnWh21jn9wu1J+inYYaME/N0FdBeGMlH0DFruynyWVipogiPY7ASDGIZNS
 IEgGvjoKhHusKAvYmOFsFDPdGIHweGKz7O1oj96I/UljnfyX0onKG+fmjHsnifsckNhd
 WDqxmq4oQAueXezNuiKCUqhpW7kPAfMU3dZXIPvI50+lxo0YTmC01z1MP+YrFLZpnS36
 ycBHDG4lz9onVb8r/dXpomDlOJn0KhNsUitxVDmYBSM+MkqYdicmGsZ0HZxSfQV+wlCb
 FbgMxYKUOdXKuK8FWvlDcCtIbMrwvvaXZI1U5zHGNBCGS0aUo5v+7dCfZDPvlgR/WPmV
 o5WA==
X-Gm-Message-State: AOAM530+kvQdy22KZfbhqqLXRC1u43xAgv9+T8jTwjjITNXdmq70+Ec2
 XSa5Yr3tIfnPLL/+uJ14xQE=
X-Google-Smtp-Source: ABdhPJynkqv+iB5TqmzLr7kHGGlCCmmXG20uJCopgsl2IFsJKNmDi2nONXmXFJXhU4BlSib2a/T7Ew==
X-Received: by 2002:a63:4c2:0:b0:381:113e:2b07 with SMTP id
 185-20020a6304c2000000b00381113e2b07mr16052787pge.100.1647323714453; 
 Mon, 14 Mar 2022 22:55:14 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a634755000000b00368f3ba336dsm18679369pgk.88.2022.03.14.22.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 22:55:13 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v4 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Tue, 15 Mar 2022 13:55:01 +0800
Message-Id: <20220315055504.27671-1-ctcchien@nuvoton.com>
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
 drivers/edac/npcm_edac.c                      | 710 ++++++++++++++++++
 5 files changed, 789 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

