Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12321E7722
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 17:59:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4721Cy5vW3zDrdX
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 03:59:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=navid.emamdoost@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIvX0idW"; 
 dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4721Bt3DBMzDrZh;
 Tue, 29 Oct 2019 03:58:43 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id a13so8825425ilp.1;
 Mon, 28 Oct 2019 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VsYOYw/63XAVKPUsYisyXnfblClorjAawHJi/it0oEA=;
 b=OIvX0idWV6esLVnTUjwsh8UX0Y3MegoKcCrUD36IazFKX/z4o4uXg0RgARV00n2l9A
 IsJFqlj41Kkp+0TO1kGJBeTa93xlWKkBk2sUsCbSx9I0xYqM23tRWBEsXzZbI9B1KdIm
 gJK5ScQ+N5hznm3+xbFwlmmllQeuPSzoTwLC2MBXy9aVrEduAt+jm+bZdVrIkQYQdipw
 eh4+A+1UszCvXqa5t2qNh0QPHipSR5BsWKa/AVAeWpl7mKf3On3n8D2TjXOvoQWqukRD
 E99/TWyhTaurLqz0QfX0oAbXkzqkEDrmroVb2688sx/hKI4ycpfahn2P7K/IBPjUdnSH
 A+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VsYOYw/63XAVKPUsYisyXnfblClorjAawHJi/it0oEA=;
 b=A+++74winFOBkMdMHPsq1DUGhZjr9gKlRXWcUkVFqhuMP9sUmV/hwisT0Jre42jbvB
 iQlZ3M4GDrkefE4jN7JZbB7VMt8s7vO1gZw3njSss/ppOyLIVH7Gn3kiBZb+9iaTPLSO
 CjPigtB0NdVXfh21agW1udLXDKdBCJAopgVZXudDRPvbjkzGqyir0EeQTKYfxnrhu/P6
 Mx2IZZsbn8v1B6XR846Lxh1iI7ouKlecqRpTr7N2GwUjHrhqe+Unfar+LxZTzaS6tW2l
 3PaPotouTm8e/gucckI/ffJW0w4EUUHkm6kfWmGDqOGajk3M6NqU1eJvk+hFhhEYXZyn
 G9JA==
X-Gm-Message-State: APjAAAVjqf7+MdDHMNhirJJfYzXMMQ3BmDEiei11dcpD6gEoISmMLb+A
 biayp70YQuDfzb7hW8MkJUE=
X-Google-Smtp-Source: APXvYqx2qXlEPCIiPVhl6XhY2JTF9eYwSmAPTLsncPs7iDDy0d9kOOdavwbVbzeSJzJSR1vraAyjIw==
X-Received: by 2002:a92:9a54:: with SMTP id t81mr22517749ili.197.1572281920640; 
 Mon, 28 Oct 2019 09:58:40 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id l2sm597572ilc.34.2019.10.28.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:58:39 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: jae.hyun.yoo@linux.intel.com
Subject: [PATCH v2] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Date: Mon, 28 Oct 2019 11:58:26 -0500
Message-Id: <20191028165827.24949-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
References: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
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
Changes in v2:
	-- replace kzalloc with devm_kzalloc based on Jae Hyun Yoo
suggestion

 drivers/media/platform/aspeed-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..2aa8ea2f9824 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1646,7 +1646,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 {
 	int rc;
 	struct resource *res;
-	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
+	struct aspeed_video *video = devm_kzalloc(sizeof(*video), GFP_KERNEL);
 
 	if (!video)
 		return -ENOMEM;
-- 
2.17.1

