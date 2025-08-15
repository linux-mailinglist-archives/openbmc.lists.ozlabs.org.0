Return-Path: <openbmc+bounces-459-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEEB277DE
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 06:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c38hD4zklz3blF;
	Fri, 15 Aug 2025 14:46:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755220890;
	cv=none; b=R1m5h+tTtodPw3uXFiiqynP7QD+mJNenEYWrWKvQ8vQYUUvrGzDcBS+YByZERHbuuLzP7EeIDaHlpKlpStnLmZYRF2sVhBsojR+9n3pwPIXkBIuNTovy4gjm7YxbkH3JQJnl2TZQOQPsoM8Q1VE3Cy9+aeMVaWiP9rTVjGYTUI3+exiSOu94Tw8a4+3NTjBvV1va3yWOC8dQxgJuak5xWQW4vo93BqN8mtHgUBu3TFUoRI7vb/rBs+yGTlGpNaTKQOXGS3ZbocCj7DDq4HgUN9Y+iuXvofJjWimPxjJLDenR+fzwNuqR2iTeM3lC7URler56KfxAzeY/AMZAtW7aPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755220890; c=relaxed/relaxed;
	bh=4XTe6SAjPrh6eLmgJpQAcR9tk8Cc+w77k3IaaZ7jyIU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=naecD6qiHVWuXu5gja87RKJChk1RU3O0bHBAcEE9B6417kG5s12gn73PRyc7+6rH3kDlKn7enBiVbqG6CuPhd19GT4REy+uvL06zAbmbUr0zEOaQn++i4o+oHkTdUEIrrxcn6XsnZcBKSlbfm6iHbu9Pf+Q+RNKjiiC9VR4ioLnWts3J9Psuos+qVtuxwt79kyJNMRa995iMuCZ6DBPdPc4BIkMMFp+i4cywDDqtybIHOLsq09Hw6zFOcAuKLX0B0SBPn+itzY9/wzZW3RjdYccS8d+GBM9i2o7F1PprOHZdOnd9Y7pc85YzuD1z7gfISEm+SsrPgfImZxxkbbAacw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nna9Dvj5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=allen.wang.quanta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nna9Dvj5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=allen.wang.quanta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c347r2KmJz3bTf
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 11:21:27 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2445805aa2eso14774915ad.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755220884; x=1755825684; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XTe6SAjPrh6eLmgJpQAcR9tk8Cc+w77k3IaaZ7jyIU=;
        b=nna9Dvj58w6hJqVncJb4xl65nAENDoC069+eCJyNSpjOiE8smPfMgKKBIY/ARFR7za
         xUySVhwa65KkUAdTLfKdk7wra+ZlHRgQDlOT9aznhRSYhJgSpun9xhzb3CQNhCat+pDM
         8ox2Ug/S7IPc+FkywiV0OPRptSMcEi8EoJWJ7AfNS4YeJJvcgLaBLiUtv4aI/I2CJ9kE
         meUgVM8U1XXXhrKmOktDJPS2+QNHUKgaCqc/xIY/uapxfFU1T+r3LKtMWYRSJSgsMB/u
         z8xpeV75Kq91iZLkezR/OEebg+m9tn7A7aXxq3+oPhpJdm3r4Lw/WgKAG+6GiJZIriQa
         rpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755220884; x=1755825684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XTe6SAjPrh6eLmgJpQAcR9tk8Cc+w77k3IaaZ7jyIU=;
        b=CKwqb0Zxan2kbuK4248QUrK67ST3dZPy68nbkMV7+ooq5PL01cGEaJuPDK12ME6T6m
         OSiCiIinSTQRdlDmrtBLPvwDRA7zkAwSBwfHPRPvsiiAnrRGMutW4BQYd2+0IQdVurMA
         YKd1lxnaiiLXik3S8aiO9yMNzcLy/LzVWczo58UHD4CP0NfgwcJgO4bi9RyzfFZzKmgo
         07Cw+5zbteXBs1QBVniV6SJurln6Y0mQ7FY6jrpid+Lk17gpuJhvZczPlOpgwJ9C/r+5
         RqOuM4OpE09vcVW07lFIQgYqbi6YHRanecesQ4feB8yTsVYT137ROaAIUqyZ6uX5H6fF
         wMIw==
