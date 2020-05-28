Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0131E721C
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 03:38:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y6dz6NxFzDqZx
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 11:38:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qCWVEKUV; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XqVM4ykFzDqPy;
 Fri, 29 May 2020 00:15:38 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id y198so13594022pfb.4;
 Thu, 28 May 2020 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=XGHYTbTFj/idv0dnWf7QG+Cg8moRXHsLIYq+mHlWJb8=;
 b=qCWVEKUVVPY6pQHiNV4vRZJ6TSUEiBOow8qeJL4gok+AOw5vxOBAkyIT3LOwhMYykb
 Fm4qewkHOpojjxq2i7QNqJ3WgmbZb2U5MAMngxeXRFFqpOfg0IrDne+kuiAYM82x3wVb
 2RHSff9MyvXGBhsSyTO9/S190iakall9JQiGcw4qy8fknGUPJ9DvwHhW8f11UrGds2Vu
 i5X88+TSK0fE+1SBMNEwJUpu6E15v3GFhu/m8zsOxuUsb/duRV7DB1JNNAzDaba2bgdO
 78oXeJi8wPJF0+qB4qY+Yyn6BxZu8vIKyLhYOyQZuINlpZIJcmwtM8pMldYNUS/oCfpg
 l3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=XGHYTbTFj/idv0dnWf7QG+Cg8moRXHsLIYq+mHlWJb8=;
 b=ihFqg/J9YQYuK9WKxx19UXK7OpfZUZX/FmIAx4vRbeaJ7wN//0sqyUPbPNCNvTDYhW
 iptT3aghKLFjgvpRbyl85dO2Xl2EWnYxuUyrCcrIr2puUQVRang4xIvKTzIYobF3KcIV
 Cg4RjPvDvOiLaM5jqkHrL/DseAVwLqedCJ+89tFzNo9209UM6xgZLrg1ifbNecr2cGUB
 2TDtgo9stLofvBWPRsghxJUona4HhWIN/Kf1zaEPSRvU17GGZTV0beM52xrvIugf+wd3
 kWTlHiR+jisV7wFEQX0R1VfHVqBk7MfaA31XlNdbikMgppDkiVfOhdvhVW7kHqT7BrNq
 8iww==
X-Gm-Message-State: AOAM533APh18PTUtObQm1EMqFeGFZCyIt0dwfynfpcohjWUPply2rrhK
 wk8zv/4mxb2WptePfA8yzBB4khOjfhk=
X-Google-Smtp-Source: ABdhPJyau0j9Gb7aMiVeAX7Qn4Fk0I16yYO/uepxNvkUntW/6CaN1T0YBq4Feb5ZsJNRhu539fsgSw==
X-Received: by 2002:a62:76cc:: with SMTP id r195mr3211576pfc.116.1590675335154; 
 Thu, 28 May 2020 07:15:35 -0700 (PDT)
Received: from cnn ([2401:4900:2340:a919:a888:ed6a:9872:b822])
 by smtp.gmail.com with ESMTPSA id j26sm4958399pfr.215.2020.05.28.07.15.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 07:15:34 -0700 (PDT)
Date: Thu, 28 May 2020 19:45:23 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200528141523.GA8810@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 29 May 2020 11:35:31 +1000
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
Cc: manikandan.e@hcl.com, patrickw3@fb.com, vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


The adm1278 temperature sysfs attribute need it for one of the our openbmc platform . 
This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.

---
 drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 5caa37fb..47b293d 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -681,6 +681,21 @@ static int adm1275_probe(struct i2c_client *client,
 			}
 		}
 
+		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+		if (config < 0)
+			return config;
+
+		/* Enable TEMP1 by defult */
+		config |= ADM1278_TEMP1_EN;
+		ret = i2c_smbus_write_byte_data(client,
+					ADM1275_PMON_CONFIG,
+					config);
+		if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to enable temperature config\n");
+		return -ENODEV;
+		}
+
 		if (config & ADM1278_TEMP1_EN)
 			info->func[0] |=
 				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
-- 
2.7.4

