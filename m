Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342038F647
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 01:34:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FptpJ6XsFz306h
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 09:34:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=sj2x86Cc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XzNITpU2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=sj2x86Cc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XzNITpU2; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fptnw4rj3z2xvG
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 09:33:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 87D0D5C01EF;
 Mon, 24 May 2021 19:33:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 19:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm2; bh=S/+HePOhxUQ84cq9XttMTdSJ+nhDL2367+I5qg4vh3A=; b=sj2x86Cc
 jSMLps8xGHgdBIZvklT1Y7DvQ7XCmWBVEQ87tN3Jj3uPNzr1U2NwmlhxRncoXv48
 CPW4G9dGCyQWVEdqNReJ2jbEdSGJLLwVwV0amSkJotoxYEre/wNU/ron9QegGnx0
 fJcYe6zc+PbxNTytvGB5Kqsnk/ufSdEXFx7E9H7sVIdEgCaM5Ns+u7i7EYoNjgYP
 rsxayFPO9tipkQ3CpZNPLJhGod3Z4xt++XTArACHlQTxd9TFlIF3MdOn3BSiC9fG
 rIahh2/lhdA6+Pp3CLAmqC+Juh46/giwDjBGta14FkIZHXAXb4/vhqMAlSHyVJ6i
 AjxtbgZoiwJC/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=S/+HePOhxUQ84cq9XttMTdSJ+nhDL
 2367+I5qg4vh3A=; b=XzNITpU2aBHSt9cgiy0ih2Z7qnCytLBhFShOaAXwwwNcy
 E3ak2wy2q5IYZ7aAQ5eX7NgOCfx2khGXan97KFk2ZBVECpD8MO0XlnHRaM4zhb8E
 V1CsHLtqFcckQTVGc45IJ76PMY/cYf5MyXHhDgCeR3yHgruNgtmCvHstI9phBA5F
 GDc9plCWikmLiHS8fbdTqyH/5oTcG5VWyw67U1W4+INyOzhd5wA+OR8vkuAvFL19
 rT+HK0SZiBU4qxz0R1Zevs8kwpF2YFT9FPOny/lRfpMRjwj6xLIDrKIBDUf3UN1N
 XAyZ0rgERakO5s1ZuxWxicbVzXxaikeeBaSZG4/Kw==
X-ME-Sender: <xms:4DesYBYA2Lch4gt2HX7g2WF7tjeX_awohK_xz5lPZmmTIV5aLAmGVw>
 <xme:4DesYIbpSceHDDPixb6JXxu9cN060_oM9IB1qSj7GrwHOff90VGT_ON0uXXwUuH0W
 InPA1SZ8e5-d4-GKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkfffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrth
 htvghrnhepfeejtdfhueefkeevvefffeefteefveekteeuieekhfdvgfetfefflefgjeef
 hfevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:4DesYD8qL7V9RGHOPLoEghrxyaVGTqj5WeMP-lyoqQNmA0bOw5V2kQ>
 <xmx:4DesYPoCAV56BOM5vdZNfUndsW2Rw7BE_twIjJAfwZft-B1eSlZ5fA>
 <xmx:4DesYMqk1rVyaFvDqZy4JyQB93hX5-GhYCU6W3We14QeCHFFnfI7ew>
 <xmx:4DesYDSwuQqQ-pgquXPwMMAn-wUsTACTX_7D20-GZ6exk6HaHnTHGw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0D064A00079; Mon, 24 May 2021 19:33:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
Date: Tue, 25 May 2021 09:03:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Subject: Request for debug-trigger repository
Content-Type: text/plain
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

Hi Brad,

A recently merged design document[1] outlines the need for a daemon to 
translate in-band indications from the host that the BMC is 
unresponsive into recovery actions on the BMC.

[1] https://github.com/openbmc/docs/blob/da726aad0d204a8c8a04d6230ea61aa15e357653/designs/bmc-service-failure-debug-and-recovery.md

A tentative implementation of the daemon lives at:

https://github.com/amboar/debug-trigger/

With the design document accepted, this could live under the openbmc 
org. Can you make a repo for it?

Cheers,

Andrew
