Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF71105DB0
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 01:30:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jy4w2FsCzDr8s
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 11:30:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G+w8NYa8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pQuaQv1M"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jy4B0WZYzDr3S
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 11:29:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 491CA22E5F;
 Thu, 21 Nov 2019 19:29:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 21 Nov 2019 19:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=MIe2V
 9/sKmY5xCsX5LSFGh8atblq55K6jifJ6ZgYdOM=; b=G+w8NYa84FbgtriDtsA1q
 YI6vCEZY14OLIJITwyenOAg8IM8e0Gv/z/u5d9QnPtg7qe83EwMowvE6TWFRFsJD
 0H8+CvuoUrTD5n0a1TnEjstbqVKk/xnOtC2IPjx8A3ecEb9yz0jp1kKgVXqdAne5
 mvySpDDBQWoHcdQ9SIF/TqTKXAMWp6utFWDCq2dZF9yiD2jPRIh/4s3exNU6fPOC
 O6jZpXgajk1Gijcue2FdKTUHxSQH9ih8eP3kEwmqwUOPUAm/+kBrxpOzjB83N9OO
 zqHxPdrhhz9W+D9xdbf9bTVB8MkqhYFaEGxGTbQSF4HADeRJX6XtgtCAu1nq8yEv
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=MIe2V9/sKmY5xCsX5LSFGh8atblq55K6jifJ6ZgYd
 OM=; b=pQuaQv1MYIep1t0YZJa+Pw0U5B35Vzspre4wQrOvpOElY1MJpddWyunnV
 tdOL7CHYgcpZnsdlUsGxo5sh+F88ec637q+raGYs9Vf29J+zQMmtE47c3XPa/X2J
 Z7lf+WS5BUF9komhe5pmwextjOwFpYQtDtiOQjFXAgi2mNJxc9S1UzjyOnfdq8qv
 ODNuTmjBW5voBJZl5XqJ+QQQVKvp/iAN/f00uussj47G6nMp1yJuDGuRia9CV1GO
 e6g3hiRIspTffEBYtlz8pGT+aoKAqr87Tss7/kHOyV5qXcS1sQLP7i6+STs7EP1s
 hmP0fcDLA3nCRe2CMZlRskPDMF7Kg==
X-ME-Sender: <xms:9CvXXYoVGdyHzhec_dd2QrinXz_IzSANiIi-4AOEQrI2LKtaJBi6uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehfedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:9CvXXaJxD_xRml9kph060UaX_i_jywFrb6nhrPD58O7yDBRaT7n6kQ>
 <xmx:9CvXXUMx178a-IhztDr2US7u3zYc49qCPpzfc1whwFd6noO-mUVbhw>
 <xmx:9CvXXY0xewH_Uz0y9pGU4hU4uFdiu2UETc_r85xLHgNq5f2aM1zu_Q>
 <xmx:9SvXXRN6JsBMBxO_LEPyg8bLxpg5Ka0IbsH1V-cyof-wWirrZFWJ2A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4F2F8E00A3; Thu, 21 Nov 2019 19:29:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <e4d8ad9b-49cf-4942-a64c-0c47a94efa17@www.fastmail.com>
In-Reply-To: <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
References: <1b4dacbd.8278.16e6e6c2234.Coremail.ouyangxuan10@163.com>
 <a06a7845-cf16-4e37-8674-acd0950d6245@www.fastmail.com>
 <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
Date: Fri, 22 Nov 2019 11:01:05 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>
Subject: =?UTF-8?Q?Re:_[openbmc-kernel]:_How_to_make_pinctrl_not_affect_pass-thro?=
 =?UTF-8?Q?ugh_function=3F?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>,
 "Jason M. Bills" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Byron,

I'm Cc'ing openbmc@ on this based on my earlier request (history is at
the bottom)

On Wed, 20 Nov 2019, at 18:34, www wrote:
> Dear Andrew Jeffery=EF=BC=8C
>=20
> Thank you for your reply. I've come up with a plan. Can I trouble you=20=

> to see if it's ok? The brief introduction is as follows:
> 1. write a pass-through driver; (can switch the pass through function=20=

> or get the status in user space)
> 2. modify pinctrl driver=EF=BC=9B=EF=BC=88Eliminating the influence of=
 pinctrl on pass=20
> through register=EF=BC=8CAt present, the operation of GPIOD/E will aff=
ect the=20
> pass through function=EF=BC=89
> 3. First turn off the pass through function, then turn on or off the=20=

