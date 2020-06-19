Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE120183D
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 18:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pPrb4sf4zDrPQ
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 02:48:31 +1000 (AEST)
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
 header.s=20161025 header.b=ZHBdCnX7; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pMBq3xvRzDrPm;
 Sat, 20 Jun 2020 00:49:06 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id h10so4569347pgq.10;
 Fri, 19 Jun 2020 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ctscLOlaKZHuHAvTFyT78hwNlRcZSz4aJaHfOiGs+e0=;
 b=ZHBdCnX7+qH7Kxr7PP2Ge6MSsRgRj0s/ihGp4bPB13nAk+lg2mZ9GPpFQHv5SE351v
 bM5jgHNdHfrUEaaLrMrXiCuqIYiwQEqSrs829H2hVv+qrNrXPAIra7ygBRVJb1mhIt/N
 1uXJzpSK2VT48LrvhU5HdW+QJTwStqm3A26IHPJ9X0mwkp68M1TF85ET6Ul4g606Lnjh
 mTZ9oGfAXFD5HTO+GmCIIMB4dHVTl8BFajZxa2Kk9QbceYPQuGQq5O3WZkk06dO0oIwq
 XOemreiCAGbB5Yr07/Q0AtBCWzBJoqZExVDVf0M3Htqv+XndSHiJh7ib/ft/GHuKHdPn
 WQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ctscLOlaKZHuHAvTFyT78hwNlRcZSz4aJaHfOiGs+e0=;
 b=DzHTvqKBON1Bc1RrNudIPg5E4UBwUs2Nx0LbqSsL4yKx289bn93CF+2Siv8ZnQ3/JD
 OlUC1MNtHnQ0fMZmL9onFCGACoP8Ry4dZTAXgOiTnvwJ2TcikIlBrP1eWz0XyqRiwa+l
 krmk/6DyiYKnHI3Gkj2NhRl8ZR3fAwRd9ioj0hmMBnFrf08q1YfdE1DD+S3ZXvxS/m6V
 3Kd6hWKR5T29NewJytQ8uLJ/Uv6VxOnsIBGIQLOaSQkFwIFXusfeKU0BxXW6UJpt1d8Q
 sMWc1SuLoWxTMg8R4zhAtevKLKHh6V8H15wBAA9aMPhUNt+4YxudWuV4tffzUpQt8rv8
 PAIQ==
X-Gm-Message-State: AOAM53092M8qYOwjmcFVRkMz/nIypLD03gPTbq1CKl/ogPV29GJT/JUm
 BmZuayMqF38E1842ddT5E7c=
X-Google-Smtp-Source: ABdhPJxerp4UqGlBqo7ylxGcCO9oCGFDfiOp3F5MBCTgeGs6IAVexj7p0hvG8EQQNbo8S8SNGMozPQ==
X-Received: by 2002:a63:1406:: with SMTP id u6mr3318908pgl.108.1592578142495; 
 Fri, 19 Jun 2020 07:49:02 -0700 (PDT)
Received: from cnn ([2402:3a80:455:d3c:b10e:bd87:9e7c:d04])
 by smtp.gmail.com with ESMTPSA id n19sm5975012pfu.194.2020.06.19.07.48.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 07:49:01 -0700 (PDT)
Date: Fri, 19 Jun 2020 20:18:53 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200619144853.GA18271@cnn>
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

v4:
---
Reported-by: kernel test robot <lkp@intel.com>
v3:
----
fix invalid signed-off.
removed checkpath warnings.
write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
v2:
----
add Signed-off-by.
removed ADM1278_TEMP1_EN check.

Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
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

