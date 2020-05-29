Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F31E7DA4
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 14:51:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YPb35Px0zDqfH
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 22:51:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BXyI1nGH; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YPTc6nmYzDqj1;
 Fri, 29 May 2020 22:47:00 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q8so1335209pfu.5;
 Fri, 29 May 2020 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=/q+MI9DCYmzNXOUcv5PNKoWs6DLZXfWW5JzDERtOTi0=;
 b=BXyI1nGH9q7WV+suVu4sRRfrCawjSHzAZkw0A91VCTaw+zCwkYabvL0E9RJhTabyMe
 IZDGzWyLTv69FfqLS3mk0pdXMS7UG37oI6S6f9NaJmufisRJRUZCUdeQ0Z6w6yJ+U5xd
 nICH6zJtFZ1Ky+rEFarg7gMOwGvQ8nc/YHC/SwqqL+YVHzOQPNaXoDWb2+5dIUZxbdcA
 PXckHKFILQl0iG1CmUKw0v67HPGAd3Xl3Fybq/MbrLFAJyT45ABp9vMnQMbJmWs5IYzJ
 d4vAM+XxebyIkNp6uCEypy7nwJSBDw5v0EghA80wURhZoG6WBV6KCzFYK/Yqa9WPEcfU
 ueJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=/q+MI9DCYmzNXOUcv5PNKoWs6DLZXfWW5JzDERtOTi0=;
 b=H4o2Rv1aPOFj/lpUMFEfQeK3ddqnZmZ5WOlMcwt1rbVim4/CqG3l575DDtDtz3C89r
 EogQBaY98BgYLIDYLi/fffZKM7HSkrih2sH5ih/9tExmoflLTv6cXzegOWz0KEIKrO6c
 WiuPEWcFgapgONlal5D9kFV9VrnT8nNc5H5xspz6kzvnHn12HjSN/lxQXLg567We5BU2
 XgZ87ASozlpXl5ZOn9qX7eEmF4EN6ullWPs11X80c/i78ibOYShKhVwKJQpfR9x3x5wX
 nKQdMQm4KvtNKQApN8VS8CuRPgfDOrkP5+g0QhGOb0RsP0tqKWacZBrv35u2OuBvRRvg
 tmMw==
X-Gm-Message-State: AOAM533chr6zGv2dJT0BzL7WsbDdzOHeSFyJWwz/gAZfRsumRxYh471+
 0ZXufZIE27udVJsHbffpZyw=
X-Google-Smtp-Source: ABdhPJwZyYjuXsZ1Rfhk+XonOEk9hVjmtO4n1WKyBOWY8Too4XOwaSPB/nqehEX5nZRw4hcYiF/t5A==
X-Received: by 2002:a63:7d1d:: with SMTP id y29mr8120125pgc.189.1590756415869; 
 Fri, 29 May 2020 05:46:55 -0700 (PDT)
Received: from cnn ([2401:4900:2654:9f89:6942:a923:c6ef:8ae2])
 by smtp.gmail.com with ESMTPSA id 25sm8180906pjk.50.2020.05.29.05.46.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 05:46:55 -0700 (PDT)
Date: Fri, 29 May 2020 18:16:07 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN 
Message-ID: <20200529124607.GA3469@cnn>
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
Cc: manikandan.e@hcl.com, saipsdasari@fb.com, patrickw3@fb.com,
 linux@roeck-us.net, vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.

Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>

v2:
   - Add Signed-off-by.
   - Removed ADM1278_TEMP1_EN check.
---
 drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 5caa37fb..ab5fceb 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+
+		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+		if (config < 0)
+			return config;
+
+		/* Enable TEMP1 by default */
+		config |= ADM1278_TEMP1_EN;
+		ret = i2c_smbus_write_byte_data(client,
+					ADM1275_PMON_CONFIG,
+					config);
+		if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to enable temperature config\n");
+		return -ENODEV;
+		}
 
 		/* Enable VOUT if not enabled (it is disabled by default) */
 		if (!(config & ADM1278_VOUT_EN)) {
@@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
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

