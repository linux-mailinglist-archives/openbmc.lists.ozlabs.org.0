Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C804413C9
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 07:36:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjNbX52ljz2yPQ
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 17:36:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cp2KN2hQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=julianbraha@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Cp2KN2hQ; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgwNs3ddmz2xrr;
 Sat, 30 Oct 2021 08:22:03 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id r15so10681436qkp.8;
 Fri, 29 Oct 2021 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z7yVckty5p/EV21n48/dXnRFMYmZ7LcCmfku0IFTskI=;
 b=Cp2KN2hQspepxD6g73KMAa1hNtZ4RvSsejofN9KHU4EYlgGu0h+Y0GnFgqm/maiTfK
 jloy1qbf/iMYC3LZ7gw36Mfx4v9vOYKSVdkba86MNXZI8c3QaipFeRcgyn/vpyLA6p+D
 BlUXwJTLpz7I9eJqb3CsgPriHDYNur0WRS3aqhjFKA2bZuWsI4S7S7tMDek9VudTnAb6
 zcQG0mA5Ki6U+Z1VBQyHeC9Hs5Az1TTXJ7/8Mntq5sTvy38TFxgu30/pv9ki3fy8iKkj
 LNRfb4lQ7gTSXT0LEiK/zVeXrPnfjiHbPXOgm2n794kVYqFrylb0R0ktYf7cV6RAGfSu
 kuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z7yVckty5p/EV21n48/dXnRFMYmZ7LcCmfku0IFTskI=;
 b=Ffcucu08RreyaGizjJGxIceQFA8qVmOTcpwvCOL6bHylak7/1c1rC6POg2rV5YnGui
 RjAsBT3YtsCp0mUXEDCsy3rO0D0wk6LXx/nBDeowwYOH3j+8zIEo8npSe/qPX3TvThGo
 UN72Wf5USvkGna5ZkOI68wqnJdRS/wCioGRaftYK3LyE7m12ZA1ofHfFIQht/WrLq7hg
 4fIhHBF/PyZgTpTups8/FeONqU8Gu54ubDhUF3XDDpKgo0GfAA0w4HoAYfE1NoBrYldJ
 ED2aj0oeOClM+OVcyGfLSVBBVl/hSSMA+/ncXHWyet+Ds/tFMkpPuwgO5mvnPuRmtRfF
 xIaA==
X-Gm-Message-State: AOAM530PIkFl7y4UlvJhJQxnJdzIGuczXufv1rgz8FzwFfsbf4+auR98
 rqdNfnF6EQzmcOUcNi4nvQs=
X-Google-Smtp-Source: ABdhPJwUx7gsoBynRrmACjiin57ysUdf42t0pD6NQ8LlVg+NSZQ9NFn3u8wksgMPHSZ9aTQWCPx2mQ==
X-Received: by 2002:a05:620a:2a04:: with SMTP id
 o4mr11583582qkp.330.1635542518409; 
 Fri, 29 Oct 2021 14:21:58 -0700 (PDT)
Received: from ubuntu-mate-laptop.eecs.ucf.edu ([132.170.15.255])
 by smtp.gmail.com with ESMTPSA id u6sm1264258qtc.86.2021.10.29.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 14:21:58 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: andrew@aj.id.au,
	linus.walleij@linaro.org,
	joel@jms.id.au
Subject: [PATCH] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON for
 PINCTRL_ASPEED
Date: Fri, 29 Oct 2021 17:21:57 -0400
Message-Id: <20211029212157.14230-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Nov 2021 17:36:05 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When PINCTRL_ASPEED_G* is selected,
and MFD_SYSCON is not selected,
Kbuild gives the following warnings:

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_SYSCON [=n]
  Selected by [y]:
  - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 [=n] || COMPILE_TEST [=y]) && OF [=y]

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G5 [=y] && PINCTRL [=y] && (MACH_ASPEED_G5 [=n] || COMPILE_TEST [=y]) && O>

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G6 [=y] && PINCTRL [=y] && (MACH_ASPEED_G6 [=n] || COMPILE_TEST [=y]) && O>

This is because PINCTRL_ASPEED_G* selects PINCTRL_ASPEED,
without selecting or depending on MFD_SYSCON, despite
PINCTRL_ASPEED depending on MFD_SYSCON.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/aspeed/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
index de8b185c4fee..b0bae6144fc2 100644
--- a/drivers/pinctrl/aspeed/Kconfig
+++ b/drivers/pinctrl/aspeed/Kconfig
@@ -11,6 +11,7 @@ config PINCTRL_ASPEED
 config PINCTRL_ASPEED_G4
 	bool "Aspeed G4 SoC pin control"
 	depends on (MACH_ASPEED_G4 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 4th
@@ -19,6 +20,7 @@ config PINCTRL_ASPEED_G4
 config PINCTRL_ASPEED_G5
 	bool "Aspeed G5 SoC pin control"
 	depends on (MACH_ASPEED_G5 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 5th
@@ -27,6 +29,7 @@ config PINCTRL_ASPEED_G5
 config PINCTRL_ASPEED_G6
 	bool "Aspeed G6 SoC pin control"
 	depends on (MACH_ASPEED_G6 || COMPILE_TEST) && OF
+	depends on MFD_SYSCON
 	select PINCTRL_ASPEED
 	help
 	  Say Y here to enable pin controller support for Aspeed's 6th
-- 
2.30.2

