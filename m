Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15D984F91
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 02:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCymc5VyCz3c5X
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 10:49:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727225373;
	cv=none; b=e7Cv0s6/qahV4udB84Dtr/HifFSwvUvYluUKoCVTYcRN+1x6PTIldBsUEXRg21J33g3Jo9X+yxpTUGr89MaVHbIIEeX/KXIEW7Hi/P1+gARMthkKiFFpjP0lXuFwHlg+Iv9xlSworDE1rRl3aj6tpqD8KYwrEVX33Co+gaxHgXsM2eacFXN+RaddFLOf//cC/q9nSquiuH3i/MsDELMuZa4aj2MzKOMwwC5OE6Ui3BuLsy9s3dQfOMLjurpBVrSI1h56rRUz1a2k1TEKyRNABNIwBCy9MEjAO7V71UkLxIwaJJVpyxgJgq2kcMzg7BS4cL012NVss8vW+neytAFECg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727225373; c=relaxed/relaxed;
	bh=LyGIKUzdez24kECi5LApFTLeAo20/jci75LlgVdKUho=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=oojr4dmXou8fMSTZ4kaLwqyM95A98GqNoWCAGdcp2oCX6uDRx7HbsO0olMqvD8tHzTUeVS4y2nfjokgiJqW7rG2ENt8OKtbYviWxVUe/zqPiYS4IjqGbxXac8rWwMlqyMQIhDwue5KVZTZF5p6Jz+U/msZG5kAM9gIBe2pxUueACIVTeeDrbUsg10UD5uZaoqfl+v069eHpkeYxHzYIzEnKR5x5I5Nuwpaw8x2HqriGDk+JuCmsDIgRbKbqCtN+ipwGvIxMn9WiZXvaUYYvvoi+JesghYW6Zr2dyaLu2oIQ7FpVHF9iUeTiy7SoDtUjEpQufh4xpvqy+NF+OMoQmQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKsYrD4K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKsYrD4K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCymY19bbz2xsK
	for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 10:49:32 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2053f6b8201so53900885ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2024 17:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727225368; x=1727830168; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyGIKUzdez24kECi5LApFTLeAo20/jci75LlgVdKUho=;
        b=fKsYrD4KoV+qegLxdfc47734q7JA0IohUDmegr4QJZIv+RB+FGEZiRQuZ1ubKhVEsw
         vZNy4iU20clBORWgO2Jdzq5kmD6ThoBgt2Cr5R+mHWpNe40X4CLjstMapsDegAV3OnOl
         k64DEEjj7If0MyJYp68wq0w5aIKHi6sxEJZFNZuZSYIZJoE0acp3ECsQrLMRHjZH5nNV
         7OdI1+OVfUVfUc6vs8MR/aOd+1UfUnoM6s0dxWJh4Dv0atrq2TgJZFYl3PGWwENZ5z3P
         hFmK3DvEGTUtQVLGGBruCTvsWecavFO8L8vJ9vYSLxxm1brLGn5UMBVX9QkTNGyBgIAp
         S3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727225368; x=1727830168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyGIKUzdez24kECi5LApFTLeAo20/jci75LlgVdKUho=;
        b=bFeI+z2gNdjU3HjN2gyxvISlLNgTcokLNMOswzc9iY2IyUZV77RCunMWzk/WvzSSM6
         Mj99fHDRXaZjYefpR/QLkN6kZDI9sEBD+JQ00DOKULF/VC4EZGXGe78dGDHCOun0/uij
         Ftar+PbQIrEVfEVCJIBauwBfp1zcWBp5Rp9KJKqLGP9FPzkaWEcfL8Ox2stkkbCmIlPL
         hUONTa1J3NZcBPY1IhPJrfDUPpd0KxL70Y09tIeFnf8Gr82CVVjHcRaK6UC2+LcgIUc4
         IAhXm6DLxAW8zYzqzz6ksyzCkWpvuEOkxH/GK5N5JABTQDRVq57DsyF8OyK8q4ZuPQut
         h7xQ==
X-Gm-Message-State: AOJu0YyLbMWvigWXlVfnRZI7kOYQ8qDcbUD3Qk15BShnF5/joO0Sx57P
	5pXLKvk1qNAaRCLDz67vvYccfgzQUPnixg2UiQlDWDb5YJFOwJovwHIAlg==
X-Google-Smtp-Source: AGHT+IEaNjAiThQTmcwXwoMiF2/nbuyLmGXKeYIVbvb3162j55IBfgVs+rD7QsEEqv6Zh9Q1GKH43Q==
X-Received: by 2002:a17:902:f643:b0:208:b468:db21 with SMTP id d9443c01a7336-20afc468e6fmr16161105ad.30.1727225367580;
        Tue, 24 Sep 2024 17:49:27 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af16df8e3sm15073915ad.45.2024.09.24.17.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 17:49:27 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.6 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 25 Sep 2024 08:46:43 +0800
Message-Id: <20240925004643.1298510-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Mia Lin <mimi05633@gmail.com>

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
index c4533c0f53896..076d8b99f9131 100644
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
2.31.1

