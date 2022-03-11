Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275C4D5775
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 02:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF7xX704Jz30FR
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 12:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hgM8E+RB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hgM8E+RB; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF7x53Kbxz2xgb
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 12:43:03 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id g1so6673755pfv.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 17:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=BP+86L+lIuRy6uRjMkCZyF2DvJ6c3trp41j9uZ3sVxs=;
 b=hgM8E+RBZ0dTNuJknt6CD2fx09iOVPsZUQOoCi6PwmLUGtVGN3RgqG96s0iVGH7iB1
 PH9jpN6UfH2GFamJQhWRogKeTgW4lZuDx45yvMMPWKv5WrEIz1RvJ71pj1kiqmygmZzU
 qJyVi0bP6jd3Ve7c6d7VhrECwmEtHyc6klMW+mWvtlkxEVVD5snRHAiNOILiQQUmy5o3
 G0Wi2ZgBtaXUwwh+Vrr67VWhCaWZD8gVVVLlyas8K5QS+f1NsHT7Wt8MJqHifrrMMf+F
 DpAqwyx4NdEqlY4MJwewIvzkktkvOg88oS4iwFYqRZfsGZh/W8SFHaZL/ehrgxX52k3A
 yUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BP+86L+lIuRy6uRjMkCZyF2DvJ6c3trp41j9uZ3sVxs=;
 b=wuPmxMtIeDsbVv91DewiNJEb/ruvS9Tnkhi5lYzqub2aJGgiPiI3A4Q9ZD00j1T4D/
 2QQGy7QAotWbjfmuS2W3phcwTh88jfbsVtwWaWkVs0gjov3fQWyjfBAhZhUT19Xh7Tvc
 ekpmvzcpB0910ilXhdmlfDbJQ+ZxA5BDQ0QMqfAhI5HnfhqVo627OkiOxc34o4SeHYbX
 oHpQjdUOTzNBCKCXGWN8x9OyxaMg2zVcIi+IIHxKc33dpuke+yTz2T3sScfVjWH+mzgD
 N8mFZzPNeU+n+djf+VvqNqEql6llmI1A2OygJA3kt0E4tEWkeDaHm4VCSQWyXZJY7Vmw
 cprw==
X-Gm-Message-State: AOAM5300oF8gR2EJ4zO9+CbOO9+sxUzI6cWdtTTxBWVxqJlOgUl4r4+I
 uDXsLZS9oH3X2UqjuswHNJQ=
X-Google-Smtp-Source: ABdhPJw4s8hxwtZjigPSX7XWokxaMTRbW0JF0Zac/tcWjw05dE0QhbsCicmgkB9Yqd+SzzZLuwA+fw==
X-Received: by 2002:a62:55c4:0:b0:4f6:b396:9caa with SMTP id
 j187-20020a6255c4000000b004f6b3969caamr7728287pfb.19.1646962975583; 
 Thu, 10 Mar 2022 17:42:55 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm7194383pjj.39.2022.03.10.17.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:42:54 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v3 0/3] EDAC: nuvoton: Add nuvoton NPCM memory controller
 driver
Date: Fri, 11 Mar 2022 09:42:42 +0800
Message-Id: <20220311014245.4612-1-ctcchien@nuvoton.com>
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
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for Nuvoton NPCM SoC.

Addressed comments from:
 - Rob Herring : https://lkml.org/lkml/2022/2/25/1103
 - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/27/63
 - Rob Herring : https://lkml.org/lkml/2022/3/2/828

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
  ARM: dts: nuvoton: Add new device node
  dt-bindings: edac: nuvoton,npcm-memory-controller.yaml
  EDAC: nuvoton: Add NPCM memory controller driver

 .../edac/nuvoton,npcm-memory-controller.yaml  |  62 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 714 ++++++++++++++++++
 5 files changed, 793 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

