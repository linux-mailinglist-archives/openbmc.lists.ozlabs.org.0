Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EF28CB60
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 12:05:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9WQV16pgzDqf9
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 21:05:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (SPF Temporary Error: DNS The DNS
 operation timed out after 21.1222882270813 seconds)
 smtp.helo=herzl.nuvoton.co.il (client-ip=212.199.177.27;
 helo=herzl.nuvoton.co.il; envelope-from=tali.perry@nuvoton.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9WPg040KzDqcY
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 21:04:48 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 09DA3P1A022735;
 Tue, 13 Oct 2020 13:03:25 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 533D8639D6; Tue, 13 Oct 2020 13:03:25 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: wsa@kernel.org, andriy.shevchenko@linux.intel.com, xqiu@google.com,
 kunyi@google.com, benjaminfair@google.com, avifishman70@gmail.com,
 joel@jms.id.au, tmaimon77@gmail.com
Subject: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
Date: Tue, 13 Oct 2020 13:03:14 +0300
Message-Id: <20201013100314.216154-1-tali.perry1@gmail.com>
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

Systems that can dynamically add and remove slave devices
often need to change the bus speed in runtime.
This patch expose the bus frequency to the user.
This feature can also be used for test automation.

--
v2 -> v1:
	- Fix typos.
	- Remove casting to u64.
	
v1: initial version

Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9..633ac67153e2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
 /* i2c debugfs directory: used to keep health monitor of i2c devices */
 static struct dentry *npcm_i2c_debugfs_dir;
 
+static int i2c_speed_get(void *data, u64 *val)
+{
+	struct npcm_i2c *bus = data;
+
+	*val = bus->bus_freq;
+	return 0;
+}
+
+static int i2c_speed_set(void *data, u64 val)
+{
+	struct npcm_i2c *bus = data;
+	int ret;
+
+	if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
+		return -EINVAL;
+
+	if (val == bus->bus_freq)
+		return 0;
+
+	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	npcm_i2c_int_enable(bus, false);
+
+	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
+
+	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	if (ret)
+		return -EAGAIN;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
+
 static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 				  struct npcm_i2c *bus)
 {
@@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
 
 	bus->debugfs = d;
 }

base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
-- 
2.22.0

