Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8077D7A9
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 03:27:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y8XqD0lR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQVqf4h2nz3bhp
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 11:27:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y8XqD0lR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQVp265Ryz2ys2
	for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2023 11:26:02 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76cd8dab98fso400807285a.3
        for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 18:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692149159; x=1692753959;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYDZYrZTFixChYA733+EKeLIok7jnc46pmm6fkzXUto=;
        b=Y8XqD0lRA/78eW5qm9FI2vq1bFLjh7Aajl8gza7wYFSZQl7ISWW8ip8ZvgRoUKnCDl
         kHEE3/0i7/toH0Ad1ZpgLBwq2Jo4jLsLpNb1RtdB3k0RiGgOlgIST7S5/xPMdVZYw1V7
         pJPVn4v18fw1yxuxBnX2woZBRcusymbahYmluv6tFCJXFS8iH0I/9jD9EPaiHckgiQMV
         uqMWLmR9gg+tne/F4P9dbA/Tw7Pvj919HgRZYDaYkw6crfKVrTeaFpyqXaMdruI1XtHS
         Ebhs8pODXPSpNWdBBGOis0phzOkjU3MGmo9q5ugBN0DERJoEXKYoHffaSAglWPlnMtXD
         oJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692149159; x=1692753959;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYDZYrZTFixChYA733+EKeLIok7jnc46pmm6fkzXUto=;
        b=W2Irevi0XO4OUX5RJBp96yARIGnuogHDeiacO+DooDMNtQtYxzQ/YvJsoSrKTLPD98
         etUhttXHA6ciQSRymRazGcIYLUgsTENcRmg2dCQZBG68IwJlzLlZhgjGeLIQmjpc85bP
         djlgRrpYFZK2QS6En77EtdJS8smIUXk7voGfENLCqe4RfikcXvOsyUE6jaSxgkLWr8u2
         ulxOO1eraPYRs+OLRdgmtUAH7W4A1xzc9CidGwC1qwpobLs1NJ6bQmSaE6VNcS0K5sUY
         cIQYg5N53uPwI4CMHqCBBuRKjurKRutLWZvn43o66iWWZsH4ZPG3V7zy/8dXTJgM40of
         4dpw==
X-Gm-Message-State: AOJu0YzfMDT3CajYW/UXICHG3cnJfbH+hIrEpHFgDQ74zNsFKD3KV+mi
	Qj9jua3378AeifIUWumWL94=
X-Google-Smtp-Source: AGHT+IECNknwcJLxfIlza3qAkDUTOeoxGLs+8FHtZxMAlMrV+jgkhz3QKLY6ygNqxNZsyDqda+6PGQ==
X-Received: by 2002:a05:620a:44c6:b0:76c:c563:cd7e with SMTP id y6-20020a05620a44c600b0076cc563cd7emr774340qkp.61.1692149159158;
        Tue, 15 Aug 2023 18:25:59 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79251000000b0064d47cd116esm9895468pfp.161.2023.08.15.18.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 18:25:58 -0700 (PDT)
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
Subject: [PATCH v4 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 16 Aug 2023 09:25:40 +0800
Message-Id: <20230816012540.18464-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230816012540.18464-1-mimi05633@gmail.com>
References: <20230816012540.18464-1-mimi05633@gmail.com>
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
 drivers/rtc/rtc-nct3018y.c | 122 +++++++++++++++++++++++++------------
 1 file changed, 83 insertions(+), 39 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..1a674e105682 100644
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
@@ -50,12 +52,12 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 {
 	int err, flags;
 
-	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
+	dev_dbg(&client->dev, "%s: on=%d.\n", __func__, on);
 
-	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 	if (flags < 0) {
 		dev_dbg(&client->dev,
-			"Failed to read NCT3018Y_REG_CTRL\n");
+			"%s: Failed to read ctrl reg.\n", __func__);
 		return flags;
 	}
 
@@ -67,21 +69,21 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
 	flags |= NCT3018Y_BIT_CIE;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+		dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func__);
 		return err;
 	}
 
-	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
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
 
@@ -94,23 +96,22 @@ static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *ala
 	int flags;
 
 	if (alarm_enable) {
-		dev_dbg(&client->dev, "%s:NCT3018Y_REG_CTRL\n", __func__);
-		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+		flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
 		if (flags < 0)
 			return flags;
 		*alarm_enable = flags & NCT3018Y_BIT_AIE;
 	}
 
 	if (alarm_flag) {
-		dev_dbg(&client->dev, "%s:NCT3018Y_REG_ST\n", __func__);
-		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
+		flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
 		if (flags < 0)
 			return flags;
 		*alarm_flag = flags & NCT3018Y_BIT_AF;
 	}
 
