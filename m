Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34218174CA3
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 10:45:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VdgV3FtwzDrCD
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 20:45:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VdZQ20xWzDr8C
 for <openbmc@lists.ozlabs.org>; Sun,  1 Mar 2020 20:41:15 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 0219ehYm028747;
 Sun, 1 Mar 2020 11:40:43 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id C7D2660330; Sun,  1 Mar 2020 11:40:43 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v1 2/4] watchdog: npcm: add restart priority support
Date: Sun,  1 Mar 2020 11:40:38 +0200
Message-Id: <20200301094040.123189-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200301094040.123189-1-tmaimon77@gmail.com>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add NPCM watchdog restart priority support.
The default restart priority is 128.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 9c773c3d6d5d..8609c7acf17d 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -181,6 +181,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct npcm_wdt *wdt;
+	u32 priority;
 	int irq;
 	int ret;
 
@@ -196,6 +197,11 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (of_property_read_u32(pdev->dev.of_node, "nuvoton,restart-priority", &priority))
+		watchdog_set_restart_priority(&wdt->wdd, 128);
+	else
+		watchdog_set_restart_priority(&wdt->wdd, priority);
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
-- 
2.22.0

