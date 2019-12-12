Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167911D9E4
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 00:19:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YqWB5yBRzDqM3
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 10:19:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUwsSXv1"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YqSV081fzDr88;
 Fri, 13 Dec 2019 10:16:53 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id x184so267740pfb.3;
 Thu, 12 Dec 2019 15:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JrcLTUya6tKmBDv9fbzxQOHC8CSLJLBRuOXylw/H/LQ=;
 b=OUwsSXv1ozwid6KtPLBhDJzii7BoCsvW+6+6VCvLOV2j0VWexXUXp0+6+s2V28nw5c
 +CDD1soqsV4bmZ882ggwY07tSBjH4mvBJNiWOB2mlvUN4dnbJdLEb8jx4Ng+hiOHwY7E
 ZbL2ReILkbwf/vZ9TSy2t4UDjeDw/yDRLAujIP1lsgACnGCH85Uxn1OexduP+b1FHyXS
 B8B2S1l9RGYr6chkeuTfD+ZCVCvVUe8li1b46/Ed5W0LEhkCj10AY8dGxeHEmT7nFF0O
 BeApaieC1GBETt+WJ0h/x6azsE/RuP78q6/n811NPRaMngJDQiwfdx5mFll3YHyebXhX
 wkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JrcLTUya6tKmBDv9fbzxQOHC8CSLJLBRuOXylw/H/LQ=;
 b=qcGL8ExF+I23E+in7kIYnwVGwnoGSTFBOYE3mnGfNw7998KenzWS7BP/OXuaq3/9Z7
 GjR6V+wDEMpGIDV5p9d2tHq35ASD+G0SNehmaj8Jp+uz/+hC2r1KesHzbti3GywmvulT
 YQHKSl1Ubixzc9sLNoyQ5GzeIV88btBZsDZAdiWgjU6v58uxPRyBZtrOEZLOamwZ9Tcq
 hLRkJ7eMZGF8MsTWNLlIE2ocP0qCqhe0SqyjHm97deDv+L3N9EtNSXsxPumkfwmbcb32
 sjssGFpPnTp5PjWHRr7W+u0Jn9E5AA77VHI023EppDI1bJVXoc1g3pE/VLZsEPTBsccD
 y6aw==
X-Gm-Message-State: APjAAAXx9TJ83+0AJ3CEH3YYZSyyVdAnjNYrbFWYB+ApZBqiXvBOQ0tu
 enMn57nD/7RcvLqr5/Uh5vk=
X-Google-Smtp-Source: APXvYqxi/4Uk21EguLIChFfr3iDaBRkRE2ol/JFuqs6f26TAO/JO2iEOAe4DA0rmARfaTHkBSX7sGA==
X-Received: by 2002:a63:2063:: with SMTP id r35mr13926813pgm.120.1576192610054; 
 Thu, 12 Dec 2019 15:16:50 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1072])
 by smtp.gmail.com with ESMTPSA id ev11sm9423307pjb.1.2019.12.12.15.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 15:16:49 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] ARM: dts: aspeed: delete no-hw-checksum from Facebook
 NetBMC Common dtsi
Date: Thu, 12 Dec 2019 15:16:21 -0800
Message-Id: <20191212231622.302-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212231622.302-1-rentao.bupt@gmail.com>
References: <20191212231622.302-1-rentao.bupt@gmail.com>
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

Delete "no-hw-checksum" property from ast2500-facebook-netbmc-common.dtsi
because ftgmac100's checksum issue has been fixed by commit 88824e3bf29a
("net: ethernet: ftgmac100: Fix DMA coherency issue with SW checksum").

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
index 7a395ba56512..7468f102bd76 100644
--- a/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/ast2500-facebook-netbmc-common.dtsi
@@ -71,7 +71,6 @@
 
 &mac1 {
 	status = "okay";
-	no-hw-checksum;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
-- 
2.17.1

