Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7A41B8B0
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 22:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJsB11nFvz2xfJ
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 06:51:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PDoIdU8l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PDoIdU8l; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJs9c3JW2z2xKT
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 06:51:15 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id n6so160171qvp.7
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=We+Hncm1dVQvjyDtLz/UlNXZ+UBYHqbLW/DDtyJJi3c=;
 b=PDoIdU8lxTm5ThnEPRbDJKoLBfGo/tgseca8fgFCeYDws8WWtddgGyjWdb0aXJde0p
 tjZ6JAvy18kJC9+srq37Q1/CvCwIMz07FNG+CyT8EImfvQHw/q5qxVrd557eMp3svXPD
 fn0sv5b3Sm3M9sn0wUxAZ6qTLw0BiwMaYRtFOUtJ58web4yUdd9ZN+dDguFvdCNQhbME
 /n3VuuJQvtDEL6lf8+IpAaqNVxm+jSrHahsjxq6KqIE9N1ieQPzBixqxxBJge+MAQcSF
 kuHdv7AeWHKfPSyw6WIA4OSx8CxwQA4NdrLWjfZra3J37mMjmpzuT5WO7HdaxepX8mk9
 yAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=We+Hncm1dVQvjyDtLz/UlNXZ+UBYHqbLW/DDtyJJi3c=;
 b=39I9X/Sxb9xOfJpHrltIX7YPZHuxOm3tKaz8M7OkMrunIYEk0xNBCFz2WlY8x+RdNA
 hDQFGXv6eE7nO3rAVTZR6KpPXMhPyqo//IaOa/BF2mQCiNa+pCEon/70KBugFkVnvbCe
 5fTH8h5f9LvUdePjZFCdM10Wg19zY9T+3Q+X7deOYLLzIMt0bukZN3VLWnR1C/lPACeS
 fLJNfIPQ7PY3N7KGIT40rJ9Lm2HU7Rs9w9nck5P8yknkaociG8axv7d+GEcKtRGu5nmQ
 AjZz/9YFvzQp/xhUdJaPdHIWUxKZai/eqHkmJzUrqJjqQlGUQAq+lVMht2WW6ZtJKdSW
 vEPA==
X-Gm-Message-State: AOAM530QeVc9JuwbAobs9thZ3mEWuydP4BA5y4cLP4GdMrq2Y0WKyvxQ
 8xjnByQ4K0XgKtZmO7x3QXY=
X-Google-Smtp-Source: ABdhPJxHQF+glZA3UMYut+VTtrVbz09lGVld5XtgNBlf+IJHDS4Uukl4RY568e/zwxLPwSkwIpD3Uw==
X-Received: by 2002:a0c:e4c8:: with SMTP id g8mr8150201qvm.24.1632862269646;
 Tue, 28 Sep 2021 13:51:09 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id x3sm173004qkl.107.2021.09.28.13.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:51:09 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2] hwmon: (pmbus/ibm-cffps) max_power_out swap changes
Date: Tue, 28 Sep 2021 20:50:51 +0000
Message-Id: <20210928205051.1222815-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The bytes for max_power_out from the ibm-cffps devices differ in byte
order for some power supplies.

The Witherspoon power supply returns the bytes in MSB/LSB order.

The Rainier power supply returns the bytes in LSB/MSB order.

The Witherspoon power supply uses version cffps1. The Rainier power
supply should use version cffps2. If version is cffps1, swap the bytes
before output to max_power_out.

Tested:
    Witherspoon before: 3148. Witherspoon after: 3148.
    Rainier before: 53255. Rainier after: 2000.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index df712ce4b164..79bfcd2749a6 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -171,8 +171,14 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 		cmd = CFFPS_SN_CMD;
 		break;
 	case CFFPS_DEBUGFS_MAX_POWER_OUT:
-		rc = i2c_smbus_read_word_swapped(psu->client,
-						 CFFPS_MAX_POWER_OUT_CMD);
+		if (cffps1 == psu->version) {
+			rc = i2c_smbus_read_word_swapped(psu->client,
+					CFFPS_MAX_POWER_OUT_CMD);
+		} else {
+			rc = i2c_smbus_read_word_data(psu->client,
+					CFFPS_MAX_POWER_OUT_CMD);
+		}
+
 		if (rc < 0)
 			return rc;
 
-- 
2.25.1

