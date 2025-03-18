Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE566A671F5
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH84t3jxJz3g6s
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 22:00:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742295590;
	cv=none; b=Pq6gEvzFTXV3Kq2Ll1CfwSuzAj6BdbUw7sL15C8QFaE4aLbPHWU06S82MxVIsqfKLRpxify2v6aAUfRGW0oEot+BDJsclwV3zxqFPATa1V09iBDmteeQQ2oqXJbhOQYcSzAL1zVdxQ1LgrHqZ0YKnsbKoitYzXswDbVEFKlucWP/1XssbOP+0ukojkO+S+Xmd7L38FEHoc6SrvcOsbiGHUGhBeOLtW+DkkSUPISEdSWJNGpf7hSRADzGEHQKHzox6F4ziSjbNOJx74Lk9d0QM0lMs6YJviUkthHJioNjOrbdC0YQhG26vAF093Sn9tB0cQZ9CHw4ddmotmWbSt7Nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742295590; c=relaxed/relaxed;
	bh=hpE7UNUb3FU02W03SzuqgdflmSnF7YJKG4oW3aDPSPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AGq+ynpRhA3pMQuEnrFlEAUGf9s82EIkdQSR+qyI/mhr8sHkvZ0t/poERoa+KLQ7PYVLwB4eQTJHcXnlR+yEtUP7iRONEKWprEXPsXglAZ3VFR1591rb9/lwtotZsCkpcOrU5OSsUX36fsY2fZJpP5WGfpqAqXccwvxOLX/kIisMIKzmizvKCmTlyQZI0+67mYAExclweo1lpcgehLs2QIN5frY+7ZcZkbglyuTUepAkJDxdrEW3XtQfiEW2FaTDT1GW4syQOMreZERC7clggT8RfEA09Id9uDigkJqRjdnrUTsU5A9eHrEjQGZt5v/oBWMyZ5dQ0oDCSwGITwk+qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLzefiYt; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLzefiYt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH84N5Vkbz2yrm
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 21:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295589; x=1773831589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKEf+YzroZXTf7Dw8vrxNUxrVBmoYhWw+uCDzGv6Ue4=;
  b=OLzefiYtiLRzYXr9wJumgw3NG4I89Jx07o/TQQRzPpna/Wm9l7/HwEtk
   npUh5jwHHXMZqAvChV8cs2dW5qxWIyiBoAESdk8KnrU0CtYDMSexWrm9D
   UktqpApfzpcHDPudp4OG/vcAhLtrBvfsgxi5Voi6qlhRj/W66hbhS6y3k
   hSdV+WH7AfDkk5Qpz/IlsP+t3Knm12ktagpKW6ghuGoHmEzDNBfNjDHho
   Z1iFkVurTc3Ql+ZzqVYnoG5zLuNF4iHwOHCyz2BouuEriuAnF+9Nqs6/H
   GxPb+7O2/O/NFVNtFORxDHSeWZRTgDCzY1sUupWS0WVnn/H8ypmpSuY+A
   g==;
X-CSE-ConnectionGUID: eaSHtqpNRdWGnFx4XVB/hg==
X-CSE-MsgGUID: 44xZL6P6R9W3gAvL9D04Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781772"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: +VWz2+diTwy2Q3onKOYL2Q==
X-CSE-MsgGUID: EImJDoyzTJi0wDl6BPq+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215698"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C03B517B; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
Date: Tue, 18 Mar 2025 12:57:13 +0200
Message-ID: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert Nuvoton drivers to use pin control provided data types
and more of device property APIs.

While doing that, fix one non-critical issue that sparse complains about.

Compile tested only.

In v2:
- fixed compilation errors and warnings (LKP)
- collected tags (Jonathan)

Andy Shevchenko (5):
  pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: nuvoton: Make use of struct pinfunction and
    PINCTRL_PINFUNCTION()
  pinctrl: nuvoton: Convert to use struct group_desc
  pinctrl: nuvoton: Reduce use of OF-specific APIs

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 120 ++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |   1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  44 ++------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  35 ++-----
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  11 +-
 5 files changed, 77 insertions(+), 134 deletions(-)

-- 
2.47.2

