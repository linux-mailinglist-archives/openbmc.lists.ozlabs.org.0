Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50A3CCBC0
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSjBn1Bt4z30JW
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:19:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qi5842c9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qi5842c9; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSj933k53z2yYS;
 Mon, 19 Jul 2021 10:17:43 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id j3so8691948plx.7;
 Sun, 18 Jul 2021 17:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E1IaT57PqM3OxdaVHeeIsBbVs6K+CAA7tBM2PO+uVXc=;
 b=qi5842c9wgexH7nMKcHR9lMnIDvGqx8RaC9r5vuX1qTgthOVXY6Lfy/3izEF2MFvii
 +Na1zJgOVTD/STx3mYGRYJVEFnumtNB5KlfEzswwI5mMgq4Fs79t8v4oFhnd6w1/eafY
 3XjZJ3Qv3GsfXHXUcaTXdpd/BR4qTpAS+I79wHZoGrxs558u8/jtRmH5H5omJpD82dam
 aveObl+lB2cYtxuNDsolZZ8KMBhNW+Om/FJgfzyzAvGhwbyOZIMAMTYpap/KQ2JYm8Gp
 sdWc6W4X9o95K3BReg73+bpymik1mipXXjFmQjPiilSm9JYAQX8FE/sWLzcGDNSz4O/6
 G13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E1IaT57PqM3OxdaVHeeIsBbVs6K+CAA7tBM2PO+uVXc=;
 b=kOyA7tIcNbkWdmYLyHAMw9Ueb6k3BUmOzRXp5XcHr+/u4/+9yHOwB8azq+c/Lt7IPQ
 4PWA3XhwFlqg0hVQn5V8UhBMGNKhLZ4Ss204UMJyW8yo7BqyFunh2XrAQehwXMqEz82O
 IVtcwNTAXXa4ZyYeOAnDDAntxBsEN0PivJ0lBZaGHxW2FZsLDta6cS//Brw3BdPBipGg
 uFBlstw4UtG7vZpNXyTDU+gV9FGMHBmNz2EXVdly9cDHAM+pR0gIGQMQUuEukxsMKKFY
 vF2QfzqgPq+Gailyuw7zJyc7UdN/rRMsdEOVUzdZf5KzD5OM4htV28nW9GQVIWd1locK
 X+4w==
X-Gm-Message-State: AOAM5315c8vsl7a7u2ytM9RI1PewvrTvOA/q2OVK/N2/mpj9Ppwm5UTE
 V0iiBFeCFNDW58eOwS0tw/4=
X-Google-Smtp-Source: ABdhPJxji3hKmRx2pHRZDVVI/50pg9imIvz4sULf1nzAhYLK7ZAK6pCSpUgK1OLvvIv+qpuhXSr6Cg==
X-Received: by 2002:a17:903:404d:b029:129:b048:528b with SMTP id
 n13-20020a170903404db0290129b048528bmr17314870pla.65.1626653860533; 
 Sun, 18 Jul 2021 17:17:40 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm1059847pfn.70.2021.07.18.17.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 17:17:40 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 3/4] ARM: dts: aspeed: galaxy100: Remove redundant ADC device
Date: Sun, 18 Jul 2021 17:17:23 -0700
Message-Id: <20210719001724.6410-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719001724.6410-1-rentao.bupt@gmail.com>
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
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

Remove ADC device from galaxy100 device tree because the device is
already enabled in "ast2400-facebook-netbmc-common.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
index dcf213472749..60e875ac2461 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
@@ -51,7 +51,3 @@
 &vhub {
 	status = "okay";
 };
-
-&adc {
-	status = "okay";
-};
-- 
2.17.1

