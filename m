Return-Path: <openbmc+bounces-647-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D2B7F004
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSny6bRzz3cQq;
	Wed, 17 Sep 2025 16:01:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088902;
	cv=none; b=SjqZC4tRZEeJkgNcbAO/AnTV7yXmOcvEfNRnAbhL0D1oGD6xC2y30vAbijLI1VVRAQ/SC/co3XHJvAHGXpRpkY1tQq2g+crFrPs4PRHVaGL54w+AJBwotPZP7mu9H8QIVsrU7wn7X88MG2CdMuTLViBGtIzuLlCJYDvKNAI1sX71OKaAdcNfz9njXedmMEkjy8y7PpUmE5Gj39HQnZ/F7ewQ1Awh2HWlVGRBgsRGo+gc9DFa3e6UOdjZr9uAUGfoK/5Qm3dMdj66vDMTlKxZMN6rVJEArKxxl8p4NdgDctaYYMtDKxPKFwrdeQeDi7hSE6tYmC2XGuJm7lqUwkAPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088902; c=relaxed/relaxed;
	bh=rxcUE4pzXEmmyODIqrBT3pIo0FuVO4H3bjanIDoGT84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVzmDAqSYr6AkT8RgZZAAUo7MFFhKan86a76c45NV9tQXPHCaXVFKbk/wcp6NSvBGKwPBoSrSDJsv7XGPUZeWqGdkkvq/xa6LW2AKWFdR0qce3RBrT2vCJA2+WaWtXe/hHlDJ84yRdqPAYaNEP6GExkhX4xr4Urn1vVCFkQRwPk/BMLv5ejPYeVCeAJ572Lp8mh1//LDzCaQaumSHL5OZ0SrhR7XQwkGEOUeGvGyoTNkncQO58TW1ojq+0cqsMZmp18+f2l6OiWcsCrLHvkOn8oGi00NwYd2h2DN5sikMXkO3vFrTEBxLiktUOrinypgC1ORXhdy+Pq5IahycPkcuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lkjYDnwx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lkjYDnwx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSnx4nwrz3bjb
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:41 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24457f581aeso63029545ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088899; x=1758693699; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxcUE4pzXEmmyODIqrBT3pIo0FuVO4H3bjanIDoGT84=;
        b=lkjYDnwxkM5CtkjY/DQGqPiI8431DJoboJc3ywvKN6ZdrWghQg0yqZHpUHEv9y+Xcs
         B3fzCSeUqEayHIX3kQcenhOcMDmFL9dtLg+TmnI/ZTIUF3tHm5n9JCrCqF95GSh6WPzW
         hgXybtNgAb3XJmwLDPb+zjWofqY6rf3MqLtVJ1kt6qbxkQhPGKrRpHjowJTJrTTfvj7P
         oHM46UFR3XSsUK2R/7EV6QDW4K6SSyFIAeQrN0B9HKyUCBqbqDx71mf1ZvJtnN46QFt1
         Ptw6GrJKXGeJDyU68kLGgJvLCycztnHGUQvu2tYyqBSO4WMTuwHNq+nynt2fdFYWfgnB
         ritA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088899; x=1758693699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxcUE4pzXEmmyODIqrBT3pIo0FuVO4H3bjanIDoGT84=;
        b=VtgvzZP6Y626oJGsvDRwMgipD3tdjT+8q+SBGFhuPPZV0SIsfeIsE2HJJzj/W7nAfK
         aIBQgwptyXVgSyE/yVyvZ/SIcYZE7sCVHew21F7CvKJBjMnRhSvC88idYJOKPvMrb5Dx
         zQyPM57EKS4qkgNacPW0d9diaMpPw7FbDVGzehJH18HhbvVT2FfX5yMXO7D3FxAYGEzt
         ZexV4kIfHtXhv86DjvYCec4/7Xp0gNLYHYSWvqmLDq+2JuW3GerCo/k7xMhNgXGgmbd0
         ff05SywYizIZvoOoVOjMkwFmYjsIC+zobauWYX+UqJ+EE65gKZTKtpGcVW3Nu0TEuBay
         Verg==
X-Forwarded-Encrypted: i=1; AJvYcCUvmeutw/FlCGKxWrnLJOijPFkxtNTlTmp79IPTl5iVeKino4sQOzG1Xg5gulR80LHWPiv0Oa4C@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEz1TEI5D0hnj3tCNWhM4Z2JpNXnVyfPXN47DGjuFUXf3J366t
	P7yUB7szg7NdpMbImzHoHDxxEhpItmLdwp9EMfM0ztDu4gkuPxnYURB1U8L54w==
