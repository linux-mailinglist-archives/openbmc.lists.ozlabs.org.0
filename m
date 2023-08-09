Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA3776F72
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 07:17:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aBcga/s5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwD82nsgz3cPf
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 15:17:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aBcga/s5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLQLR1Qd0z3031
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 19:51:27 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686f94328a4so548417b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691574685; x=1692179485;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsaoVJzrGmnyIbJL9SlQQYggDG4l4W2+o3LDu7nhuKE=;
        b=aBcga/s5OW41/9IXigMdUd7yQO/I4fsTTPax7pd6uLLhd6O5yt6LAhdYSsFtUMzqRA
         R/pfzqM/1kKEPICV6adxWgicbr6u2pCofsWorDrACNB2oNTbGVp0PaqiKRprkcdT5Dwm
         hHM51BSD9g5xEDTzHguG83AA3O3765K9w2k4AAL50O0RIozY893q0MTCHIzMYWYeyI/G
         DH6H8EdFGk+6blGDk2ECXVho73eX2rRHR2oNdkKaEz1mVeNXSx955Dpx7WHcOMBgj8YI
         9outI02pmySTAkdREvXiPAZlF8df4EZ2/rmoEglLAmlmCW4/yF5GHxuk2sqDDMSQLOvT
         G1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691574685; x=1692179485;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsaoVJzrGmnyIbJL9SlQQYggDG4l4W2+o3LDu7nhuKE=;
        b=Y8IIB+j188Lj2nvxOXf2PhbCtT4GPZXB4+ocduzOGvr9GW9EEGY5795QWxf2/mT8M/
         QiIZqjjV5tfeUmXgaN1leq4RAilEQWeDVuR0nS/3P8mALyH5uFnHFr6hpe09BjB1BYF8
         /Uc1JsHnHWQ6Ic0Mo9LCJHuz0x8P1xV6MQmpEXl9MDQ3Q/HUjLORWh8LFBof58jRFF8d
         d2Dc/6n7dmh8LJSoEHx+S6b/mWaGr1G2xXwWmrSuuvQ5aRgjjtdS5F7JK9AE2QY3misO
         mAjW7NEcBvcmZpL8ixsx5izidDtlZoTfSiaboKXwwUk49zheZyZ7R1D43MvqXTASpcem
         G3rg==
X-Gm-Message-State: AOJu0YwADVKgL0M9iGZnGf8a5ivmf2jKzXGD9ucB+4KBGtjZcABx7njt
	nEPpjbYfA7MTXkvj+gz7adc=
X-Google-Smtp-Source: AGHT+IFsfqTKAe7SK2MRNY7tE/bxUtBUNbKqa4AxlKLV2X4VS+C7zTB7bpP1pLfXRAHjry344ThooA==
X-Received: by 2002:a05:6a20:3c8f:b0:132:d09f:1716 with SMTP id b15-20020a056a203c8f00b00132d09f1716mr2964196pzj.2.1691574685135;
        Wed, 09 Aug 2023 02:51:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j21-20020a62b615000000b00687375d9135sm9493822pff.4.2023.08.09.02.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:51:24 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v2 2/2] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed,  9 Aug 2023 17:51:12 +0800
Message-Id: <20230809095112.2836-3-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230809095112.2836-1-mimi05633@gmail.com>
References: <20230809095112.2836-1-mimi05633@gmail.com>
X-Mailman-Approved-At: Thu, 10 Aug 2023 15:15:25 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

- In probe,
  If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
  Else, do nothing
- In set_time,
  If part number is NCT3018Y-R && TWO bit is 0,
    change TWO bit to 1, and restore TWO bit after updating time.
- Use DT compatible to check the chip matches or not.

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 88 +++++++++++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..edc73be3ab59 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
@@ -23,6 +24,7 @@
 #define NCT3018Y_REG_CTRL	0x0A /* timer control */
 #define NCT3018Y_REG_ST		0x0B /* status */
 #define NCT3018Y_REG_CLKO	0x0C /* clock out */
