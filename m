Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5F2AFBAD
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:28:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgsV3Y4QzDqP3
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:28:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SIfjbVbX; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWglt6G60zDqsW;
 Thu, 12 Nov 2020 10:23:51 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id m13so2521779pgl.7;
 Wed, 11 Nov 2020 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rmvEzNyFoJX1iHYxKsv0/EGBjX8DBa3yt0/jMPmZuc0=;
 b=SIfjbVbXY9g2nGpr3BqroW0o9pCuBd41UimxHetMt19exNTV0jskvTTI4D/ubKIHsB
 DUf4SCe+EqQ/6L2D52wX8PE5uJ9dSwBdlrq1GFulADQLx1Thh3z8/UgMxLuaLxr8I0d9
 8haeVcVDKdVJvIdEYtH0oxYWVhiOV8ajBx2YGhgg40jK3lUEkPeIOC3+yJ8SQst6SfER
 ALddFewf+XAW2+kSkKkVgWuLwSK1CETx+eXOTrJsH9h4RdGYW00TCaNlHaJkZ2ZVTFM0
 s2beFieRVB7U64JwJDuxp2kiSK5JmU4L8UMmJ4UsmY/2/pPc9GiFxNyfnL08fUywSk4f
 QlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rmvEzNyFoJX1iHYxKsv0/EGBjX8DBa3yt0/jMPmZuc0=;
 b=qPDKLHlvZXhhyHYvLSBsySCU4HozNjR7/cCeHpt2fod53VBEgqpACcefxn5HaKP4yC
 pB70SSETnXHiLmiXe5SC/qR8oOjA7bxK14cSrHsznhhciaL/v/Uv/pyI0CVZMe5XvQXX
 DTG71p19ekqSwMrZ9I7VYVWx6TluuWP1uQzjeOWnEnMe/r3JWj1ZOCLLAZg0DwOcmmTn
 u/STr5wHq4asdLTPaDEQrPDoNsDIMmac5SuWZwiTUBOt4cFGXmG5Ho5PwR02ix/s9+J3
 vXPr9SKWFgFaFfaMIMROdsmQdSo1LNuL1KySQnC+AxLySkItw4gvnppK5wA2rLhuIf3D
 D/Ag==
X-Gm-Message-State: AOAM530QHzFiOafyIKVe/CEmYpgoF0yUk+//KDYSbujZritft4d7MkmV
 Ur4yMB99oQ/DaNjnzRz9GMs=
X-Google-Smtp-Source: ABdhPJwLIkmY1lx2BkFH6Ky9XCzcwXy2Tiedp8iEyPSz0H7c5glq67safBqMDc1pSrdZwJsRHwPlYg==
X-Received: by 2002:a17:90a:4208:: with SMTP id
 o8mr6176658pjg.19.1605137026461; 
 Wed, 11 Nov 2020 15:23:46 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a128sm3901431pfb.195.2020.11.11.15.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 15:23:45 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
Date: Wed, 11 Nov 2020 15:23:26 -0800
Message-Id: <20201111232330.30843-1-rentao.bupt@gmail.com>
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

The patch series adds the initial version of device tree for Facebook
Galaxy100 (AST2400) BMC.

Patch #1 adds common dtsi to minimize duplicated device entries across
Facebook Network AST2400 BMC device trees.

Patch #2 simplfies Wedge40 device tree by using the common dtsi.

Patch #3 simplfies Wedge100 device tree by using the common dtsi.

Patch #4 adds the initial version of device tree for Facebook Galaxy100
BMC.

Tao Ren (4):
  ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
  ARM: dts: aspeed: wedge40: Use common dtsi
  ARM: dts: aspeed: wedge100: Use common dtsi
  ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC

 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-galaxy100.dts     |  57 +++++++++
 .../boot/dts/aspeed-bmc-facebook-wedge100.dts | 120 +++---------------
 .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 112 +---------------
 .../dts/ast2400-facebook-netbmc-common.dtsi   | 117 +++++++++++++++++
 5 files changed, 191 insertions(+), 216 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
 create mode 100644 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi

-- 
2.17.1

