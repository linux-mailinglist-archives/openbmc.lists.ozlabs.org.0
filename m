Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3E7774D5
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 11:44:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Du/F3XNK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM27X1qr1z3cLj
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 19:44:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Du/F3XNK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM26v4Xpfz3bh5
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 19:43:34 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bb84194bf3so5164235ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691660612; x=1692265412;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ht3VL/Ute0f0NpKuJCr8WI+TjnXswoA7IO1WC8WBAU=;
        b=Du/F3XNKyw207VcXml+AY4g3uFJ1aRsJY3WvB/ujeTunAkzJfZ6hJuiWmp4ktzf0mq
         cU6wRhW2OijJvyigoCR8PhNMtufVeq8Nr14YOlC6tzLg1rYrAmZW7v9Xoj8T11qgNVlQ
         un7BfkUMf3iQxUscOUPPor5fG/o2zAc+Pz+qqnCLP5Ds0/HRdL5rnvdcnc6JzM06+iw3
         PA2xYtiux/7Yaj+EqNmTfekyWN74aJnJOveipih4yfMzBIrM78hd8863FeEq1+El/t8z
         TGaubqXThoc9zbX4ktmEBIYJlTKSNPlSGmu4pNJ/4H1IyHtarxqun6b0Zbek67OXGgDJ
         98qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691660612; x=1692265412;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ht3VL/Ute0f0NpKuJCr8WI+TjnXswoA7IO1WC8WBAU=;
        b=fm/l/BSql8LbVlDaJhixzN0WFcjeCvrPx1xniKNW055/iX97N+xWdM0OYMtM9Z8NCG
         P+z0Yz7o1enRuPShTdTatwWr/0PxJ29RPeQby8sCrH/YIv582M8nBgSg83iI9IkUzuc+
         kARLY0AXc9zYaCAhoSbXGz47v2529L0j7jXLy7oMFiFGvaSjPQhyXiKkvBs3nPxpSx+G
         H0FFdFA4KsYYNfVD1eZ95AhXdIO5uk71jbGovjloBnV244F56mo2TLsCSFPb/7vJgLYX
         UhYA2ZzrdoYYafm0bnxX7ESAuoCiB/Vnz0MlOvPR8o6Xg6QopS854QY/ED3ZJLrTdbol
         QG6Q==
X-Gm-Message-State: AOJu0YxCYKluVuzW2H3A3dFV6Wru7o8DPXF2i717nwXQrZKu5wZrMCEO
	BGKBDlbtDWB2Tu/MztvDD2A=
X-Google-Smtp-Source: AGHT+IEvIA7YB3PfyUgRkmbr8R8VeKGCOJisl2sw+yV7WDIIhnBPkWwkd1EYKsMuvxES1eYW3blvHg==
X-Received: by 2002:a17:902:aa0c:b0:1b8:847d:973a with SMTP id be12-20020a170902aa0c00b001b8847d973amr1486435plb.46.1691660611621;
        Thu, 10 Aug 2023 02:43:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id bi8-20020a170902bf0800b001bba3650448sm1233665plb.258.2023.08.10.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:43:31 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v3 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Thu, 10 Aug 2023 17:43:23 +0800
Message-Id: <20230810094323.20077-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230810094323.20077-1-mimi05633@gmail.com>
References: <20230810094323.20077-1-mimi05633@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

- In probe,
  If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
  Else, do nothing
- In set_time,
  If part number is NCT3018Y-R && TWO bit is 0,
    change TWO bit to 1, and restore TWO bit after updating time.

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 63 ++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..bac1e3fbbbcd 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -23,6 +23,7 @@
 #define NCT3018Y_REG_CTRL	0x0A /* timer control */
 #define NCT3018Y_REG_ST		0x0B /* status */
 #define NCT3018Y_REG_CLKO	0x0C /* clock out */
+#define NCT3018Y_REG_PART	0x21 /* part info */
 
 #define NCT3018Y_BIT_AF		BIT(7)
 #define NCT3018Y_BIT_ST		BIT(7)
@@ -37,6 +38,7 @@
 #define NCT3018Y_REG_BAT_MASK		0x07
 #define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
 #define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
+#define NCT3018Y_REG_PART_NCT3018Y	0x02
 
 struct nct3018y {
 	struct rtc_device *rtc;
@@ -52,7 +54,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 
 	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
 
-	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 	if (flags < 0) {
 		dev_dbg(&client->dev,
 			"Failed to read NCT3018Y_REG_CTRL\n");
@@ -109,8 +111,10 @@ static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *ala
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
@@ -178,7 +182,30 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -212,6 +239,18 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
 
@@ -479,11 +518,17 @@ static int nct3018y_probe(struct i2c_client *client)
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
+		flags = NCT3018Y_BIT_HF;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+			return err;
+		}
 	}
 
 	flags = 0;
-- 
2.17.1

