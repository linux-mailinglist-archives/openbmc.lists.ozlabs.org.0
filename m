Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9D5754B1
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 20:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkMxy0Jpcz3c5G
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 04:11:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=dsP1dcOw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uiftyfxJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=dsP1dcOw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uiftyfxJ;
	dkim-atps=neutral
X-Greylist: delayed 350 seconds by postgrey-1.36 at boromir; Fri, 15 Jul 2022 04:11:05 AEST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkMxP1TM5z308B;
	Fri, 15 Jul 2022 04:11:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id B46A62B0597F;
	Thu, 14 Jul 2022 14:05:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 14 Jul 2022 14:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657821906; x=1657825506; bh=/iwEYxigdE
	FuJz5vUQfpajKlKQ642prMXuR8LsWTJx4=; b=dsP1dcOwic3v090lBty7m6YW4K
	atHGONu7Led0sjHJZWelPCHgNq9BtvCXoAlawZinMH7q+4MLV+52lyecfKvPC8fo
	zDfpaHKoD7N4x9QIEogUA3YYhUPI042cDS3aVqc9eYzN2bQnV2YPDegWsrwQZwSY
	RhM57rkIgthJXPb4Wy1ZOBg0+bWYEsEv0YEfGaIJT016haemk3WFPXeACzgkZ7qG
	sy2nB6v9CtYohh4fKzjj4BAWOupA0ZjkEoB3UU9ad/DQHG3PoPrlNZZVJwputKnW
	LjZ2+/f1VO9Q0MfgWXf//Ho20NDcsQ0qaoNE6wp8RN5gWaZGWA2XpqCknHkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657821906; x=1657825506; bh=/iwEYxigdEFuJz5vUQfpajKlKQ64
	2prMXuR8LsWTJx4=; b=uiftyfxJnwG7Wl8vGOUO9ZiZhGBb7O5yZVTr+YdQmAC9
	cTNgOu9DZTtAOac1txGWodXuHV3b6JEDgm0s7X01WTzoLieBZiO1GFhd0N/gqppM
	sVid7qPRakRVkow4ZFiOPrQnfWReuW5I9pyV0NWeIwWdfE9JnL6YN+Aa1Biq0e05
	A1WWLT/D4dKfeJn7f8ORNcmbpE1JcmVdbQykxPHPp7kjXkv7fncj2t61M12n5Xko
	V1/PcGuPHiGSPdfd9G+DTTnOhFGbcRVXKIAQEbno6LBnkcXjgsOzIK4nRjbm8XYf
	7wIj5LvH0PmfXt7bDLYCo9LF8V4j/hVdfS7BYcRCtg==
X-ME-Sender: <xms:0VrQYjyHiWXVZBbaR8bHz7yfS7_8NklA2UspznsHItCUqOGkJdS7yA>
    <xme:0VrQYrSYVManhJiKOK4dcMB70ICfjHzQ9-wampgNgNkYXvWPgLEXumjCuxD3Bf417
    xnKuIaWXwJI6UKg5H4>
X-ME-Received: <xmr:0VrQYtUUh0hJCG9yHDccVve4wtQQB_gEMvOqrh4XPm7N1QMRddT7T9PHBQqd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpeevgfehgedvvdekveeifeekjeduueetieegvdeitedvffdvgffhjeekveek
    tdehfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:0VrQYtioem0RvXqwb80HhYC7sd8amseCPfy2JJeOq9Dj7AU02vodxA>
    <xmx:0VrQYlC4TwTpUizVdKPXOnHZULWLG-O20y0mnMoKNWIHmhFLQOpzlQ>
    <xmx:0VrQYmL2L0AILy7TtR5-w9MOaztDtt9xcaKoxpM3WkVJEeSTRQ91rg>
    <xmx:0lrQYtYtfCsKbstjPAbkTtiUDy_lO1pVxG2CP284ecVn-GZ-SDG-cOInk5w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 14:05:03 -0400 (EDT)
Date: Thu, 14 Jul 2022 11:05:01 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
Message-ID: <YtBazSo/uJzFeF+L@pdel-mbp>
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
 <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
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

On Thu, Jul 07, 2022 at 03:33:48PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 7, 2022 at 3:20 PM Logananth Sundararaj
> <logananth13.hcl@gmail.com> wrote:
> >
> > This patch adds linux device tree entry related to
> > Yosemite V3.5 specific devices connected to BMC SoC.
> >
> > Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>
> 
> 
> Something went wrong with the patch description, it looks like you dropped
> the subject and sent the first paragraph as the subject instead.
> 
> > +/ {
> > +       model = "Facebook fby35";
> > +       compatible = "facebook,fby35", "aspeed,ast2600";
> > +
> > +       aliases {
> > +               serial4 = &uart5;
> > +       };
> 
> Why not start at serial0 here?

Hey, Facebook person jumping in here (using a personal email):

I think you're right, it should be like this:

	aliases {
		serial0 = &uart5;
		serial1 = &uart1;
		serial2 = &uart2;
		serial3 = &uart3;
		serial4 = &uart4;
	};

> 
> > +       chosen {
> > +               stdout-path = &uart5;
> > +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> > +       };

Also: if we do serial0 = &uart5, it should be console=ttyS0, not ttyS4.

> 
> The bootargs should really come from the boot loader.

What if we want to boot the kernel by itself with QEMU? It's kinda annoying to
have to specify '-append "console=ttyS0,57600n8...' everytime, or to have to use
a wrapper script. But, it's also a source of bugs: I realized yesterday the
dts we were using here:

https://github.com/facebook/openbmc-linux/blob/e26c76992e0761d9e440ff514538009384c094b4/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts

Has the wrong console setting.

Booting the kernel directly is actualy really useful for us, because U-Boot
literally takes 4+ minutes in QEMU because we execute in-place from flash for
most of it.

> 
> Why do you need the vmalloc=384M? That seems excessive.

Yeah I'm not sure what that is about, would need to find
the person who wrote this originally. Speaking of which:

The dts I linked above, from our repo, how come this patch is not just a copy of
that?

> 
> > +
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x80000000 0x80000000>;
> > +       };
> 
> The memory location and size is usually also set by the boot loader

Yeah not sure what happens if I remove this and boot the kernel directly in
QEMU, would we need to specify the RAM size explicitly in console args? Hmmm,
I'll check it out.

Thanks for your comments!
Peter

> 
>         Arnd
