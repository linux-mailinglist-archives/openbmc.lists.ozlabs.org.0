Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C643E3A6
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7FC6YR2z2ypD
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:27:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hHbvKPrE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hHbvKPrE; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74j1TLGz3bjG
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:21 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id d10so10576416wrb.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KVlpgZO0dCMGpzJjKxhnceHT6UKMAoRduCsZEkMUE8=;
 b=hHbvKPrEoSKQC7djeA6n5NJDPAyLs1GTnx1kVQgrwegVlEJ0QdYaZDjsyuuGzr8fRv
 F9T3FcTr+JuzCpX6rdsMvp0gtLZCk/239WO5a5rI76A4QcFstF6+9XFAfqA3fK6sVSxY
 Xvids82VKesGpequgPQ9WmTjz+jQSmfp5Ao8lNfTCOXYfSTZU6IxtZjnoTDZ+NMmQHej
 4tnoOBItQC9bWK7xrqnyVgvaT1+n1svo83UqdVLA2yqfsmDtDcTHNzOqlGiOuLfX1ic9
 SAvJrNAkU02aSRUN2IjgRWl1UXqqraHm0xbxXfqt4Kf3ceknUGaKfvbjWGFVuGI/CdRe
 xWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KVlpgZO0dCMGpzJjKxhnceHT6UKMAoRduCsZEkMUE8=;
 b=wk5/rHjmloA0Hua24Uqvg22xPYMAMZuvILd3opwpq45SdQCdhz/Xs/RQ9Y2PiW4Q/t
 z/7VR9AsZt0PFdtwQH2l1Bk4hN1e7BWlozUPBg+9s89aoKy8ful6iIXbOB3K6mcnSrj5
 XGcoQRNCMyiwJIe/KLcvvfzU9guMbmiYAQdNidhl2aD0P7xeuqEJytMM1SQJ/CRoZfj+
 U88O5PrIQPKoVHdbHEGKJWAQJ1Pk53CKBKFHHC6YZeou6rSzaLccyxZP3zG2Ki3P+6+s
 J/OQkq3F5G6+GcLnBWf/0jit5/O5u3o4QMQlxttMK65LwP2pYD0TLKlYhB6zsly17SHA
 /mMQ==
X-Gm-Message-State: AOAM532zLIpQfMnGQ0wMEfN7sBn8R+Q/gpGibCat+44C6K7OArBfUf/j
 Lj331cG/oWhKmuNghoAS1Bw=
X-Google-Smtp-Source: ABdhPJz49YR12dBg5U6u32/RrLtwMQYZtgCaHEc4fjD/v0JKfj7gX1PL+MxOROCEP1Ry4zyP+Jv5IA==
X-Received: by 2002:adf:c00d:: with SMTP id z13mr5970271wre.299.1635430817777; 
 Thu, 28 Oct 2021 07:20:17 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:17 -0700 (PDT)
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
Subject: [PATCH 11/13] arm: npcm: drop selecting non-existing ARM_ERRATA_794072
Date: Thu, 28 Oct 2021 16:19:36 +0200
Message-Id: <20211028141938.3530-12-lukas.bulwahn@gmail.com>
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

There is no and never was a Kconfig for ARM_ERRATA_794072 in the kernel
tree. So, there is no need to select ARM_ERRATA_794072 in
./arch/arm/mach-npcm/Kconfig.

Simply drop selecting the non-existing ARM_ERRATA_794072.

This issue was discovered with ./scripts/checkkconfigsymbols.py.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-npcm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index a71cf1d189ae..9c137462fbe4 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -30,7 +30,6 @@ config ARCH_NPCM7XX
 	select ARM_ERRATA_764369 if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754322
-	select ARM_ERRATA_794072
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
 	select MFD_SYSCON
-- 
2.26.2

