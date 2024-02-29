Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A586D6DC
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 23:27:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BboKlfR0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm5Ss4f3cz3bZ1
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 09:27:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BboKlfR0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tm5SG04sRz3bmH
	for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2024 09:27:09 +1100 (AEDT)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 6CC1EC29C1
	for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 22:22:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 594DC1BF205;
	Thu, 29 Feb 2024 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709245324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vXQti813qjlmOLifixiuae4rGnXkl/dZRgzemhLIIuI=;
	b=BboKlfR0io6uhoSX9M/qXIXMRpbuvsG8ZMbNg98I66b0NOSB14mbHaVQn2B2noqZOXW9GN
	Jjy4nI02E+iAMD1ECCTRwYTNYFHqSDxq6mDCGWMcAHhzevWvTSJuWMYLIvoMsvIFwOvp6O
	RFEGJVXRWrJsgMy0GBDH1sOtAgfDKceOJhHXb2dqsd4Hz150sv4rqye/a9UM5pj6j88TmF
	aem+3qWJPn8mBsfTbH7+RP3jR5S14Ou4Rvwfw5Tvbz51wuTJMXvtpJobkypGc/LojAQKzN
	iftBgEP+ZeGuJ5suGgi/mGdIgf2Ae2UzNlC+Ek4gMyiWOLtN4OG21a7AA9kOxw==
From: alexandre.belloni@bootlin.com
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: nct3018y: fix possible NULL dereference
Date: Thu, 29 Feb 2024 23:21:27 +0100
Message-ID: <20240229222127.1878176-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

alarm_enable and alarm_flag are allowed to be NULL but will be dereferenced
later by the dev_dbg call.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202305180042.DEzW1pSd-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-nct3018y.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index f488a189a465..076d8b99f913 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -102,6 +102,8 @@ static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *ala
 		if (flags < 0)
 			return flags;
 		*alarm_enable = flags & NCT3018Y_BIT_AIE;
+		dev_dbg(&client->dev, "%s:alarm_enable:%x\n", __func__, *alarm_enable);
+
 	}
 
 	if (alarm_flag) {
@@ -110,11 +112,9 @@ static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *ala
 		if (flags < 0)
 			return flags;
 		*alarm_flag = flags & NCT3018Y_BIT_AF;
+		dev_dbg(&client->dev, "%s:alarm_flag:%x\n", __func__, *alarm_flag);
 	}
 
-	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
-		__func__, *alarm_enable, *alarm_flag);
-
 	return 0;
 }
 
-- 
2.43.0

