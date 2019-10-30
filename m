Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F6E9C0C
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 14:09:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47381N409VzF4PR
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 00:09:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lIiq0/V9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kiJ5WnfL"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4737Gj0x7CzF4Hl
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 23:35:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F83721B6A;
 Wed, 30 Oct 2019 08:35:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Oct 2019 08:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=uA/JxmsRvNVGcBvcqTW4RK9Z/W
 Gr0w0uV65IQVkIvaQ=; b=lIiq0/V9FlohGGozGBZwC2H35bNPgGzCfs5Qh9U71c
 aK+Nnz5UsnQ82WLx240Cc+Yaq1RGZU8FmYpZeLY8l0h1/z6Wwt6To93hU73gmv9n
 hkmGt1C5MqsiSTVLxNKJImcWbnYZMJ66pZH5SmSOgSYCia+/uQQIJk+1UBlvN7wO
 OE+2oXuMJFXPiusik1vuX2l5KwMQKqs/vvr9F4YXrlrGH/OSqJJq5mX43ISF9M4g
 dKz9s7LVc27urh8MiAFhhHiyNPMyKn+YVafPAzWKAStn5zfpwSe7wTtucLfVRA25
 1td0Hh9ADVpIS9J5Dny/szZ6STiKbKZ8oDsdmUAwPstw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uA/JxmsRvNVGcBvcq
 TW4RK9Z/WGr0w0uV65IQVkIvaQ=; b=kiJ5WnfL+nyMlEbb+ase0Uq4I+pA25DSD
 gXW3W740wuuJe+f5Uy2grvPUtv0XUXJ/O+4JkuYLYHXGR7P2rGy72kyZX+7r53Aq
 f4WINygwCEk2H2uw137jFCf9ZAr5Hx1zhUEQnVLIlHOrDNipUu91sKwzYyFMSxQ7
 NpokE8i6vKTCdfrqMUVFuVeT9bsNIGaXIY8kJR2S4l98Edj6SyoNMCSJrlzbOyCU
 4/KtWJEnirsb2I+rRD6/tp+b46aI1y7vJ1T7T09PonPW2WarC6xomBdhycO7BXsJ
 FZOfL15soezcC3PIemvXLP0/UYIsIUHMl6wEn0BePZ4VDCt8Sgw/Q==
X-ME-Sender: <xms:pYO5Xf-gEV8Z6ef1yjfkKXs1GHGokb-UDt7fSQE2GhCmyDhleB9lcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppeduudekrddvuddtrddugeejrdegheenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:pYO5XQSIb-sen696Rp5vXAab9hzpL5eoNV3buZ1qat582fYuS_ziCQ>
 <xmx:pYO5XY5yR8XrdxzduNZmLpX94lj-BhPCGfwJPMrQB4-na4XLWtWX6A>
 <xmx:pYO5XYKKs8aIDXK4jvWht3YO8agwoWPsOAp9fppRl0bGQ0Y9dF2DWw>
 <xmx:p4O5XaWDWtv-w9hFtWHH53mZ_b-7pBTEMK3EXxeoeN00akj_I76vxg>
Received: from localhost.localdomain
 (ppp118-210-147-45.adl-adc-lon-bras33.tpg.internode.on.net [118.210.147.45])
 by mail.messagingengine.com (Postfix) with ESMTPA id C4952306005F;
 Wed, 30 Oct 2019 08:35:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 0/3] fsi: aspeed: Access width fixes
Date: Wed, 30 Oct 2019 23:07:04 +1030
Message-Id: <20191030123707.29110-1-andrew@aj.id.au>
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

Several small patches fixing up access width issues with the hardware FSI
master driver.

Please review.

Andrew

Andrew Jeffery (2):
  fsi: aspeed: Enable single byte FSI accesses
  fsi: aspeed: Fix buffer overrun for small writes

Joel Stanley (1):
  fsi: aspeed: Implement byte and half world transfers

 drivers/fsi/fsi-master-aspeed.c | 58 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

-- 
2.20.1

