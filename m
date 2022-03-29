Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C44EAA6B
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 11:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSPGP3q00z2xm2
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 20:22:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.48; helo=cantor.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 91457 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 20:21:52 AEDT
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSPG84FTyz2x9J
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 20:21:51 +1100 (AEDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4KSPG16nPbz4wy91
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 11:21:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
 by baptiste.telenet-ops.be with bizsmtp
 id C9Mk2700T49QC44019MkcM; Tue, 29 Mar 2022 11:21:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nZ82q-007Ecu-2L; Tue, 29 Mar 2022 11:21:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nZ82p-00CBgc-GL; Tue, 29 Mar 2022 11:21:43 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 Jason M Bills <jason.m.bills@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH] peci: PECI should depend on ARCH_ASPEED
Date: Tue, 29 Mar 2022 11:21:37 +0200
Message-Id: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Platform Environment Control Interface (PECI) is only available on
Baseboard Management Controllers (BMC) for Intel processors.  Currently
the only supported BMCs are ASpeed BMC SoCs.  Hence add a dependency on
ARCH_ASPEED, to prevent asking the user about the PECI subsystem when
configuring a kernel without ASpeed SoC support.

Fixes: 6523d3b2ffa238ac ("peci: Add core infrastructure")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/peci/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
index 89872ad833201510..0d3ef8ba0998d649 100644
--- a/drivers/peci/Kconfig
+++ b/drivers/peci/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig PECI
 	tristate "PECI support"
+	depends on ARCH_ASPEED || COMPILE_TEST
 	help
 	  The Platform Environment Control Interface (PECI) is an interface
 	  that provides a communication channel to Intel processors and
-- 
2.25.1