+#define NCT3018Y_REG_PART	0x21 /* part info */
 
 #define NCT3018Y_BIT_AF		BIT(7)
 #define NCT3018Y_BIT_ST		BIT(7)
@@ -37,6 +39,20 @@
 #define NCT3018Y_REG_BAT_MASK		0x07
 #define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
 #define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
+#define NCT3018Y_REG_PART_NCT3015Y	0x01
+#define NCT3018Y_REG_PART_NCT3018Y	0x02
+
+struct rtc_data {
+	u8 part_number;
+};
+
+static const struct rtc_data nct3015y_rtc_data = {
+	.part_number = NCT3018Y_REG_PART_NCT3015Y,
+};
+
+static const struct rtc_data nct3018y_rtc_data = {
+	.part_number = NCT3018Y_REG_PART_NCT3018Y,
+};
 
 struct nct3018y {
 	struct rtc_device *rtc;
@@ -52,7 +68,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 
 	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
 
-	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 	if (flags < 0) {
 		dev_dbg(&client->dev,
 			"Failed to read NCT3018Y_REG_CTRL\n");
@@ -109,8 +125,10 @@ static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *ala
 		*alarm_flag = flags & NCT3018Y_BIT_AF;
 	}
 
-	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
-		__func__, *alarm_enable, *alarm_flag);
+	if (alarm_enable && alarm_flag) {
+		dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
+			__func__, *alarm_enable, *alarm_flag);
+	}
 
 	return 0;
 }
@@ -178,7 +196,30 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char buf[4] = {0};
-	int err;
+	int err, part_num, flags, restore_flags = 0;
+
+	part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (part_num < 0) {
+		dev_dbg(&client->dev, "%s: read error\n", __func__);
+		return part_num;
+	}
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (flags < 0) {
+		dev_dbg(&client->dev, "%s: read error\n", __func__);
+		return flags;
+	}
+
+	/* Check and set TWO bit */
+	if ((part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BIT_TWO)) {
+		restore_flags = 1;
+		flags |= NCT3018Y_BIT_TWO;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+			return err;
+		}
+	}
 
 	buf[0] = bin2bcd(tm->tm_sec);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
@@ -212,6 +253,18 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		return -EIO;
 	}
 
+	/* Restore TWO bit */
+	if (restore_flags) {
+		if (part_num & NCT3018Y_REG_PART_NCT3018Y)
+			flags &= ~NCT3018Y_BIT_TWO;
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+			return err;
+		}
+	}
+
 	return err;
 }
 
@@ -456,6 +509,7 @@ static int nct3018y_probe(struct i2c_client *client)
 {
 	struct nct3018y *nct3018y;
 	int err, flags;
+	const struct rtc_data *data = of_device_get_match_data(&client->dev);
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
 				     I2C_FUNC_SMBUS_BYTE |
@@ -479,11 +533,24 @@ static int nct3018y_probe(struct i2c_client *client)
 		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
 	}
 
-	flags = NCT3018Y_BIT_TWO;
-	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
-	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
-		return err;
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (flags < 0) {
+		dev_dbg(&client->dev, "%s: read error\n", __func__);
+		return flags;
+	} else if (flags & NCT3018Y_REG_PART_NCT3018Y) {
+		if (!(flags & data->part_number))
+			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
+				 __func__, data->part_number, flags);
+		flags = NCT3018Y_BIT_HF;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+			return err;
+		}
+	} else if (flags & NCT3018Y_REG_PART_NCT3015Y) {
+		if (!(flags & data->part_number))
+			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
+				 __func__, data->part_number, flags);
 	}
 
 	flags = 0;
@@ -530,7 +597,8 @@ static const struct i2c_device_id nct3018y_id[] = {
 MODULE_DEVICE_TABLE(i2c, nct3018y_id);
 
 static const struct of_device_id nct3018y_of_match[] = {
-	{ .compatible = "nuvoton,nct3018y" },
+	{ .compatible = "nuvoton,nct3015y", .data = &nct3015y_rtc_data },
+	{ .compatible = "nuvoton,nct3018y", .data = &nct3018y_rtc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, nct3018y_of_match);
-- 
2.17.1

