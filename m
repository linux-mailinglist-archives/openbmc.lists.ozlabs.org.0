Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D2759394
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 12:59:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XpKAALYM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Xrq0qfyz30KG
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 20:59:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XpKAALYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4swv52tLz2ytn
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 18:45:51 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6689430d803so3593040b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689669948; x=1692261948;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CR1YngAZBQYUPSsbWejwgz5QcYsHxChch/OgGgwh/aE=;
        b=XpKAALYMr2citfX+e/SmXXIynMoEuO1elLYhLylxzdDh/aDs0bn16jOM/k+WD6aygo
         YeFhe4uGE5R0ObMd7Zj5MxuMr6TCUna+1MV2omkjFYr7t5gINWMQ7N7gOOxClYqkVEpq
         98GegC2OykOQT6S5b5G5i0py8/jsxa6TwWQA9AwFBQKvql5Lb1UD6HgVi6tP2FvrsK+V
         KFZikVmEZaiCMnb4igIc6pQDK0FbEj6zzTuWgiwwBa+RhV2QZPDIPQ3tRUrAuJFyY8aw
         DuLndeUqphULYnLRH5Sb9JyetLe5CFsl3JMGrSljV92JfBT/j0ToQNaKhC/EwRVk2d/f
         i0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669948; x=1692261948;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CR1YngAZBQYUPSsbWejwgz5QcYsHxChch/OgGgwh/aE=;
        b=galmz1Z+NhCkkQ0O2ZmCrQqNib3IqEqTqXGgyMrU6WByqajEjWi//RKWyMCSIbb/cE
         WtzeKSDg+70/n/p1DfDw8k/GEQydM3Uzm9ZUS1XEwUa9Md3ahF9UqhNJDZVQ33rSDBGx
         LHpIgNmDsWyFmrE5tY7GPNx3EcZzoT9kqDgS+PFaKOGshbZby63ZPf8+j/lIOQ6/RKAv
         tS8eRdSyYUeLekKWPhyAIU8m/SQWVPEwnUDZPc3TkPsN6xstSUR7nOJ/2AdwXOOQzUlg
         EXfCEt8thZeP8rIxxyT+L4kJ0KIg5qWoGgnpVVYHHPvxk4YGi1e1suI+V4VNOmLnWQiK
         uRKw==
X-Gm-Message-State: ABy/qLbXL4urtuE7d1ugHweftT0vdKzKwLpP0QClvsTh/lCeTk/ZBT7T
	SfjsJsKJc2bbuVHdVkJyD503sWY6I9iBLKlx
X-Google-Smtp-Source: APBJJlEWSej+ZWhjTej9FxL8Z6XsJo4GJFMvstgh7d6+tutmfzdaZG5J+lF6+xRlGdLmjZb3k4Jqhg==
X-Received: by 2002:a05:6a20:7d83:b0:131:44f2:8691 with SMTP id v3-20020a056a207d8300b0013144f28691mr17769623pzj.37.1689669948289;
        Tue, 18 Jul 2023 01:45:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001b9fef7f454sm1291516plb.73.2023.07.18.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:45:48 -0700 (PDT)
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
	YHYANG2@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH 1/1] RTC: nuvoton: Modify the setting timing of write ownership
Date: Tue, 18 Jul 2023 16:45:35 +0800
Message-Id: <20230718084535.11081-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230718084535.11081-1-mimi05633@gmail.com>
References: <20230718084535.11081-1-mimi05633@gmail.com>
X-Mailman-Approved-At: Wed, 19 Jul 2023 20:56:29 +1000
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

- Change the write ownership to default.
- Set the TWO bit to gain write ownership for BMC before it updates time.
- Restore the TWO bit after BMC updates the time.
- Set 24-Hour Format.

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..e6b06724cdef 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -178,7 +178,19 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned char buf[4] = {0};
-	int err;
+	int err, flags, restore_flags = 0;
+
+	/* Check and set TWO bit */
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (!(flags & NCT3018Y_BIT_TWO)) {
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
@@ -212,6 +224,16 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		return -EIO;
 	}
 
+	/* Restore TWO bit */
+	if (restore_flags) {
+		flags &= ~NCT3018Y_BIT_TWO;
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+			return err;
+		}
+	}
+
 	return err;
 }
 
@@ -479,7 +501,7 @@ static int nct3018y_probe(struct i2c_client *client)
 		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
 	}
 
-	flags = NCT3018Y_BIT_TWO;
+	flags = NCT3018Y_BIT_HF;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
 	if (err < 0) {
 		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
-- 
2.17.1

