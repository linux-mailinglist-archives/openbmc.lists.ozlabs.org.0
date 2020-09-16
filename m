Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CDA26D00C
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:39:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJ5S0B5zzDqq0
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 10:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.66; helo=mail-qv1-f66.google.com;
 envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cRSvvi0Y; dkim-atps=neutral
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHqH49pQzDqGp;
 Thu, 17 Sep 2020 10:27:36 +1000 (AEST)
Received: by mail-qv1-f66.google.com with SMTP id f11so149540qvw.3;
 Wed, 16 Sep 2020 17:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KTEiXWsrNTTNF4brX7sslTaA27Wj3jCvRMzdzjVA1+k=;
 b=cRSvvi0YE0LJjsNnQLFLiwPLRVlEijDhvdRIBIBr8yhwSaTr23O6/FkV3eUeZHWNH1
 5dd5sqPqaj0uMn7SPpHv3fgzwI8kR2tF+zHRYDm9JKnO65URipWWSVxohnglZHVlq1Nx
 /Zb8A3yC5nKh2vBpN1z43jRgUMkDNJKbY6jHt8QZDZdp67hKaPTshyMQomOmgn6xcImw
 lBZKQzybZDMWY7QifXzwjoQqOi8oZBHeKuXdhKTEt2mD/cm4DVLNcf2UkPYItgsQ5Lwr
 u0TsOa468276YYmj4N326UMVf4BMH19Cnt+s8qGBOwtzEwGtw34AmhAXkpr9eBNTVEVp
 lt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KTEiXWsrNTTNF4brX7sslTaA27Wj3jCvRMzdzjVA1+k=;
 b=gjiEUvrbdMD+i50TO0u3lh1uBLl+zmaxbeh4/ouqItpAzYNSwF39QvdrY8+EGmX0Aq
 SWKLVPOrEFhk8Lt3NXHgJsM+xYfytItwjbU5SnkqfAn6zZGbPbeOI3qkcKx4Mt9EXRkC
 suRARJ+KjgUuibFo+pK3uo/vBI9CptLoFpFcBzZ+o2ujfPdLj9tMyB4k2u5C4ubHPIME
 D0e3zgwbbpWrt4d/hVk1Zd+I+hjdexfrbEfho3NqoB/YE4zDISjTd01VoLCU5NtgK+US
 6FZPkAsl/puWlvQXiq7lCJE6MPmOqKirSH4SeeWAoufgZJRjYbcgISlkO7poI9u8AsBl
 PdQQ==
X-Gm-Message-State: AOAM530ZJRaHBEiduNU45hrzuZoY7KhvrhkO8z7LcLbU0Vwhi/qp70xr
 prvTLRseDnAls59Gfs6CQGa0xXJ3+6WMpw==
X-Google-Smtp-Source: ABdhPJz3bA82VJkPymAABgFmCsDwVkj3PWIi1CeckDZIOwQIJJc3547a8fhdrIhdpnvHex5U0dmVMQ==
X-Received: by 2002:a17:902:10f:b029:d1:e5e7:bdd7 with SMTP id
 15-20020a170902010fb02900d1e5e7bdd7mr8126307plb.55.1600288945769; 
 Wed, 16 Sep 2020 13:42:25 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id n9sm10071276pgi.2.2020.09.16.13.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 13:42:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] gpio: aspeed: fix ast2600 bank properties
Date: Wed, 16 Sep 2020 13:42:16 -0700
Message-Id: <20200916204216.9423-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

GPIO_U is mapped to the least significant byte of input/output mask, and
the byte in "output" mask should be 0 because GPIO_U is input only. All
the other bits need to be 1 because GPIO_V/W/X support both input and
output modes.

Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
according bits need to be 1 because GPIO_Y/Z support both input and
output modes.

Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 879db23d8454..d07bf2c3f136 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1114,8 +1114,8 @@ static const struct aspeed_gpio_config ast2500_config =
 
 static const struct aspeed_bank_props ast2600_bank_props[] = {
 	/*     input	  output   */
-	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
-	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
+	{5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
+	{6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
 	{ },
 };
 
-- 
2.17.1

