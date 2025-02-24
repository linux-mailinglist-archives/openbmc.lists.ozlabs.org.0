Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33338A43250
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 02:12:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z202C71Mfz3fvF
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 12:12:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740380645;
	cv=none; b=VeswdgFSYdqCxIRdqiQsWCzsdtoaVkCF5IuHjKqWg9UxsHVQeiV4NU007G1X8vog0V9ftkbjTnVpGmksB+VfpA7R/aKbKeB7b3bSMDDl3hiyF3BZIuYQxMls3+vim2IBm21Fb90jAsuyK8xqO6nWd0/NiaMu+BJgPW0rTc2VFJh7rvnlT57GeMAamBtLilhpvb+Xd5AwDxp4tw73KS8SFbPH5OntuMzyWh4I1Jrenk+/1QP7We+1jZLjDhOVVwpB5x0Z5USsgBQgWdtMQ9Qb9QiITKtXo/Qs1koGjFFvOkvxi69ZZIcQewQuYObN1iypLH29QSzycBTyyUPBApIzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740380645; c=relaxed/relaxed;
	bh=5q6OzdDXgwAQxAxBQA745WK29nT03MLnpLkJ+gh1wVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCvYsZMOxhNugnVphmUwpiDA/D5lPTXxOnOozMlVAyY1rjMjjB0TfriukFrmrzzSiVSHxt3EX/hMUNM6/4W7acvkUak0DSaumToCsvRUnEtjYWi4+1m5wYefHTsw++6pYyu1LFHXecQJ5th7rl1tOZ2JeGeXBH6NFpMI0wtK6HXIkg+/+0SK88eyyQWdyiZ8GUmqBT6qWZ7LyViBSX5yNZaUZHxfH8HxCRTfgs9tYLVoN2oP59vr3bkRReY+/WNrIjefyHvR8x9Wmr6XGmBYtYbMvuyZxe3x+XVolrjHal2Aol9qYdcMHfxtViGJp/ckEPnvsYKcHeNDMDrzgEalFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cZdykw/Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cZdykw/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1WtX59wvz2yMh
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 18:04:04 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c22ac6d856so81544885a.1
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 23:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380642; x=1740985442; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q6OzdDXgwAQxAxBQA745WK29nT03MLnpLkJ+gh1wVI=;
        b=cZdykw/Yr5PrihUQUn/pfdyj9R9quANcBM6Q8WBtXIi6lwZJKDdOI7ECuZnIar2o2/
         3zUZKiBlHtdhqeUsPCxPu61K+BEpnPK1aXuTL9Dpzk0lf9FstT94R8n+31veMm6EmiUz
         mBChTaVmzeRng3RgBLQvy+t9xXagwrJjz7i7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380642; x=1740985442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q6OzdDXgwAQxAxBQA745WK29nT03MLnpLkJ+gh1wVI=;
        b=CEb/0egJ7azgmkWC9CZ/dIwL3RCeqq2S4lT+jT3hdD1HamavgG4guhxJGnZqv8bJTZ
         2L+3zwSPjZfLz7BcDx7hb3lKfGa9ZIAshCxMrKuZN8aSN6YRupWj1v7Jbz4+gKqaTWbC
         Hre9ZuNbAf3+W2nTJpIBhGORqoV0Xog4eH5y9OTWPAzxpbo6PzaTimTR68fehwjzw4TR
         zVh2r2f5D3Nvzj4M+aqaUyAkviSOenGA+oUasvegNuNBDFgyAGDcxZEjc+Uw4HB8aeer
         6u1fFatJ+FM+AqMv3xjQ/fxgqqgqfRi6g+lD+/zC7x8VXkwmf3ygqtsW1g2XBxIi5lvK
         0izg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoYgIkNgYoi8LR6Rp9tHR+TkaHf21pykncLMy/gUR6tZPs6kbhHTqQAIDAmS1FVPLjznPjqWn@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/MYiTv03Fz1YXkyNlLgqRDBzP+DOqjNunb7tSj7yNvqy71jD3
	lXiTxk42rYrVSNRRriaGtzjHyZUcDCdnVJZkWw5dS3fgTHORbsQnMll+9ClLT1w/OWk0A72M+Yr
	P9A==
X-Gm-Gg: ASbGncv2c0B3AemTEmeDx1UVDMaUhVUW/pOIjRYEy1xz1a7Lw+FeJ30EHnMsjmROtuR
	QbCSImDXYgTQcqF+hec1KLKHya4fZXkhSVUBiltV2F+sg3yUq46RPMBhY53mP0WW6/oqsPhFGDW
	uw2b+LkPW8OJydEezKITz3dn9ecN4ZrZO3LjLndaAT2tNDayGTonoKdWcibCQpwSRhZBicvll7u
	B3ZGrt/OCeelOxfdtWtWpm+PNQDjNsi8/ZyMUAaykg1CBbAJhU9eSdG4gh3N+wW0Epo8EwImaeZ
	5+RsJv8Grcp3N7jcGZVg4vk0sqt1mP8nZ3gYzqLUBtE55rxJYErUgHePz5HVgVuOZRy7nvoaXG9
	lGVg=
X-Google-Smtp-Source: AGHT+IHgxFsGJ5AGKD2il9LAdTDxMgGFCz1Kjs7fo9qIU1XdeZFdKJmn66/YwmftLgDLOc15f+yjhQ==
X-Received: by 2002:a05:620a:8006:b0:7c0:8175:3651 with SMTP id af79cd13be357-7c0cef5333fmr1704029285a.43.1740380641946;
        Sun, 23 Feb 2025 23:04:01 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:04:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:03:55 +0000
Subject: [PATCH v2 2/2] media: nuvoton: Fix reference handling of ece_pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-nuvoton-v2-2-8faaa606be01@chromium.org>
References: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
In-Reply-To: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Feb 2025 12:12:04 +1100
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
Cc: Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When we obtain a reference to of a platform_device, we need to release
it via put_device.

Found by cocci:
./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.

Instead of manually calling put_device, use the __free macros.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 0547f119c38f..7a9d8928ae40 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1669,6 +1669,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
+		struct device *ece_dev __free(put_device) = &ece_pdev->dev;
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
@@ -1683,7 +1684,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			return PTR_ERR(video->ece.regmap);
 		}
 
-		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
+		video->ece.reset = devm_reset_control_get(ece_dev, NULL);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.1.601.g30ceb7b040-goog

