Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F28203B40
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 17:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rDBh3GDrzDqWM
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 01:40:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VJEN13ez; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rD7R1LwZzDqVp;
 Tue, 23 Jun 2020 01:37:38 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d4so8316282pgk.4;
 Mon, 22 Jun 2020 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Es07PooiZSXxjxOYZMyYhw0eShmysXjcokuuPID8SBQ=;
 b=VJEN13ezcBfitU/knBaJoVjUSPO7tRSy83x0iwvXUroVjfpM1abAak06Wby0HSJhjW
 3TAfZpgTv5+0lDjXEjJJlg4Ai0WaUmrBG8tLcFguItP0s4OInG1dE5CppJ4yEPr6CFvu
 Le+uPayyeugMSGDo7/YB+3yVZh7NPR07n2yylWV2gnwIR5e77Mk/7B64mp/FAWkbSdI1
 b5g0nUUh1on9k6+eN7HTXF48a/YBefUH8//I9p7iq0oK2Q1njJgntodYvewj7VCSpsT8
 r6UfaGjUzB2Z496qnfeHts1VvCxbPOuCD3RSdxHoMHxZw430Oo/i4if0cUpTTuAqpQon
 LoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Es07PooiZSXxjxOYZMyYhw0eShmysXjcokuuPID8SBQ=;
 b=ktX4hv+COagiFycK7h5D5qjAWmTk3hjakVP5uPDK3WWC0utjMJyn7cW5lLur00d9sC
 BK+YzdSeOvyUTgHhV5yA+onEZyz6nNEGmIltHUuQwEyClis3Mgdx89l4+it1IRDv+Fo9
 H6ZMunyEUMzFLeDRpg+ZmdMhWNYhPHYQLn7n/ZjR6RGG2VxxoYZ9q9XiaTztwE7yvw6L
 Hf7+3214AqIGA+UIBE4Nu02l3G9W9YIuR7MIyXGuig/tl8AvIlRjei3hpmlvQZGBjC6c
 +LAaSYWiViV1xOoThy5wjXaMiQQtuY6zRZ4UFUIAPdyiSS/5xvnXGMsCFQkBBn0xTnde
 t+nA==
X-Gm-Message-State: AOAM5328eOn8vGimPW9UCfhGIeWQ5C4RN5PthFVLq35+rGGqGdsFU4Rz
 bt50qOJ1jBIeu24Fva3/KLo=
X-Google-Smtp-Source: ABdhPJyrpuylIa7V3BVep59iIW7Hr5hWwlEONFn+NSvjqQKwf6Zd3Di3SEEpmzlZnQBAKhFy8LxKJw==
X-Received: by 2002:a62:7841:: with SMTP id t62mr19835568pfc.273.1592840256516; 
 Mon, 22 Jun 2020 08:37:36 -0700 (PDT)
Received: from cnn ([2402:3a80:462:12d4:244f:2b0c:295:2c0b])
 by smtp.gmail.com with ESMTPSA id i12sm14333391pfk.180.2020.06.22.08.37.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 08:37:36 -0700 (PDT)
Date: Mon, 22 Jun 2020 21:07:27 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, miltonm@us.ibm.com,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200622153727.GA9347@cnn>
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

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
---
v5 -> v6: 
add Reported-by in commit log
align commit and change log as per guidelines.
v4 -> v5: 
align commit and change log. 
v3 -> v4: 
kernel test robot CI warning
v2 -> v3: 
fix invalid signed-off.
removed checkpath warnings.
write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
v1 -> v2: 
add Signed-off-by.
removed ADM1278_TEMP1_EN check.

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

