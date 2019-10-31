Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB1EAA1F
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:16:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473YTZ5xPmzF48H
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:16:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HE15oaGh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oCeIDN4e"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YQ66N0VzF5W1
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:13:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DAD3B223DA;
 Thu, 31 Oct 2019 01:13:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 01:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=z8ngavjpr9ZdpaCDTKopJJZw0J
 m8e6ibsBlpnhn98uE=; b=HE15oaGhz3uwSjffE7WEeYSG+ydtdUUMMgJuod+g4c
 FSQkWSGjf2QYq8goCvFGHi/zv1215RSn4ZuvRekJwRFe+Z6guF+YjFco29hMvSR/
 c/Zyr+U2cfl2rI16pV3a/2Zd9IP/8p2N0eBpZdI3Y+SeHvMcBOE8UDlEBe0yMIye
 jqgjOr0/YWWGxbNsQ9IY7viZru+T6aG9Qc7hVt0ptvck5xv0f89XLtZxi7l6Cb12
 NAQsdrSO+tTkbWKeFzKLUEs5tzwhXHynsgBTCqBlLBKU9lCT55FoDU6BtNqsesnL
 6aTYQHELT+uhNOUYsJn/OJ1ydO/xgH5CkysqFoU9mHqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z8ngavjpr9ZdpaCDT
 KopJJZw0Jm8e6ibsBlpnhn98uE=; b=oCeIDN4eo/O8B1KNpWVMWwt4Zbt0QA4UC
 TyHdIERcHYm0zpVyCqWKvHxF3xEVIgGDxAVq8O4EI9owyVdcZOctqP1I1PnL103a
 I3Xe3BT4CxdqX7txAHf2mfy6V3p6tTe1pRUTDykxfT/bsWM4tTy79cKzQqa8yQAE
 M8LBS6vX2lO4DHowUXMw9IpQ9kZHpKroFJ8OvVRSFFSyGfW/hJZYdYwPJaswpyrc
 64ilvRIFT+GRuNlX6mlwzg259FmPnvpysWf/gCoh5lWU8FBv42/4TY3UhGDFQFep
 /v+Vn7ODhKS4dV2Ney7uCsf6BnPqj7GW426rQUvRHwI0TIzWVkBAg==
X-ME-Sender: <xms:iG26XaWDdA52vBgR9N_HJYnYU0lotG1D_t-XKfcH4NybXBZ6Yks2tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilh
 hfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:iG26XUEu7MHizGXpIwDGriLYFCo4UGy_NbnWbOTv5mAZV0GHTC6y4w>
 <xmx:iG26XRAL0GLvsBwr-3j931lAYS5PsNU0t5qht3gH9NG2zAPfWrtsGA>
 <xmx:iG26XWxjvNb0phqbmnkmE7daDiUn9Vq_GX_HAYXR-jwSNdU0XvlZgA>
 <xmx:iW26XcuDLzMm7-DeHcDrucnlfv1c7GPBcIEyB5oWws7hZjhtpxFJSw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4B8B3060062;
 Thu, 31 Oct 2019 01:13:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 0/2] fsi: aspeed: Fix unaligned raw accesses
Date: Thu, 31 Oct 2019 15:44:36 +1030
Message-Id: <20191031051438.28589-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Two patches, a tracing cleanup to fix signed/unsigned print format error and a
minor rework of the sysfs `raw` attribute read/write procedures to handle
arbitrary offsets and sizes.

Please review!

Andrew

Andrew Jeffery (2):
  trace: fsi: Print transfer size unsigned
  fsi: core: Fix small accesses and unaligned offsets via sysfs

 drivers/fsi/fsi-core.c     | 8 ++++----
 include/trace/events/fsi.h | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.20.1

