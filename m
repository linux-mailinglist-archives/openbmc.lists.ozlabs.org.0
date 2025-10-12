Return-Path: <openbmc+bounces-728-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A5BD003A
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 09:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cksKK3Hhgz2yGM;
	Sun, 12 Oct 2025 18:18:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760253525;
	cv=none; b=acECUZSZf38lSLHDWrKs5AfA1ZXjdv7h3kY40b/XDqDPss/Mx1F4SrwfDK74imjL39H6uEzgOoYBcsPkPEWV5eo3i2T8M6yGJENBCuxieb8c33+8984KV/S/tynZFV5qaRnmCE3Xii5oGkLHschM9gY1lWGyFmOjUt6Z0qV527/+fFgYPbyB0G76rgtw9fjXOteTdiAs8rLa4qiFWZ0mWQC0Xl1d1k95uww8J7pVmbeFfDgRePQsvdJ7YmnZqU1ezyS9EacLJq0WCgiIeCAYJVyBEJw/8qyB7b7AvvyRRMLllf0Y9au5C6pksfCvjjn7EANSBgVIAh0Clc7VQCRghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760253525; c=relaxed/relaxed;
	bh=Wt2VLrErVi1LQGd/knGgS0qk23FbjzPwWNeisKIM8sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDkczoD5CsPGt3S1hGsuVNeW50lSzOImhvN090PR52zRta+UViVR5gsa7JVMHqy42P5ycJ8+n3ItsZm3k4SHsJkfqrDDw/CJzceEt+t7+Yc13GncHKEHGw1Rk+tqHfkfqdLgowrEU8gFppzTN8HO6d1Nl7gTFbRkw6P+dYl7SKQoSjd4lrSOTnBsCntx+8rYa9A+6NX2D9FNJxnytlBK9g2OzLIwt4R4usAVP0l5j/iFFkdWYoanlDYbs8OTaS2OeRy/3BIR1hCRBgMWzJyM1F2tppqlBqqekg972ztLGcs30/odX3Kz8Bi3+I9/8dozqgC9pTUhogmLvRIe1aE+7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xd1nRIvN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xd1nRIvN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cksKH67Qdz2yqW
	for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 18:18:43 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33082aed31dso3419069a91.3
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 00:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760253522; x=1760858322; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt2VLrErVi1LQGd/knGgS0qk23FbjzPwWNeisKIM8sQ=;
        b=Xd1nRIvNqstbT4BZcfLoyX914e6aigQbCsOp8BJZDpJSay/efJ99bQQ6NX0Auinsd3
         ZYCkjekKOMqaf+JQl+K20evlnOhf9LpLo4i7KbPvsAL0EANHjoGEHxP1SH0d5voZ2uB9
         B17cvzvqXQqjYwVMl/mdzUjwg7s01F3lkrAwWuiKVehkK7jd18Jj83nRbVW2uTBHm75O
         f6V/tDvVTAxNm3QDEYynYy6LGUB9H1SMTUeocepNwMA7wEt9Bj2IAEkWZpXnZF9j67Pn
         37EqUl3wwJ+GzXXa7hx3OqViCudrYiaQCXHlEdxFF/TWLP5Y8GhwaKY5zjjJgqO0WdBW
         2r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760253522; x=1760858322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt2VLrErVi1LQGd/knGgS0qk23FbjzPwWNeisKIM8sQ=;
        b=c9FJLGwteN7eqWTA10hd9SJHI1OJIXbJPZJJkB9WOmQKmvDvHRCgh5x6PuWFKRQfoR
         uQVNJH6s1Bnxj1Pz7s3kexWaoAm2izd7P+AXC8PosoWRzR6TzjMYwZuk/2K7+4HDtYND
         crWWMAa6s0XYUoZkqcdwsqm3nMaTOKLS+G/w2Ihfk5EvAJ1VHj8BYQGdetdkXkPKcZ7Q
         aeXb+WR7Z2PQjL9D9qTUh0WojYO2+XuD/0LqYV2jpVRbAD2SPhUcgMntcuBlmu07jqKQ
         BqXdAGH7txOUFtuuWsN1J55vnZckDw62+zwHjgvnXzuJ/C0EL16suBaz7qBD59PpV+y5
         aaaw==
