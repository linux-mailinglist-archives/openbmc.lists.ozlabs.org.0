Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08E15B34C
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:01:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Htrq1Z2rzDqBj
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:01:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lGInGhkn; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtmD3rHqzDq9L;
 Thu, 13 Feb 2020 08:57:32 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id s1so1889874pfh.10;
 Wed, 12 Feb 2020 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fcer5maloVUCbkrSQe8DVkPL6Lk2CjvPvSpxHsxWCA0=;
 b=lGInGhknBbblmThHtOa744jV16eu2Xyt2aJIm0PxY//v6EDHVQoK5BSn+MknS02bMV
 tbA5WHwtJZorWqS04XVWCwpGUBQU+pbfOzlFLHLYtxu40nNkRBDitMK+dVqXc8tARDcO
 BepqoRcl4CHTjalDmGkH5eDUSt9LuKa7irkD/hbmNIT3gDaL5bubldX9qYxCDbQWSKrh
 /9W0WufeNzu/OvP1Hh3lXXAeBj348e2RqbvpWSuAEN8t+BDZ1l7H0vtcCs8DjOeUHm4m
 GP2hqK3qtscWZE3htNBsmE7cXAi4Kn84itEE0Cos0Z+wHhZ8G70Aj+nH+EU7/Qi2/CNe
 QiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fcer5maloVUCbkrSQe8DVkPL6Lk2CjvPvSpxHsxWCA0=;
 b=X4a78mrRYiyAgYq98pa42EwAiyNE3DrVyx+U2UK74q380FFXxnEivdaRV+ee4iMvRu
 T9L7lOXS05LQygtJ/viEyP+BfQu1atPtK61tSTNcUZ2QIhT0hJ0wNEA505/VJ1VzcTiu
 +jLXkHFXQuBGzHSB7LRxaM76s15APNo8np63nkFs+Y0/WaHHwGSsGkHkjwFAxEoTKac3
 NNc9XNhxYsrnS9Kld1+vT3pEcjqRLYHih3hcfatq2YDawPPGk2ZuJ7gUNVhgQXHHuzNI
 xIjSFN0ivK+pRY2wePc6Q4VyzDxoEa0DO36yJ8PeY7ennmmQwHJLUDXzNXte7qNdPNgS
 e3pw==
X-Gm-Message-State: APjAAAUk4Xfm8Vda/ObTDgNTaYs+m/Ymqc/wRl0B6TRdc7luLardUDZL
 xMpv9mEmsRfMgPhnIzOr8tw=
X-Google-Smtp-Source: APXvYqxclQ88Laxxq1gwYJEcZ4+1ZPZl3eGG+pqs9MZeB3l0Bz+whOVPNY0gnX+iG+v3p+tsU2Y4Qg==
X-Received: by 2002:aa7:94b0:: with SMTP id a16mr10508433pfl.35.1581544650459; 
 Wed, 12 Feb 2020 13:57:30 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::3:533f])
 by smtp.gmail.com with ESMTPSA id r6sm214431pfh.91.2020.02.12.13.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 13:57:30 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 3/5] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Wed, 12 Feb 2020 13:57:15 -0800
Message-Id: <20200212215717.9474-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212215717.9474-1-rentao.bupt@gmail.com>
References: <20200212215717.9474-1-rentao.bupt@gmail.com>
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

Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-endpoints"
properties to describe supported number of vhub ports and endpoints.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - None. The patch is newly added and it's given v2 to align with
     version of the patch series.

 arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ebec0fa8baa7..f12ec04d3cbc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -195,6 +195,8 @@
 			reg = <0x1e6a0000 0x300>;
 			interrupts = <5>;
 			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			aspeed,vhub-downstream-ports = <5>;
+			aspeed,vhub-generic-endpoints = <15>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usb2ad_default>;
 			status = "disabled";
-- 
2.17.1

