Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94658877991
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 02:35:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FVcHdFhq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtK8M3MNWz3ccV
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 12:34:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FVcHdFhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtK7n2mYrz3cGw
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 12:34:28 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so23090585ad.1
        for <openbmc@lists.ozlabs.org>; Sun, 10 Mar 2024 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710120865; x=1710725665; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QpEUw5eyC4HEPvfJHmw08ig3V0O5LyY5ZvvKVAvM2I=;
        b=FVcHdFhq/OyYq8GUV04WvXgACfoI/bJy0TbDb7pBy6PVpX6FXcR1dsQV34gC/npgjh
         auV4Uwass7ukwYFOdh5q9EXXTxtlBX09b5TGemBoof0KKuJtmzyLI6LN/33xQRiBhx3f
         ZYLbk+u2rNPMCRsEx1WTgeG45RE31vyYSRQKRwDqJu5TXgkr7Dmcm+Ine4j40fqZ2rBs
         529M20ncFV3xySgDNQOQ/3iO6uhCPxNRbZ0Zv9iUUxsFXxxZEVvxZZ2TeMjfQgjWLSeD
         3k1rwbgN+ypQBsLWhxVI/AICR07M6pSrigGHggFrRG05y6S9gfurzbcf5+pvNudUp5Ok
         Xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710120865; x=1710725665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QpEUw5eyC4HEPvfJHmw08ig3V0O5LyY5ZvvKVAvM2I=;
        b=Ht8zaz1tPKfC5XLVWFj+GMzN4ICVEZlhzH+Ijj/ZeDZL5m3p039peP2a/OQuXvUELc
         b7kvmokMR5Pcfi7rytfglCoHpNut10R4SxCJM+pLAQEyWgL0ThhsTEC2Gdjm0vIHXaa7
         VzZjau57WMkfxz7IkDd1Ygr9mrJtfSI/6Oxp1AHG+GaqyHQhz0C2/Ly08fvpbrajCdnV
         RHoToyduyfgsHqzeXI8CVVp+LJuj+7OZ+/KevrP3txtvtHtGx/M00luIjJztZux8hB2z
         8n/GhOwZxG+RgAT8zfMXjMKVtYI0ilma1FZSp+pFL4H6w2oOQi4fh7m/q3yMlWcakdIE
         IOgQ==
X-Gm-Message-State: AOJu0YyUHNp26ylSkzzjBxTAGt2c/2Bx+UcImd358BG8XFt+Tasjnq/f
	gy3CzYxQL5jMtkwgPC/yVCP+VW4kUOmB16nj8S6TC6tfuU0ylU81
X-Google-Smtp-Source: AGHT+IEAeyjg3xhuB/I//fWBM/9zitHT4hxtT7rTFBLq6P6c+R8jMXNtVxd92ufsyQPcoTDue/fHlw==
X-Received: by 2002:a17:902:6846:b0:1dc:b308:c3b6 with SMTP id f6-20020a170902684600b001dcb308c3b6mr5895821pln.1.1710120865000;
        Sun, 10 Mar 2024 18:34:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902e54c00b001dbae7b85b1sm3255012plf.237.2024.03.10.18.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 18:34:24 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	alexandre.belloni@bootlin.com,
	mimi05633@gmail.com,
	KWLIU@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v1 1/1] rtc: nuvoton: Modify part number value
Date: Mon, 11 Mar 2024 09:34:05 +0800
Message-Id: <20240311013405.3398823-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311013405.3398823-1-mimi05633@gmail.com>
References: <20240311013405.3398823-1-mimi05633@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Base on datasheet,
    the part number is corresponding to bit 0 and 1 of the part info reg.

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index f488a189a465..9dce003126a5 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -517,12 +517,15 @@ static int nct3018y_probe(struct i2c_client *client)
 	if (nct3018y->part_num < 0) {
 		dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_PART.\n");
 		return nct3018y->part_num;
-	} else if (nct3018y->part_num == NCT3018Y_REG_PART_NCT3018Y) {
-		flags = NCT3018Y_BIT_HF;
-		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
-		if (err < 0) {
-			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
-			return err;
+	} else {
+		nct3018y->part_num &= 0x03; /* Part number is corresponding to bit 0 and 1 */
+		if (nct3018y->part_num == NCT3018Y_REG_PART_NCT3018Y) {
+			flags = NCT3018Y_BIT_HF;
+			err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+			if (err < 0) {
+				dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+				return err;
+			}
 		}
 	}
 
-- 
2.25.1

