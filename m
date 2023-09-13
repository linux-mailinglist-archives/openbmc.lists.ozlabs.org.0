Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D838579DDAE
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 03:38:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bfm5PbLv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rljm15bzzz3cVH
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 11:38:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bfm5PbLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RljkN25S0z3cPS
	for <openbmc@lists.ozlabs.org>; Wed, 13 Sep 2023 11:37:31 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68c576d35feso6069750b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 18:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694569049; x=1695173849; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Qr8W+YNZxo/PHrt3cm26F+6wvNKcFBceX5yhtm3BlE=;
        b=bfm5PbLv3iF5fecEQ1uIdpXB7iQpdTK6BlHb9yyM/4s9IX8vKjOHFbi3Gpbbr8XWhc
         opp+Sz644gptLp+gJwmhFjMomdNA9wxvuV63lI0U3lZ1ZN8oO3HyZ/0KmJ7xgd3/WL5G
         pc94r+si195m7n/8iiT/QkU4Z8GtFPeyW9KHrxQR5pOFJwVQOCZZUdZR2DW9xn1TBc1K
         xgk2n9ecS2O1Ek9vphlaN3y3JhJouG5bEd2Cf80i0BmEOFpPlhkb2MAmfxat3u/0JATd
         97yYenDMZzkELQpBes7C3w5kzQUCsAdv8JA4dZ2tIA03AlA3/TG75eVifHW5mJy2jB2H
         On4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694569049; x=1695173849;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qr8W+YNZxo/PHrt3cm26F+6wvNKcFBceX5yhtm3BlE=;
        b=icqbvNhGvdf4mubFc2NWAxJkRT7NuvS8/8hkuBDdY3kBYH+5FOYdzV/YKCHvAz6Zl+
         RrOKKnsmsv41Vf8pYQg7M9YHC0uS/XUAk1pUx1gF50KYytVXZURjYtBFMowhzmxYBeTB
         fVU47fnlCi5Vytb5PC9k7F9lD0rdXbcDUbwbtEVsMWwOzKmC4TUEGIBszO/mrWE0Ny+m
         PmPsEbKONXBPU8fGWb3vdo2Kyh3z4Ftg43yB5zOPZy4o1SEZmKqB103Uppge4j4RPfy6
         zxcfNUFIUWiug3mrdeD6AVTFtzSPt8buoC8MtNRHfFfrzXzOOnantk9IX1U0V4zcdp5N
         tBzQ==
X-Gm-Message-State: AOJu0Yx5Esc7bfRLAR6Ek9yVoVvJ70MLmejdrop26rknWLsncUb4Vcq6
	X0OuGBUMmJej2z1R50pZwN0=
X-Google-Smtp-Source: AGHT+IGrwyy2AwKKihEq6EvWvFtmbZ20XQE2n5RSWwFYjNLYqUuW7iPocw5YvspS9tY/IjuP9oy94g==
X-Received: by 2002:a05:6a00:1a11:b0:68f:b5cb:ced0 with SMTP id g17-20020a056a001a1100b0068fb5cbced0mr1439599pfv.34.1694569049094;
        Tue, 12 Sep 2023 18:37:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id l20-20020a62be14000000b0068a0c403636sm7874648pff.192.2023.09.12.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 18:37:28 -0700 (PDT)
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
Subject: [PATCH v6 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 13 Sep 2023 09:37:19 +0800
Message-Id: <20230913013719.8342-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230913013719.8342-1-mimi05633@gmail.com>
References: <20230913013719.8342-1-mimi05633@gmail.com>
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
 drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index ed4e606be8e5..b006b58e15e2 100644
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
+	if ((nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BIT_TWO)) {
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
+		if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y)
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
+	} else if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) {
+		flags = NCT3018Y_BIT_HF;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
 	}
 
 	flags = 0;
-- 
2.17.1

