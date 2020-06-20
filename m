Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9044202179
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 06:36:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pjY21PvWzDrZh
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 14:36:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VoG4wjiO; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pjX75sTgzDrRN;
 Sat, 20 Jun 2020 14:35:19 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d10so2966544pls.5;
 Fri, 19 Jun 2020 21:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=LiVphpOlRXGaGXfaOABG1RGoV3+LFuxLuQ5qOuypjgE=;
 b=VoG4wjiOstuvcoF6JJtdY0dAYQzYUVrczUc+WkA+cB6u+sSZuJdJ7CxFkFGhmM8o+4
 El2ys175Ln0yOVQ02V2l6WUtWsZVmErwrCn47spMqBJxAGAeJ38JNToN9b9ClVheJMfZ
 UxGZry0X0pJWdRhEJBfbkxfYVVNkFSRN3iOE+YIyvRKGnmKpTrLqxJy0wVR6gRtVyQ5Z
 eluoy3dHPnavSxOKdIVzxvfXLakrRxe5wKOv/WWWD/BxpYa59ONurmRvJMbnSO7tXDpn
 VbK/i/BqHflhzl6TkW6NdouQyT133RcZxmjPZwP4unufmzdoo/yLY6VAXaVvOPhNdn5a
 KyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=LiVphpOlRXGaGXfaOABG1RGoV3+LFuxLuQ5qOuypjgE=;
 b=aO7PFLop1T4Gde6yNPUo7QMNROZKkh76MMb5ijfc1eMgyig2U7VSiuyxMirrFGl6Wg
 qmNFjY7Uvu//pqDYWEDyLHNYw4a3G8FyLbZG8/1rNJI7d1NsEpQc2hoyD/K/uePieIR8
 c3zsbW6NNj7iJsh8LKbsJzZBdRdsRM90Pqir14Mh/LfU47QFBY+V3VIYXubDOYC98Ev2
 eykZmLxmdHVAUbWK7tIPP2i6TfDPKfYjL+dqqFjkNIv77+G73yNmJvfX6u2jhDILtry5
 DZ7MrM+yplzvhO6pMAOyF8XGEFw/dxvaCm/UuTRAJ5Hn3YhtFJU8f9OO+RMnXsPX31aJ
 oAdA==
X-Gm-Message-State: AOAM5319xljsB+sMDFPreA7ReBBCjyI3gwIVjxAEWAw0fICOyfJ47OzO
 dFXshrjcR3bcRNSpupbJUWg=
X-Google-Smtp-Source: ABdhPJyki36oOBj8oLOeUx0Qp+o1Ryj3uhYf7b3heG9W1GfWzOfAZ33uFiIY3YHa/r5LIhOa/BVWuw==
X-Received: by 2002:a17:90a:930f:: with SMTP id
 p15mr6963952pjo.85.1592627715752; 
 Fri, 19 Jun 2020 21:35:15 -0700 (PDT)
Received: from cnn ([112.133.236.114])
 by smtp.gmail.com with ESMTPSA id i5sm6669437pjd.23.2020.06.19.21.35.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 21:35:15 -0700 (PDT)
Date: Sat, 20 Jun 2020 10:05:09 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200620043509.GA27532@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, vijaykhemka@fb.com, saipsdasari@fb.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The adm1278 temp attribute need it for openbmc platform .
This feature not enabled by default, so PMON_CONFIG needs to enable it.

Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
---
---    v5 -align commit and change log. 
---    v4 -Reported-by: kernel test robot <lkp@intel.com>
---    v3 -fix invalid signed-off.
---       -removed checkpath warnings.
---       -write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
---    v2 -add Signed-off-by.
---       -removed ADM1278_TEMP1_EN check.
---
---
 drivers/hwmon/pmbus/adm1275.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 5caa37fb..d4e1925 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		/* Enable VOUT if not enabled (it is disabled by default) */
-		if (!(config & ADM1278_VOUT_EN)) {
-			config |= ADM1278_VOUT_EN;
+		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
+		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) != (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
+			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
 			ret = i2c_smbus_write_byte_data(client,
 							ADM1275_PMON_CONFIG,
 							config);
@@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
 			}
 		}
 
-		if (config & ADM1278_TEMP1_EN)
-			info->func[0] |=
-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
 		break;
-- 
2.7.4