X-Forwarded-Encrypted: i=1; AJvYcCW9TGQxCe3pFWuRXKHZmoEEuah85yKverlFN1JGZaBUNOMiDxDlnknApAQlmKooVqM7aUnANNKm@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yze/NxzjM5Ty2kZHIg5W4IHAlFrZjJXCHyMNX9Q8EJsuvWddPfL
	Z1oDBsXwcdp/QdqHtPGGHUEMIKhObIIcXey913SVfeBas4DkkjzZPnPj
X-Gm-Gg: ASbGncvYNihcs+3zwfe0gOD4z9YN7JlEZtX4E/MzopeFp25BXTPULwfE3ZlNuuUwLtm
	ptJE2o8Fbicn62AsuXl1BJyTfoLZC6T4vgrg/CRvjsti0ZrAmn0UxRz5ib8dHkcxuiIsNE+57K1
	ltBPrky+3n8bzGn3zzeq+Q/sduVQuLFvaUqQmozyS9XnvRCt+zEpDYMFe64iga8nqLGF0gitzXb
	hx0RBRk5ZPNV1dJMX1nxE35rJ/Nk5XDxwrgOUILMlS1tRDmHGeTRm99igswM12p7NQ0O5C3KvG+
	m1asE23UefM/nKYBwBhscCOm0AWJA9FPOc6f5o9VFPzB69Z0n28YQ8m4rTerjYSzkjoLJ88w8PG
	cTJs7CiJNUQeuiMoW8bgCpph+ZYgB/X14976XNTVaUDxWyt30xjU4yuz0S/yWSEJoH/CExEB/s1
	9Q78RXueWbOMim9jgAn/cYJx0eILsP3W51RUMGfsEm+w==
X-Google-Smtp-Source: AGHT+IE/snt8rYlX9uL2siFgy8z9fsVwfWac8PbMtaUHH7Dw15PcCa5kaEpBJ+LmwQ3hUG/LZSsz5A==
X-Received: by 2002:a17:90b:4c4b:b0:339:9a71:efd8 with SMTP id 98e67ed59e1d1-33b513a24demr23639091a91.37.1760253521812;
        Sun, 12 Oct 2025 00:18:41 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b6192995asm8437897a91.0.2025.10.12.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 00:18:41 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.12 2/2] hwmon: (pmbus/mp5990) add support for MP5998
Date: Sun, 12 Oct 2025 15:16:33 +0800
Message-ID: <20251012071633.503539-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251012071633.503539-1-chou.cosmo@gmail.com>
References: <20251012071633.503539-1-chou.cosmo@gmail.com>
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

Add support for the MPS MP5998 hot-swap controller. Like MP5990, MP5998
uses EFUSE_CFG (0xC4) bit 9 to indicate linear/direct data format.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Link: https://lore.kernel.org/r/20250916095026.800164-2-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/mp5990.rst | 30 +++++++++++++--
 drivers/hwmon/pmbus/mp5990.c   | 67 ++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/mp5990.rst b/Documentation/hwmon/mp5990.rst
index 6f2f0c099d44..7fd536757ff2 100644
--- a/Documentation/hwmon/mp5990.rst
+++ b/Documentation/hwmon/mp5990.rst
@@ -9,9 +9,13 @@ Supported chips:
 
     Prefix: 'mp5990'
 
-  * Datasheet
+    Datasheet: Publicly available at the MPS website: https://www.monolithicpower.com/en/mp5990.html
 
-    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5990.html
+  * MPS MP5998
+
+    Prefix: 'mp5998'
+
+    Datasheet: Not publicly available
 
 Author:
 
