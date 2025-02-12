Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C067A33326
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 00:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtYmC2hSDz3dT5
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 10:04:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739391813;
	cv=none; b=Y9C4lAz0tGjf4BbaaexXAUrc+Eg/GUIuCBIUqGmVxMVkcr6awoAP3x+BdlYU7wRlaFnAjvx8PBBp4toEa/kTuKONvBwcsPWJmeW/q1WULbt9o8tBiP5biYIvj6AJBoPe42YcQ09XZqqsKwFXnYTni7+5io1qJHOGvQEi4JjIMmhLBpKY1Dzbp5lA7wKxbriegNiOAbJDYGscyhH2VSRjvUUm7c6IcEpmlQoMTm26UYayrtAQu6nZETpln939O8f7aDwyqwcPvmL35TfkFAt+vep5IdbRXwJB4XkXjWO128gAp4BVjcMBdNsId0rOK0y7SmTDVsrhhaIOPLgEw/J/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739391813; c=relaxed/relaxed;
	bh=wFqfug0dvo4+SvGxTEfuy1Nbc66z9jbXayYAmndjSOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CFPghnzP+aUvRrIEs5E07/wpXnCmAxfGutWYP6TYVf+9k0DHkYHtEB1nmGvzEowv4r34BwIfi78yR35BOOJHjO228NwpqRSvWuYJKUsox97BPJQd+kwY7VhTou2dro48y4ktQwDZ3+wudCRX7Dy1RSZD0r6m45EVp0RJQMy4289gMTIBreB8ciDLtQ5ZCxobnydxdkTTuXef33hOtDR0C7GGTJ/ejhnKsPWXl3VYN8OIZ0CFdRrUkuj1TCeXADceTObGfmWIlVakfMGGXgInP86MtILB2vKinlgoIJThsllGWiV9lJLOQ/xqp4sq7Wi5V+EYMm8haquZ3eThW+gmJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PiNm6T01; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=chenyuan0y@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PiNm6T01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=chenyuan0y@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtVBX0LCjz2yh2
	for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2025 07:23:30 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e4479e22c1so111166d6.0
        for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2025 12:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739391807; x=1739996607; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFqfug0dvo4+SvGxTEfuy1Nbc66z9jbXayYAmndjSOM=;
        b=PiNm6T01ughL3VUW9+peVnMRoL/tYfllH3AjMqOgIEPPUzI6wUUH5R+I6l7CUUAY/1
         fCckELOkA9XCXvddArsNfgL8Xpvv4W2AVf0BQT/bFwoNnIYnYIRE/jhlRoEoBLMoH0Qp
         REfKvlgZGH61NwdV7Nj0HE57OwuVFH6zY+UySnN5t7OUcyRxzTWy/RiR6UyviRKV5XTu
         flw5J5B/QCiLO4x6bZ/9uwpcT1w50rt8EqCT9JTbtF99aaenVXOXl9YvrIy6RfXXRceP
         vfSe8DjUcEScIpgL1hsk2w416Zv1Ww3NYw9VokQ5TgAFO0Ckn0MGEzKKHEKtPokStPLE
         LKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391807; x=1739996607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFqfug0dvo4+SvGxTEfuy1Nbc66z9jbXayYAmndjSOM=;
        b=oVSLvxy3Fe8HQHVygIBZ7G+J1UaGtT/bBkVMNdiH1Oxel53n6cOM2I/rQFtvlUxcSa
         W78mN5zB7fi38bnB8n0wGf3jXVOT7TrFD7mCDu0iaFoZNoQDQg5hAiQ2/MaYirVjbAHR
         zhzgxC9GA9DUkfdmbvNecQ8gzk19L+h9hmBtnWp3ekrhx56A+mZtuZ5Z6tgF8CJh9ccG
         EURuuv6J1yaWXxKWLUmpOIrOpANafE8VTjHCL4x0CyOc32gryc+Ju9HNBbY612iJWJKq
         pTgd7LkzhrqRr3XdRdqbs70djNWg50kFMtlIEWmSUVNp69hDBr3BpgLTXP7tLjAKHRSC
         DErA==
X-Gm-Message-State: AOJu0Yz8ldwoR1O0r+yGUzABXpA85QorvwpWoh8qXLI+E0wGHq7PgTjf
	AO/ZroM6tWpsBM35fLpGF2+RVsb6eWJL34Rw9LOjftuIf/aBBfg=
X-Gm-Gg: ASbGnctdsn9nqFv854E6BQKTrBOp++AZDzhUU818vxd0e8tOltXBeNB9tYn2oubDJrH
	QbzTxEgQJ7MkGZxhDy1euSYwEgo9KEdkKy0l2FD4WB9sGNFlThFmIquVWvBt4+UTFluR2FfrE1t
	44G0FqJzvDyyZ7FCCQCxd8I2IH0W5pwH+ncjXTMjdRTpy1nlhwCyldtQzKxpWh7NiF1i1Y/d5cN
	pgedyR807EYgVtyMyHOFCdg8ILCQTHk/YVz6Vf8sQXgd3Rp9nx7AjI8027shmE0lKL1cGQSJrK1
	/2EW1VoG6VXQ
X-Google-Smtp-Source: AGHT+IHrunwFa9y1n/VCE/JHLro3uaHsjKV1AuCg8NjkBGyKTg9Jo6/WpWR9TxBMa0++i/xfgPtU4Q==
X-Received: by 2002:a05:6214:20e9:b0:6e1:a79c:4cb8 with SMTP id 6a1803df08f44-6e46ed772damr30480456d6.2.1739391806803;
        Wed, 12 Feb 2025 12:23:26 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43baacee1sm82943076d6.84.2025.02.12.12.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:23:25 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linus.walleij@linaro.org
Subject: [PATCH] pinctrl: nuvoton: Add NULL pointer check in npcm8xx_gpio_fw()
Date: Wed, 12 Feb 2025 14:23:11 -0600
Message-Id: <20250212202311.3741443-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 13 Feb 2025 10:04:21 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chenyuan Yang <chenyuan0y@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a NULL pointer check for pctrl->gpio_bank[id].gc.label in
npcm8xx_gpio_fw() to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02 
("ice: Fix some null pointer dereference issues in ice_ptp.c").

The npcm7xx driver already has this check in its npcm7xx_gpio_fw()
function, which provides similar functionality.
Add the same protection to npcm8xx.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 471f644c5eef..d09a5e9b2eca 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2374,6 +2374,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.parent = dev;
 		pctrl->gpio_bank[id].gc.fwnode = child;
 		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (!pctrl->gpio_bank[id].gc.label)
+			return -ENOMEM;
+
 		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
 		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
 		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-- 
2.34.1

