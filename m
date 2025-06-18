Return-Path: <openbmc+bounces-247-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FFADED42
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 15:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMkRF4xdcz2yKq;
	Wed, 18 Jun 2025 23:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750251737;
	cv=none; b=lb7xfMueEjbkyI8xqQhoDBkpmemWzebHnrSO+BDGAnCnjIDLwj5hRbbTumQt+bqDcrJwfuyzZ9XcUQIq8vw+3/E2uf4KzbFHFZtntLz8U6ZfpGsSyWWeilivK2FAm8vKMCFTogJaH4PKUmKRpLd0O4v+CcZuuhGnW0WSyYs4B3LIOy32q834ccXOaYlXUdG7ZOcmiIpZ6NwZ2zUBQhGreshTIFKNQ2xqL9D1daeaJWLH2kQHcwFnxa+YDWpl/i5EKIT+6gARGOj6k+c/SK1+b6eP3B0aiGUMZObvI+ECGLqmPqgXFNyCZmz5NJDh8KCkbOXvQeBDVL4mXfI0fpb4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750251737; c=relaxed/relaxed;
	bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jbAnD9Xl+031Biu89KfwMeMKWCRwJILQLRq208JqapskDL/Q5Dj7N4dXPUJ7XBuGtcbr4c3aTAzr4dOBXCZqchSVvC12qIpx6t+l2QKe8+6gPfY0WWbP2mdgXY95PSlI+uRdEQQ99AJShrHyYwdXDB4ls5kuX1a47ntTTVQdpT1fMuxlxM9uYBuajvW202uh4+kFzUJfZVhU+Lv7b5cK7sIQ8NYapbTtddFVqGVDbg5TyiaeLt9jtzW6hbrx8Pc1LlIpcsMBXCWVN0SbexVqRXR8LhCI71hEOpF/2VWjRebpL4+vkOmXXf9eCj+8fVbzRe4+2MQwpxQGlUASv3bRTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ld8UwXvh; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ld8UwXvh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMkRD2KQsz2xPc
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 23:02:15 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-453426170b6so4552785e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251732; x=1750856532; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=ld8UwXvhY0BNonHIWFLiXhosU+U1tw/zwZHAirevQBwasSxhfCYyQgFIe4Pkku4Pas
         LIQoKVUyrbnvvhqPO2u1dCqTu2UR8Hk9IMtfBez0R6HCwzc1ULiGNltKPP3Mh72VMdER
         EigyELzEb/MbCNJ+akPSmkb99R+VRcytCymPIhM6o/0CoNP6/mGhe+gwzYMe/e5nGpej
         jnNyOjlakcNoq9c6JogibFbGx6Y6+EYtxy0RhGH88o6ED5oJ1JUM/5AY67n0tjSAJa3q
         1+UyuEuj9E7i3Ds68Uv/oKmimcp3+8o9Sz1RIolKlKyntd8e7Ab2WfhGdfitccMLOR9f
         SpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251732; x=1750856532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=lLeKCUHMuAC5H/NcMRLb8sgSwYZCitWN4RfzZPcb3mI8dWzNGmB10TdWGgMBmo7L4g
         cHllWY0ZlDGprGBZyzdYiNMnrqjtPkn3jqWHnTrCFTYNiewHmxndv6heXAjTZ8t0QJv1
         2yGJ8W536cn6WDEB9EtM9a+sMqrlM9j8R4SepfdH6zvQSLuQH2nDaYN76Fsw7T9yZPdu
         kzYt4z0ReMXU0z5KJPDhmyBoYeTeDWYQN9M3kxfRua4QA/4nO6xZezZnijNMatI+ZBII
         nvADaolpEG1HvcUfwm2zketkNe6lGhr+o+Ws71H5e4shxqfaNWqyztlWdAoV1z45RFhn
         4p+g==
X-Gm-Message-State: AOJu0Yx5r/3iKri9RZdDKJLQlHw5h9cLC/wiE4BYVKKu3g7FnNd3oHGV
	9aJv+4x3EB6+Z1hIJrjRCMXp0SaHIc0jvXG29bK+KugWK8+mfGz8+8B+UHqfOVViud8=
