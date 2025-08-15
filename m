Return-Path: <openbmc+bounces-458-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC8B277DD
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 06:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c38hD4k1Nz3bkb;
	Fri, 15 Aug 2025 14:46:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755220890;
	cv=none; b=EFTcGB/g/xQpq1JgJvRoO/a5KEy+4Ej6eKAhWRfJnay7btijqllKMavo4/db6nC/EoMB8t303TsVdmcAMadm2E+fMXspTiUUOB4bzjBiZkPhZADTqUCVrva0wIGJZiURKGfv4s+X9WRAyq2O7Nt3V9krSMeOiyKimT8e6uqUre9LDfHGvAshkF0BDmZSRIr+X7vg0UsPFSp7ygFpZERPGPYyivyTMvfzISQ1Zz37OlUyjC3a8rSQYu4Zf0f42kIIBzd+T8mfugpnak59N2ofPNBGNkVd3cthFWLgFXoOwMluf2WZfN/a0cKy1yUdvq3+ItRq9yeMSu0ykfckgLDOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755220890; c=relaxed/relaxed;
	bh=7bT61b4lDSfRLW37S1TqW19G6wc46GPdF/8w3PLeOJI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWUQAww+ZDbcTjmEwwyLgQB7NREG1gYrt3+BJ6j6XmG4ZGcCCsFSv3zr/C5HRrIkkqA+Sg+Hx5KaiuEUMjPPrRbb4WUzPvAzPBJeX+eD1uQzAGG6Varz2qpq+m7Wi15CaPoYPVOHJqjUJNOckD7TWDzlrog7uxiC4DExdUX0EMKBdRhZQGgOUQj1ROWKGeSCOypfWQl81mQIdNS6T3BEgKs5wdhkqVGdmO3OThwdsJ/PVY9Ep7TsN4cLojYjerfvBsLHZZ7Df2hervVe65dFrzrBdp8wEIsoexWyUk9YyYRz4noZ5y3bTU6g+49kAe9P+F2RmdGOg3zz14fg4Bmsng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hDQZyahl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=allen.wang.quanta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hDQZyahl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=allen.wang.quanta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c347r1PwXz30Vs
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 11:21:27 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4717553041so1214570a12.3
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755220885; x=1755825685; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bT61b4lDSfRLW37S1TqW19G6wc46GPdF/8w3PLeOJI=;
        b=hDQZyahlx69UVWM94IqBCP0tFjoIsgDMCd/HyouACt4urLLpALKfsQIoU2a3EBOWO2
         USC1KRyCockgf6pfl88stGaq6XICy02Gy2nw1W+4oHl9GSwkLQxYchCMkA5lrjcfVxcH
         k4TE/+QlEjFqim2gD37YadjuEhq6NVajw9yDjO1EL/aKMZlQyG0eYlt8/1sYowsGlwV6
         6P7v9nXxsw2clnkE6oFAZHdDNzizlZ7Y/W4XrtujoXBMIa/PXs9MaGWsnr9FUF8P0YvU
         A90OOzR3W+IMhb2dHl9YSaekiQTWrbJkHd4GVAYojB+tY2C3q9eGL4Szt8PosEEqGsWn
         6JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755220885; x=1755825685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bT61b4lDSfRLW37S1TqW19G6wc46GPdF/8w3PLeOJI=;
        b=Id9qKUyLzF9JadxzrH/ROBLHP+bfgGiKPAFYDroQUznQJAxg1nc9Q5Z9UMnjFeWsaY
         MOvqhmAxm6iSq5Z9WYtGMiYTU4QbA/qvipwdVFryOrhNBRJpCNTKRWxxmZQo4CjwLand
         mGjcc4gL6DQHN6ytBT2JiyQYWdfCoCHRi7hbIIL0316ISSwQLvbnrTVWlIV/UqID0Bcv
         xGSrnL2p/mEnX+aA9Z6szGhL3064UPmeKm9FbBYeXSgtUnoFtnf53Ulq0wc9nes/Sfy/
         n7Rqbwmj6d7fDBR0Y6zEgWJWms3ZHegb0ppurrxGaRGm+uDqHOztUf8CcpTxP1VE2UJL
         0oGw==
X-Forwarded-Encrypted: i=1; AJvYcCW8bltQzNHHC6/OCGhoavIZP0leQFivN43DTsmzxKYsJFazwIDKRKK1Sf7wShW4Cg7MzSUM7NF8@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0NaRV3vs1rGugTfTFSta15l0XzJzGR7JyQkNx1Gh4/8foNPIi
	TVuL4ST2I9RA+ObqI2qBVvLbTJ3d1boHeYldL8z7a0roAyVMd9/MrC1Qu1Tbbyna
