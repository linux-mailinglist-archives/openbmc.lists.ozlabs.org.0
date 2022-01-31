Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8834A3C73
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:29:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9T43J3vz30Nd
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:29:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=TpESBBVc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iFKbj3Ac;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=TpESBBVc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iFKbj3Ac; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Pp44v0z2xsY
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B41505C00EC;
 Sun, 30 Jan 2022 20:26:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 30 Jan 2022 20:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=2oimyd1cG/eGSpPS1wmNEY6/51xaE9
 n8y5HF5ezJDH4=; b=TpESBBVcMQWzcTIoR2xSAd67/vFIIiNb/9r1cvRTT34jEu
 94ioo1tATosCAaxOPsmnoX11AKICt6xK9klDVBVO9bOGM3mfzL19W4CcJ5hgMMHJ
 cVXt5sq0X/5CFn5jocvu1BAlBJmfk0ugeF+yhM5fIZMkdZ4LmExNdIE6qD2R88kA
 Mzp3pgn5/MBomurAwQhR0AuMGjj5W4kInkIGHi6p0wfPlystRnaTF9UFCxci3oYH
 pPo6qveKokvl2PtLshGB7EhqZRjH+0x80E6FFN/xlM44XOIHNYFM77avqIVvvYdx
 M4gNtKilcqKL8UR2V8gxtHPylWlL5vCuVwDyzP6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2oimyd
 1cG/eGSpPS1wmNEY6/51xaE9n8y5HF5ezJDH4=; b=iFKbj3AcS8/65hRHoetQm0
 3UUQdIw4jjmzQhOcAprSAnB6I2TiAIjxu1ohD6m/MGoNWpzsXk1NjEAwmdo6Ft8X
 gMr/9ed5jF5EST22qc38RQurZn2HTbxykKG2jHJbni/W/Ekfs16LxdSVATn9azsj
 qUHbaMge5Hc1ZDGggncLO/aPT0hmxE/3gpKbJABBgz3L2/J+Rd5pbenzw5+uzgL+
 WLUeyN5ObRJqzpsFV8CcQX5JR348fyRSnhfZqj1O+5c1UA5koPrrxoJUyU7oL4SG
 NGXJkkS4sBniTS+IzXy9AGiMKWexStiJpsdSPsDXXJ0VUKB8OeP3nTJ/Ejae7d3g
 ==
X-ME-Sender: <xms:vDr3YeZW3rGZwf7IDOZUDemDZ-NT9hhDm0pVwaZNBFX7VQ_TECiwuw>
 <xme:vDr3YRbAu1UpbLW1KKWqO_ZK5VbM56Xwvfj8KLqnxFtivpjnTUwcRTvwFwO2F_6s2
 Np8Q9IWrW_JJ-dE_Q>
X-ME-Received: <xmr:vDr3YY_lLE_9DMCOxLXurlgi4EieXVST59GZ3XwqNSGbrx7-HCq3ZZEJz18fAY3LEfcbBCxPYs3LX0p_LMI5JS8SZtxx7CN9MBNvYQ2GjnFKUnTX6UHaPl75jYXs_47h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:vDr3YQqkE_OH7YIftuLdrwnQ7mgUAmk7CjdI63PQcTqXSdfsNvSyXg>
 <xmx:vDr3YZqYOUbNNgos7Mx41GJjEZgBQqopnPuFq6fZwnb1VscIIC0qsQ>
 <xmx:vDr3YeTxfmDnj8tAsEhnOBb7yOK3tD5myAIjRaGmpVBaachnNRVOMw>
 <xmx:vDr3YaBmM484X5G7RrStwhKrVHL4uMVdhpQeO4J7AJ7gejyhBfzLtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:18 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/6] configs: ast2600: Runtime
 control of FIT signature verification
Date: Mon, 31 Jan 2022 11:55:36 +1030
Message-Id: <20220131012538.73021-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131012538.73021-1-andrew@aj.id.au>
References: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Turn on runtime control of FIT signature verification for systems using
the ast2600_openbmc_spl_emmc_defconfig, such as IBM's Rainier platform.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 5f50298a589c..a3d229d786b8 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -29,6 +29,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
 CONFIG_FIT_SIGNATURE=y
+CONFIG_FIT_RUNTIME_SIGNATURE=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_USE_BOOTARGS=y
-- 
2.32.0

