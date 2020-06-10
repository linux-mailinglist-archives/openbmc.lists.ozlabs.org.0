Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D11F503F
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 10:27:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hg8L2s9QzDqcQ
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 18:27:14 +1000 (AEST)
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
 header.s=20161025 header.b=gV025CDP; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hg7N57DQzDqMr;
 Wed, 10 Jun 2020 18:26:22 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b5so784939pfp.9;
 Wed, 10 Jun 2020 01:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=EeIfeMtC6ZVKYeciuWjHUrT7P8TMj/nqx7gXpKs4XCw=;
 b=gV025CDPRGRjF9olznMwB9I8BVSSZyFb6nZT9v8dhM3lR9EOk99EmbUOrOVBIJkU1k
 XJApj6a9uHsHCS8WuNg9nf8+3fRndJp2++HkXAnOMNh7IslSSunzMND27SdnLZ04HADf
 U4J/FgsvkwskI1E/y4QYWhRM1A7EMeBz6tohFNhyjL0ZowQG/Lxyx8A3R3tUueuKdkEe
 tFC/RQt/vozPGE7s8VeSllKn/BHZXvB9lxuRwD+gSlYOlaONDWioa0AiGRoHBHMMKiyj
 tlLhrr8U3RGcpAaO5qwhlP8RPhiDoLAGib6NyhKfj3Xu7X8LD1UBYgGJO1yWo2wlRB5P
 kDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=EeIfeMtC6ZVKYeciuWjHUrT7P8TMj/nqx7gXpKs4XCw=;
 b=txlb/+qXwewWl2J/KMaN1VUcIy9C4qjLX/pqbOSHncqx0v7K/Jo+63NLvDs01CK5P0
 Pj08koBBOB7L2GTycGOOY8M5iSQHui+EldFFHI3RVf2Ja9/9SN8bnJ9ZKl/ZEn9g21Eg
 /0Erv8z0sR332XhPgQ2W7ZaiguiE8/3P0LA00i6UWSixnpoOdY4QiMjvhzcIYGvr2ENu
 VLZVqbGrjbej6zP0IqfDYbiUXf+IR4jEajTVmU2pvFsgoKs9GjwqnPNLz2q0LhJu/5IW
 7d934J67/U9FBPqPZK/8AdZV80R4TiVUG35bctBPJ373dSBAunpWfiXJwgUzM4cc/3qv
 603A==
X-Gm-Message-State: AOAM5314Z1pvUUVFhcJsJwK5vmsnx0jIAjPAMVO1jWfTgxi5bfSuGIPQ
 /HmekhGDC3hrtEEs+GMsGlQ=
X-Google-Smtp-Source: ABdhPJzl+voonL1FEiRC2ZFApPnKYyVNuEkBlIo+oyZjozrtQXiPPJ2+TVtcMhKqtohIEOSPcJMKpA==
X-Received: by 2002:a63:ce14:: with SMTP id y20mr1710922pgf.186.1591777579132; 
 Wed, 10 Jun 2020 01:26:19 -0700 (PDT)
Received: from cnn ([2402:3a80:407:e743:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id c9sm12172754pfp.100.2020.06.10.01.26.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 01:26:18 -0700 (PDT)
Date: Wed, 10 Jun 2020 13:56:11 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200610082611.GA14266@cnn>
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
changes in conditional check to enable vout & temp1 by default.
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
+		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
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