> host, and then enable the pass through function.
>=20
> In this way, there is no need to detect whether GPIO has input or=20
> not=EF=BC=8Cand this is the real hardware pass through.
> Do you think this is feasible?

Your proposal sounds like more work than just hooking the two GPIOs
together in userspace, so I need to understand why you're avoiding that
approach. I have some questions:

1. What mode of pass-through are you using? It comes in two flavours:
hardware strapping that affects an entire GPIO bank or paired pass-
through which must be explicitly muxed at runtime.

2. What is the requirement for hardware passthrough here (as
opposed to doing it in userspace when the BMC comes up)? Please
provide as much detail as you can in response so I'm clear on the
motivation.

Another significant issue with your proposal is that removing the
knowledge of pass-through from pinmux means that it's possible to
achieve an inconsistent state between the intent of a pin request and
its resulting behaviour. That's a bug that is currently not possible, so=

you will need to do a lot of work to convince me it's the right approach=
.

Getting back to your problem rather than solutions, it's possible to vie=
w
this as a deficiency in the GPIO subsystem and Aspeed GPIO driver: If we=

could describe that we want the pin muxed for pass-through as part of
the GPIO request then your problem would be partly resolved, save for=20=

the fact that the exported GPIO would still be read-only. However, that
issue is fully resolved by multiple sequential GPIO requests: export the=

GPIO in pass-through mode initially, and then when it comes to changing
the host state, re-export the GPIO in non-pass-through mode so that it i=
s
writable, and then again re-export the GPIO back in pass-through mode
after the host state change has been applied. This is the sequence of
your original solution above, just without the need for additional drive=
rs
with ad-hoc userspace interfaces or introducing bugs into the pinctrl
driver.

What are your thoughts on this?

A couple of final notes:

a. Aspeed confirmed that GPIOs configured as passthrough are
constrained to read-only behaviour in the GPIO controller. I haven't
tested this to verify, but if it's possible to drive the pin then you'd
want to be mindful of multiple current sources in push-pull or
open/source configurations.

b. Looking at the ast2500 driver the groups for the strapping-based
passthrough aren't described which means some of the mutual-
exclusion behaviour won't quite work as desired. I should fix that.

Cheers,

Andrew

>=20
> thanks,
> Byron
>=20
>=20
>=20
>=20
> At 2019-11-20 14:52:17, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> >Hi Byron,
> >
> >Sorry about the delayed reply, I have been on leave.
> >
> >Please ask me questions on the list in future, as others may have the=
 same
> >question as you but they can't learn if our exchanges are private :)
> >
> >On Fri, 15 Nov 2019, at 20:06, www wrote:
> >> Dear Andrew Jeffery=EF=BC=8C
> >>=20
> >> I saw that the speed pinctrl driver in the openbmc kernel was uploa=
ded=20
> >> by you.=20
> >
> >Yep, I maintain the pinctrl drivers for the Aspeed SoCs.
> >
> >> As a result of the test, I found that this driver will affect=20
> >> the pass-through function. When operating with GPIO, the pass throu=
gh=20
> >> function will be automatically turned off (this is not the working =
mode=20
> >> of the aspeed chip. On the chip, the two functions can coexist).
> >
> >Only to a point. If the GPIOs are configured for passthrough then acc=
essing
> >the pin via the GPIO controller is read-only according to Aspeed. I'm=
 trying
> >to find where I found this information.
> >
> >> How=20
> >> can I modify it to eliminate this effect? I want it to turn on or o=
ff=20
> >> the system without affecting the passthrough function. Can you give=
 me=20
> >> some advice or tell me how to modify it?
> >
> >I understand what you're after. Let me think about it a bit, as it mi=
ght be
> >possible to cook up a solution. It's complicated by the mutual-exclus=
ion
> >behaviour of the pinctrl subsystem - I want to retain this as it remo=
ves an
> >entire class of hard-to-track-down bugs (last-function-probed-wins-th=
e-pin).
> >
> >I assume your system is strapped so that the GPIOs are passthrough? I=
f so, a
> >possible software implementation is to export both of the relevant GP=
IOs to
> >userspace, and provide a daemon that polls() on the input GPIO and so=
me
> >other external (dbus?) event, and writes the output GPIO when an even=
t
> >occurs. This gives the effect of hardware passthrough with the additi=
on of the
> >arbitrary control over the output GPIO.
> >
> >Hope that helps,
> >
> >Andrew
>=20
>=20
>
