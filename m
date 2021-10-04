Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE34211CD
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 16:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNNmV5dXhz2yZf
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 01:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bnpINp6n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bnpINp6n; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNlZ64rTz2yV7
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 01:44:26 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id w10so2236076ilc.13
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T7EvqN40ZsaJpmzmKI90qpoq8EiCU5xRqyhC9TLRD+0=;
 b=bnpINp6npWGwJuvw9UmB8B647LD2eEkrKSk56Dn9bP/J+Jg1w4p4Pus3+Qmuyds5Mz
 81uLXhL2ifxN5Vuhl0+Z6K38vYsAi+tVgVK2SGHo2gyXyP4T/li3Puulj2mCRXVWfv7q
 IvojXX8bH9OiTZ7UZ8nBYWCHInxs/7ItgoOjS8ZDkQ/b7VObC4lCjweFNGWnlwf/CXkF
 90F5OHbKLxf8lViRSbqVCXF638A/ZZfcadu0vjTJlMj/CLFOWs6aqFpYywlW03XrTbIT
 VD0d8oS4zPJlEYpYrXeowzR3xSgwLlygI13jhQcZ7i974HLPOahq0M8NHJcpYB4WhxPz
 sPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7EvqN40ZsaJpmzmKI90qpoq8EiCU5xRqyhC9TLRD+0=;
 b=tty8pVr3qYDp3CqdefuxGbYeZIpLyXSVD0O2LVGui0H5tLkgQDkpsG18D1OC1qWL7I
 1TKQxUSEGZtTrdeA52Zh5foykADq2sscO+U6K3ewPTyRxnvsoytwmr4uJKQSTyVDvRKp
 l5zycP3RfcQLxEKgZRrUw59I2s+SwtFcWZxPZSHvtnOkSxTlu5Key5miU0U/dUHU0rnM
 7IyFHrHINcTZUG59sSynpDgkGmydLPrC5uN7vcDA8Py10XZGTzHU2tXCoLANwywfkTRj
 aV4vRD4dbwQzAOuQLbBoQ85bsrfZ/giMhqAVmpK7P433GuXbiwPyvcoGIaeO+UvKAjYP
 8BKA==
X-Gm-Message-State: AOAM530FMLtpZgBj6rbStKfusuV0G+PvYl8BcJFqzrGKt7gM+kdM+27V
 oPxRn7vVPOdpYh61dQvwoh8=
X-Google-Smtp-Source: ABdhPJy6AOE/KMxXys6rH0bg3VLu7gyzjWJnK7GpWxYJzISlnn5gnuq7UmgP7BPV1NxOT6CVOi7Tng==
X-Received: by 2002:a05:6e02:1445:: with SMTP id
 p5mr6807213ilo.11.1633358663794; 
 Mon, 04 Oct 2021 07:44:23 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id b11sm3692382ile.12.2021.10.04.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:44:23 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/2] hwmon: (pmbus/ibm-cffps) Use MFR_ID to choose version
Date: Mon,  4 Oct 2021 14:43:39 +0000
Message-Id: <20211004144339.2634330-2-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004144339.2634330-1-bjwyman@gmail.com>
References: <20211004144339.2634330-1-bjwyman@gmail.com>
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are multiple power supplies that will indicate
CFFPS_CCIN_VERSION_1, use the manufacturer ID to determine if it should
be treated as version cffps1 or version cffps2.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 2ee47cbbb665..292c87331f2b 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -502,16 +502,29 @@ static int ibm_cffps_probe(struct i2c_client *client)
 		u16 ccin_revision = 0;
 		u16 ccin_version = CFFPS_CCIN_VERSION_1;
 		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
+		char mfg_id[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
 		if (ccin > 0) {
 			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
 			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
 		}
 
+		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+				mfg_id);
+		if (rc < 0) {
+			dev_err(&client->dev,
+					"Failed to read Manufacturer ID\n");
+			return rc;
+		}
+
 		switch (ccin_version) {
 		default:
 		case CFFPS_CCIN_VERSION_1:
-			vs = cffps1;
+			if ((strncmp(mfg_id, "ACBE", 4) == 0) ||
+					(strncmp(mfg_id, "ARTE", 4) == 0))
+				vs = cffps1;
+			else
+				vs = cffps2;
 			break;
 		case CFFPS_CCIN_VERSION_2:
 			vs = cffps2;
-- 
2.25.1

