Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428343E3BB
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7H3258bz3056
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:29:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qQ1E19Yc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qQ1E19Yc; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74n5DK9z2ybK
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:25 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id d13so10489196wrf.11
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0+Ewf3zoYKYSWZPJecgoccdfTSC37HrqNABHJ/zSx4=;
 b=qQ1E19YcuVT5BdjCL+cmlKQONdyDux+CcDXoljj3sR/mw/MbHxYEUXfiB/v6dFUVKs
 8wfkCTpArL5db/Y2QwkhAPh/a0UAVBIb5LYjUYjWMwY7DH4NcutzkEcbsyDkui6fDJvQ
 yzbVHDh+EN3Pi+ifIu9haL5Vtn1wL1SoY2GMawHxP98gKS0h66oPLUL7b9eQaIPSa6RS
 KjAhHWPi71XeN7bXQbSnavaIMdAPxAL7+VNnOuHhEoPcBEaRb4x50Sz3lQLmgaqfGqYN
 jrOlLY7FCbPwkBw0OBBd5aUYiaSEQoBqeXESKvxAoJO/53291Pn7AJoE1ZCgD0pAVPA/
 JvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0+Ewf3zoYKYSWZPJecgoccdfTSC37HrqNABHJ/zSx4=;
 b=JDn1esXvgmQpdyln/mXt1i7qfG+X6VyMXjMh4exIz5m61yHrQODlpzgcnOm8AvrM3B
 jiOn4gftW9Vtz/IWnxLg5/Xnb0TDZg8kuMqg8pqXuNxe/tsa7jjkkEz9mgxC6kpBmgcc
 afPliWM/5+rwWDAzQZey2SBvBaQPtLpe/WOugNmU9lSLz9FJHX4lg0bmOdfoDfQGb2hW
 V81pyFw3uSUS5FMXXczPhiKjZv3G1uJyPzsDpcll8wEweqMQVtl6fH9/jpnheaKazcZA
 1b5SNC2M1Kr+ZM5KYwuzYcWPkea2QpSTLifng11I69Vf+bPOBuDJq07fagPgeIA02PlF
 UlyA==
X-Gm-Message-State: AOAM531uXHrkx4hrLkq67mKw3DUFGSECfK8bOhVRZFbfMOew5GxnYA4k
 E2by1VP3ulBuqCoZg6UWALQ=
X-Google-Smtp-Source: ABdhPJyQqCEoBp5Xz9+BZw2NcATVGQ8YNlBwKwxvu8ASJ7d5NPYrqSJPGxWZa2Pga/Uj2nf1pomHkQ==
X-Received: by 2002:adf:e489:: with SMTP id i9mr6257310wrm.22.1635430822842;
 Thu, 28 Oct 2021 07:20:22 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:22 -0700 (PDT)
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
Subject: [PATCH 13/13] arm: pgtable: refer to intended CONFIG_ARM_LPAE in
 comment
Date: Thu, 28 Oct 2021 16:19:38 +0200
Message-Id: <20211028141938.3530-14-lukas.bulwahn@gmail.com>
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

Commit 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow
memory") adds some nested ifdef's in ./arch/arm/mm/pgd.c, and follows the
good practice to annotate the endif's with a comment to indicate the
corresponding ifdef condition.

One comment annotation refers to CONFIG_LPAE, whereas the config is
actually called CONFIG_ARM_LPAE. That imprecision in a comment is probably
tolerable for all human readers.

However, the script ./scripts/checkkconfigsymbols.py, which checks the
kernel tree for references to non-existing Kconfig symbols, identifies and
reports that the reference to CONFIG_LPAE is invalid.

The script ./scripts/checkkconfigsymbols.py has been quite useful to
identify a number of bugs with Kconfig symbols and deserves to be executed
and checked regularly.

So, repair the comment to reduce the reports from this script and simplify
to use this script, as new issues are easier to spot when the list of
reports is shorter.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mm/pgd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pgd.c b/arch/arm/mm/pgd.c
index f8e9bc58a84f..bf2935f21c12 100644
--- a/arch/arm/mm/pgd.c
+++ b/arch/arm/mm/pgd.c
@@ -80,7 +80,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 	       * sizeof(pmd_t));
 	clean_dcache_area(new_pmd, PTRS_PER_PMD * sizeof(pmd_t));
 #endif /* CONFIG_KASAN */
-#endif /* CONFIG_LPAE */
+#endif /* CONFIG_ARM_LPAE */
 
 	if (!vectors_high()) {
 		/*
-- 
2.26.2

