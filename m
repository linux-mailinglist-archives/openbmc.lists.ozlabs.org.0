Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C92AD05E
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 08:23:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVfTn431czDqfZ
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 18:23:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hXdt4Wj+; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVfSl2QcgzDqY5;
 Tue, 10 Nov 2020 18:22:14 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z3so10570973pfb.10;
 Mon, 09 Nov 2020 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=m6tsI6vZLfIOGN9wjxc2B8Hx0bcrTnQ1WgjjtJhiAxM=;
 b=hXdt4Wj+U8TXSrNYk85tfPQyaSLQX8lwdjU6bH2sNPPBf7zmx5OkXp6nQWGPqTOIBp
 YWzE3pTWgM2Rro8ZcsEQXWODmdZImbqVYq3nNGW7QyvxSgK3mdWIFTctp/90VjgTYTnD
 abbOhxeJvN908jmacnaTTZgB0IBLvj4SQ/IxJG0vx2yny94F44DxHuvIsFABn7U9m29p
 x26nrvEwNYSJyHIN9mOUOzO5TtYHuCxsz5F/ix4gqQ1Y1m/PeCMUpZxtOCkko//5z6Zf
 YZdYf7QsZb4OqOFNe4sRVXP2zC3mR5YtKo8LcqTipKgzu+lLZH6+V/dv8W0m9hIEChhq
 dXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=m6tsI6vZLfIOGN9wjxc2B8Hx0bcrTnQ1WgjjtJhiAxM=;
 b=CIFrW3ZYSkKyFcMuClC5wALCgcIDzHPe63mdtN734dtjYWcRLtPBXySp4N7nBoLtMd
 ppwkeR9a36qt3/UwDcnbwE5oxwn5ZsJerm3gdL0yVqfwrU+k04VYCdVGyLGiEbhRospm
 dDZZoC/cFUhc0U8lGHM8V0UbSQ2NNm+bPwEVGygngKVqJopQ1a188V5dvEiFvIqxD3Gi
 SSUkigT9J9iMLTSfNt76sIb3RqLWTPB/4pYjJmzRVirmDBfp+Zq+zRIX2TGs5YKgxHiB
 A6fQIIV+uJ3+V1JrLWufPeyXvk7RD5E7qztz70mWKGPE0j4nRfg/2BFJP2YMAtmMFovd
 bVgQ==
X-Gm-Message-State: AOAM5305wc/xOl62ze1tQvVVxsaHlIRjuisyzJZKDmagKL1gLJAek7+m
 s1Kr1oyyqhMpqVpwcggQz5M=
X-Google-Smtp-Source: ABdhPJzYQvMef+/qWUw8dey1QJTJqoDr9khYcPxNfUhdeyoAHJCdnBB/f1QdASjgDe4U8UL0HUYkmg==
X-Received: by 2002:a17:90a:f00a:: with SMTP id
 bt10mr3389011pjb.91.1604992930418; 
 Mon, 09 Nov 2020 23:22:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id ck4sm2020721pjb.50.2020.11.09.23.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 23:22:09 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
Date: Mon,  9 Nov 2020 23:21:59 -0800
Message-Id: <20201110072159.7941-1-rentao.bupt@gmail.com>
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

Update "data0" partition's size from 8MB to 4MB to fix "partition data0
extends beyond the end of device" warning at bootup time.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
index ad1fcad3676c..63a3dd548f30 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
@@ -124,8 +124,8 @@
 		 * "data0" partition (4MB) is reserved for persistent
 		 * data store.
 		 */
-		data0@3800000 {
-			reg = <0x7c00000 0x800000>;
+		data0@7c00000 {
+			reg = <0x7c00000 0x400000>;
 			label = "data0";
 		};
 
-- 
2.17.1

