Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C056C3F03
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:18:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph8G301dvz3cHG
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 11:18:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=pengutronix.de (client-ip=78.46.208.201; helo=magratgarlick.emantor.de; envelope-from=r.czerwinski@pengutronix.de; receiver=<UNKNOWN>)
X-Greylist: delayed 427 seconds by postgrey-1.36 at boromir; Fri, 17 Mar 2023 07:55:23 AEDT
Received: from magratgarlick.emantor.de (magratgarlick.emantor.de [78.46.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pczzv1kHSz3cdy
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 07:55:20 +1100 (AEDT)
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
	id 13680E4CC0; Thu, 16 Mar 2023 21:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	magratgarlick.emantor.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from localhost (unknown [46.183.103.8])
	by magratgarlick.emantor.de (Postfix) with ESMTPSA id 93AABE4C53;
	Thu, 16 Mar 2023 21:48:04 +0100 (CET)
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: npcm: remove select of non-existant ERRATA
Date: Thu, 16 Mar 2023 21:47:50 +0100
Message-Id: <20230316204749.19902-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Mar 2023 11:17:46 +1100
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
Cc: openbmc@lists.ozlabs.org, Rouven Czerwinski <r.czerwinski@pengutronix.de>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

config ARCH_NPCM7XX selects ARM_ERRATA_794072, however this config
option does not exist since the workaround for the errata requires
secure mode access which needs to be run by the bootloader or firmware
since linux can't determine whether it is running in secure mode.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 arch/arm/mach-npcm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 63b42a19d1b8..d933e8abb50f 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -30,7 +30,6 @@ config ARCH_NPCM7XX
 	select ARM_ERRATA_764369 if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754322
-	select ARM_ERRATA_794072
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
 	select MFD_SYSCON
-- 
2.39.2

