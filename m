Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22243E386
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg77s0NtWz303F
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N0HwkOaj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N0HwkOaj; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74N5DmVz2ypB
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:04 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso1434837wmd.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwKhuPd0K1+EmTRAh45beol0sV7WvBTjR24Mfp3dTpE=;
 b=N0HwkOaju3aHOIPChBq71/QS7cdj2sLk6qHh0FwX7OVXO5sW+QNvVhsxl3b6kVzZHy
 1TsgXblfqH4lohGTZH4PrW4Cmb03P57HNMFzFRTUUUNcYWNKu9O+/wnSNr80QU14tllv
 87+5xccCn9T5Rz/c/mL47kP6DQIlacnBh2zc9T8fgaV5WyWLsJPPLeOaCdjivi60CBb0
 KLCcShyp7Pog1dJqJMwYSq6ayLOr85LQYKd3EeBZxP/lmKDp6XRrqCzfkHnpxm8sRrAP
 lmmf7ZLwHtr0LiPTldNLBGBFCoJI3hM2iDQZnfW/lOVKzLEWFqgcOhgJAROKeY1ge+Co
 x9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwKhuPd0K1+EmTRAh45beol0sV7WvBTjR24Mfp3dTpE=;
 b=2iXld4NjfLSkcP9er8OqMNmleRP29oU3hU5GSV+KEWj+SjMi7iqkIRwV19rAD5d6KA
 yyTDBFMh77k56/iIZMrPfUWUjnNYbF4ZbzE0IT0NqS7zEAH8oBQCl8NuS5tTkYpsZbgC
 rzpTFPykpe4muwmWI4HwufpbXukt33WOap4yK2JF+VFr5QpKgIeGUNKOzlT1dqvf58Ly
 yjyUAYNI+TReGUGApiiEnk0a7OV0CIHaUvu5MXEW3trfhy4GVKErbSm5Z3IAbSsc4DE9
 qoh6DZk3xn9cbvVpXpYu9nZcCpxUE18t80V0wBLpqVFpGMvnhLVDLlD2uzJ6Kj1hjBm9
 PW6A==
X-Gm-Message-State: AOAM531RR4y+G1YS7S0tw6GAKLrY7OF7fbLvSTESxkNLcaQl0hP6+BUy
 ifiSl12CLCkD5namPBrUvI4=
X-Google-Smtp-Source: ABdhPJxJf+q7NdBCBG/TUWbpWh436luTVJzFSER9ir83w9qoTEJrg8dMENgpR69PnWdTbdIfAD/BSA==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr12724598wmc.112.1635430801147; 
 Thu, 28 Oct 2021 07:20:01 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:00 -0700 (PDT)
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
Subject: [PATCH 04/13] arm: drop an obsolete ifdef with the removed config
 PCI_HOST_ITE8152
Date: Thu, 28 Oct 2021 16:19:29 +0200
Message-Id: <20211028141938.3530-5-lukas.bulwahn@gmail.com>
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

Commit 6da5238fa384 ("ARM: 8993/1: remove it8152 PCI controller driver")
removes the config PCI_HOST_ITE8152, but left a dangling obsolete ifndef
in ./arch/arm/kernel/bios32.c.

Hence, ./scripts/checkkconfigsymbols.py warns:

PCI_HOST_ITE8152
Referencing files: arch/arm/kernel/bios32.c

Remove this obsolete ifndef.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/kernel/bios32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index e7ef2b5bea9c..26b5d8361980 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -529,12 +529,10 @@ void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
 	}
 }
 
-#ifndef CONFIG_PCI_HOST_ITE8152
 void pcibios_set_master(struct pci_dev *dev)
 {
 	/* No special bus mastering setup handling */
 }
-#endif
 
 char * __init pcibios_setup(char *str)
 {
-- 
2.26.2

