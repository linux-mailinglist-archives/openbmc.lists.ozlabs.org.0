Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3BE7C87
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 23:50:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47290M2s6hzF0B3
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 09:50:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K8t/xfrU"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4728zc5RpxzDrhj
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 09:49:30 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id k7so6476662pll.1
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 15:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/WZEAomVjJ+725DnvAAAnSxsbckEzTmInFHoxAcfrVY=;
 b=K8t/xfrUvO54cAT/K46akV/qEnLzS1/uU1SOkpoor14ttRwVYVkbpqoCY5VMK2fNbm
 fLMCv1GpohL5N99sSwz2m9BFR4OMmrhNGzqngucJyfv3KivEQnBBcbsKxtFirSMedw94
 RO/Q8sQN9KQCI0+BEWRQ92EZ7c16k4AS4hxkOPsqg5Yj3IABTTP+HYi+zR8TYVHuSuvz
 NVxJjGctiHx/EsFpxF338Y7LWtbWIcPmX7IwxPtVZBWApBsiJhDWpo2DNZ3PnDVPVEYP
 Ao8h+M0AsX0dyvTE2U3btXDFFGPBg95M55CK2iU+BUAMClOUHAMLI6Gk+46HaRWqiiLF
 ALzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/WZEAomVjJ+725DnvAAAnSxsbckEzTmInFHoxAcfrVY=;
 b=jtuc7Sw4y+GvnxhRgVMJZtVGLTPUSE4PcLpkJLgNjdSa6T4U3d1pz0Zxg9XrDy5V8Q
 EPDv8QcE+qhTUdWuMiDckoQkxIhqIMrpEUgg+zP4vP6SE7JatD3ek38u/7glFBSjOsSW
 EOqg3c9K1ch8zfqG2gfoHgkxDiBZnvQB58l/WhjoTJYbB6CQKL18Z29M9K7n1shzfgVX
 xo3K+0152z1B2ITcFn0s9mQaGM2pAZYL7A7QskzFI9RTzEL5NNcn2S/8I3drwK4wzhMA
 BnJuCM8o1oUXKr2ZiQPSmf2MYa79oMrvBbkhzbHTLrWaFmt6oYLwV0db12j9KRGCxv98
 lZYA==
X-Gm-Message-State: APjAAAVjwZJ95Q15jenTGRA6fafNBwQgVt24UdWu/BCJfN9oYIvS7+T/
 xVT5VrGbSq3GjfIFyk61HXA=
X-Google-Smtp-Source: APXvYqxvD/GJ2WH7xzUvuVqaFgUWlHwU3zy1adKIbAVvZLCucTrhXqRqBQTAZu58dPq3TSZFuaAi/Q==
X-Received: by 2002:a17:902:8345:: with SMTP id
 z5mr492355pln.113.1572302966574; 
 Mon, 28 Oct 2019 15:49:26 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:78fe])
 by smtp.gmail.com with ESMTPSA id y129sm13092345pgb.28.2019.10.28.15.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 15:49:25 -0700 (PDT)
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
Date: Mon, 28 Oct 2019 15:49:09 -0700
Message-Id: <20191028224909.1069-1-rentao.bupt@gmail.com>
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
---
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

