Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D958863CFF4
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 08:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMWh85Vkpz3bZ8
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 18:54:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=gViZnKZF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=gViZnKZF;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMWdW6p4Pz304s
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 18:52:30 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id b2so23035654eja.7
        for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 23:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=gViZnKZFgRlbNm1jtxIEEIkjeN4xocrNfGViPkto7DwghP/9zbbshYPFkxV9SpGzWE
         eaRbUTAFmPLiOydxvpdaQRtnLRdqUcYxyWmVCpsRp77mGvYs/7I9Q7n0tSq9LO0ltOU3
         xOt3xeOOped574RFH6TmtPf36mTHQbubI9r3EuhW7Us+RjnrC+aDx4aEI8UyicqYCorM
         I/20j6w6GfEft3kHUUyUjjM8UN6imPg7rKepaRmTErH9uvTW3QmLFAOBVS4pCqQlZ8Ym
         Lu9Y9Gy6EeC6rpB/U00pe1k9SZMqzvIazHTYmLU5t9DdbarAGlv8Vts1tbGDNvF518sh
         /SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=w4gVfdiz6pO6hPIc+9Y0FO3WsUpgL/5Mh7wTSyH/9XDhvBOthKsqy+ndIEMKu/VM+R
         35lLCu8vg5osb0BX7lP7EqZjBGhjSHP+pYDmb8Xvdv+6RiudImxclxjU9tPf/qYmBnm9
         QB1+pewMC1OhbfVi+i8veBSwlUoRk/kJJixDH9nxMgciM10KuLjsQNEbrlzCwtCxSCvj
         uFtZ9yp0+5b/gR7zw/4CZLWZ/fB4/dN2Adg1m7gW7XEeCWBuMy01u90o8mLllqP86QGn
         nTdzL1PuzH4WYs06ayow14q/xgEb956nO0KAZjCxP9awJpk/DqSb/j5HmfGBppoQbEuM
         9KLg==
X-Gm-Message-State: ANoB5pmcWsnPb2afzcltkGjJhqtKxz5owTqdLSQnkZOm1T/h9zZfbOTU
	bkGUtg4w+ka/LVYVNJ/F05SoUg==
X-Google-Smtp-Source: AA0mqf6yrR5BHDheugEO9VQe3KX9WAQCmMAUFCuszweR1v0Nyac58t/oRyEnLOAtEsE1QjVGMjnXdg==
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id ky2-20020a170907778200b007b6dd6db829mr38212239ejc.602.1669794746064;
        Tue, 29 Nov 2022 23:52:26 -0800 (PST)
Received: from fedora.. (ip-094-114-233-057.um31.pools.vodafone-ip.de. [94.114.233.57])
        by smtp.gmail.com with ESMTPSA id s17-20020a05640217d100b004585eba4baesm313236edy.80.2022.11.29.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:52:25 -0800 (PST)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 0/2] Add support for IBM Genesis3
Date: Wed, 30 Nov 2022 08:52:20 +0100
Message-Id: <20221130075222.1238196-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.38.1
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
Cc: takken@us.ibm.com, andrew@aj.id.au, naresh.solanki@9elements.com, christian.walter@9elements.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
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