X-Gm-Gg: ASbGncsjxpFNw6DbaDEF7jYrJnKcze0V5y6Zdr+WdvOUzG3h50lhJkBm/dYXBbtAftW
	4cexyKbfhI/jHQgz+TsmAfEm+K8gUKAoVC8dOlZYgqGhfmsrO2E3YS41lwDj1ggNZRfHTNK+d5A
	lTskrHeDERo2TQUgwW6x/fUkc2r/7PgSnrmWrt876U/FXWowpnkP20qnrIsXOku6z6C7HJvqpdy
	jgsLlL3dIHrXpoq94WXmdiaOSp41xrDGzR4o1YsmrI2GVWILYgxfk8bOW5wa2I9RhZdv/PcRBzk
	F5kS3UP5FlK/lmopUCLNjkJVNKbZ9J3B2CGxG9gGsEH72Adcr410ENQrIEsKwu6nXiGuh8vu4le
	U5sH7TTdeRE6Q6xR5cBuc4vQ1WzMG9bt2yKjgXeG8MJBaeXvIEWFMVtHufQmc4t2WCKB66njwWM
	gCINre0pSEA0IwUmez3ZPV3Mj0qk/g
X-Google-Smtp-Source: AGHT+IE2EJLiVhNsfTUftqMuvjuGl2p6fZGhzkyg/G3ZcPhpQvvfu52QV9bAju9u3fmeejon6xkvog==
X-Received: by 2002:a17:903:24e:b0:240:8704:fb9 with SMTP id d9443c01a7336-2446d948463mr3906515ad.53.1755220885351;
        Thu, 14 Aug 2025 18:21:25 -0700 (PDT)
Received: from allenwang-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5637acsm1582955ad.143.2025.08.14.18.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:21:25 -0700 (PDT)
From: "Allen.Wang" <allen.wang.quanta@gmail.com>
X-Google-Original-From: "Allen.Wang" <Allen_Wang@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 2/2] hwmon: (pmbus/adm1275) add adm1273 support
Date: Fri, 15 Aug 2025 09:19:21 +0800
Message-Id: <20250815011921.716573-2-Allen_Wang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250815011921.716573-1-Allen_Wang@quantatw.com>
References: <20250815011921.716573-1-Allen_Wang@quantatw.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Add support for adm1273 which is similar to adm1275 and other chips
of the series.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Link: https://lore.kernel.org/r/20250106131740.305988-3-johnerasmusmari.geronimo@analog.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit adc52dd4078067fabf1431036ba180eafd8a7eee)
---
 Documentation/hwmon/adm1275.rst | 28 ++++++++++++++++++----------
 drivers/hwmon/pmbus/Kconfig     |  2 +-
 drivers/hwmon/pmbus/adm1275.c   | 10 ++++++----
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 467daf8ce3c5..57bd7a850558 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -19,6 +19,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1272.pdf
 
+  * Analog Devices ADM1273
+
+    Prefix: 'adm1273'
+
+    Addresses scanned: -
+
+    Datasheet: Not yet publicly available
+
   * Analog Devices ADM1275
 
     Prefix: 'adm1275'
@@ -66,14 +74,14 @@ Description
 -----------
 
 This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
-ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
-Digital Power Monitors.
+ADM1273, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap
+Controller and Digital Power Monitors.
 
-ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
-controllers that allow a circuit board to be removed from or inserted into
-a live backplane. They also feature current and voltage readback via an
-integrated 12 bit analog-to-digital converter (ADC), accessed using a
-PMBus interface.
+ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and
+ADM1294 are hot-swap controllers that allow a circuit board to be removed from
+or inserted into a live backplane. They also feature current and voltage
+readback via an integrated 12 bit analog-to-digital converter (ADC), accessed
+using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -141,7 +149,7 @@ power1_input_highest	Highest observed input power.
 power1_reset_history	Write any value to reset history.
 
 			Power attributes are supported on ADM1075, ADM1272,
-			ADM1276, ADM1293, and ADM1294.
+			ADM1273, ADM1276, ADM1293, and ADM1294.
 
 temp1_input		Chip temperature.
 temp1_max		Maximum chip temperature.
@@ -151,6 +159,6 @@ temp1_crit_alarm	Critical temperature high alarm.
 temp1_highest		Highest observed temperature.
 temp1_reset_history	Write any value to reset history.
 
-			Temperature attributes are supported on ADM1272 and
-			ADM1278, and ADM1281.
+			Temperature attributes are supported on ADM1272,
+			ADM1273, ADM1278, and ADM1281.
 ======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index dd4514628975..60e74ced989a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -51,7 +51,7 @@ config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
+	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
 	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 59ffc08289bd..72f2fc379f2f 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -479,6 +479,7 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
 static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1075", adm1075 },
 	{ "adm1272", adm1272 },
+	{ "adm1273", adm1273 },
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
@@ -555,9 +556,9 @@ static int adm1275_probe(struct i2c_client *client)
 			   "Device mismatch: Configured %s, detected %s\n",
 			   client->name, mid->name);
 
-	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
-	    mid->driver_data == adm1294)
+	if (mid->driver_data == adm1272 || mid->driver_data == adm1273 ||
+	    mid->driver_data == adm1278 || mid->driver_data == adm1281 ||
+	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -630,6 +631,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1272:
+	case adm1273:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.25.1


