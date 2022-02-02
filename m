Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 811344A7B54
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 23:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpxwb21hHz3bY6
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 09:55:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Z4Bwip36;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=k+LBdjoU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Z4Bwip36; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=k+LBdjoU; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpxwD4gjMz2xsG
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 09:55:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B045A320217A;
 Wed,  2 Feb 2022 17:55:22 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 17:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=gwoDtd9Yf7YYdl9ieASLKg5Eol3YlB7xi3frX5
 OwXX8=; b=Z4Bwip36hCelWj3FuuyKG+F7SALJ9DTYoSQRHOA8PyLr1QfY07Pd68
 EjCtwe/Rz1TRyy0ot+Y0y10XE1ug4sUsXkPTBX93Yj5l9nIGxQYvRep6msbJ8SG+
 QJHIYbQAYFuJZ14N4x4ru1NL5Te4gBFF6l49QY4j9paokFy8Xk33E3NEkdap86qb
 eRgRZm4Bbb3TIN/5MjBDpbKrurnkqimKa1qx2tCvaNR4NAZPHiB7XMCaiQeeEwwW
 tZodgc7f7BWVV1qlltOqZxzsLCA++W5DnMs6P3oDTp38OrYUhAuLiS/totoF7Apu
 tvj2XYai9ZwBAXmmwP0l4rVgDoabZwVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gwoDtd9Yf7YYdl9ie
 ASLKg5Eol3YlB7xi3frX5OwXX8=; b=k+LBdjoUzy+1Ma8aWHuWaZmlKj7tWGlmw
 1ce9mQ4RQ9hSsazjBlesHvCdDD4ec8v9s1lg7kXtsDATYv0AXmd0nJpW73gj0UE2
 rPW44h5l2T3gJpVzQ+y/Fjh27JXqps8PwPcdkdZ9evvwc4GdT428VfQYiqCtQ42y
 GAUeroN/Jk9HwFghPALX37eJ35RB6ETyMFV/VY/b8kLavpLLmRdPGe4mVNSHwOxD
 ZEWNak6ep4HY9JccdRi11vA7M1eOr/hlxqFMXijIG5Ikx/iBbwvwLjVcdCNDNrm+
 1k6yrQL81y4QCWUKIwvRMdE0USX6yiPUGc6lMqF56JnchMoJW1QSA==
X-ME-Sender: <xms:2Qv7YZ7PFSj19TMihUv_CQjJZXeOe_uu2jI8Mqw0jxest1nJVl2Thw>
 <xme:2Qv7YW52b1vCRXlbXO2M1OWVO5HinLEBxoaOp3vQ624JTvKOiFftcav0sK3ManQnx
 7oNLTxXcFevk8hNUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2Qv7YQeZpJs65ly_irm29roYNwAhmNnapY69T8TOhqPRnZDVmulazA>
 <xmx:2Qv7YSLe6I_sQzOtXq5dWnyzxFcKYZZ6YW2trzQP9NRXtDE_vjoDhw>
 <xmx:2Qv7YdLkVP3xWRPZoCXJUxzYJ6y5mvTuFaHpaYx8oYx7yrkXUa1MeA>
 <xmx:2gv7YQnJluNxv8r7H2Ae3DsviskN7XyNYZCTF5V4zA1IdDD4yeUflA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D60DCAC0E99; Wed,  2 Feb 2022 17:55:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <80000687-ae85-4353-8d0d-a0ea370ac542@www.fastmail.com>
In-Reply-To: <19a9fcd1-f697-e029-7c9e-67ff529c05f8@linux.intel.com>
References: <19a9fcd1-f697-e029-7c9e-67ff529c05f8@linux.intel.com>
Date: Thu, 03 Feb 2022 09:25:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] pinctrl: aspeed: Allow monitoring of power control
 input GPIOs
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



On Thu, 3 Feb 2022, at 06:30, Bills, Jason M wrote:
> The pass-through input GPIOs cannot be monitored because when
> requested, pass-through is disabled which causes a change on the
> pass-through output.
>
> The SIO GPIOs cannot be monitored because when requested, the
> request is rejected based on the value of the ACPI strap.
>
> This change removes the register check condition from the pass-
> through and desired SIO GPIOs so they can be requested and
> monitored from power control.

I'll have to take some time to convince myself of the impact of this 
one.

I'm wondering whether we're better off adding some explicit support in 
the generic aspeed pinctrl code. The behaviour is essentially allowing 
the GPIO controller to snoop the pin state of other mux configurations.

Again, thanks for surfacing this patch.

Andrew

