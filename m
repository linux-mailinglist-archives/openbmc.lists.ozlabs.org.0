Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BF421AED
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNd6W6vp2z2yn3
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 11:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g27BuLur;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=g27BuLur; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNd625Bcrz2yPj
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 11:01:14 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id q201so5470823pgq.12
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bl21WC3q8vxRu8y+9i8en5gjoKFE83vfROh6h0p4prY=;
 b=g27BuLurd/l71utt9UYk3qY0XjxmEE+Z1b0lrOYw8VC+qy+QE7PLaFIQcOoummcwGE
 VOvNrjpkBKDZvYA8XKacUL51HRrVREvgHdFJcfsr2b4uSRL9iJHn8o00t5WNJVwTnLpU
 k4QIov8PAUE7UxvSsudr8KYyH6Z+7ogY8E0TAa94C3BMjzIU8xfdFBctq2gAQz2Xrh5w
 v3B93ivreu2TzdlgIexjof0nKSOyDEv1va/A/i6Zjx61HKbb3bQq37yXHLU+rFXGOBvf
 lsVQLOJ6D/lMeVfNBj6XWS0VuI4TLhWYzk1N4Kg/i5xoYKtNQLhmbM6/1J9yIO+LagDz
 ctcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Bl21WC3q8vxRu8y+9i8en5gjoKFE83vfROh6h0p4prY=;
 b=WmDvI61cxGaprhLG/XVqg5yshbER6ZtmDy485JQk2EZgFw6/hyqEIH1q4xrLqSh+Vw
 6gJWhS2iFHjT1lBaDicbYf0lyAwlepx7GwiOWdEWGSZolf+jk7cR/VFhCQUNIo7j+LgM
 +jjmSa797KyW5iOySlb/QcUdJaVyp6UgZlPVPgjqTvD06kH+nDzMWgSIsTscTtd3btAh
 I14B6+3fa3JqjzDq4GKNiWzXVVDt4KCo8K96/dIdPaIWjIStXTegP08Drgnrfq8zK16v
 Hi1n5R43APGkclSK6h9o4JAE40yGNJm+gRGqIKrlNx8vyWCmG0o7KCDeAsxrSZsa3gCM
 nDMw==
X-Gm-Message-State: AOAM531y4OofxCYzVA7Kc1YEO3fEunENCmfHoF9rrWceBsi0TbS0jMFJ
 vqzzWKidfxtbzT3WdJW7fQXiaNZgBzI=
X-Google-Smtp-Source: ABdhPJz9uE2pJE+p413oVMloK7NTy395/Xqyn/BoH13+H+DWIAaju9GshLp/jiCgY1SuA5v0iMDWvA==
X-Received: by 2002:a05:6a00:1891:b0:446:c141:7d2a with SMTP id
 x17-20020a056a00189100b00446c1417d2amr28882412pfh.36.1633392072032; 
 Mon, 04 Oct 2021 17:01:12 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id r75sm15430444pfc.94.2021.10.04.17.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:01:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Patrick Williams <patrick@stwcx.xyz>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14] iio: aspeed_adc: Fix prescaler devres cleanup
Date: Tue,  5 Oct 2021 10:30:26 +1030
Message-Id: <20211005000026.464018-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A devres hook is added for aspeed_adc_unregister_fixed_divider that
should pass a pointer to the fixed divider. It mistakenly had a pointer
to a different clock, leading to a null pointer dereference.

This change was included in v7 of the patches submitted upstream.

Fixes: ec35bd77c642 ("iio: adc: aspeed: Fix the calculate error of clock.")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/iio/adc/aspeed_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index d4d8ac07d40d..3e9850a43372 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -492,8 +492,8 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	data = iio_priv(indio_dev);
 	data->dev = &pdev->dev;
-	data->model_data = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, indio_dev);
+	data->model_data = of_device_get_match_data(&pdev->dev);
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
@@ -512,7 +512,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(data->dev,
 				       aspeed_adc_unregister_fixed_divider,
-				       data->clk_prescaler);
+				       data->fixed_div_clk);
 	if (ret)
 		return ret;
 	snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), clk_name);
-- 
2.33.0

