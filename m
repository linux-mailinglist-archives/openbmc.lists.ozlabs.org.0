Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E2250ABE
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:21:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4nS5zBtzDqKb
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:21:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JVBFGmcG; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4lM3jn2zDqJK;
 Tue, 25 Aug 2020 07:19:59 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id n3so239107pjq.1;
 Mon, 24 Aug 2020 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ubn8Ygt3LOORDEBZIqrY09E37xtge/HiuDXDH6cz5po=;
 b=JVBFGmcGmSWsz9bYllOKTJ2ZeE9TP2Kw+25wP3wiTjEs/w8rXBS3cY6HAo7tZ9b6qq
 z9d2tviGGmc+rYAsiIH/YXjcOj2TeuM4TFih4RDUGQ2fORwBCTHGhNbp51SdUgxpvV5j
 hBqlWgYC5NZO+wsKW7oWPKBersSSzu9iZIQn0MOUJunMyllfdzD65zkVQ7mYC4Y9Ax3P
 tuzsTK6IZ4ccnYcvd5o1+XIGRWxeuHjsmcwbKj5GB/5Ep2/rcPTRNesCfGQxPSQ2L7kT
 1sZZ9ggD3o+v72/YOlmVz6AH6PAqiHsO+q+d/5o+saMWqoitT6AN9JkTeNy8/ND+fiR4
 UZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ubn8Ygt3LOORDEBZIqrY09E37xtge/HiuDXDH6cz5po=;
 b=XAn30HWQ5xG4aMt6LrWUOFPFqINzMuqiX23jtLNF3fCIi7J6ntGgbrcke+Xws3oCcG
 fYWsEIX6ApgWE30cLLMDE70HbixOkcrVmhpdQiQUFUNEeZX9D7BKC2pWhsCGA+ZwZy2x
 wPu5uVwX/Ca2HrL9tgnJ4xjntXUHlmMxwuubVOKZkLf3YnN8u3/XEhjas2Sp1eGkGNtE
 WBPsRs48MCn3NIS3fe5dt0Cu5Uk9CL9yuMYPIgWOoIQVWdRVnzXaIaCzlfpK0MD9Z80C
 tr27bgIra/fP+iuuhOuvqNozOlWwzDfW9qqGHjyOYBbWgLQeh5IxccHl8GAcHrlkHxXL
 PDkA==
X-Gm-Message-State: AOAM530uk4jL+hWhpvYIuWt2o2U2qShqWDduH6A7jT+l23ZOudS2aixM
 CA4foRQYa43F5nta1wXizE4=
X-Google-Smtp-Source: ABdhPJxg+9Q3F3q7vivl+srkbNQE74Bxef4gWwHaXun2cCyrH8AN+9ABF5qNI94MyZFjOgkAml3BMQ==
X-Received: by 2002:a17:90a:ccd:: with SMTP id 13mr915003pjt.123.1598303995731; 
 Mon, 24 Aug 2020 14:19:55 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id t10sm97788pfq.77.2020.08.24.14.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:19:55 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/5] ARM: dts: aspeed: Add Facebook Wedge400 (AST2500) BMC
Date: Mon, 24 Aug 2020 14:19:43 -0700
Message-Id: <20200824211948.12852-1-rentao.bupt@gmail.com>
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

The patch series adds Facebook Wedge400 (AST2500) BMC device tree, and
FMC flash layout is re-structured because flash size and layout varies
across different Facebook AST2500 OpenBMC platforms.

Patch #1 removes flash layout from ast2500-facebook-netbmc-common.dtsi
because now we have 32MB, 64MB an 128MB flashes on different Facebook
AST2500 OpenBMC platforms.

Patch #2, #3 and #4 sets FMC flash layout in CMM, Yamp and Minipack
device tree explicitly because the original layout settings were removed
from ast2500-facebook-netbmc-common.dtsi (in patch #1).

Patch #5 adds Facebook Wedge400 AST2500 BMC device tree.


Tao Ren (5):
  ARM: dts: aspeed: Remove flash layout from Facebook AST2500 Common
    dtsi
  ARM: dts: aspeed: cmm: Set 32MB FMC flash layout
  ARM: dts: aspeed: yamp: Set 32MB FMC flash layout
  ARM: dts: aspeed: minipack: Update 64MB FMC flash layout
  ARM: dts: aspeed: Add Facebook Wedge400 BMC

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts |  17 +
 .../boot/dts/aspeed-bmc-facebook-minipack.dts |  47 +-
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts | 420 ++++++++++++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  17 +
 .../dts/ast2500-facebook-netbmc-common.dtsi   |  13 -
 6 files changed, 500 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts

-- 
2.17.1

