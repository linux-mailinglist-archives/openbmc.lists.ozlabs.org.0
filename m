Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDE43E3B7
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:28:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7GK51rqz2yWR
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:28:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lQ5OcjGI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lQ5OcjGI; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74l18dYz30RK
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:22 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id d3so10499488wrh.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7gwbG6UFkkaU6lNQMINz/kDW0z+hx1/TQcDms7EvjA=;
 b=lQ5OcjGIeh4NWjsNWv6j+yKcMQtIziyKvbwOas0MSzkEbju8H0ZnDckxAxYW/du82l
 ca5gAa3XAltOr/QYzm/K2OZmNEz+PuC8je4ThTALteh3btLgk95l6/8WtQuvVIC1mXoX
 ZgZKg7OhgK5stvkpFa72LQm4n+b7fhxu6d5FXxc3M/+fg9tNh1oMyx3NGqSTmB804FWq
 8vLzv2I7+Jv3SyrFkE1bRNm++K7Bjjfr+SDFvVgTcI8sksFNwxZQ/TFUObSGWv4qWzqV
 07w+Ht6Xpu0MzgMwihImF6bIhjuT5JCvNcgLT8evs1rJgoqHw4ra+7yHAbZGa4t/LFPo
 o9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7gwbG6UFkkaU6lNQMINz/kDW0z+hx1/TQcDms7EvjA=;
 b=zFHIxl2ngcLS4WwuFgzaF/99YbtsLNZ6CE7x23rqfoW7atsiWidzyaPLUDqC2IVcfS
 oU03V3vJI7O63I1EUiX8fcy+noj40pGDmswXmDA/H9HWtJROwWXJUIJ4HErb2RjgplMA
 5hWcgB/1T3A9WyuIh/I/uRYDpA1ZpfC7mMI+plXDOgyNFoemqLkGHcKkV5hz9WNHWExT
 9e/Y3Qq5u+3+HPjE7K28IiGjB48pkBzJ4Ij6rVK+WAqBSJ/NDAamo2DNyeXwHWHHnb3a
 m6B9AosojBQK+7+ETdiJezlP7UFmqSqwMUfhYOYJSw0r+St2JjtpTOv5wSxlNKujiKeo
 NnHw==
X-Gm-Message-State: AOAM533O+biSIZs3DyhOAlMsLGKAND4RvaMrqciFYIz86B4QcdW5F4q5
 O71WPw00FRdMykUCGAaHDxK5P7r/ekutGA==
X-Google-Smtp-Source: ABdhPJxAB1fxVvguMzzS9pPQar0ZSLiVaHnPSqayVPTb0W96ZibRfHgK6i+ws94hG/4IbD/xNcdZfg==
X-Received: by 2002:a5d:584c:: with SMTP id i12mr6162936wrf.365.1635430820014; 
 Thu, 28 Oct 2021 07:20:20 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:19 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH 12/13] arm: socfpga: always select PL310_ERRATA_753970
Date: Thu, 28 Oct 2021 16:19:37 +0200
Message-Id: <20211028141938.3530-13-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache") adds
some selects in ./arch/arm/mach-socfpga/Kconfig, with one select being
conditionally selected on the non-existing Kconfig symbol PL310.

Hence, ./scripts/checkkconfigsymbols.py warns:

PL310
Referencing files: arch/arm/mach-socfpga/Kconfig

Assuming that this errata should actually be selected for
ARCH_INTEL_SOCFPGA, simply select this config unconditionally.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-socfpga/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 43ddec677c0b..c21df17202a6 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -16,7 +16,7 @@ menuconfig ARCH_INTEL_SOCFPGA
 	select ARM_ERRATA_775420
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
-	select PL310_ERRATA_753970 if PL310
+	select PL310_ERRATA_753970
 	select PL310_ERRATA_769419
 
 if ARCH_INTEL_SOCFPGA
-- 
2.26.2

