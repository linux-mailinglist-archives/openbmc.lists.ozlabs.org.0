Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4494B43A062
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 21:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdQ2j0HkKz2yV5
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 06:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=q/VzL6QD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ULmZFSIG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=q/VzL6QD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ULmZFSIG; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdQ2D0xwyz2xXf
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 06:27:14 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B4885C019E;
 Mon, 25 Oct 2021 15:27:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 25 Oct 2021 15:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
 1+tp55LVymmhxs5+EI1cI69CNxpflMxqauDqeSz10kI=; b=q/VzL6QDgaTZJ+Hf
 zrSjCwqF4sW7tTrTgfL+BYmiW7eZe6Cg8ZlQGAlxuHiXTMkHRHEP69yTABbaPJAV
 CC/Or6zePk75o8W3tesimdi5LI45XEM3NpZSUs1vdGuiWC1kcxP7hUUe0R0c27EN
 rDBXflFJgH6LjZIZiLB4eMWv4qONe1dEnpsqIzjLeinxdlVjT/I9zLh0dI3E5MqT
 IXq2E332ZC/PIEELm6Pou6/pDx/kLMBfQX8r2vpclzgyON99L+LL83ro/NtzLH+H
 twBXbB6vLVIt70eEjXduVy1smdIBrq8iusRR6opCyAFIbWYdM4i1uLZoogUMuS7T
 5b9BCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1+tp55
 LVymmhxs5+EI1cI69CNxpflMxqauDqeSz10kI=; b=ULmZFSIGUDgk0Wpudz81QJ
 dR5y0Jt0vMuttgX7F+yzPYqXchScCzr6TfK0N/76JRNHRCQCn5MwUurL/J3U2uS+
 RrcZdK1l84NO2oB3uJ/hUwegjmF7v/CUgmzolaKB9+iyzDo3W6I3r6sX55ZG/D/h
 53Ieyqh9F2aDM8yxGNK28xSSGt8X/m2UeqUBQRWr/iGa7lbfEducaz1880nEdTZl
 j8uNTVH0XldqJ0XXkPxE6jMqe9VN/Yrw4fRk4xGXPgepW7Xjc5tNFKXyZOLUO8BY
 Fhm9sxADyhvbBXAhWF1y9bWDpXkpos7AEQCov8eXM9wiKpbvzgdpPM3xe/pne3Tw
 ==
X-ME-Sender: <xms:DQV3YTcZ5olU50oTbRt5MBfO-eeMht6BFe28EA8VXuYh5iYTfhnTAQ>
 <xme:DQV3YZNCSqpYV8uXPjzLeMZx4Yr391UbqMBizxm42rMJ6p1DmjTpjC8MEJPWDzJap
 PcH3Qkq8_YC7yEgKqI>
X-ME-Received: <xmr:DQV3YcjCUgrmJMa98Eyk1m2SRgi3Jn5z4BPc_Z_Ft9QQIuBf-occLn4UOritJJvZ3Z8I2Nc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgtfggggfesthejre
 dttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeefiedtieethe
 ektdfhvedtueevieetkedtieefhffgieffffdtleejheeigedtudenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuii
 iiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:DQV3YU8LgAWPD7vwybqobHee3PEHyghylSLlr8YmFo0QVn18YolT9g>
 <xmx:DQV3YfuOxYy3vkuZtPeSunGKFoA_Vxn16knTiqa7TWCcQrTKYa7NNA>
 <xmx:DQV3YTH_3Wii03z0ieYN3L9sFzXSyx7qZW1rjp2JPl3gYYJOx77scA>
 <xmx:DgV3YYWRSQtlLNABFZWxavz4zr77tus3npNdztOD_KRPstKhEjo2Sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 15:27:09 -0400 (EDT)
Message-ID: <96b17124acdf2309205452bc135e5653a1834aad.camel@fuzziesquirrel.com>
Subject: please merge OWNERs files and scrub your repository maintainer
 information
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 25 Oct 2021 15:27:08 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: ed@tanous.net, manojkiran.eda@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone!

Continuing on the work done by Ed last year, Manoj has created an OWNERs
file for every repository in OpenBMC. Thanks Manoj! This is a great
piece of work that will let us turn on the OWNERs plugin everywhere,
trivially, which enables project maintainers to delegate maintainership
of parts of the code.

I just wanted to make a couple requests...

1 - Please review these patches as soon as possible.
2 - Please do not ask Manoj to update your maintainer information for
you if it is out of date. If he made a mistake copying the existing
information from the MAINTAINERS file, go ahead and ask him to fix that.
3 - Please scrub and fix any outdated information in your new OWNERs
file after you've merged the patch from Manoj.

Thanks!

-brad