X-Gm-Gg: ASbGncuCPNhJ+mrq9sC60YP+5ZTUrFFOIFMN+9/t4EFT5/GCkuQjrLUxMURGlzKJWro
	Bwq1Gc+PtaQx5+0FujbhQevlk/AMY/PKeGXdbN4HlQtJk1wGWkp7HZdZVlVF9tcdhF80k+spJic
	al9QhWmG2i1fViIOu27tfExK090U3uwkDT16Qf3Hpy0ri2z6L5YVokctiykdVG53lM+aXK5Nw1m
	Z26U8PXSMxJv+C2gpiEcQcUmmMJckvAnbkJ1QvvdB7qX1bOCUugTXrviX39Di85zttoJsuYMIub
	gBmXM18iNuAKRzPsyNu/aWNxei4BhamTxsRKkCNp5R9zIXp/fXe+IsjdGCvFjcEGvA==
X-Google-Smtp-Source: AGHT+IGyG6czM+NA4DL6DPDZolzFgEkYLp4uzIqdLlHk4uIN2olygmeuzCIqgpbNsdJHz0t3ZLd8vg==
X-Received: by 2002:a05:6000:2209:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a58e269482mr2168586f8f.19.1750251731670;
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO
 chip setter conversion
Date: Wed, 18 Jun 2025 15:02:05 +0200
Message-Id: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM24UmgC/x2MSwqAMAwFryJZG2j941XEhZqoWVilLSIU725wM
 zAM7yUI7IUD9FkCz7cEOZ2KzTNY9sltjELqUJiiNo3tcLvkxONQrPJg4BjZIxFVRO1kSp5Bp5d
 nrf/tML7vB3m1S41mAAAA
X-Change-ID: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hccs/FPXaY7RAT+ynuxuHb9c9hF4RB0vDaqzG5iDnIM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjP1wth3l3y0b/dpfsvBR3ga26T+3RSw3vJB
 x0kbg9Jlr+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK4zwAKCRARpy6gFHHX
 cigrD/wIlZg68DQPUb/Uxwvn20BPPVNFSRmkO0ONhMjRxA9Cd5z9FVSELIqeJNcLmMOBgKKTrcl
 uUzpGdafOJq/2I413tc6QwR3r+VZdpnwxIIknZbn3z6XQjh93IPRQFA/WN2Bs2EodH69CwwXpxe
 0KSN3WZKe4N+fjCUA5kjmFbu7TNarl5YiZ2svHzzMosiyvTgdtMsxYHG5YwRPdfVB8KT32E/9c4
 3Vkj7Bp11lHQwPBkiZ6TU87k1rCNSMiboTHpWphUbc1a+Kt+gOOa2StXKi1OYSLVevP/TsF+fUR
 Bm23qRH6x1jOyUTfAIPiabWKKlwA0lrsJe4QpnSTeEPAZUWuLehTDK4HT/4PS8K8fCMZZhlZmpT
 AIIBZMua28rtFBDqAINXCRHVBBToqEUTNvGvpovtfRvL2CPhRNb31ZITYlKPhcClO9K7SATr2W8
 4REqdSa+37GH/Ej5jdTP8Rhhg58AoJyoTScoLrehje5gsaCBZ3wTCUtRLNnAR912GtGEYEAupJ5
 7BArRUYRcXDWX3Dk3mtJnOTtt39agcOSMvgpeFYQkeY0zQrtjgOQzQoQFOblmyHUR1a/e5kFJT+
 ZDhXeF8KVdg4YLstfIX58CZ1Bz1pOII36vTQnzQP0/a1+U6TuV5ZTbFm22S1Ms7pa5GrQ9dMgDa
 Ezax+2FfL6QSn3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I should have paid more attention when doing the GPIO chip setter
conversions that there are instances where the setters are accessed
directly using the function pointers in struct gpio_chip.

This is not optimal and I am making a mental note to track all such
use-cases and use the appropriate wrapper instead. For now: let's just
fix the issue in gpio-mmio and its users as well as one other converted
driver that suffers from it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: npcm-sgpio: don't use legacy GPIO chip setters
      gpio: mmio: don't use legacy GPIO chip setters

 drivers/gpio/gpio-74xx-mmio.c  | 2 +-
 drivers/gpio/gpio-en7523.c     | 2 +-
 drivers/gpio/gpio-mmio.c       | 6 +++---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 4 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 7b20980ffc11514d8849811857d915001236bcfa
change-id: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


