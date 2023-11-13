Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA17E9A70
	for <lists+openbmc@lfdr.de>; Mon, 13 Nov 2023 11:39:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqd9hUpF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQsq1FpYz3cVl
	for <lists+openbmc@lfdr.de>; Mon, 13 Nov 2023 21:39:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqd9hUpF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQrB6srMz2y1l
	for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2023 21:38:18 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5c19a328797so387773a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2023 02:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871896; x=1700476696; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiJlbDV02NWbkvJ5jpVJciv8KDhCisvI4tOyDfm1YJo=;
        b=bqd9hUpF96hsatGM2oDQ6iTg2gJ/6QVXcu3A++7fOo9COiZhDKhcV/Wq24gvAXStzM
         9+EMPQxqK1JYPxORn+R/iozbHSagrDHbOTOmrrgNoa0etNTNQwaFqS2Falua//nE84Mp
         HNSvBLmj63gBoV81zgT0TOwSUq/vapJfaSd5Ujh5q5Ai+O9axRh2+6om/AX6SzMZ0lSa
         yQyoGKWAD+nP60x1RRlSaW0zG0UM8WiuKp/21vS4VAHiqZAJanCFkQJ5Jp0gc+0VzE2i
         VQHS4xg6nsv4GWG1FINDKBFnAaMswvywfD3ZFRGxoOh0wFWZ2gXytYfyY4dREYM+XPJh
         0WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871896; x=1700476696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiJlbDV02NWbkvJ5jpVJciv8KDhCisvI4tOyDfm1YJo=;
        b=tk6CTCpjfofYHSEo7q4xnSBUUqpShb38EEJ0PfVK79LxpHFx0CicaQKqnWgHSdUw+U
         xXU+NNHC+R7ehouDNge39uEEKsYbcd79UWLTdrtm19DCTPO7xqQzl/DhzUc7tgPNiqmF
         /nML6Q3GiTVxgO5klHk6tc5jYApwH5qcFvGlgAU35foFkU4MWm9w38pi6cF9zFrZdVRq
         AZaQezE2d5VgWq1XfMcbr4Tn4lXpcz6q+5SIvBQ5D9fY0L/jXBcmpZHrwoYN21vt1asA
         u1GC71saIteJHA6Zi247izIj5GmxoYnRNvF0UY89ww0nh9cAFu8lq6vN6e8+9R17rAmU
         VySA==
X-Gm-Message-State: AOJu0YyYrWSYc6hxtGWZ50P0SggsDX4IRKFE4hlk43i9GYRgKbV1dIwC
	CJGrCFp/zXj4vYSYBN2plVQ=
X-Google-Smtp-Source: AGHT+IEgJaKwvITNN2ZPUMkM5l5mBI49kYoY6NVeT/wLcHZJtmSH5ONKRabmekhHrtIRzZPlnDRDtw==
X-Received: by 2002:a05:6a21:193:b0:14c:c9f6:d657 with SMTP id le19-20020a056a21019300b0014cc9f6d657mr5114256pzb.22.1699871896057;
        Mon, 13 Nov 2023 02:38:16 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id bb4-20020a170902bc8400b001c755810f89sm3752593plb.181.2023.11.13.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:38:15 -0800 (PST)
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
Subject: [PATCH v7 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Mon, 13 Nov 2023 18:38:07 +0800
Message-Id: <20231113103807.1036978-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113103807.1036978-1-mimi05633@gmail.com>
References: <20231113103807.1036978-1-mimi05633@gmail.com>
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

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
Changes since version 7:
  Fix the part number parameter checking issue.

 drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index ed4e606be8e5..f488a189a465 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -23,6 +23,7 @@
 #define NCT3018Y_REG_CTRL	0x0A /* timer control */
 #define NCT3018Y_REG_ST		0x0B /* status */
 #define NCT3018Y_REG_CLKO	0x0C /* clock out */
+#define NCT3018Y_REG_PART	0x21 /* part info */
 
 #define NCT3018Y_BIT_AF		BIT(7)
 #define NCT3018Y_BIT_ST		BIT(7)
@@ -37,10 +38,12 @@
 #define NCT3018Y_REG_BAT_MASK		0x07
 #define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
 #define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
+#define NCT3018Y_REG_PART_NCT3018Y	0x02
 
 struct nct3018y {
 	struct rtc_device *rtc;
 	struct i2c_client *client;
+	int part_num;
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw clkout_hw;
 #endif
@@ -177,8 +180,27 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct nct3018y *nct3018y = dev_get_drvdata(dev);
 	unsigned char buf[4] = {0};
-	int err;
+	int err, flags;
+	int restore_flags = 0;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (flags < 0) {
+		dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_CTRL.\n");
+		return flags;
+	}
+
+	/* Check and set TWO bit */
+	if (nct3018y->part_num == NCT3018Y_REG_PART_NCT3018Y && !(flags & NCT3018Y_BIT_TWO)) {
+		restore_flags = 1;
+		flags |= NCT3018Y_BIT_TWO;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
+	}
 
 	buf[0] = bin2bcd(tm->tm_sec);
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
@@ -212,6 +234,18 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		return -EIO;
 	}
 
+	/* Restore TWO bit */
+	if (restore_flags) {
+		if (nct3018y->part_num == NCT3018Y_REG_PART_NCT3018Y)
+			flags &= ~NCT3018Y_BIT_TWO;
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
+	}
+
 	return err;
 }
 
@@ -479,11 +513,17 @@ static int nct3018y_probe(struct i2c_client *client)
 		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
 	}
 
-	flags = NCT3018Y_BIT_TWO;
-	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
-	if (err < 0) {
-		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
-		return err;
+	nct3018y->part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
+	if (nct3018y->part_num < 0) {
+		dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_PART.\n");
+		return nct3018y->part_num;
+	} else if (nct3018y->part_num == NCT3018Y_REG_PART_NCT3018Y) {
+		flags = NCT3018Y_BIT_HF;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
 	}
 
 	flags = 0;
-- 
2.25.1

