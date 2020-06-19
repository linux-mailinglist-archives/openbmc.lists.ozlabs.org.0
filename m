Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B352019AE
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 19:46:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pR7f5fs1zDqHk
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 03:46:38 +1000 (AEST)
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
 header.s=20161025 header.b=lOWhq/zJ; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pPwk5fkhzDqSN;
 Sat, 20 Jun 2020 02:52:05 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id e18so4732412pgn.7;
 Fri, 19 Jun 2020 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=MojqGVMm/N36ukD1qQOzNiKEH9Yim97rUfkXtpM0HIo=;
 b=lOWhq/zJNBjesFgxGkSn+BtJRwxdpQomhyNHZjlONsvkEN01tr66aBIeORJjSlwrzc
 FU5LcMVd9PShZF8KF7qWB2r9nJTDNzbUQFTIbtZEygCCvfx2SoWdYi3G4ThYpquzn7du
 VjTaDYtDXrCRuMgvTdYBl0LSsSxePM1iVhw0O+4kHjzM9oruFsWA+9t6pDoSSEeytMUq
 ztebVmkrP6goQODaIFcGYuFPm9xXGNRapQ4dceWSPlj7VfBr3vZitoPI5lAVO03aVVvO
 7w9bYuIMXzVmT0/+BmyJmMycx1Ctm9cPdZiWG8cDdpIyaj+6wWD9lfbEGHobj4s5ya5g
 pTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=MojqGVMm/N36ukD1qQOzNiKEH9Yim97rUfkXtpM0HIo=;
 b=UfZm9KeHzoDA9A+HZeFPDV2QLZC5n0d3ay3itQhxMB7Ooso+egJJT9EoiSXVLECxg9
 r87tOya5rPRLmdSvGe96U4R6oTLSyCoG4ilQS2lbgsDqjA9PzCkADVwCsiUMFMajg9Ns
 YHxd7RlMq7PlSHopMbD2qTywuzV/5mQFs8eLitXfc8G3UTkwVasIw5+43ZW/0JWgbCqm
 m2+Fmprax/ByAaqtWT9fs96+fJhBz3bArnUu27KYu0pKUOwMNVndhFA0QOmIJ6gft9rj
 jJQ/+5Et1u32aIHNfd7EfTugLDgHVzfbMfN8dnH/H/D9j5rlkLbHKdVZQoNd2QkuEW8A
 jDrw==
X-Gm-Message-State: AOAM532qsAptKkBpJDOi4o3jMixeVuKzviAm1bgFTz9waFS+Rs51CBeH
 cAqUTWaRtLCGvB/9qIe6WD0=
X-Google-Smtp-Source: ABdhPJxQLpIde5crNDljO1wbiI8PDd931pTpWT7w4Fpd3YuE5eJBQnt/XfFKVMlmlaSaxcOe7PD3Rg==
X-Received: by 2002:a62:8095:: with SMTP id j143mr8678422pfd.62.1592585522685; 
 Fri, 19 Jun 2020 09:52:02 -0700 (PDT)
Received: from cnn ([112.133.236.100])
 by smtp.gmail.com with ESMTPSA id w18sm5580656pgj.31.2020.06.19.09.51.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 09:52:02 -0700 (PDT)
Date: Fri, 19 Jun 2020 22:21:54 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200619165154.GA20461@cnn>
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

