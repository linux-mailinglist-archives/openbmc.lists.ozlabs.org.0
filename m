Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52979207C
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 08:05:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hgXGES5Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfw321ftnz3c50
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 16:05:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hgXGES5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfw1S1xhSz2yPG
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 16:03:55 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf1935f6c2so13253275ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2023 23:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693893833; x=1694498633; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L5PEbd1VHK64XWZhTC2X/gEOqeuCyXsQqfB44JXU490=;
        b=hgXGES5YE94ICQnqHqhN0ljzIGGoSMOTCPQBVLw45RxnZz8a6pg8clM1hqwF7b/uZy
         ZGMrCFLiD6r++sW5lWx9k5B9zOIoZ141kyBkffMJ/gxcHZT8QnrCh+lZksg9WtPxLbrG
         1HB+t+RQ3UTo7BA37MM99nbsSLdm/r4L/oWuWqMIgnxeNU+27Gep8J//BCYQRiKyLN6L
         VlHiiLIiQ+VKgsO5u15Vgm3Lgh7qZJo6SvYxat9miNHri3y4ivrvKFLFlPnMcWFVVni4
         WumoA2heG6uthBCubaF9I7GX6MeIqs5IrVP284xNgjdDy2zo2HEpsE/oscuHEsbg58Rp
         b2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693893833; x=1694498633;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5PEbd1VHK64XWZhTC2X/gEOqeuCyXsQqfB44JXU490=;
        b=J+9coHN5COSI4V6rRuLq/8tgM1+7ooobI5abVsb1L8NXHzDXU1H64IOz2/PVPYtwks
         kzcb4S7fzMo6tin5iZiGzsXFSa+2ORhQSB7sMJv/jAPKX5JLLzleQYDiCw4JO3ex6O7m
         GAqY66iKYTnH7ehgmyXpThuA5BmBq733CkpgNhjozb0EESRbDb+OtUQvY0FoK966ynqN
         2bfZ2H9nqBcR6x3s8C8GCemJsLxKuLxfvITdM0BkwpYeU7X/tLSl5u+1pGONgQWApVcU
         Y3q8GkAvtIA/Dx63k1Gd/1n0as/bjvoCXba5EPj2mejap/p1NJNPbh4mJB9CAsfGkSv3
         a0cw==
X-Gm-Message-State: AOJu0YzJVToPJYRPV4Z8S9fgNfDKpt66xNqELR52TIqfy8SrhWg8Pt5X
	0D5BWMYcyxLCAHXY5P0gCPc=
X-Google-Smtp-Source: AGHT+IE+/QXBCVgNaoxXd0GZy0FpE1x5XcdsDEJ289scS9qJQLTVO6x6Wc4OxTP9lQ+sVRNllIl4Kw==
X-Received: by 2002:a17:902:c409:b0:1c0:af36:e178 with SMTP id k9-20020a170902c40900b001c0af36e178mr18994695plk.11.1693893832926;
        Mon, 04 Sep 2023 23:03:52 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001bf6ea340b3sm8482921ply.116.2023.09.04.23.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 23:03:52 -0700 (PDT)
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
Subject: [PATCH v5 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Tue,  5 Sep 2023 14:03:41 +0800
Message-Id: <20230905060341.5632-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230905060341.5632-1-mimi05633@gmail.com>
References: <20230905060341.5632-1-mimi05633@gmail.com>
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

The NCT3015Y-R and NCT3018Y-R use the same datasheet
    but have different topologies as follows.
- Topology (Only 1st i2c can set TWO bit and HF bit)
  In NCT3015Y-R,
    rtc 1st i2c is connected to a host CPU
    rtc 2nd i2c is connected to a BMC
  In NCT3018Y-R,
    rtc 1st i2c is connected to a BMC
    rtc 2nd i2c is connected to a host CPU
In order to be compatible with NCT3015Y-R and NCT3018Y-R,
- In probe,
  If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
  Else, do nothing
- In set_time,
  If part number is NCT3018Y-R && TWO bit is 0,
     change TWO bit to 1, and restore TWO bit after updating time.
- Refine error messages to pinpoint the correct location.

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 87 ++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..9ec20f241e15 100644
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
@@ -46,6 +48,8 @@ struct nct3018y {
 #endif
 };
 
+static int part_num;
+
 static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 {
 	int err, flags;
@@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 	if (flags < 0) {
 		dev_dbg(&client->dev,
-			"Failed to read NCT3018Y_REG_CTRL\n");
+			"%s: Failed to read ctrl reg.\n", __func__);
 		return flags;
 	}
 
@@ -67,21 +71,21 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 	flags |= NCT3018Y_BIT_CIE;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+		dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
 		return err;
 	}
 
 	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
 	if (flags < 0) {
 		dev_dbg(&client->dev,
-			"Failed to read NCT3018Y_REG_ST\n");
+			"%s: Failed to read status reg.\n", __func__);
 		return flags;
 	}
 
 	flags &= ~(NCT3018Y_BIT_AF);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_ST\n");
