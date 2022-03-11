Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D77434D904D
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXgl59Gfz30Qg
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:24:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pRcYO6tJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=jim.t90615@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pRcYO6tJ; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFG1s3k1sz2xXy
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 17:17:36 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id z4so6652663pgh.12
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 22:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=A7pAy++gE6Sf24glsPSuwiIhYjaba9pQjOIqVLpC6lY=;
 b=pRcYO6tJNwMTlM04j9EYiq+iHMveHk+7BaoWF0Bq6k6ihtdUuQYRWMX57QXqc/cgwT
 3soYCIiJMzJDPxP1LAxR7W/urMID0UPDO2mU5BSp19D5aRTQmOebNhAekpRFmrkJBEU2
 uw5F1LyuTQIVhzyTfFosft17eNwOGqnWyo5T5FsXPK8Ws4Aus0ueDtcHp09VuNYhu6CK
 JTHE/JkXnXD7hiqFljjEy/SupHRewvx83T/dTiDzxcRpnfnl/rkXDHxKdkLm1yN6R4gT
 V3vtNJCcNSpx87joQ9YliJ6QGCu29m9w6tcD2bvxOZXBF4yjRlv4fevpPnZ5JekVOj8m
 5Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A7pAy++gE6Sf24glsPSuwiIhYjaba9pQjOIqVLpC6lY=;
 b=zUv2Otod8eNx8CEtmPCsDWfuRV+NYUhMQNiMFMfgpI7HOlaxT8bvsySBF0HEMFWxrZ
 nJGSsBNycGVdr2Io/0NY/HoMDi9D6AkqEVeZwVrWx1doHGGLX5Na8WU/64dFg7XF3VoD
 V0qZM2yoU0dUGMB6ZptcicDOnrOwY6rTFDJlQNC9mfPqRRKjIaIu1B49riZHvtPgszVx
 uu7xs3QUjMn3LpECcUA2D0wnBgCxYZR1srJkyCmLj4G/zV4JwfEN2PM6bjtETbb/0U7q
 LblDqGzziMmvuJCq4RLEmJ3kd+DTpr3vbDlyy4D9H0vtyM0KEnUo0EbwvhGak4WA6/Nl
 8oHQ==
X-Gm-Message-State: AOAM5318GWZde3QaAz2pxnzWBEV0CV7sawYq4tx4vC5eNFdlTHEbuLQd
 8nRiI8yx8NvDlfFJGeXkXnc=
X-Google-Smtp-Source: ABdhPJy1fJA4WkmniCGtgE/gxQ9bvOZVEhlL1C4xif5vmxgIgz7POBtlmcziW3Q4qioutsVd86x+oA==
X-Received: by 2002:a05:6a00:1a4d:b0:4f7:b86:fd1e with SMTP id
 h13-20020a056a001a4d00b004f70b86fd1emr8387142pfv.65.1646979453413; 
 Thu, 10 Mar 2022 22:17:33 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a0010d400b004f7093700c4sm9101764pfu.76.2022.03.10.22.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 22:17:33 -0800 (PST)
From: jimliu2 <jim.t90615@gmail.com>
X-Google-Original-From: jimliu2 <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
 brgl@bgdev.pl, robh+dt@kernel.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jim.t90615@gmail.com,
 CTCCHIEN@nuvoton.com
Subject: [PATCH v1 0/3]sgpio:nuvoton:add support for Nuvoton NPCM SoCs
Date: Fri, 11 Mar 2022 14:09:33 +0800
Message-Id: <20220311060936.10663-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add sgpio feature for Nuvoton NPCM SoCs

jimliu2 (3):
  dts: add Nuvoton sgpio feature
  dt-bindings: support Nuvoton sgpio
  gpio:gpio-npcm-sgpio: Add Nuvoton sgpio driver

 .../bindings/gpio/nuvoton,sgpio.yaml          |  78 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 634 ++++++++++++++++++
 5 files changed, 755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.17.1

