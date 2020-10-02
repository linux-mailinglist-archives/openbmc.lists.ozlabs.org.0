Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E1280D8C
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 08:37:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2gJz0FRWzDqdD
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 16:37:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Di3CXRPK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Mqb1ITKh; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2gGJ2JjfzDqGl
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 16:35:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3B684949;
 Fri,  2 Oct 2020 02:35:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 02:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=D82aTn0JAMKVj
 dHSS5HZCmwyxCerbzsouxFEb/ivHlE=; b=Di3CXRPKfFkeh/95owq7RfYC6NJJP
 TZmiHfr7UydU3IXZ+t0g6Dx93/D8aAz2ZU64cVz6oivOy6A5kbcNtZR/qjfmRxeI
 IhB9ItY36z8bpIYs2Qza7M2P0fm4OXziMNaLJRxmFIverXfM/WnYZwAn/WVrj+34
 5hB3HTwjnHqkeVeuulqiXx0YIsvvb7P8Jij64d1sXJ+HAW4JLDSAsPKHNp3rZxrg
 yDPt8zBCSRrdTUDQYw8VCeTf75fC4M3oURtcsAVwA1knuAdX9ZmO6RkAS0MXM1fL
 6PyeAL7zUfhDEEMedzqQvRQrxI+TXECu2aa/EfZDzKkZ4oIHJtHNbxSQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=D82aTn0JAMKVjdHSS5HZCmwyxCerbzsouxFEb/ivHlE=; b=Mqb1ITKh
 yIPe9M7dJHS6rOI1aQcwK1qf/wZWvWt86S8LMpbAvzNtFoA/kk+jJBLIyb42abwK
 WYcR9dxR8fZwEfBmOFl/gbNGSmwtI3NoxMOmCT4EO4JcaaXqh+2toQkJ3CnTzB4B
 sLqNOjQilmVS//jyNCZW4EXKilANjp+2s6cmSrWOEo6+vRgMsRvMltAjQWhj/9mh
 zHClyhqHmwkY9tT1cQZz/dGsMy72uOkAeecaAlvRup/o5jJwseCiGuPu9BTqgboy
 C9zkEDIgKSV3MJlgwjQkiNgemRGzjHPGAaFejQbK1NQfvBZY3mjIIOxKT8iPpE7P
 ZMP4W/jRZB8QRw==
X-ME-Sender: <xms:FMp2X3Whmnz3jPitWcQUL285oV6q-zlacM3qyXzLijNRWdy22s3nLw>
 <xme:FMp2X_n4t5Ce4mmtOuMbDcKtpui1u5xt2duZFtcSCID_EYwUlUig1J9N985CTcG9T
 ZcYJskkKpyKTetV2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukeekrddu
 jeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:FMp2XzYQ8VIr8FPbzf-kb0vXJq_tk2G4NYD9kHs1WlxHEOR56GCb9A>
 <xmx:FMp2XyXX3-_fzczpTHjEG3dVLMvmEvYe4bWL0tZABp7z2thwi65mzg>
 <xmx:FMp2Xxmd-eVNRdKsn1dP44fTpjUHevN5WpsmZbFYd0zKOmNRXbsAsw>
 <xmx:FMp2X_TxGv76wP-BFincBNvtFLrAhBxXIJ46FREfQc99FbCyWTb-MA>
Received: from localhost.localdomain
 (ppp118-210-188-175.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.188.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5B6E3064684;
 Fri,  2 Oct 2020 02:34:59 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 2/3] ARM: config: Enable PSTORE in aspeed_g5_defconfig
Date: Fri,  2 Oct 2020 16:04:13 +0930
Message-Id: <20201002063414.275161-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002063414.275161-1-andrew@aj.id.au>
References: <20201002063414.275161-1-andrew@aj.id.au>
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

We're making use of it on IBM's Rainier system.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 2bacd8c90f4b..c52db992b84e 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -274,6 +274,10 @@ CONFIG_UBIFS_FS=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_XZ=y
 CONFIG_SQUASHFS_ZSTD=y
+CONFIG_PSTORE=y
+CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_PMSG=y
+CONFIG_PSTORE_RAM=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_FORTIFY_SOURCE=y
-- 
2.25.1

