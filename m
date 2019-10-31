Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B956EA8E7
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 02:41:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473SjJ1NVFzF3KF
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 12:41:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o2dIOgZ7"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473ShX2ZXvzF5Cp
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 12:40:59 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id r4so3060601pfl.7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 18:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=THm33sey/F8tpDHX1qubvNAiBD6mm2zUX4cg4vLd7dI=;
 b=o2dIOgZ7+lrcRu01IRgjF317J2s/ys08d+KlzGOc2rpbAn+U6OLC1C30Ea8ZTaDfoE
 xxPZYszouo/8gDSk0vgl92TBm4esyFtuEihG41LCQ4HmtXJFQBQeIN2goqfliVb2s+5e
 U7r2pPvF8AhBLm3h8R2m6mwiJeHVepdQCR1lOePl7k+rpI617iIlvRymhYr0iSRaa6NF
 VyhVcYPrWyoY8MsndkbiCmQta31LA6p+n0OhCxrOZ1Wcw8Exuq8fqJS4tkVNifX92DPH
 lEIASj3sBYw3iP0THYEkZs1GgTc8MgWCYCz37blqQI2/5/Jrjfj3qQ4ARv7Dux9v/dbG
 12Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=THm33sey/F8tpDHX1qubvNAiBD6mm2zUX4cg4vLd7dI=;
 b=KIOLymaVpsgBX+fXikPH2+t3Bsxtz+tK4TDJ6T76w/8ptI1VzhoKEbuxvJCMUPPobn
 0E/NUHrl0zbkoNX+g8yWnjbpjVJCgq6soSq9+LHUKy8/12pa2FGXEoRZQv1JbjXhv6oK
 I5f4XiLey3u3Acg0j2YsizX7viXZE7bZx8vt7qq9Scni5edojG+6x/eTCWFg4Rr2mvLK
 rXj/r9+qJMJAW85s6TvtQIU01RN/HNMVaLi8orAJZN/zRnw1qO5aggFElau/OnzGTf6T
 hdpzlJPP+rx0joIuWmJ9mre8mf09YBePZXL/Ch+kbAQ1dKg/gOmfDjA0RS6Q5S7zhRaS
 BdaA==
X-Gm-Message-State: APjAAAUfVS1TXD5h6OR+yv9zbSB95JN9PY3uPFj+poemUCygdcrwU+nZ
 KffMxkMdcZq6kUj5icsQQg8=
X-Google-Smtp-Source: APXvYqyiiRYmWih5L7Km/8PhYX+xDLNb0WRqCF0+D79eVEcUhmNcBHqLVY85E0aeQ3LEWB8Yel6ujA==
X-Received: by 2002:aa7:9687:: with SMTP id f7mr2805612pfk.230.1572486055591; 
 Wed, 30 Oct 2019 18:40:55 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:e375])
 by smtp.gmail.com with ESMTPSA id b9sm1287811pfp.77.2019.10.30.18.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 18:40:55 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
Date: Wed, 30 Oct 2019 18:40:40 -0700
Message-Id: <20191031014040.12898-1-rentao.bupt@gmail.com>
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

Increase the max number of GPIOs from default 512 to 1024 for ASPEED
platforms, because Facebook Yamp (AST2500) BMC platform has total 594
GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Changes in v2:
   - updated Reviewed-by and added ARM SoC and SoC maintainers to
     reviewers' list.

 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b7dbeb652cb1..57504f3365c7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1359,7 +1359,7 @@ config ARCH_NR_GPIO
 	int
 	default 2048 if ARCH_SOCFPGA
 	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
-		ARCH_ZYNQ
+		ARCH_ZYNQ || ARCH_ASPEED
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
 		SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
 	default 416 if ARCH_SUNXI
-- 
2.17.1