+		dev_dbg(&client->dev, "%s: Unable to write status reg.\n", __func__);
 		return err;
 	}
 
@@ -155,7 +159,7 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return err;
 
 	if (!buf[0]) {
-		dev_dbg(&client->dev, " voltage <=1.7, date/time is not reliable.\n");
+		dev_dbg(&client->dev, "%s: voltage <=1.7, date/time is not reliable.\n", __func__);
 		return -EINVAL;
 	}
 
@@ -178,26 +182,44 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char buf[4] = {0};
-	int err;
+	int err, flags;
+	int restore_flags = 0;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (flags < 0) {
+		dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__);
+		return flags;
+	}
+
+	/* Check and set TWO bit */
+	if ((part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BIT_TWO)) {
+		restore_flags = 1;
+		flags |= NCT3018Y_BIT_TWO;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
+			return err;
+		}
+	}
 
 	buf[0] = bin2bcd(tm->tm_sec);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SC\n");
+		dev_dbg(&client->dev, "%s: Unable to write seconds reg.\n", __func__);
 		return err;
 	}
 
 	buf[0] = bin2bcd(tm->tm_min);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MN, buf[0]);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MN\n");
+		dev_dbg(&client->dev, "%s: Unable to write minutes reg.\n", __func__);
 		return err;
 	}
 
 	buf[0] = bin2bcd(tm->tm_hour);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HR, buf[0]);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HR\n");
+		dev_dbg(&client->dev, "%s: Unable to write hour reg.\n", __func__);
 		return err;
 	}
 
@@ -208,10 +230,22 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	err = i2c_smbus_write_i2c_block_data(client, NCT3018Y_REG_DW,
 					     sizeof(buf), buf);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write for day and mon and year\n");
+		dev_dbg(&client->dev, "%s: Unable to write for day and mon and year.\n", __func__);
 		return -EIO;
 	}
 
+	/* Restore TWO bit */
+	if (restore_flags) {
+		if (part_num & NCT3018Y_REG_PART_NCT3018Y)
+			flags &= ~NCT3018Y_BIT_TWO;
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
+			return err;
+		}
+	}
+
 	return err;
 }
 
@@ -224,7 +258,7 @@ static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
 					    sizeof(buf), buf);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to read date\n");
+		dev_dbg(&client->dev, "%s: Unable to read date.\n", __func__);
 		return -EIO;
 	}
 
@@ -257,19 +291,19 @@ static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, bin2bcd(tm->time.tm_sec));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
+		dev_dbg(&client->dev, "%s: Unable to write seconds alarm reg.\n", __func__);
 		return err;
 	}
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, bin2bcd(tm->time.tm_min));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
+		dev_dbg(&client->dev, "%s: Unable to write minutes alarm reg.\n", __func__);
 		return err;
 	}
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, bin2bcd(tm->time.tm_hour));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
+		dev_dbg(&client->dev, "%s: Unable to write hour alarm reg.\n", __func__);
 		return err;
 	}
 
@@ -473,23 +507,29 @@ static int nct3018y_probe(struct i2c_client *client)
 
 	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 	if (flags < 0) {
-		dev_dbg(&client->dev, "%s: read error\n", __func__);
+		dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__);
 		return flags;
 	} else if (flags & NCT3018Y_BIT_TWO) {
-		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
+		dev_dbg(&client->dev, "%s: TWO bit is set.\n", __func__);
 	}
 
-	flags = NCT3018Y_BIT_TWO;
-	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
-	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
-		return err;
+	part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (part_num < 0) {
+		dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __func__);
+		return part_num;
+	} else if (part_num & NCT3018Y_REG_PART_NCT3018Y) {
+		flags = NCT3018Y_BIT_HF;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
+			return err;
+		}
 	}
 
 	flags = 0;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
 	if (err < 0) {
-		dev_dbg(&client->dev, "%s: write error\n", __func__);
+		dev_dbg(&client->dev, "%s: Failed to clear status reg.\n", __func__);
 		return err;
 	}
 
@@ -507,7 +547,8 @@ static int nct3018y_probe(struct i2c_client *client)
 						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
 						"nct3018y", client);
 		if (err) {
-			dev_dbg(&client->dev, "unable to request IRQ %d\n", client->irq);
+			dev_dbg(&client->dev, "%s: Unable to request IRQ %d.\n",
+				__func__, client->irq);
 			return err;
 		}
 	} else {
-- 
2.17.1

