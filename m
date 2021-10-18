Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8780432A51
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCZB0Gv1z3cCd
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GKsf1G7U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=GKsf1G7U; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCT74wMjz3c4g
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:17:31 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C5245C10;
 Mon, 18 Oct 2021 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634599044;
 bh=08x8zUaEg/e6pgv47UAY8VcUVQlEju7qoIXPBgdH4qA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GKsf1G7U1t/k5Z+SSp0xi+tUo+bwBjA6XmCbPeqXi+AYRCmxT7C+5zCM9pBSXszu9
 4+FYqhtQ9KFNwTi7GjbAaBOT1C0rdqvgV01krCAETI6PC3qw4jJNgrNhbr2cpN4PZz
 aTN8f3OrMGbozBedsCLUC4KtmjvfZBWaLrB6v9x0=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.14 7/8] hwmon: (pmbus/lm25066) Support
 configurable sense resistor values
Date: Mon, 18 Oct 2021 16:17:13 -0700
Message-Id: <20211018231714.19054-8-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211018231714.19054-1-zev@bewilderbeest.net>
References: <20211018231714.19054-1-zev@bewilderbeest.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The appropriate mantissa values for the lm25066 family's direct-format
current and power readings are a function of the sense resistor
employed between the SENSE and VIN pins of the chip.  Instead of
assuming that resistance is always the same 1mOhm as used in the
datasheet, allow it to be configured via a device-tree property
("shunt-resistor-micro-ohms").

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Link: https://lore.kernel.org/r/20210928092242.30036-8-zev@bewilderbeest.net
[groeck: Fixed checkpatch warnings]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/lm25066.rst |  2 ++
 drivers/hwmon/pmbus/lm25066.c   | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/hwmon/lm25066.rst b/Documentation/hwmon/lm25066.rst
index 9f1d7e4d3ca1..a2098eb24090 100644
--- a/Documentation/hwmon/lm25066.rst
+++ b/Documentation/hwmon/lm25066.rst
@@ -79,6 +79,8 @@ This driver does not auto-detect devices. You will have to instantiate the
 devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
 details.
 
+The shunt (sense) resistor value can be configured by a device tree property;
+see Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml for details.
 
 Platform data support
 ---------------------
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 7dc5ffeab77d..8402b41520eb 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -458,6 +458,7 @@ MODULE_DEVICE_TABLE(of, lm25066_of_match);
 static int lm25066_probe(struct i2c_client *client)
 {
 	int config;
+	u32 shunt;
 	struct lm25066_data *data;
 	struct pmbus_driver_info *info;
 	const struct __coeff *coeff;
@@ -534,6 +535,16 @@ static int lm25066_probe(struct i2c_client *client)
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	}
 
+	/*
+	 * Values in the TI datasheets are normalized for a 1mOhm sense
+	 * resistor; assume that unless DT specifies a value explicitly.
+	 */
+	if (of_property_read_u32(client->dev.of_node, "shunt-resistor-micro-ohms", &shunt))
+		shunt = 1000;
+
+	info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
+	info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
+
 	return pmbus_do_probe(client, info);
 }
 
-- 
2.33.1

