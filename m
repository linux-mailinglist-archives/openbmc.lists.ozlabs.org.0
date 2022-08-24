Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2659F3CB
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 08:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCH155LWKz3bkG
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 16:55:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=daaB+v/O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=daaB+v/O;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCGzL5Wzrz2xG6
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 16:54:05 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id b16so20823039edd.4
        for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=daaB+v/Ogt/XFcvC7vydNq7smPbNaBpL2E9TjAhbK+B0qJX1InYC/0VWR+L0wyA+Xc
         GH7VSMXweLWA9kepWIqHLE5TCNAuGRKGgdiJAJvcsG9NVG4J0K9mPdhLXqS8/nb0NwnN
         HutQY2yWF8iZ1mU7l/3UzScOjDCpHBUpIASHKUK6W9CxgsnfjdXZ98Dq1m8cdpalwsBU
         0czNvBPMUlbQTsXdU5XGJyogUk26NHo2pv1jIcpz3tsryjvnBdDULhghd6gU339Ef3F6
         OBVzYZlAALv8TRynYQTK2q5fzZC0XuwkThi9NKMISPYi1RqbhBPo2fH4Lf1ou2FL8H3Q
         FHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=YUs+hsNU5ciVvCfO0AKy08Gl/fZXjVRnd4bbeeMQY5xkQ8h5hQ0cUNsvgOux0be7Hf
         CE0JSVcXeMrSZ/caElwUlXcnCOcpqBd+6tH6Mtarc/mFnFFLUCvAUlHqWIzNX9zC5nnT
         emTT1tfi5fo9aHgHt37RegoVqvwqclu2ruIBULyE6jRvE6DczE9pGGI/py6xyut50lEm
         1BSrP6W/1R/B9uTqieAXMJ8ndvns1JRCYuFI2Mfcqf7K10tUmMu9f53ouikbWP8TVGLc
         AamAUb56kuYPQ0waq3qZkdyuBiHOvcalFkF6v+U4JM8Aw/0XroDoc4LoQA5KmnQWxa1a
         BLYA==
X-Gm-Message-State: ACgBeo2772oKYvLDkRStFK3wKPjy1A/ZwB79m8fEfsUsfB6gFoqxHu9K
	pQSWYJsslRgJbAcJEOo3znD0iA==
X-Google-Smtp-Source: AA6agR7AqkhRb/IaS05MU+QgQHEiQvNOYiZZ+kyetkCkjpuXL6Uw++GxLxVFlvXuiCLl69KQmwEgfw==
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id ez12-20020a056402450c00b004436279774fmr6477626edb.11.1661324038564;
        Tue, 23 Aug 2022 23:53:58 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id n26-20020a5099da000000b0043bbf79b3ebsm2644475edb.54.2022.08.23.23.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:53:58 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v6 0/2] Add support for IBM Genesis3
Date: Wed, 24 Aug 2022 08:53:11 +0200
Message-Id: <20220824065313.1636548-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: andrew@aj.id.au, christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v6:
  - Clarify UART5 rerouting only affects the console

v5:
  - Rename Kconfig and don't depend on ASPEED_ALLOW_DANGEROUS_BACKDOORS

v4:
  - Rebase on upstream
  - Drop defconfig and add it on openbmc instead
  - Rename Kconfig for debug uart

v3:
  - Drop FIRMWARE_2ND_BOOT patch
  - Include reference board DTS instead of copying it
  - Rename DTS to ast2500-<boardname>
  - Describe defconfig changes in commit message

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (2):
  arm/dts: Add IBM Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1

 arch/arm/dts/Makefile                   |  1 +
 arch/arm/dts/ast2500-genesis3.dts       | 28 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/Kconfig            |  7 +++++++
 arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

-- 
2.37.1

