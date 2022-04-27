Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31295510FAC
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 05:52:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp4Z603xRz3bZp
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 13:51:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JJlNVM5S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JJlNVM5S; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp4Yh6VkFz2xlF
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 13:51:36 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4AD74137;
 Tue, 26 Apr 2022 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651031494;
 bh=fiHBh/Fh5zEGAH6yN71KI47zEv55JXWMRQICkzrdU2Q=;
 h=From:To:Cc:Subject:Date:From;
 b=JJlNVM5S2ycrHAuvWGNKCO+mC+eSG/qH5Awg4cMw8+4eeMZT3ECtCKsI/ovXbPBGo
 Vg5TRiNzlq+t0KMUAL7GQWvn4TyqFRkcZ9RBOtNPAlWJU27ol0HfUtw2YQBlyVORYz
 fGUY4P62bEwjyACYYnycdeBHjLGrlIxugI3lD7ig=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) delta-ahe50dc-fan: work around hardware quirk
Date: Tue, 26 Apr 2022 20:51:09 -0700
Message-Id: <20220427035109.3819-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
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
Cc: stable@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

CLEAR_FAULTS commands can apparently sometimes trigger catastrophic
power output glitches on the ahe-50dc, so block them from being sent
at all.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: stable@vger.kernel.org
---
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
index 40dffd9c4cbf..f546f0c12497 100644
--- a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
+++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
@@ -14,6 +14,21 @@
 
 #define AHE50DC_PMBUS_READ_TEMP4 0xd0
 
+static int ahe50dc_fan_write_byte(struct i2c_client *client, int page, u8 value)
+{
+	/*
+	 * The CLEAR_FAULTS operation seems to sometimes (unpredictably, perhaps
+	 * 5% of the time or so) trigger a problematic phenomenon in which the
+	 * fan speeds surge momentarily and at least some (perhaps all?) of the
+	 * system's power outputs experience a glitch.
+	 *
+	 * However, according to Delta it should be OK to simply not send any
+	 * CLEAR_FAULTS commands (the device doesn't seem to be capable of
+	 * reporting any faults anyway), so just blackhole them unconditionally.
+	 */
+	return value == PMBUS_CLEAR_FAULTS ? -EOPNOTSUPP : -ENODATA;
+}
+
 static int ahe50dc_fan_read_word_data(struct i2c_client *client, int page, int phase, int reg)
 {
 	/* temp1 in (virtual) page 1 is remapped to mfr-specific temp4 */
@@ -68,6 +83,7 @@ static struct pmbus_driver_info ahe50dc_fan_info = {
 		PMBUS_HAVE_VIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_FAN34 |
 		PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_STATUS_FAN34 | PMBUS_PAGE_VIRTUAL,
 	.func[1] = PMBUS_HAVE_TEMP | PMBUS_PAGE_VIRTUAL,
+	.write_byte = ahe50dc_fan_write_byte,
 	.read_word_data = ahe50dc_fan_read_word_data,
 };
 
-- 
2.36.0

