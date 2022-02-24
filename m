Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80D4C39C9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 00:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4TvF5nlXz3bTl
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 10:41:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R0M4j5wp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R0M4j5wp; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45Lt1f39z2xrm
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:15:34 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so1398196pja.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=W7sYQJpV/1TTOPCMlo79NSJ3PxinSPdjztCu/wR0/MI=;
 b=R0M4j5wpt3ujVcwAnddRhDbMtF74+yF4/g/MBaN4IdXRFF8nOHK3927oVp+cCdtyYh
 fEp2XRupymP01e/dVmrq7q2LEKgxx4m/HTNFVtPwqJw2EDYs0uo/Yp5RpP3+jKLqLE5e
 KRmoCEc/mxqNY0yvU82/4EFe2zO+Ku7Ug/nIu+iqt5P8A1mGDyFqFGftsdKNsycTu/8m
 UCDgjcNXlh95iD78UEd8QyChw8/evalUahwl2g+GzA15HPGNwHztT2JtAIt7jvvsOVyI
 V2QAfHK2CsrrIUdU+iEUCvRaJZnC1ImvjHsCmHgsgr1PQI+wee5dWZG5L5s6XrzvWOjW
 HvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=W7sYQJpV/1TTOPCMlo79NSJ3PxinSPdjztCu/wR0/MI=;
 b=Q3Ev9Dz2nQnf5z4VGFmmAvK/Of+zAMmPC4RxAXDQt+6wl89ajhHs7geO7zPfsBuMAa
 veK91PMjMKF9No63XC27N60/Zx09dBEaGeKFm50aLLuOOvSAFvusEtRutxEy+yMJGCVD
 Hrm65FNKC0Fdq8fm+5FOQxlygTYj621Mis0+iJTkj7g2zWhZEo+RqIPU4dW3i9w9iV3r
 sUrM0xLdGhvbRtOjbGGjzRf15Edwd1UV8oIXum1vjCaT/HG6SgG3kdyYDaxzHN6wqfhh
 ro5JxxG7xxalZtczNPmy1uFBVmVbcMk+zFLkIVWHyPShetyuddbAP9nBigoPWnfFuoLx
 cEVg==
X-Gm-Message-State: AOAM532iMVr+ddyPL6iv3t4xBAI2m3YJ9jVihmOF9nIPKq24+znzlqT6
 oqbM8jwNjnUbqbQmenBuI4J3vnOC1a3Gmw==
X-Google-Smtp-Source: ABdhPJyJKUvcPSohgtvBJEQZQ6vW0pFCFCCUl76l5yrCsGIs1jk6IyIUOMdNVwojivXlJzO/h5cIGQ==
X-Received: by 2002:a17:902:f68b:b0:14f:c84c:ad6d with SMTP id
 l11-20020a170902f68b00b0014fc84cad6dmr1345785plg.155.1645688860171; 
 Wed, 23 Feb 2022 23:47:40 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id z21sm1616839pgv.21.2022.02.23.23.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 23:47:39 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v1 0/3] edac: npcm: Add driver for Nuvoton NPCM SoCs
Date: Thu, 24 Feb 2022 15:47:26 +0800
Message-Id: <20220224074729.5206-1-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 25 Feb 2022 10:40:00 +1100
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
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patch series add EDAC supoort for Nuvoton BMC.
Add driver to support EDAC for NPCM SoC.

Medad CChien (3):
  ARM: dts: nuvoton: Add new device node
  dt-bindings: edac: npcm-edac.yaml
  EDAC: nuvoton: Add nuvoton NPCM EDAC driver

 .../devicetree/bindings/edac/npcm-edac.yaml   |  64 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 712 ++++++++++++++++++
 5 files changed, 793 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

