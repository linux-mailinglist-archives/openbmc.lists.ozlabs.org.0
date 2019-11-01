Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79AEBD9F
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 07:09:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474BbW3twLzF6W7
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 17:09:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LF58gqy8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H2kDe75D"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BVt4DTrzF6W2
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:05:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C9E30429;
 Fri,  1 Nov 2019 02:05:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 01 Nov 2019 02:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=aJ5g6/OipWkjxduib3+SNvv/Qh
 t6CuNga/TYtZnswvU=; b=LF58gqy8uj6ShZYJY5VTng41upXxpcUojlB4MuUc+Y
 g+ZgvKyrhQoOlYfxQBAVeu6yNBIzCIXEWBoJZQqxb3gYVkkAEPU1JfYS2H1YVI99
 MC9ZcUkAdoW0SDsW4aImx/kGvtltq5i5aonwzmcmtcjQjvp8LNMvb8hmQLPKlt2i
 W/BsoicJugC7/N2i30Cpbnofbcf8S0/EDYfZj1/EAjNcw7lMdVDcZUiUsAQeWJBI
 lMQQnbf5hBI9R+SnidUAtNdWOtaM30gq0W/vL0603i7Rwl5v0XAuYPH80tIfnGwr
 wU6EnXRfzRay6BFzK7LgKEO3PXsVyhpn57tAhf+AplXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aJ5g6/OipWkjxduib
 3+SNvv/Qht6CuNga/TYtZnswvU=; b=H2kDe75DfyIp3b0bYUXGixFkornqgU7p1
 4tlx5vXsKOGkVKg22sJOg+o+bnWwK8xnLjQBoFNRHPcNbygmQuEEFdTl+JXZhzO+
 Zw0SY3xrTnaaWvnuSjbZmmCs1CCW6dIvaxrH/pEnzq8oFA5fCOOkk9oCMj3zTpyH
 0bQFRD2OkkVN8bpxNY3xc/vqD7PEOpV5uO9a1Iy0I+tqVos8e6+ajiL1tgL+8UWj
 jQxKdRDpDVwtqz8HcHm4Hw9ap2ttVjerYlOmgRz3lgNpYsYSGYfJp3Ub5MjT1YkE
 YmKAKprZKgHmY7HkP9Kc6UWFSyqdSzyqUnLIfMNZ7OJxJCISUg6mQ==
X-ME-Sender: <xms:EMu7XXulGvCje4v-7lXyGten2DbCy5BKPxhfTfMBqGGvQcitZ75f6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:EMu7XUzkEyX6pEtfjSzcNozDbnvW5VRltfF3uoi-ouVDWD_QLqBUBQ>
 <xmx:EMu7XdiFoxXKem37A2s2fxyGp4K6vSK2Dz2RnzDO-W5DjN_2Gf280A>
 <xmx:EMu7XYCsk6yu7UIe0NOG-4fjR0Hk2PcAuiccpvLYbEbtLiutzgJhnQ>
 <xmx:Ecu7XYj6YUlp7AYnGEqLa6vb06nFviqlnJxM_LfysCDuO2v849di6w>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 667693060064;
 Fri,  1 Nov 2019 02:05:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 0/3] fsi: aspeed: Fix unaligned raw accesses,
 OPB0 byte order registers
Date: Fri,  1 Nov 2019 16:35:58 +1030
Message-Id: <20191101060601.24896-1-andrew@aj.id.au>
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

v2 pulls in a reworked OPB0 data byte order configuration patch in 1/3,
superseeding those posted previously. It also fixes and optimises the unaligned
data access width calculation as mentioned in [1] in patch 3/3.

[1] https://patchwork.ozlabs.org/patch/1187178/

The series is based on top of https://patchwork.ozlabs.org/cover/1187185/ with
the original byte order configuration patch reverted to accommodate the rework.

Please review.

Andrew

Andrew Jeffery (3):
  fsi: aspeed: Fix OPB0 byte order register values
  trace: fsi: Print transfer size unsigned
  fsi: core: Fix small accesses and unaligned offsets via sysfs

 drivers/fsi/fsi-core.c          | 31 +++++++++++++++++++++++++++----
 drivers/fsi/fsi-master-aspeed.c |  6 +++---
 include/trace/events/fsi.h      |  6 +++---
 3 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.20.1

