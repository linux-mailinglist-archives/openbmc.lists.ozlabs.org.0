Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21845307436
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:56:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHSx58FWzDqhn
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:56:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TYDuUFQ2; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHPp5PTBzDq83
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:18 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id md11so3640586pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ab+RIvlfrSl7hljDLw6CIrjUIt5Hddb9nyDOy3MEBJk=;
 b=TYDuUFQ2DxIQtBFCHkbM5ebs6imwiu2KOQm6ZuI4+91yDK1nRrbDm7CEaIFdyR84hi
 D6ThJZBWp5zctrFBb/bI8+wDM5ndhNpeRYgVnAr/uqXfHIMRQozETDhX+UtQmC9ppTmt
 9Wl/89pGtigkHFT93lZuHDviE7cFoCiMZV8z1PtKvS87iyMHLXXC1RC/TICGV1Un+Xt/
 Q94lZZVbiUziRBrr3E2reGdEkBJAELtTIliUG9eTIM9lxDdEmCJ9ES1lA9VKvnlE6b73
 IF/MMIjNFBW/G8MGSDVMeiEq+ZciBiA1mvdy9iHY2F0NI6a+e+Y/H/821CXNJpk4OMlI
 9NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ab+RIvlfrSl7hljDLw6CIrjUIt5Hddb9nyDOy3MEBJk=;
 b=dSg3oZYmN/bRhWD7XuoDgwxThIFCIJYGMPlgFJyLRa46C2Xabls34mIqv3reE92Xer
 RjzKtgOxG5JGPdl3g50FRTO4AwWL2NopHc1AGjqZtq+0KpHLomVjL0j6nnYRoWDX0zlw
 cH04VvCyaQB8CSaUxSFHgcn8meOZNdaOvJirbaTlw1o739ZNacCfBOLK14Af/05ouzt8
 qDLte7HbMwbNr9namf/GyoEOe9kQykLPu0gUOqPE7UC/RdKNzZ/mz8CLniV7NEtCW3uz
 wOW1qvxEvBw8Dk+3KHVfyCR5Boz81Na1zqR+Z9k2qK3tgPL0ehuRDFa8BP89HVv0b6tw
 auZQ==
X-Gm-Message-State: AOAM532egDP8v9kRZWZj8z+2eJVdFTvTOllJVamxHKXZrYkCJ4+Q9ks2
 mQbmy/Bdy126rbMS+OfrpQ6wmD41ilw=
X-Google-Smtp-Source: ABdhPJyvDT3vbZnbrteH4sVT7oINpeFBLocRbAzR8METNwQC6/aJ+cubHA2oRzOFnL6IHyhz+MI1PA==
X-Received: by 2002:a17:90a:c595:: with SMTP id
 l21mr10468214pjt.137.1611831196066; 
 Thu, 28 Jan 2021 02:53:16 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:15 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/7] rsa: reject images with
 unknown padding
Date: Thu, 28 Jan 2021 21:22:58 +1030
Message-Id: <20210128105304.401058-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
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

From: Patrick Doyle <wpdster@gmail.com>

Previously we would store NULL in info->padding and jump to an illegal
instruction if an unknown value for "padding" was specified in the
device tree.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
(cherry picked from commit 19495dd9b6f5f4e893b56b0c73e14b2e671c3780)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-sig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/image-sig.c b/common/image-sig.c
index 4f6b4ec412c3..004fbc525b5c 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -211,7 +211,7 @@ static int fit_image_setup_verify(struct image_sign_info *info,
 	info->required_keynode = required_keynode;
 	printf("%s:%s", algo_name, info->keyname);
 
-	if (!info->checksum || !info->crypto) {
+	if (!info->checksum || !info->crypto || !info->padding) {
 		*err_msgp = "Unknown signature algorithm";
 		return -1;
 	}
-- 
2.29.2

