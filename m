Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC62717FB
	for <lists+openbmc@lfdr.de>; Sun, 20 Sep 2020 22:52:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvfrb54y5zDqgw
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 06:51:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvfnp2yPWzDqcl
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 06:49:28 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08KKmfuV002773;
 Sun, 20 Sep 2020 23:48:41 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id AF7F5639D5; Sun, 20 Sep 2020 23:48:41 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: wsa@kernel.org, andriy.shevchenko@linux.intel.com, kunyi@google.com,
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
 tmaimon77@gmail.com
Subject: [PATCH v1] i2c: npcm7xx: Clear LAST bit after a failed transaction.
Date: Sun, 20 Sep 2020 23:48:09 +0300
Message-Id: <20200920204809.132911-1-tali.perry1@gmail.com>
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

Due to a HW issue, in some scenarios the LAST bit might remain set.
This will cause an unexpected NACK after reading 16 bytes on the next
read.

Example: if user tries to read from a missing device, get a NACK,
then if the next command is a long read ( > 16 bytes),
the master will stop reading after 16 bytes.
To solve this, if a command fails, check if LAST bit is still
set. If it does, reset the module.

Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index dfcf04e1967f..2ad166355ec9 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2163,6 +2163,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (bus->cmd_err == -EAGAIN)
 		ret = i2c_recover_bus(adap);
 
+	/*
+	 * After any type of error, check if LAST bit is still set,
+	 * due to a HW issue.
+	 * It cannot be cleared without resetting the module.
+	 */
+	if (bus->cmd_err &&
+	    (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
+		npcm_i2c_reset(bus);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/* reenable slave if it was enabled */
 	if (bus->slave)

base-commit: 856deb866d16e29bd65952e0289066f6078af773
-- 
2.22.0

