Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225F535BD4
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 10:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8dj32MsPz3bkl
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 18:47:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EkXFhzB6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EkXFhzB6;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8dhj3FC5z3bhK
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 18:47:00 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id c2so3598419plh.2
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=LT+QAOqNHX7ViHSsik7kvf3ypjWNwSuEN+rviPBBKVw=;
        b=EkXFhzB6I2uejZeDOfwTivxzmkAjlXWQzgl7qS1XAqWQSsrMu3JAjkaSjsfaL51svU
         uZBzGyfFzcwDbnNsjntpXEi6BKOUPzamrL5XX4vGVMPP4+9JI4cl2BQScVC5lNBlEoVm
         rVtSgcMKqsbGqBzEOr6qb5QvJ0DnzQxDYdxoj5Q+KrmLGGK/IBiaAG5CubqkZ6JAURhh
         fnHmldWC0iducAx6xhxoqiAVBoh/9AAR2nT6Io4ILBQT4AHvTXNf+j3PX7DjGPUMZ4lU
         QElFZQaiz8IcjrdWNtptAUIMZpbTh4w4mlws44DvIwY+ZKdT6luOpK2CHcQGD7zgshyQ
         6/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LT+QAOqNHX7ViHSsik7kvf3ypjWNwSuEN+rviPBBKVw=;
        b=Z0e3a/1ZNcsTFvPTS70ALxoQfhSi4W/jouql5GkUQlJ40JeCvTeFtDe4sUXg+xVwgy
         Rh8Ht6uJ4dEPYV1F+6xu/I2grI0FtcyMaGst3uRq2pCXZB0syYIemjxXLZyKKK1Dj9Wd
         fWU8p6Yd/V3lwqRbpDjvNW8J7fJY/gx7BfWj/xHj5+GhySy3jE0myHNz2pRmHWJbVJpU
         RDsdAOfBjvMPf29U4H77iFa/LhJCT8+j0Ejyj3U0crrLGzvKag7F6WG0JUfpDhciynOn
         UPMArqXKdL88Zjetqw2P8AP4rcZW0cTalmeny9EY+ubNdT3rfPhfbyZIv2mygqz519Ec
         J6zg==
X-Gm-Message-State: AOAM533zdxSSAhKPZAcwlfaz4wqc4oj9rSomB1hoJxS86kBeCUvQIhYp
	WwKKjwcyHAZgmsB2hwZ09ow=
X-Google-Smtp-Source: ABdhPJwbMVfPy1IMJtptgkrIf6LW9VDXVLIQ/vswb1KPSPLQl8dZBhbh32Dh0jzQbem2FdkY30ZOMw==
X-Received: by 2002:a17:90a:5d03:b0:1e0:cc5b:4808 with SMTP id s3-20020a17090a5d0300b001e0cc5b4808mr7091366pji.180.1653641217105;
        Fri, 27 May 2022 01:46:57 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902d58c00b0015e8d4eb1ebsm3003254plh.53.2022.05.27.01.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 01:46:56 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	tali.perry1@gmail.com,
	tmaimon77@gmail.com,
	avifishman70@gmail.com,
	robh+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	a.zummo@towertech.it,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	ctcchien@nuvoton.com
Subject: [PATCH v3 0/3] RTC: nuvoton: Add nuvoton real time clock driver
Date: Fri, 27 May 2022 16:46:44 +0800
Message-Id: <20220527084647.30835-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Support Nuvoton NCT3018Y real time clock.

Changes since version 3:
 - Add part number in Kconfig.
 - Refactor rtc-nct3018y.c.

Changes since version 2:
 - Fix errors in rtc-nct3018y.c.
 - Fix warnings in rtc-nct3018y.c.

Changes since version 1:
 - Add nuvoton,nct3018y property in NPCM devicetree.
 - Add new property in rtc binding document.
 - Add new driver for nuvoton real time clock driver.

Medad CChien (3):
  dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
  ARM: dts: nuvoton: Add nuvoton RTC3018Y node
  RTC: nuvoton: Add NCT3018Y real time clock driver

 .../bindings/rtc/nuvoton,nct3018y.yaml        |  44 ++
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nct3018y.c                    | 560 ++++++++++++++++++
 6 files changed, 623 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 create mode 100644 drivers/rtc/rtc-nct3018y.c

-- 
2.17.1

