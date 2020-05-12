Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D590E1D00DD
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 23:28:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M9sc2pm0zDqpL
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 07:28:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=kLafczTp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VpZRjxem; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M9rv2bV0zDqn2
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 07:28:13 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id DBCC28F0;
 Tue, 12 May 2020 17:28:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 12 May 2020 17:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=LfKTMMUmyteKQSjrABsX+cRxFj
 GwvbEOYMoHyYuGz8o=; b=kLafczTponNUdQQRimt4clF9+fPT0PXqCOg/w+fvgR
 tPGHciemmK/xXpWNLfMYy+8SHopioztw3Qr6fR1g00yq+97Zt6wJhHGAdBHTkHfL
 TyV55bsxOLcm1o3yjvjI2lJyZHcV87vXPAmxyyI3d4zwGRd8Qb9oqnhmhNQ6Saqc
 Kgkd6xeap/NQy/YSJCaEjt4mEgDJYz8P/iRwgGhBukR7redf878kB/oG4oZdexas
 VGBYsTzPFu+qDqelLfKnxJatfFbA1YizD0t0SF9vHRa6PKTsQ0PJUXXZVG4Mo5G5
 +1asKNQeAkMbtu4TfIVXtYpDdz4mXo0cPxhj4pSEDyIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LfKTMMUmyteKQSjrA
 BsX+cRxFjGwvbEOYMoHyYuGz8o=; b=VpZRjxemVkLL5KSMLONg28loFvkZPoHAr
 wy50Mfbg5h1hJJCZ9SDU2fR7bEw1mE0RqpeySqXjg5ug8MzFUAZuLpCXL0atROQL
 wqTuqS59i9wvwX2ELUCCYsz93ShORucbvGHD7PmFetbqiLzhls3uRtu3XiTmPIwA
 rPoFmx6QNKd1EvBlyEk9yQ9uXvP4SFybLtg4zO+apSe8r+dxMvZNYcL5wjIGt9Oy
 6R9/E13Cf3RtjbuonjKwirUs1Im1ZMXYb42/9Lel2e/1vEZ1KdVTbXlNGDXOMDgW
 Blyc45QRh9pmj02brDR4RPJfmvvx5XmbgDIF16g2CimnEluxCyp9w==
X-ME-Sender: <xms:6BS7Xp8K2rtTu_FzEcLERL_mh8zMV4fPdSqqWH0Hz9_kDNZcOhIxjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefhvffufffkofgggfestdekredtredttden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeludegheejteelheduudegkeehleet
 feekiedtfefgleeifeelhefgveejhfffnecukfhppeduieeirddujeeirdduvddtrddutd
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:6BS7Xtt769VV_obp2nX0uM4iwxS-UYn6ib2yiEQ1dQhyyixPd6U53g>
 <xmx:6BS7XnDWzrVQZnY2NMLgHPt930kprHm9Ez2mBq4oPCQaPvtum50Txw>
 <xmx:6BS7XtdZ3VEC0zhfir3DtiMrao7huPm15YNDLDqARBaEd5jSZOFycQ>
 <xmx:6RS7Xg0pv6hJcKEsL33lyc4Pn7cZp3SalX3OaKhfxifzcXHYwZNmBQ>
Received: from localhost (mobile-166-176-120-106.mycingular.net
 [166.176.120.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2D8030662A2;
 Tue, 12 May 2020 17:28:07 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot-v2016.07] libfdt: Make it compatible with newer dtc
Date: Tue, 12 May 2020 16:27:55 -0500
Message-Id: <20200512212755.621891-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>

DTC does not use an underscore for the LIBFDT_H and
LIBFDT_ENV_H variables, this causes an error since
u-boot does.

Remove the underscore from these variables to allow u-boot
to compile along with dtc.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 include/libfdt.h     | 4 ++--
 include/libfdt_env.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index 74b1d149c2..a8a6ffb445 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -1,5 +1,5 @@
-#ifndef _LIBFDT_H
-#define _LIBFDT_H
+#ifndef LIBFDT_H
+#define LIBFDT_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/include/libfdt_env.h b/include/libfdt_env.h
index 273b5d30f8..b45c9624d8 100644
--- a/include/libfdt_env.h
+++ b/include/libfdt_env.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier:	LGPL-2.1+
  */
 
-#ifndef _LIBFDT_ENV_H
-#define _LIBFDT_ENV_H
+#ifndef LIBFDT_ENV_H
+#define LIBFDT_ENV_H
 
 #include "compiler.h"
 #include "linux/types.h"
-- 
2.26.2

