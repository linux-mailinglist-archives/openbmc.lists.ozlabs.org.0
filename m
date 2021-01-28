Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BC307285
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:28:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRFWw6lMQzDrhZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 20:28:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m0Fwe18W; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRFSv4BsrzDrfN
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 20:25:50 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id e9so3005930plh.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGVbPoY9H5syjMNxUKmvunYVJ9/X45rWYXbtdIF6A6s=;
 b=m0Fwe18WbXsIfPujUBbgFalMGhT5ckJ3B9c4bBq/222AYueMiszM8gT10fmpJecKBG
 DuRyMyj9TCjuyA4noh8dTAZqNOsf3v0MXAkl0sJ7iR4bfra7IuyOXzSzt6aLtPG/BkQZ
 nd49PSyNgG5WILfQjBG7+sVwXTvqmQKllSvbYPdKX4Hfckl2LfxfVqjScwL89W+oK/xF
 Z3H5CMvHjjHHh2mYYYjGwNmOa767sCL6rYUxI1xiX3vyViISwvdbCVOq1OEKcPjt4I5I
 vre6qLGAL3C8jyNJ5UWnUCMOTzAUsKDBz/AcuOw6Pkr3dRRyUDHIdWRQPwzfQvl5+87s
 03FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gGVbPoY9H5syjMNxUKmvunYVJ9/X45rWYXbtdIF6A6s=;
 b=U6mAq2BpAIoTVYfCjTT89D2/1s71GxEAweC00xrBw7OJgArDLbsDdXaGJIjQRW3xel
 NKO6a0Zl43e6fV9fL5mWJDzDRUwo27CO1ex615qMFPefsY1jANgYCoKPv3N9ezm0HJly
 fnX2Zv2CoNvurAD4jbmGOZfqiJQNXDAGA6JqUcOj3MYFA2mI1e9ZJNO8k629YTqH+AAU
 RKYiqqScXVSqYek6Hn0TJgelkx9zmMK3smxGxCfOrKyE6+J909CVYXAv3wr67HJaulzI
 y8TVOJFwrM2yPP80xtNNi0pAgJo9tmraG4gRS9ffCNExKK+5pQJotGVgxY5M4G3NkVV1
 QaIg==
X-Gm-Message-State: AOAM5330te9h/P8JtuLwq84/DE+JJayxiv/fniNoJ/h4DhWZ+OD5D2M8
 jOR8cVxGAAcUHF8IWNIo7ks=
X-Google-Smtp-Source: ABdhPJz69EH3Dpe+UUXR5p8MeyH2jZg2KHm99cURUzj6UoqmiFs0HeWhN27vD4oNRh18Ch8I0GjC6w==
X-Received: by 2002:a17:90b:710:: with SMTP id
 s16mr9947737pjz.46.1611825948415; 
 Thu, 28 Jan 2021 01:25:48 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gk2sm4531923pjb.6.2021.01.28.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 01:25:47 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ast2600: spl: Include RAM
 loader in BL2 ifdef
Date: Thu, 28 Jan 2021 19:55:40 +1030
Message-Id: <20210128092540.343138-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With this patch all of the BL2 verification call sites are behind the
Kconfig symbol. When it is disabled, 1903 bytes is saved.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/spl_boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
index 98cf72bf440d..06800940109e 100644
--- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
+++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
@@ -23,6 +23,7 @@ static int aspeed_spl_ram_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("RAM", 0, ASPEED_BOOT_DEVICE_RAM, aspeed_spl_ram_load_image);
 
+#if IS_ENABLED(ASPEED_SECBOOT_BL2)
 static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -41,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
+#endif /* ASPEED_SECBOOT_BL2 */
 
 #if IS_ENABLED(CONFIG_SPL_MMC_SUPPORT)
 static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
-- 
2.29.2

