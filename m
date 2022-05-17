Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCA529E10
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2W7F2RHpz3bsG
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UOVO1Jua;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UOVO1Jua; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W6t3Hk4z3bhK
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:29:57 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so1483477pjb.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=g/E3VZeeSx4dDu8xOt4mwfu7kFDlErlaUWZ6ZYy2iJw=;
 b=UOVO1JuagN5fkOqvm1Vfy3AVFOBCw1JxX6OnVGhCSluKau7tPaGepitnU5YhrG7tJL
 Op3DU7A+Yvb4zB9t2mX1kpJO5JsTWzVQSgaBk14JZj6Dy9Ludaz1/w7ZM+wVc+ywR/xo
 9QEjJ/kXok6b3uVmcIuXT3XNIEjJ19RyjAxfaMKrFCeegNkMmMB2YVRcoGoRTnZgNOvL
 6MoWjdtJOojboVq/zxmxMS7wuVEc7ojQGmJ0WZB/TgCipZXEvRHH0zsIsJq+yRhjK8kD
 YOMOomvkhKLemPFTKf8JSJpWcBSwuMD43/Hqkm6dGyZKYmrDDO3eJ/mQo1qygmoP44dk
 b3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g/E3VZeeSx4dDu8xOt4mwfu7kFDlErlaUWZ6ZYy2iJw=;
 b=ekCZacmZfNQU6FRowvh+d3+qktSGW+Lfs5qvi/sbvBMyWCaS0UNlWGwBO5cRWGCA9+
 QfCCVOhfw2d/HWorjh8eAJYBUxPEoCOpq/3CaBniBgXUJZPm/Ybbr8yzlYc9w2FiFa30
 X0U5hnjmWOVx2xuk4kQ7m1sC8PshPHP2nTvPhwVsXQBcoDVKThA2HdBDRMYf+qyNmzWU
 CQy3BhRadMvHmnzjiqSz4mbSqg4Pg32PjQxWyR1BrjUw1DSlZzrRpvR7xcq0RqTE6F0l
 57o6FmjWukw9Uy9wtIZmAa9Ik1RPSdo/itrI/OkNDV11Rc5XpVjBf1IFjaR8Gkb8d4GT
 WSow==
X-Gm-Message-State: AOAM533Nr9v6oxpPqeajildq5qZuo5jQPByo8Wa15jZtuvXYzZNTJOSX
 O7aByn7LPK750eBzf/80jxY=
X-Google-Smtp-Source: ABdhPJxPA24MheatYMK3fvrNDnXIJtoCA2tqst7+IsHsKo/cdZGTnbPL6EGXUjwLJlWTmEiWdOLzDg==
X-Received: by 2002:a17:902:d58f:b0:161:9abd:cff1 with SMTP id
 k15-20020a170902d58f00b001619abdcff1mr4898522plh.135.1652779794666; 
 Tue, 17 May 2022 02:29:54 -0700 (PDT)
Received: from localhost.localdomain ([116.89.131.16])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a62b411000000b0050df474e4d2sm8399720pfn.218.2022.05.17.02.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:29:53 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: benjaminfair@google.com, yuenn@google.com, venture@google.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 robh+dt@kernel.org, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: [PATCH v2 0/3] RTC: nuvoton: Add nuvoton real time clock driver
Date: Tue, 17 May 2022 17:29:23 +0800
Message-Id: <20220517092927.19537-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support Nuvoton NCT3018Y real time clock.

Changes since version 2:
 - Fix errors in rtc-nct3018y.c.
 - Fix warnings in rtc-nct3018y.c.

Changes since version 1:
 - Add nuvoton,nct3018y property in NPCM devicetree.
 - Add new property in rtc binding document.
 - Add new driver for nuvoton real time clock driver.

Medad CChien (3):
  ARM: dts: nuvoton: Add nuvoton RTC3018Y node
  dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
  RTC: nuvoton: Add NCT3018Y real time clock driver

 .../bindings/rtc/nuvoton,nct3018y.yaml        |  44 ++
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nct3018y.c                    | 592 ++++++++++++++++++
 5 files changed, 653 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 create mode 100644 drivers/rtc/rtc-nct3018y.c

-- 
2.17.1

