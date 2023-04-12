Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5D6DFEA5
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 21:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxXbN0VVjz3cjK
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 05:20:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N/sr0Ikz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N/sr0Ikz;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxXZm0C9Cz3c2j
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 05:19:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681327160; i=j.neuschaefer@gmx.net;
	bh=VaVzOQrTyDTUfR4+6RnjitXAQ8yivcJJAu9s49yRhF0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=N/sr0IkzMPWlKEOMRE5+z3QLMeCbv0CJDtcY5Mcj7y9XBXaqxoLqKeWxKDqay39tR
	 xnB2Q/E0fnqeavSG05MMGqE+dhn1kcuoGnC1CbwJShqXpTaYwckmKsBsFQK6BZBkj5
	 lJY1jwygHEdoANd2gg9p8zm5JHOrfLUBaIHwt6zMQ+30lb3X1mwZVAkcR+HPXK1HGy
	 CfmT0llqi5qYZd58Ll/JqRNgELPW+r2zvOeNtGV3ZEXZZWQ3mT7lk4ZqVEfnk8YPqM
	 bJDEE9V6dd3qpxKPyB4J3n5lgXnjqQ+pTsDpt+7X+qD/CuXyDkGOU5Z2ImdZswWutI
	 wXilMIe2xgVPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1qYC2d3hkS-00wUx4; Wed, 12
 Apr 2023 21:19:19 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] reset: Enable RESET_SIMPLE based on ARCH_WPCM450, not ARCH_NPCM
Date: Wed, 12 Apr 2023 21:19:13 +0200
Message-Id: <20230412191913.3821805-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DrtxPhdAyUNp80ZrqKFGgQAMHjcR69ozwn61cg1yxBi0zg4gb9M
 tORRwRTTJ1DIayhrWWm7qL8A8i3DPaphizVtMReBo0Yxc5JOqV5ne/umxElAhTHFNVTIDVm
 jYx6GjWJAfggjIMwipJUhpH0OqTrBL7U50CV+ddSGHUD2Ti/AW2Hky/X3XxVJt2j5hv/pW7
 4Lcj7t451GqtzZeEPq/WQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WC1y2a621Ww=;I9+wyziHjqc1N+QAiP4j66pWUY/
 QVbaQVnN0Cr1yqjHWZAbAVegVmeX1Okjj+CUyRqjQdGgB0XL7tn1EAeeJnfmTJ676/aq15OEX
 esDGfTzDUaOOVIiNu6a7bYX21RVuUJm1IjfuswSu39jwbaRRX6YV4QgvqeenTX7yWn8jdFJ/P
 C42SXeT0ubvbAFvspBe+/TpOq1CvM67JOwEq6kJMULj/ZJT8Rc++vLzS9BlBDYLvX4juXXLpD
 RDV+dO+LhNpcOqN5pt0RJlwK4ra8UA6xiV6sZK3mZS0IYIq7eKOsDmElKFPpAMt0Tb7nAh8yl
 IZYXRDvRniNr9vN8uJ3h2kySZPiU2eZzooSDOL4Da3wmR20Ocbf9T9rCi75tSF4CfpAQtsyrz
 KmukbsPD+Kw03MnTXlbqAOyvI3lYKH3UeKX6ztjy6MXJEPwaDZHnQ/y3xZgujWZiW34hpSRYc
 8G+wB4BIH4V5MYwTPA5coZs8PTnYyFy1G9kZoEIu1w4qCVe+XfUF7rnjD/BAmEL9BcYlKv5aa
 hUwDFNonrCWODSbQ3DKZmGFsRcGeBfDntbg6iYJ3/Yl2Xkn2C5R9rWIw2vY6jkUIJLVCxw2AT
 PWummMZv6yr5O3ynn6mKMCRLNS/jhEDm5OzmAtftrQGzGkM0NSKlJJMBGhU6yHqi7uOWZlKsF
 QzfmnXpy6C0iqsSoSK0fTXRzflS7lkyZ2FQCYf/dSVmXGxGJmYg4PfFLnJnyxWTPvs/UcG+dM
 62gww8ueRqxtqI0HBCk5ehGl8tjKR9ycwL/URkCjm5DOKvy+0GtIVSpAUwp5dxabVXDZT64du
 wu5lNVCea/Z13mqQT+qBCByOSHbYNq4L1uqbnPvQ4Pz/nFbyw9KT5ywTIiLq+56+PV9Z4q1dj
 BQ/TVX80pu48SDEnYfFZHaNVHdu1MKT7J6gLck20wMZDo0yWv1S8XiysAKEsIBWmXi89AQ+Kf
 lp+Ko9uIniRwnR6occomWUKMVQ4=
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The reset-simple driver is used on Nuvoton WPCM450, but not on other
chips of the WPCM/NPCM family.

Narrow down the "default ARCH_..." line from ARCH_NPCM to ARCH_WPCM450,
to avoid unnecessarily compiling reset-simple on these other chips.

Reported-by: Tomer Maimon <tmaimon77@gmail.com>
Link: https://lore.kernel.org/lkml/CAP6Zq1hjbPpLMWST4cYyMQw_-jewFoSrudOC+F=
PP5qOxJz4=3Dxw@mail.gmail.com/
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/reset/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 4b36cdc73576c..16e111d213560 100644
=2D-- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -208,7 +208,7 @@ config RESET_SCMI

 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
-	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || ARCH_NPC=
M
+	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || ARCH_WPC=
M450
 	depends on HAS_IOMEM
 	help
 	  This enables a simple reset controller driver for reset lines that
=2D-
2.39.2

