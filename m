Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C42570B9
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 23:32:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfmlJ25rmzDqQY
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 07:32:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfmkV5ZVbzDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 07:31:58 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 07ULVNUJ011608;
 Mon, 31 Aug 2020 00:31:23 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id BA033639D3; Mon, 31 Aug 2020 00:31:23 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: kunyi@google.com, xqiu@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au, tmaimon77@gmail.com,
 wsa@the-dreams.de
Subject: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
Date: Mon, 31 Aug 2020 00:31:21 +0300
Message-Id: <20200830213121.239533-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: openbmc@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

timeout_usec value calculation was wrong, the calculated value
was in msec instead of usec.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 75f07138a6fa..dfcf04e1967f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2093,8 +2093,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	/* Adaptive TimeOut: astimated time in usec + 100% margin */
-	timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
+	/*
+	 * Adaptive TimeOut: estimated time in usec + 100% margin:
+	 * 2: double the timeout for clock stretching case
+	 * 9: bits per transaction (including the ack/nack)
+	 */
+	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
 	timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);

base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
-- 
2.22.0

