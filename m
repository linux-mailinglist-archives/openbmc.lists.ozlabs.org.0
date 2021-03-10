Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C173341F9
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 16:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwc104K6nz3cW2
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 02:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jrd4oEUw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NUlG1Fxs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=jrd4oEUw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NUlG1Fxs; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwc0j11TVz30JY
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 02:47:48 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id DAA9320CC;
 Wed, 10 Mar 2021 10:47:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 10 Mar 2021 10:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=i1b
 Ji3ia9oi5Rmbu3ebTGguQ5n7hCJNlm2hRoGd/lps=; b=jrd4oEUw6PYvraXyvaI
 ChaLpONB5Zuwa/zbn9PZHR8gJPEWctuHgvchtVSFJaexQjbVa1oH2HfL97ieCE6m
 396GV2Jgs7tQy+Z8W/01AOu53cdE38oIU8dYSpoSe4IXzFNJ3W8clhs8od3n60YP
 QinRSpPsBrtZHAcuVdGjAfkBUvJeqPA26aAhFxpnK4bgU7l1DQ1+q3k0nNh4n4rz
 nnt+IQDbYFpK9XtY/hrhVVXwQqeZbnaRHCWS511wbOszWf3zybXSXkTVQ+50ZQFh
 nSG27DG1tBd3aIcr9MeS5zyuIgKuL5guxmPWjlrGsoE6GGdLb2xXi/VpGVKxf12w
 tTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i1bJi3
 ia9oi5Rmbu3ebTGguQ5n7hCJNlm2hRoGd/lps=; b=NUlG1FxsRKESvZ2H1jOQmQ
 Upow/oU+MPhrALhkl0zUx7C+d2GytqxJkqflBie6gf6M7CZEo3RmVKhFQB3/I27C
 eEyVfffpfshU853ee02+au845TpeFTijSTLwLOcrRUzb1CerPAMNu21AbUABjsfA
 ePzI9+h7iyww97V+Tt2IUQf3+/Net9CHKK0N7+GGqBVmAckmiJFEalk9Ic3omaDb
 xymuXB6rsWs0T0Fswr/QjXWJGXsE5bluBEAot0AXhpQ/QM7oTrSCbj61SUC2H+33
 w+N0NkdFIQvK4AhG4iYB9Tc995roEqnY01bMg8AgLL7plG7uPlzRoIhlETtaJiSA
 ==
X-ME-Sender: <xms:HupIYK2CPEJYGjmpfcPxfqSM3imTKcRm3vFbd0pegISC1u9tL4rLzA>
 <xme:HupIYPrxWkGfqtXCJobFVluKz_eEPEEj-fXEgCAmC8L2Q8xsZYZGlfJrGsIvB5zHi
 tUioaB03FEzSwl4C18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:HupIYGh4te6W0EKztsR5ejP_NFZnJoI3jwstquMt3RJiaa0FurMcGw>
 <xmx:HupIYL9p3uqZwOc3IuFibEXGXuTgjMvwhX0K21XFGSaucTS0wSdf_A>
 <xmx:HupIYCXQSHMaN7ONX1PRXumxSU56cu3gxfiz9477qlTet4cgG_s2xg>
 <xmx:H-pIYJzDUCPQHHKuUv9lv-j9fDiNZRmEmWnv7cKw81jL4rYpIdESbQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 899C7240057;
 Wed, 10 Mar 2021 10:47:42 -0500 (EST)
Date: Wed, 10 Mar 2021 10:47:40 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
Message-ID: <20210310154740.qj6wbvqym4utypbv@thinkpad.fuzziesquirrel.com>
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
 <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
 <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
 <CACWQX83sHwbW435Ph9+e2xyPmqxNyih5L=Rs96ydR0mZQOLzpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX83sHwbW435Ph9+e2xyPmqxNyih5L=Rs96ydR0mZQOLzpg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 07:12:39AM -0800, Ed Tanous wrote:

>It would be really helpful if you could add your input and participate
>in the reviews.  In this specific case, I recall pointing out the
>missing Min/Max/Average aggregations (from the first bug) in one of
>the original telemetry code reviews.  I don't remember what the answer
>was there, but I don't think it got added.  I don't think append
>behavior has come up, but I suspect it would've changed some of the
>initial design if we had known it was desired.

FWIW this interest in the telemetry work has only emerged very recently 
(around when I sent the first mail in this thread).

-brad
