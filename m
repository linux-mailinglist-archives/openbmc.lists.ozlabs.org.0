Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 148664A53F8
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnlv46XsKz30RD
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 11:20:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Jdec9XvS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Jdec9XvS; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnlsP35sDz2yY0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 11:18:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id ADCEBA21;
 Mon, 31 Jan 2022 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1643674726;
 bh=5JAGqQ9aEMCbf49zoPYAvYmpDWdGL6AiRKITJqVtblA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jdec9XvSbZB6dINvNo8j8U/DPNDuBaXcXWfr+z9nJHHsIKPsyMNjQBubFvz1z7N61
 GGm9m78Y2JRd5f5aG9NeQ+2CcclYcWECCKCcaQgxy5zJFxf52KzR8jHRWVjwbrzMNS
 D30AxO5vUFoN+Lvbtto5VypanEx2ZDFdnsCuqCxk=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 1/2] i2c: mux: pca9541: add delayed-release support
Date: Mon, 31 Jan 2022 16:18:09 -0800
Message-Id: <20220201001810.19516-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201001810.19516-1-zev@bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For heavily-utilized i2c busses, the overhead of reacquiring bus
ownership on every transaction can be quite substantial.  By delaying
the release of the bus (in anticipation of another transaction needing
to re-acquire ownership in the near future), we can reduce the
overhead significantly -- a subsequent transaction that arrives within
the delay window can merely verify that we still own it.

The new "release-delay-us" DT property specifies a number of
microseconds to wait after a transaction before releasing the bus
(zero by default so as to preserve the existing behavior of releasing
it immediately).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 56 ++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 6daec8d3d331..76269bf9f9ca 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/jiffies.h>
@@ -75,6 +76,8 @@ struct pca9541 {
 	struct i2c_client *client;
 	unsigned long select_timeout;
 	unsigned long arb_timeout;
+	unsigned long release_delay;
+	struct delayed_work release_work;
 };
 
 static const struct i2c_device_id pca9541_id[] = {
@@ -127,8 +130,11 @@ static int pca9541_reg_read(struct i2c_client *client, u8 command)
  * Arbitration management functions
  */
 
-/* Release bus. Also reset NTESTON and BUSINIT if it was set. */
-static void pca9541_release_bus(struct i2c_client *client)
+/*
+ * Release bus. Also reset NTESTON and BUSINIT if it was set.
+ * client->adapter must already be locked.
+ */
+static void __pca9541_release_bus(struct i2c_client *client)
 {
 	int reg;
 
@@ -138,6 +144,13 @@ static void pca9541_release_bus(struct i2c_client *client)
 				  (reg & PCA9541_CTL_NBUSON) >> 1);
 }
 
+static void pca9541_release_bus(struct i2c_client *client)
+{
+	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
+	__pca9541_release_bus(client);
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+}
+
 /*
  * Arbitration is defined as a two-step process. A bus master can only activate
  * the slave bus if it owns it; otherwise it has to request ownership first.
@@ -254,6 +267,9 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
 	unsigned long timeout = jiffies + ARB2_TIMEOUT;
 		/* give up after this time */
 
+	if (data->release_delay)
+		cancel_delayed_work_sync(&data->release_work);
+
 	data->arb_timeout = jiffies + ARB_TIMEOUT;
 		/* force bus ownership after this time */
 
@@ -276,10 +292,21 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
 	struct pca9541 *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 
-	pca9541_release_bus(client);
+	if (data->release_delay)
+		schedule_delayed_work(&data->release_work, data->release_delay);
+	else
+		__pca9541_release_bus(client);
+
 	return 0;
 }
 
+static void pca9541_release_workfn(struct work_struct *work)
+{
+	struct pca9541 *data = container_of(work, struct pca9541, release_work.work);
+
+	pca9541_release_bus(data->client);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -289,18 +316,13 @@ static int pca9541_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct i2c_mux_core *muxc;
 	struct pca9541 *data;
+	u32 release_delay_us;
 	int ret;
 
 	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
 
-	/*
-	 * I2C accesses are unprotected here.
-	 * We have to lock the I2C segment before releasing the bus.
-	 */
-	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
 	pca9541_release_bus(client);
-	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
 
 	/* Create mux adapter */
 
@@ -313,6 +335,14 @@ static int pca9541_probe(struct i2c_client *client,
 	data = i2c_mux_priv(muxc);
 	data->client = client;
 
+	if (!device_property_read_u32(&client->dev, "release-delay-us", &release_delay_us)) {
+		data->release_delay = usecs_to_jiffies(release_delay_us);
+		ret = devm_delayed_work_autocancel(&client->dev, &data->release_work,
+						   pca9541_release_workfn);
+		if (ret)
+			return ret;
+	}
+
 	i2c_set_clientdata(client, muxc);
 
 	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
@@ -328,6 +358,14 @@ static int pca9541_probe(struct i2c_client *client,
 static int pca9541_remove(struct i2c_client *client)
 {
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
+	struct pca9541 *data = i2c_mux_priv(muxc);
+
+	/*
+	 * Ensure the bus is released (in case the device gets destroyed
+	 * before release_work runs).
+	 */
+	if (data->release_delay)
+		pca9541_release_bus(client);
 
 	i2c_mux_del_adapters(muxc);
 	return 0;
-- 
2.34.1

