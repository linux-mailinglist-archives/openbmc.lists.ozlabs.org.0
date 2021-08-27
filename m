Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B643FA1AC
	for <lists+openbmc@lfdr.de>; Sat, 28 Aug 2021 01:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxFg15Nh7z304x
	for <lists+openbmc@lfdr.de>; Sat, 28 Aug 2021 09:05:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VXHVnFW4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VXHVnFW4; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxFfc4fN7z2yJd
 for <openbmc@lists.ozlabs.org>; Sat, 28 Aug 2021 09:04:55 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id f22so8925343qkm.5
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 16:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01hGhTEykF0Oen+PehMw35YekmoQ4ZCTAgo08P6ZyM0=;
 b=VXHVnFW4X99IfoeL1Osga+0QOlK7SZcSfSTCQoYalwMggX1m4+IQFr8j842mLXzirK
 8YIDt5Cym/8mL3i/9yLGVKCt3pUKLyWqoC/cEg/o/Ysht17g+p6ZErp2ihIW0Co6mGuK
 tfEpsL8Ta6i5ygGrPNMbHKWdRHB6gnS+0CvytsFpricDcq7YDWHJpdswFsDICnwzRq+8
 xq91UuJRcOWOm8LL1kqdzzAIRkZaGiwgPSlQETmXipHkalvjdSIrSRm2qoJgZAskykcb
 SJGw9B7iaQMJejgNIcHBzDtyE50vEb8BZd4NVWh0HloRB8BGaoanDBrYkybv3irugFBE
 u5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01hGhTEykF0Oen+PehMw35YekmoQ4ZCTAgo08P6ZyM0=;
 b=BG9LcAiyEPjzCTLHDiq8juxX56agUxAR7c5sIecIXHYYF6vXwpZ37Wp96b4av6qPz2
 9b++QNZUEFZWLlkFgc5pB4Xul8xCzF6Km5VOYnOi6HvaqjpkjEzX82ug7ziVp+YZV9dA
 sI+IDTqRNacgKzK5eyVVebz9GWiIDoR1PKErddXawr2YhjhzB78/SPnKTEbj6MmgzWZ3
 wZDUe0Lw1E/NtB7FnOJmm5ex4klF/Yc+Vy53+Z6xgEgHyPpmS5F+t09HGiyrgoKi0pPQ
 maOS4RnkCCYoF/FKdXk1ybxQv51sQ6Ma44Ubu0D5r4wQ8wX1O38YA0EqEWO8BIboA572
 NS7g==
X-Gm-Message-State: AOAM532XzMRU119OzyD7tp5OHJCy0PfBjqYnIvNNIYv5tiR1XxeHmUsL
 EawAssQCtDVeKGaIKNEpFT8=
X-Google-Smtp-Source: ABdhPJyaBfKBb7GEWJZ8qyNK3DpPQ8kfFHQrTmVYwd3GlY2LhCQhDmAaxnzD9iRm3gq6oMi5oTO6Zg==
X-Received: by 2002:ae9:e017:: with SMTP id m23mr11681862qkk.8.1630105492020; 
 Fri, 27 Aug 2021 16:04:52 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id p22sm5588552qkj.16.2021.08.27.16.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 16:04:51 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
Date: Fri, 27 Aug 2021 23:04:33 +0000
Message-Id: <20210827230433.3596370-1-bjwyman@gmail.com>
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

The bytes for max_power_out from the ibm-cffps devices do not need to be
swapped.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index df712ce4b164..29b77f192c9e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 		cmd = CFFPS_SN_CMD;
 		break;
 	case CFFPS_DEBUGFS_MAX_POWER_OUT:
-		rc = i2c_smbus_read_word_swapped(psu->client,
+		rc = i2c_smbus_read_word_data(psu->client,
 						 CFFPS_MAX_POWER_OUT_CMD);
 		if (rc < 0)
 			return rc;
-- 
2.25.1

