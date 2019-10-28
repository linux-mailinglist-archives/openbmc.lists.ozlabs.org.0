Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C0E777F
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:19:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4721g42w9FzDrgT
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:19:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=navid.emamdoost@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZeldSHPe"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4721f571ZbzDrgP;
 Tue, 29 Oct 2019 04:18:53 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id o16so8848865ilq.9;
 Mon, 28 Oct 2019 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iuTrpxKUHZ/UCdTRpuBAw/Jl1hvuK8hDPzJ43oHoufo=;
 b=ZeldSHPeFLJ+46uOkfBauBzB4QUPRBL6FT/1IHG3H5HgV/S9oZEeCr/eYmlUMX7RQq
 IFbtyzQhlAjxV3MeEOPtjCY8Mgkf7ZOjnufKao/zkc8ODIrNdmsBxMrvOsEYgxp8plBY
 Zp0UGhtXV58wk7kTz2557fjBR2/HNO+4dc9QPt39aIk70v8soaE+VJulKOGSGN5DPj5r
 yGXE/TiVoohKDdetpgR3vFS8PLMbiOrvdEIKTalwP+ZB5NtQPEv+qqHl0Ae8gfMoYpWR
 pHfnd+NmAMEOqTOFdBKEqVr5NztbiyfO2NZAiotAE7M9JiDm1PeEbPhivg9/gcDxn0h2
 vkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iuTrpxKUHZ/UCdTRpuBAw/Jl1hvuK8hDPzJ43oHoufo=;
 b=QZUHLUnlXjGq6MbSy7lZvanNeqsT58tlOP1qOZXrEAvnL/03aAy+8JhSoAWwSBZ9+G
 ITXpA0UzfQEscAIVfcrlA892AFXE7/42MJcDyZXiC5O5v4f7RvbGYn4cRJU5NgIOfTt0
 yncbdKSGSDDX7x2EmYowRhE9kG4OWChpFZSIxmoKFxuAVntMu/MSi1EAkmRVbbw1GaWb
 K5JhN1q7C8F7FM4Bla+ZUTmxupqcQZpTXWKlYi+qYsOENT87Phlhgyg7zSFMqQYxw6tS
 gjdRXGCIQe3qmvKGRRkjtWIBWnvCksO5O6byeEzO4b7nnbk00FPryFh+UstTQEtlOARQ
 fyVQ==
X-Gm-Message-State: APjAAAXHNXwk7qPH5E/204WKAdnxWNUdQhF459fRvtyyEp1IMeOWYXPg
 OXN6ikk/w0Gcrain8U1trwI=
X-Google-Smtp-Source: APXvYqzQieKGGUdlk8auRT6Jo9SvrelCUC+fWWRQTTE6KT3RIsMBxP0GS64VURM0hUE8IXpPF2ghQg==
X-Received: by 2002:a92:ce4a:: with SMTP id a10mr22136925ilr.48.1572283131374; 
 Mon, 28 Oct 2019 10:18:51 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id f8sm1637563ilg.58.2019.10.28.10.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 10:18:50 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: jae.hyun.yoo@linux.intel.com
Subject: [PATCH v3] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Date: Mon, 28 Oct 2019 12:18:37 -0500
Message-Id: <20191028171838.28533-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
References: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 kjlu@umn.edu, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, emamd001@umn.edu,
 smccaman@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the implementation of aspeed_video_probe() the allocated memory for
video should be released if either devm_ioremap_resource()
or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
kzalloc() with devm_kzalloc to avoid explicit release for video.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v3:
	-- fix call to devm_kzalloc()
---
 drivers/media/platform/aspeed-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..70797b41447c 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1646,7 +1646,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
 {
 	int rc;
 	struct resource *res;
-	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
+	struct aspeed_video *video =
+		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 
 	if (!video)
 		return -ENOMEM;
-- 
2.17.1