@@ -21,7 +25,7 @@ Description
 -----------
 
 This driver implements support for Monolithic Power Systems, Inc. (MPS)
-MP5990 Hot-Swap Controller.
+MP5990 and MP5998 Hot-Swap Controller.
 
 Device compliant with:
 
@@ -53,7 +57,7 @@ The driver provides the following attributes for output voltage:
 
 **in2_alarm**
 
-The driver provides the following attributes for output current:
+The driver provides the following attributes for current:
 
 **curr1_input**
 
@@ -63,6 +67,14 @@ The driver provides the following attributes for output current:
 
 **curr1_max**
 
+**curr2_input**
+
+**curr2_label**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
 The driver provides the following attributes for input power:
 
 **power1_input**
@@ -71,6 +83,16 @@ The driver provides the following attributes for input power:
 
 **power1_alarm**
 
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+**power2_max**
+
+**power2_max_alarm**
+
 The driver provides the following attributes for temperature:
 
 **temp1_input**
diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c
index 4ce381a39480..9a4ee79712cf 100644
--- a/drivers/hwmon/pmbus/mp5990.c
+++ b/drivers/hwmon/pmbus/mp5990.c
@@ -8,6 +8,8 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
+enum chips { mp5990, mp5998 };
+
 #define MP5990_EFUSE_CFG	(0xC4)
 #define MP5990_VOUT_FORMAT	BIT(9)
 
@@ -110,10 +112,53 @@ static struct pmbus_driver_info mp5990_info = {
 	.read_word_data = mp5990_read_word_data,
 };
 
+static struct pmbus_driver_info mp5998_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 64,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 64,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_IN] = 16,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 2,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_byte_data = mp5990_read_byte_data,
+	.read_word_data = mp5990_read_word_data,
+};
+
+static const struct i2c_device_id mp5990_id[] = {
+	{"mp5990", mp5990},
+	{"mp5998", mp5998},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp5990_id);
+
 static int mp5990_probe(struct i2c_client *client)
 {
 	struct pmbus_driver_info *info;
 	struct mp5990_data *data;
+	enum chips chip;
 	int ret;
 
 	data = devm_kzalloc(&client->dev, sizeof(struct mp5990_data),
@@ -121,7 +166,15 @@ static int mp5990_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	memcpy(&data->info, &mp5990_info, sizeof(*info));
+	if (client->dev.of_node)
+		chip = (uintptr_t)of_device_get_match_data(&client->dev);
+	else
+		chip = i2c_match_id(mp5990_id, client)->driver_data;
+
+	if (chip == mp5990)
+		memcpy(&data->info, &mp5990_info, sizeof(*info));
+	else
+		memcpy(&data->info, &mp5998_info, sizeof(*info));
 	info = &data->info;
 
 	/* Read Vout Config */
@@ -140,6 +193,9 @@ static int mp5990_probe(struct i2c_client *client)
 		data->info.format[PSC_VOLTAGE_OUT] = linear;
 		data->info.format[PSC_CURRENT_OUT] = linear;
 		data->info.format[PSC_POWER] = linear;
+		if (chip == mp5998)
+			data->info.format[PSC_CURRENT_IN] = linear;
+
 		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
 		if (ret < 0) {
 			dev_err(&client->dev, "Can't get vout exponent.");
@@ -153,16 +209,11 @@ static int mp5990_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id mp5990_of_match[] = {
-	{ .compatible = "mps,mp5990" },
+	{ .compatible = "mps,mp5990", .data = (void *)mp5990 },
+	{ .compatible = "mps,mp5998", .data = (void *)mp5998 },
 	{}
 };
 
-static const struct i2c_device_id mp5990_id[] = {
-	{"mp5990"},
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, mp5990_id);
-
 static struct i2c_driver mp5990_driver = {
 	.driver = {
 		   .name = "mp5990",
-- 
2.43.0


