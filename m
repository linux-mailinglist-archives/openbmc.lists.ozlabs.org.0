Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEBE280D8E
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 08:39:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2gMY4lhQzDqLT
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 16:39:37 +1000 (AEST)
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
 header.s=fm3 header.b=XBC2cGXN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=iLz3hH2l; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2gGJ2FlNzDqDr
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 16:35:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AF910917;
 Fri,  2 Oct 2020 02:34:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 02:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dnuu51apKzkSW
 yyFZhbwMJUaR/W7hcBh9deHqhIeOyo=; b=XBC2cGXNkkmVZAze9EKipOaoWeWJF
 vZBEcElShEE1x4LdMGtegyR70fPFOBKV+8gNUvWfn5xPBJNC+eiTI1vJXEzIhTAE
 +XqLS/bMJSN85Z2tbjbIuHWAGL1jUNl2PJQ4SoWGT29vx3/GJaP7K9DPgSjQdf+z
 amMSw35GBiWrl6Vrb94CE2EsoTLTsohrt+gXFfXmJeYR/2DqPLMtdJlFnhmXa6wd
 GM+fisstykh3sM0jIgmg1+h/+SJtV8SJTvdziv3XKv8IYTMNILb7/iNauRv4amVv
 0nfBYnjCjipJa/n50YqI+n41CT93p9e5rYMrwGshaH8/GIX/M9ajQydLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dnuu51apKzkSWyyFZhbwMJUaR/W7hcBh9deHqhIeOyo=; b=iLz3hH2l
 7G+RVKueu/qz7Bm3EYmNp8Rhk6UMEoLAFMqijIFY6p7ijyL9edfA1bVI6QYgBxQB
 Mqsg63EBoNmrpaqBSEHZDV0SCcuwlC/95mliqt1KF7IUeAnshrY86xvZY/puNP64
 nA3O2w5J4VBENooOQh//CfUazn408ot2iWzwHrYmkezoZWQhmwZgryw1IuKXcyvQ
 0TpRKOgruO1WCnOrm7fWDvEOHlhOVtqe361exOGZDyHnYhR8Z+mWSxACOd836X63
 GdM4yPgtB8XVJvdony7f7PZ5eiObjT3mE3K2BXHuDKhQO6ntYlTGiNfY3JBuxQ0f
 gk8DzfD6xE7mfg==
X-ME-Sender: <xms:E8p2X0hdcZ2Ze1lFYVz_LFZr6c5bdGpQcuRJvp0QeDN01SUZ8zmY_A>
 <xme:E8p2X9CDaZnEJfnpLGkTT3lh6e6R0Ws7HE8tnphzB2nKsxhNLeJWU4TJYbFZbG3jk
 xhC2Gpn9k-INB3jdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukeekrddu
 jeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:E8p2X8FXevlxKX9jIV8CfUfsUObLHfM0iZaHXDbCD4jZn-tRYM4l8g>
 <xmx:E8p2X1QvvqwEvqaXeGWCdJVGmSyJyFHzGK938CLd6YVRdg45j4Wa1g>
 <xmx:E8p2XxxjMyHqk-HCLsnGDKMwlBbj0kOXW7QL4rcC-24MbctCoQ42mg>
 <xmx:E8p2X6tgTPyk2yBvLMvI2jec0obbY8fq3cpMVYYor8B2fhqjE8Gg0Q>
Received: from localhost.localdomain
 (ppp118-210-188-175.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.188.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A4553064686;
 Fri,  2 Oct 2020 02:34:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 1/3] ARM: dts: rainier: Add reserved memory for ramoops
Date: Fri,  2 Oct 2020 16:04:12 +0930
Message-Id: <20201002063414.275161-2-andrew@aj.id.au>
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

Reserve a 1MiB region of memory to record kmsg dumps and console state
into 16kiB ring-buffer slots. The sizing allows for up to 32 dumps to be
captured and read out.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index e6f422edf454..46a0e95049fd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -47,6 +47,14 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		ramoops@b7f00000 {
+			compatible = "ramoops";
+			reg = <0xb7f00000 0x100000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+			pmsg-size = <0x4000>;
+		};
+
 		flash_memory: region@B8000000 {
 			no-map;
 			reg = <0xB8000000 0x04000000>; /* 64M */
-- 
2.25.1

