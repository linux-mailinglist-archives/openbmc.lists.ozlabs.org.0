Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A853053CF
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:02:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZKK26lQzDqyl
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:01:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hMTL2K0r; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJS4S5jzDqWM
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:12 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id c132so954108pga.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBHS6V7w+FV/SvK50srH9w/z8nXu+RuNDqnQLNLThCU=;
 b=hMTL2K0r+biXu7SYSDYgBkmWmL3V6KeyP5PV9qMAAWtcZ3aCVvZjKmvC1bA60iiFTo
 6p4NUldiTRGEDoNOtpXoHKIzNjK0PwtolKN7tpqQqwa0pHREh6Qni+BoboQpQ/Sftlpy
 Edp2sy4kKkCsFxgvwMWtsLQz8cm1yG4ExBt/tjcn55Du3PsqGTrofme8/7TbhkBk80j8
 GkxSuqo18i3gST4tXYZsHJiyXVTR7+/wcbuL2gdOw/K2tmEtNgwRwI/8faoNdwlzE1Ap
 bMYzLmHCZ90H+VCdd0VIZ7lhZ8d1Zqrin0GbBh/WgNsjEKGAfyZ+rKBoOO3Tw6+IecKC
 uXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OBHS6V7w+FV/SvK50srH9w/z8nXu+RuNDqnQLNLThCU=;
 b=DhhqeSnRQ6RorxhuUG9QXD7WxzDJ4fCG1v1HtbY14DKXV7/5Cxqg/IHVldxcepZumG
 ioGkQpr3y+Baifx+ex7/PAa3+vBsLGUewlHkicM3c9kPFEd1wUSUfw5yGbZ9j02INpYm
 w6ilYOE+rC1Xw3mktS8DV+0Nk0DIz8CcUETyG9lqhlPOswzyzlK0Z4n54evS0l32nBmf
 M332kdrEBNTBpEkounPFCdM7hV9slstBsEpMiiUkkIsoXCJB45mWyQ2X4ufvyE7LAKE0
 qx990QHCtYmrJm2KrHs2eMjqV0qBb/ZdnobrhBSjaYTof7V1blHtlz1B9vbT7GAw/nzB
 lDWQ==
X-Gm-Message-State: AOAM5300pWuXfrH0WXXTtuKXbmJHLbmw80cdlHmFxNzceE5mPcE/LLNi
 8kwiBA9BpLF19PD+wVr2/y4=
X-Google-Smtp-Source: ABdhPJy4xwhpjAFea6RWf7yAPaAJCh9Km7HScZO5FrBkdv46mmlT/ljjAyHXWi5Rixdklt+81yqhEg==
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr9303982pfe.40.1611730868221; 
 Tue, 26 Jan 2021 23:01:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/6] FIT verification
Date: Wed, 27 Jan 2021 17:30:48 +1030
Message-Id: <20210127070054.81719-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As part of our effort to enable secure boot in openbmc, this turns on
FIT verification in the SPL and u-boot.

It adjusts the SRAM layout to accommodate the extra code size, moving
the heap to the non-parity checked 24KB of SRAM.

It also modifies the way the SPL is built, including disabling features.
This reduces the SPL size to 59716, meaning we could choose to leave
ymodem support in the build for now. Please voice your thoughts when
reviewing.

Joel Stanley (6):
  ast2600: Modify SPL SRAM layout
  config: ast2600: Enable FIT signature verification
  ast2600: Allow selection of SPL boot devices
  config: ast2600: Disable unused features
  config: ast2600: Disable SPL ymodem support
  config: ast2600: Reduce SPL image size

 arch/arm/mach-aspeed/ast2600/Kconfig       | 12 ++++++++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c    |  9 +++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig | 13 +++++++++++--
 include/configs/evb_ast2600a1_spl.h        |  4 ++--
 4 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.29.2

