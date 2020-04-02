Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85919C145
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 14:40:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tN2n276BzDrBZ
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 23:40:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=uOD5u01M; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=4MbP3/OE; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tN1b6l5FzDrDr
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 23:39:47 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EBE2E5C02AB;
 Thu,  2 Apr 2020 08:39:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Apr 2020 08:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=3VibULpJXMTBvLEguoeblKRBaK
 E6YafTnK+foZH0VZE=; b=uOD5u01M8126/OL9LoclxB6p5Jhwu15voV6YzN73s4
 hYoneoC6ZarxF0b6tJdYMZqfVaNAvBgw9xZF6dOsDM5UrDeOljOv/LFHlwDrdq8U
 Nx9JXKXBYREv8/1rD3bhYmCHbZZRj1eKfLwEiITRMf6AokHwHq4t42i7W/DmfK2L
 sxcQtqewm9rrOc0PjduaeutzqXOXnTCnkijG58yJ1jQKTgTcV/b3yoeUmCrMgyCB
 Iv8xUpmuzplMb0jMqxFVgAyRoIFZeSsDXVMwwA+KHOw5QnixtKsM8bl2xaGyIgB3
 5AHI4SXvrbPzP9q2Wtc7AcG7ACndow7UX7uaKoT+oVow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3VibULpJXMTBvLEgu
 oeblKRBaKE6YafTnK+foZH0VZE=; b=4MbP3/OES4EVj8V/xuCP6DpmiYSAeD6mL
 sBhIKTKtf6ezevRuZyZP0p7qkWKYaDRCGYqDNKoGsXTA2MCMRUcL8dFEGCwy5ygH
 lGA+ghqZitP+0LON2sdIhtdyRqKnbqdqjw5kNic12JWeB/Xnfe1L4F9t06YUI4Qx
 iMLztvOluBdyJ0bzivvqYrojZ7rZX45LsLo8oKdW8ozF+YSEEgq2MkEGDN8ODSSg
 ntWXTJ5KdMWiG9gcnzfBnjguqIjc3QKx2UDDqLvUCox96lhK4OTz3D8e4L12dr4l
 grHQinJ8MO/q9yoBE7y2HSdwc2AGa6qYmghL5/WMkINyJdebpIwvA==
X-ME-Sender: <xms:Dd2FXge10_DHDuvi4GcQDR03bjzuc4kIRbR62PFLKGyfUkYKIrUKeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepudegrddvrddutdekrddugeelnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Dd2FXmdTYVTWGEKefCpy4jI1te2UOLdVR7A6ZhFLQh2mjvF1o6u8ZQ>
 <xmx:Dd2FXsj5_VQN4gbRDAxnyqVlo57h5TH_7iiLE151l7k429p-_6pHwQ>
 <xmx:Dd2FXqQT7CFaR8O4-8O3uxnMTm3gZZlfMjxZ19GuT2d8kfFk9LGOZA>
 <xmx:Dt2FXrrMYe3cixUTvVigWzKpEcjXm4VaMjAAFHnqlWOlqah_GQ9Tnw>
Received: from localhost.localdomain
 (ppp14-2-108-149.adl-apt-pir-bras32.tpg.internode.on.net [14.2.108.149])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98F593280059;
 Thu,  2 Apr 2020 08:39:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] ARM: dts: tacoma: Enable the second VUART
Date: Thu,  2 Apr 2020 23:09:31 +1030
Message-Id: <20200402123931.23379-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Used by some POWER hypervisors.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index d332c0706c5d..6fbe58ccd7d3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -823,6 +823,10 @@
 	status = "okay";
 };
 
+&vuart2 {
+	status = "okay";
+};
+
 &lpc_ctrl {
 	status = "okay";
 	memory-region = <&flash_memory>;
-- 
2.20.1

