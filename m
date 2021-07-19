Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE73CCBB9
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSj9M30d7z3036
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:17:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CyclXjJX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CyclXjJX; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSj925Pr5z2xy3;
 Mon, 19 Jul 2021 10:17:41 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id o201so14918691pfd.1;
 Sun, 18 Jul 2021 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xKHTc9yNHDPtjYjnEVTpSB6WymMSFLcHaJXp0d+G5KU=;
 b=CyclXjJXwPzCrFFtbc1DGmLC10POQbDDlwBpwKsixBTkQoAXHydB4Lw+LL1IcY2RrC
 xLYhQ0td895wTInaV0x9Q3BVitpNfK2z9vM8eEvT7Q2APYni0DYwAcDpvZhGLe2281W5
 Liq5SNEj8JYJTlU/KY4eyrcq7fhWuJTsjwdITBsempO3McTvzx82+RJ0AGNBdSu4Vmb8
 GXDFhV477R8uiMLMFOOzra7jxKtr8wm35FBsm299/Fi2od7YQ091DQJ9G+3b7YbJGFET
 S0Dtsnf3v+JAFPv2eKID5DMfUB3mburKKAWr3fOUusylIGrb1XvUK1YoQgwhMmy6Utww
 cNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xKHTc9yNHDPtjYjnEVTpSB6WymMSFLcHaJXp0d+G5KU=;
 b=tz63H07Sunz6lGr3K1NkmQdm8AzgxNE0PELPE/CBDhCbc7IfUul5g4ADL/d6/BRZsD
 krcwQevLr76Up+8gp1xA4dSdWUXjE0ScmrmEDkN4j53r9mF7KxLiIcKBvbSjGQkyJTJt
 z17P28BpZXjcnUQJuWrMNixe5XW7TFXZkifl02QvbibZupiAuh8+9VRQ7MMW5cRH6L/u
 62B0G1UkyUZlXM+2O4hte88UXAPXfsYww79BllZmayU2oV2LoHe/218ChVGPkjlLjmkX
 anGqE47s/BHaUoDLv8TWz7tRrjIB+LSigACUnq169SByAr2TMvQR3CCdadbrc0ByswYf
 Ravw==
X-Gm-Message-State: AOAM532IxX52Q4el9zZ5lL76TotsuBlZj7zaDga6tNjPPpmEQb2vpnUj
 g1Ab1NqP+wC93yk37vraAjI=
X-Google-Smtp-Source: ABdhPJxQfE0nSyd9L3tgN+7nCE4/1nAhzcu/nYonExJ4G9xGVWcU8m5Amt9zOIdLlOtncSsh5nexVw==
X-Received: by 2002:a63:190b:: with SMTP id z11mr22290718pgl.320.1626653856452; 
 Sun, 18 Jul 2021 17:17:36 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm1059847pfn.70.2021.07.18.17.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 17:17:35 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/4] ARM: dts: aspeed: Enable ADC for wedge100 BMC
Date: Sun, 18 Jul 2021 17:17:20 -0700
Message-Id: <20210719001724.6410-1-rentao.bupt@gmail.com>
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

The patch series enables ADC for Facebook Wedge100 BMC platform.

Patch #1 enables ADC in Facebook AST2400 common dtsi because ADC is used
on all the Facebook AST2400 Network BMC platforms.

Patch #2 removes the redundant ADC entry from Wedge40 dts.

Patch #3 removes the redundant ADC entry from Galaxy100 dts.

Patch #4 enables the ADC voltage sensoring channels in Wedge100 dts.

Tao Ren (4):
  ARM: dts: aspeed: Enable ADC in Facebook AST2400 common dtsi
  ARM: dts: aspeed: wedge40: Remove redundant ADC device
  ARM: dts: aspeed: galaxy100: Remove redundant ADC device
  ARM: dts: aspeed: wedge100: Enable ADC channels

 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts   | 4 ----
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts    | 5 +++++
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts     | 4 ----
 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi | 4 ++++
 4 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.17.1