-	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
-		__func__, *alarm_enable, *alarm_flag);
+	if (alarm_enable && alarm_flag)
+		dev_dbg(&client->dev, "%s: alarm_enable=%x, alarm_flag=%x.\n",
+			__func__, *alarm_enable, *alarm_flag);
 
 	return 0;
 }
@@ -123,17 +124,17 @@ static irqreturn_t nct3018y_irq(int irq, void *dev_id)
 	unsigned char alarm_flag;
 	unsigned char alarm_enable;
 
-	dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
+	dev_dbg(&client->dev, "%s: irq=%d.\n", __func__, irq);
 	err = nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable, &alarm_flag);
 	if (err)
 		return IRQ_NONE;
 
 	if (alarm_flag) {
-		dev_dbg(&client->dev, "%s:alarm flag:%x\n",
+		dev_dbg(&client->dev, "%s: alarm flag=%x.\n",
 			__func__, alarm_flag);
 		rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
 		nct3018y_set_alarm_mode(nct3018y->client, 0);
-		dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
+		dev_dbg(&client->dev, "%s: IRQ_HANDLED.\n", __func__);
 		return IRQ_HANDLED;
 	}
 
@@ -155,7 +156,7 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return err;
 
 	if (!buf[0]) {
-		dev_dbg(&client->dev, " voltage <=1.7, date/time is not reliable.\n");
+		dev_dbg(&client->dev, "%s: voltage <=1.7, date/time is not reliable.\n", __func__);
 		return -EINVAL;
 	}
 
@@ -178,26 +179,50 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char buf[4] = {0};
-	int err;
+	int err, part_num, flags;
+	int restore_flags = 0;
+
+	part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (part_num < 0) {
+		dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __func__);
+		return part_num;
+	}
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
 
@@ -208,10 +233,22 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
 
@@ -224,11 +261,11 @@ static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
 					    sizeof(buf), buf);
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to read date\n");
+		dev_dbg(&client->dev, "%s: Unable to read date.\n", __func__);
 		return -EIO;
 	}
 
-	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x hr=%02x\n",
+	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x, hr=%02x.\n",
 		__func__, buf[0], buf[2], buf[4]);
 
 	tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
@@ -239,7 +276,7 @@ static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	if (err < 0)
 		return err;
 
-	dev_dbg(&client->dev, "%s:s=%d m=%d, hr=%d, enabled=%d, pending=%d\n",
+	dev_dbg(&client->dev, "%s: s=%d m=%d, hr=%d, enabled=%d, pending=%d.\n",
 		__func__, tm->time.tm_sec, tm->time.tm_min,
 		tm->time.tm_hour, tm->enabled, tm->pending);
 
@@ -251,25 +288,25 @@ static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	struct i2c_client *client = to_i2c_client(dev);
 	int err;
 
-	dev_dbg(dev, "%s, sec=%d, min=%d hour=%d tm->enabled:%d\n",
+	dev_dbg(dev, "%s: sec=%d, min=%d, hour=%d, tm->enabled=%d.\n",
 		__func__, tm->time.tm_sec, tm->time.tm_min, tm->time.tm_hour,
 		tm->enabled);
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, bin2bcd(tm->time.tm_sec));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
+		dev_dbg(&client->dev, "%s: Unable to write seconds alarm reg.\n", __func__);
 		return err;
 	}
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, bin2bcd(tm->time.tm_min));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
+		dev_dbg(&client->dev, "Unable to write minutes alarm reg.\n");
 		return err;
 	}
 
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, bin2bcd(tm->time.tm_hour));
 	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
+		dev_dbg(&client->dev, "%s: Unable to write hour alarm reg.\n", __func__);
 		return err;
 	}
 
@@ -278,7 +315,7 @@ static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 
 static int nct3018y_irq_enable(struct device *dev, unsigned int enabled)
 {
-	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
+	dev_dbg(dev, "%s: alarm enable=%d.\n", __func__, enabled);
 
 	return nct3018y_set_alarm_mode(to_i2c_client(dev), enabled);
 }
@@ -473,23 +510,29 @@ static int nct3018y_probe(struct i2c_client *client)
 
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
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (flags < 0) {
+		dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __func__);
+		return flags;
+	} else if (flags & NCT3018Y_REG_PART_NCT3018Y) {
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
 
@@ -507,7 +550,8 @@ static int nct3018y_probe(struct i2c_client *client)
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

