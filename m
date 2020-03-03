Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7549177377
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 11:06:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wt2b1SnZzDqXb
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 21:06:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wsxb5DlVzDqTn
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 21:02:05 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 023A1IvJ019843;
 Tue, 3 Mar 2020 12:01:18 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 20D19603B0; Tue,  3 Mar 2020 12:01:18 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
Date: Tue,  3 Mar 2020 12:01:14 +0200
Message-Id: <20200303100114.87786-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303100114.87786-1-tmaimon77@gmail.com>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
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

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 84a728af6664..bd38bf1ee6a1 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
-
 static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
 				unsigned int timeout)
 {
 	if (timeout < 2)
 		wdd->timeout = 1;
 	else if (timeout < 3)
-	      wdd->timeout = 2;
+		wdd->timeout = 2;
 	else if (timeout < 6)
-	      wdd->timeout = 5;
+		wdd->timeout = 5;
 	else if (timeout < 11)
-	      wdd->timeout = 10;
+		wdd->timeout = 10;
 	else if (timeout < 22)
-	      wdd->timeout = 21;
+		wdd->timeout = 21;
 	else if (timeout < 44)
-	      wdd->timeout = 43;
+		wdd->timeout = 43;
 	else if (timeout < 87)
-	      wdd->timeout = 86;
+		wdd->timeout = 86;
 	else if (timeout < 173)
-	      wdd->timeout = 172;
+		wdd->timeout = 172;
 	else if (timeout < 688)
-	      wdd->timeout = 687;
+		wdd->timeout = 687;
 	else
-	      wdd->timeout = 2750;
+		wdd->timeout = 2750;
 
 	if (watchdog_active(wdd))
 		npcm_wdt_start(wdd);
-- 
2.22.0

