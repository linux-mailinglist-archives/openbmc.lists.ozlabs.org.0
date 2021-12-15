Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F874764BA
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 22:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDpZq0R03z3c7v
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 08:40:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hTSmm96I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=julianbraha@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hTSmm96I; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDpZQ0TTTz2yZ6;
 Thu, 16 Dec 2021 08:40:27 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id j17so23387215qtx.2;
 Wed, 15 Dec 2021 13:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dBmNfUUXlFFGQ+sdmOWfMRZ5XVtampSpkmAvqHCdWjo=;
 b=hTSmm96IXkdb15Y51GO3v1Kob+u1eJn+H2WSF/uv9cN9AAp7lxoEwvWxKJl/HNmip2
 vn6BBbzMzC9Rrr8dUMY0fLzCzjv9t32Ak1gDCpGWLLRFeZAMTmkF0LENtDX7ElUMjLhe
 bfq4ByjYo5CGxnPbvIWHlWqsH63qwX04VGtwMXyX4gzWGFdeVBmxAoUA5rAVogxriqZG
 5HQrAP98VIz3dodS17Ufw4mx77+js4u2znfcDut4KjmhO0v8yF/kzJpPUVxgwGW/ZYZK
 MVezXOCdnAnRhLwktkrK6cbpEh+aLjrHuyOXKTFHivRhSjDRUf2iV46nWAFOZ7c3gZbi
 eVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dBmNfUUXlFFGQ+sdmOWfMRZ5XVtampSpkmAvqHCdWjo=;
 b=34pxoEY9HksPI4Ki7Qoc3EauDtc3VwXbUTNg+wsJelDdRPzKfixIKLBUKKmyYzqLLn
 GtL1qHVrc4v9DhLXDjVX1Cju19wcGDc+uwgAizzeoFkE7xwfw4zVNVWFH5acG9xVIsa3
 v53x5nCjj2BpMbaa2JsMaE+vyL/UDynq07cJXKlGT4N8W/blOBwtOBe9J23Qaz6scSxW
 6YmuBiQd5suowwXpcKGAmg0qEnzHpaxPeUdCTiWOMVJIZ51FZJRPStejlT3rKyobJUvR
 ADiH0TJ24OPi5v4Q0hmjYqipu6D6FABpfYZjrxkYWAune0xJKMdGzOLQm6NuY/Re4Wnu
 qWLA==
X-Gm-Message-State: AOAM533eJ31eiHjw2nIbzuJmLAceb2o243zP+wc0sNfkuHXA3NMSUIef
 jWXiasNIIex4oxJ9GblJjvQ=
X-Google-Smtp-Source: ABdhPJxsVzTqiyuhQ/gkZagHF2QD7t9F+lNGXyubtGk4s0cYRy+SqHH6fBc42phCSuvI4Kb5t3WFlw==
X-Received: by 2002:a05:622a:647:: with SMTP id
 a7mr13825515qtb.593.1639604425522; 
 Wed, 15 Dec 2021 13:40:25 -0800 (PST)
Received: from kubuntu-laptop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id h9sm1755988qkp.106.2021.12.15.13.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 13:40:25 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: andrew@aj.id.au,
	linus.walleij@linaro.org,
	joel@jms.id.au
Subject: [PATCH v1] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON for
 PINCTRL_ASPEED
Date: Wed, 15 Dec 2021 16:40:22 -0500
Message-Id: <20211215214022.146391-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When PINCTRL_ASPEED_G* is selected,
and MFD_SYSCON is not selected,
Kbuild gives the following warnings:

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_SYSCON [=n]
  Selected by [y]:
  - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 [=n] || COMPILE_TEST [=y]) && OF [=y]

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G5 [=y] && PINCTRL [=y] && (MACH_ASPEED_G5 [=n] || COMPILE_TEST [=y]) && O>

WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
  Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST [=y]) && OF [=y] && MFD_S>
  Selected by [y]:
  - PINCTRL_ASPEED_G6 [=y] && PINCTRL [=y] && (MACH_ASPEED_G6 [=n] || COMPILE_TEST [=y]) && O>

This is because MACH_ASPEED_G* depend on (ARCH_ASPEED || COMPILE_TEST).
ARCH_ASPEED enables the MFD_SYSCON dependency, but COMPILE_TEST doesn't.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/aspeed/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
index de8b185c4fee..1a4e5b9ed471 100644
--- a/drivers/pinctrl/aspeed/Kconfig
+++ b/drivers/pinctrl/aspeed/Kconfig
@@ -2,7 +2,7 @@
 config PINCTRL_ASPEED
 	bool
 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
-	depends on MFD_SYSCON
+	select MFD_SYSCON
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.32.0