X-Gm-Gg: ASbGnct9oZCvxw0/wK2NvAxwrxTmh4r8J8AavuDh7qUCpP7tHz+SGL7l7zlA4DcSRIr
	7GLDONuRC46790COapPcWDUVGrwdE0YUut/FR5Fwv6+MariSEkE1JvrYWFx5Z6cx9Ah/dRXss2H
	+cO1BveBLJiDLfihzFOWJAXYKt2Aaamd2b6Qiw9AdSr+68Ja5FbKK8A1orY8TLKQ1x22JavJ22R
	wqFGHHlYX5BQZqWNL+3iBfornA5EP8qOY+4njO9vTcUcK6hnFpu0AaAnv6qYMFm5uEL3Pml1AUY
	PL02pRwtWJND/TgHd0v15Brq4G3kMv8OSyhIByrzs7FiBhWgel3kyqovFGMDFRKnZ9h8zWDQN1Z
	j33pd08jOVFV8rqh3DLs6b/JDcv7zl6L9sAnY0q+My3ZBn6mRS4gZC+hhtSzIPYpFcIHzHjvDBi
	WA0/hQpCfqnV4bxhVW5JE8UPIoQw==
X-Google-Smtp-Source: AGHT+IH8VPoGBFxnauJkd17OP1lY1kUz8iqtvKX/XmU7UwvpxpSK1QnYPNap4PPzr4DeMm62/fyOWg==
X-Received: by 2002:a17:902:8f8a:b0:248:ff5a:b768 with SMTP id d9443c01a7336-26811ba5363mr7525755ad.10.1758088898919;
        Tue, 16 Sep 2025 23:01:38 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:38 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 1/9] hwmon: (ina238) Add ina238_config to save configurations for different chips
Date: Wed, 17 Sep 2025 14:01:26 +0800
Message-ID: <20250917060134.2383005-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
References: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
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

From: Wenliang Yan <wenliang202407@163.com>

Add structure ina238_config to store proprietary properties for different
chips to meet different chip adaptations

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
Link: https://lore.kernel.org/r/20250506053741.4837-2-wenliang202407@163.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 024e5cf24327184bb363b6e330550394982b93f8)
---
 drivers/hwmon/ina238.c | 57 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 2d9f12f68d50..c8d6bd3041b3 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -102,7 +102,20 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
+enum ina238_ids { ina238, ina237 };
+
+struct ina238_config {
+	bool has_power_highest;		/* chip detection power peak */
+	bool has_energy;			/* chip detection energy */
+	u8 temp_shift;				/* fixed parameters for temp calculate */
+	u32 power_calculate_factor;	/* fixed parameters for power calculate */
+	u16 config_default;			/* Power-on default state */
+	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
+	int temp_lsb;				/* use for temperature calculate */
+};
+
 struct ina238_data {
+	const struct ina238_config *config;
 	struct i2c_client *client;
 	struct mutex config_lock;
 	struct regmap *regmap;
@@ -110,6 +123,27 @@ struct ina238_data {
 	int gain;
 };
 
+static const struct ina238_config ina238_config[] = {
+	[ina238] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[ina237] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+};
+
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 {
 	u8 data[3];
@@ -536,14 +570,20 @@ static int ina238_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct ina238_data *data;
+	enum ina238_ids chip;
 	int config;
 	int ret;
 
+	chip = (uintptr_t)i2c_get_match_data(client);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
+	/* set the device type */
+	data->config = &ina238_config[chip];
+
 	mutex_init(&data->config_lock);
 
 	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
@@ -570,7 +610,7 @@ static int ina238_probe(struct i2c_client *client)
 	}
 
 	/* Setup CONFIG register */
-	config = INA238_CONFIG_DEFAULT;
+	config = data->config->config_default;
 	if (data->gain == 1)
 		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
 	ret = regmap_write(data->regmap, INA238_CONFIG, config);
@@ -616,15 +656,22 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
-	{ "ina238" },
+	{ "ina237", ina237 },
+	{ "ina238", ina238 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
 
 static const struct of_device_id __maybe_unused ina238_of_match[] = {
-	{ .compatible = "ti,ina237" },
-	{ .compatible = "ti,ina238" },
-	{ },
+	{
+		.compatible = "ti,ina237",
+		.data = (void *)ina237
+	},
+	{
+		.compatible = "ti,ina238",
+		.data = (void *)ina238
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ina238_of_match);
 
-- 
2.43.0


