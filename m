Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54ED4C7F58
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 01:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6yvr65yyz3bcg
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 11:35:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbOPECi0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kbOPECi0; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6yvN0B6yz30RR;
 Tue,  1 Mar 2022 11:35:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646094913; x=1677630913;
 h=from:to:cc:references:in-reply-to:subject:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YuZO4OlaL+j1Hz0MmUZERoJwsTLfUDX//Mg77p/cZZw=;
 b=kbOPECi0fcHaC4YNsrRQEJYgW3uFaLtJSuhT4Dn0R926e0/v9IwZr+8u
 5fDrsJiCJ3Hk9kGdnjv1B1yry4F0MPDwamHjcucz6MaMap1fZQaeNfcal
 T9O7A8GAlcFvM0ffQZnhoLLuZhb/lcFq0oIQS4/59f/ZGxMvKAX6QPPUF
 UOSUCsZshwmaAc3eQB3jM2z1XUZgR0wqhbuL/swsBqRNjGdDZazrsbJOR
 XqndBeBQMaPFydd31Nt0tJveE5S8y6Nw0Xq0hj5T4ziu6/fuYxt16LwoK
 rhSzBrMdzjaabbqGLv5KV/A7AQpUKbLKmXsNPhmtzIc74q0HZjn4SUpny Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277684310"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="277684310"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 16:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="608636851"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2022 16:34:08 -0800
Received: from yongli3MOBL1 (yongli3-MOBL1.ccr.corp.intel.com [10.255.30.72])
 by linux.intel.com (Postfix) with ESMTP id 58EB65807D2;
 Mon, 28 Feb 2022 16:34:05 -0800 (PST)
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Chia-Wei Wang'" <chiawei_wang@aspeedtech.com>, <robh+dt@kernel.org>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <cyrilbur@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
References: <20210817025848.19914-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210817025848.19914-1-chiawei_wang@aspeedtech.com>
Subject: RE: [PATCH v2 0/2] aspeed: Add LPC mailbox support
Date: Tue, 1 Mar 2022 08:34:04 +0800
Message-ID: <000501d82d04$0ffa9870$2fefc950$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFpITV8ohJziVpZHKVTEr+hR1WqCK2HxEiw
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: request-justification,no-action
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
Cc: "Li, Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

@andrew@aj.id.au @Chia-Wei Wang @joel@jms.id.au

Just want to check the latest status about this mailbox driver. I would like
to get this driver upstreamed too. 

Thanks,
Yong

-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org>
On Behalf Of Chia-Wei Wang
Sent: Tuesday, August 17, 2021 10:59 AM
To: robh+dt@kernel.org; joel@jms.id.au; andrew@aj.id.au; cyrilbur@gmail.com;
devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/2] aspeed: Add LPC mailbox support

Add driver support for the LPC mailbox controller of ASPEED SoCs.

v2:
 - Fix error handling for copy_to_user
 - Fix incorrect type in the .poll initializer

Chia-Wei Wang (2):
  soc: aspeed: Add LPC mailbox support
  ARM: dts: aspeed: Add mailbox to device tree

 arch/arm/boot/dts/aspeed-g4.dtsi     |   7 +
 arch/arm/boot/dts/aspeed-g5.dtsi     |   8 +-
 arch/arm/boot/dts/aspeed-g6.dtsi     |   7 +
 drivers/soc/aspeed/Kconfig           |  10 +
 drivers/soc/aspeed/Makefile          |   9 +-
 drivers/soc/aspeed/aspeed-lpc-mbox.c | 418 +++++++++++++++++++++++++++
 6 files changed, 454 insertions(+), 5 deletions(-)  create mode 100644
drivers/soc/aspeed/aspeed-lpc-mbox.c

--
2.17.1

