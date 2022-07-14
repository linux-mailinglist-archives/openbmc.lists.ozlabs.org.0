Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC91575654
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 22:25:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkQwj24gkz3c79
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 06:25:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=wRYAFZ/7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w9n6I+xL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=wRYAFZ/7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w9n6I+xL;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkQw65z3zz3c15;
	Fri, 15 Jul 2022 06:25:09 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 80A352B05ABD;
	Thu, 14 Jul 2022 16:25:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 14 Jul 2022 16:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657830305; x=1657833905; bh=dEHQ4rwrUu
	F1UGpd+DLi5Y852uMVTewadoYXIvYJyJM=; b=wRYAFZ/7xoGteRVuspPfArr2Wv
	QxSlR3KayGoBNWtidEUqGY1ThClRBiPK3OjVq5PRdJfEF4zZ+xtjym31cJ/taLb4
	gxbhcYJ9AibBSgIev/GG8WaWBROGmnz8mJ8mU2YmBmWQI5iQYRSjQvHXMS3qebMk
	EpuqmuPvfMeEEi4VOnNjqSrIKtsN/JcsNQRYPTS1GKIFNSNS8oLHo5GJakO/dW0X
	CRZ1kuqsJWiQr3uQL8oc1N125W7DywFqwYKvgLy/+BQ5wzCIrEP7SY2AAp9QTtDd
	gbaoiA7IseY+dDNSSSoVKKA3BgZ3O38f8j2Ob7NuXu2Vl3R88UTrd21b9y7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657830305; x=1657833905; bh=dEHQ4rwrUuF1UGpd+DLi5Y852uMV
	TewadoYXIvYJyJM=; b=w9n6I+xL9nIeF9NVBJz20HOQFomsC8mPpKBrKhetOET3
	dCgUR+cnC0xytQ7JUEv/Yjs620/ZeFIM16VdbHw8ecI+1cOw6fjq9FDkpDF0WhoX
	JamGjntgTRcfHMjpAmH22+S0Zt/DB55+2PA1zP9dr7yJnmQdTdLe0SKMuOr3O5hi
	/Rf9wVG9GRwXZWm7soku5Qzzfmb2rn8fS6NzMX7ekFNMELnG5V4T6OKTLFWjf5rP
	WD7iSsrXT5pKtVi0uDziPmIVDfxugelQFEh7QUV0gsA+4s47JvQCJT9DT8czXpP6
	E0PDGBAMMGdEt6JBwoesC41AgItNRD7aLiEHANcnZQ==
X-ME-Sender: <xms:n3vQYoxYrmLBvOTZxcr3XQ0RYmp21wtQnMVw1C5VGdTILhNaplnGLQ>
    <xme:n3vQYsSXz_jfKXJPBkdrI2wQH7_aqZTqHWIqFmCrvENEW23PJJjm-C-b4-cLaTqLa
    KsKX3K_JnL-K1m70_s>
X-ME-Received: <xmr:n3vQYqUOzkq8L_zwBJd9Ss6Pu0qV0mcWN-jPwBBozzLfQtPWoPUo-QxWojK_OYE2akWaR0oQtY_8InXWUIDm4c9G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpeejudfgfedvhffhffeiudefvdffhfegffegjefffedtheekgfehgfefveeh
    feejteenucffohhmrghinhepohhpvghntghomhhpuhhtvgdrohhrghdpkhgvrhhnvghlrd
    horhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:n3vQYmjm49W_-Ii0_MrEhS1Lf1UCW8CV_EUm3sbSxYsUDAfaMJG2ww>
    <xmx:n3vQYqBOLqcQiHvi3fs9StcThDD2I5sa8v7_OASlZEAdCjvFD2jT3g>
    <xmx:n3vQYnLWwYUykBvsuk04ZbYlmpNwAetcXgYBIoHf8e1otp9W9jJABg>
    <xmx:oHvQYiZNTe8EZhARh8DUBjNpok7vd-vCVkqg1KEhDJWmklGDc12oaETh6Zg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 16:25:01 -0400 (EDT)
Date: Thu, 14 Jul 2022 13:24:59 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
Message-ID: <YtB7mw1YSahFg0xI@pdel-mbp.dhcp.thefacebook.com>
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
 <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
 <YtBazSo/uJzFeF+L@pdel-mbp>
 <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Logananth Sundararaj <logananth13.hcl@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, garnermic@gmail.com, velumanit@hcl.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 10:15:15PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 14, 2022 at 8:05 PM Peter Delevoryas <peter@pjd.dev> wrote:
> > On Thu, Jul 07, 2022 at 03:33:48PM +0200, Arnd Bergmann wrote:
> > > > +       model = "Facebook fby35";
> > > > +       compatible = "facebook,fby35", "aspeed,ast2600";
> > > > +
> > > > +       aliases {
> > > > +               serial4 = &uart5;
> > > > +       };
> > >
> > > Why not start at serial0 here?
> >
> > Hey, Facebook person jumping in here (using a personal email):
> >
> > I think you're right, it should be like this:
> >
> >         aliases {
> >                 serial0 = &uart5;
> >                 serial1 = &uart1;
> >                 serial2 = &uart2;
> >                 serial3 = &uart3;
> >                 serial4 = &uart4;
> >         };
> 
> Are you actually using all five uarts though?

Actually yes, I should have mentioned this in my previous message.

YosemiteV3.5 is similar to YosemiteV3, which you can see here:

https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server

This dts is for the BMC on the sled baseboard, and it manages the 4 slots in the
sled. Each slot has a "Bridge Interconnect" (BIC) (an AST1030) that manages the
slot CPU/etc. uart1 is connected to a uart on slot1's BIC, uart2 to slot2, etc.

We also have a work-in-progress QEMU model for this:

https://lore.kernel.org/qemu-devel/20220714154456.2565189-1-clg@kaod.org/

> 
> > > > +       chosen {
> > > > +               stdout-path = &uart5;
> > > > +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> > > > +       };
> >
> > Also: if we do serial0 = &uart5, it should be console=ttyS0, not ttyS4.
> >
> > >
> > > The bootargs should really come from the boot loader.
> >
> > What if we want to boot the kernel by itself with QEMU? It's kinda annoying to
> > have to specify '-append "console=ttyS0,57600n8...' everytime, or to have to use
> > a wrapper script. But, it's also a source of bugs: I realized yesterday the
> > dts we were using here:
> >
> > https://github.com/facebook/openbmc-linux/blob/e26c76992e0761d9e440ff514538009384c094b4/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> >
> > Has the wrong console setting.
> 
> You can encode the uart settings like
> 
>            stdout-path = "serial0:115200n8"
> 
> the rest really should be passed on the command line, not in
> the DT shipped with the kernel.
> 
>         Arnd