X-Forwarded-Encrypted: i=1; AJvYcCUKyAvBLITxh39O3PkeYd357Lm0EFCGeZ2sd406+h/uj0LBNDkWWCUpEN3CIn+pFC0fU4t+SAB2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHvtU7AK7fjh/weJS+ofu7bj3XirkPBNU4N+4HW7Ro5rSp/rwJ
	FwKXzm7xKM5eRF/C6m+EHVE3rXmplxy4ob40yO43kTKK7f5Dd5exyrde
X-Gm-Gg: ASbGncs0YVe3NSFdU1nR+jTOfKMocIW80Jt+2hWMH3aI4+5+y0SWb5iF6fa4LeKmkIe
	TQ3PXRIBqIHJMApBw9DEs1amr1jtY8f3H4xsiDWNarp+qpMMzHNISqQSk13/F2t0zO0S+SaXLYj
	vlmqylZPUf9G2XCIiN0T5bVw1i2cz4GsDhshlyyL605kcHEYTLFFVxdfAe585W4Hp9c+9e3uXGE
	QO2JKQZZljRTW0rC43Dsse1DVZFBiTvvwCoh+1zxuInyRqmkx5r5w2c8NDlUx0t2lCf41YUAMac
	wCudRnLDy8K5FGxv4xRDLtcNz3CzdnrbnkBki9Qp/brG9Ld8QdDdCS/RSUHv40JHbxxW8ynSYBT
	T72+2UGmeo9stApgf0+G/82XLjtktly7MJgxWP64wNSD8pTSC2kpjJhZqx5xrq9DqJBZpB2QoW2
	79/vAFQCJmRmwEKMX0g8oBX9BkyOT/
X-Google-Smtp-Source: AGHT+IHOs0X9df1jLDMMi+1wURPIVF89m4hhuaFhq8atYmY6FOPeE67UFETMtDdfUoNQnIy85NZz8w==
X-Received: by 2002:a17:902:cccb:b0:235:7c6:ebdb with SMTP id d9443c01a7336-2446d6dc1bemr3987685ad.10.1755220884192;
        Thu, 14 Aug 2025 18:21:24 -0700 (PDT)
Received: from allenwang-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5637acsm1582955ad.143.2025.08.14.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:21:23 -0700 (PDT)
From: "Allen.Wang" <allen.wang.quanta@gmail.com>
X-Google-Original-From: "Allen.Wang" <Allen_Wang@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 1/2] hwmon: (pmbus/adm1275) add adm1281 support
Date: Fri, 15 Aug 2025 09:19:20 +0800
Message-Id: <20250815011921.716573-1-Allen_Wang@quantatw.com>
X-Mailer: git-send-email 2.25.1
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

From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>

Add support for adm1281 which is similar to adm1275 and other chips
of the series.

Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Link: https://lore.kernel.org/r/20240425070948.25788-3-jose.sanbuenaventura@analog.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 916300902725b362d5008ee10825a39056f0b095)
---
 Documentation/hwmon/adm1275.rst | 14 +++++++++++---
 drivers/hwmon/pmbus/Kconfig     |  4 ++--
 drivers/hwmon/pmbus/adm1275.c   |  7 +++++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 804590eeabdc..467daf8ce3c5 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
 
+  * Analog Devices ADM1281
+
+    Prefix: 'adm1281'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/adm1281.pdf
+
   * Analog Devices ADM1293/ADM1294
 
     Prefix: 'adm1293', 'adm1294'
@@ -58,10 +66,10 @@ Description
 -----------
 
 This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
-ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
+ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
 Digital Power Monitors.
 
-ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
+ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
 controllers that allow a circuit board to be removed from or inserted into
 a live backplane. They also feature current and voltage readback via an
 integrated 12 bit analog-to-digital converter (ADC), accessed using a
@@ -144,5 +152,5 @@ temp1_highest		Highest observed temperature.
 temp1_reset_history	Write any value to reset history.
 
 			Temperature attributes are supported on ADM1272 and
-			ADM1278.
+			ADM1278, and ADM1281.
 ======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 81c10dc0d1bd..dd4514628975 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -51,8 +51,8 @@ config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
-	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
+	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
+	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e2c61d6fa521..59ffc08289bd 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -482,6 +482,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
+	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -555,7 +556,8 @@ static int adm1275_probe(struct i2c_client *client)
 			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
+	    mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -703,6 +705,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1278:
+	case adm1281:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.25.1


