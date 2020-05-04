Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E51C36F3
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 12:31:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Fzfq0K6hzDqcq
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 20:31:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=u/v7CTJK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=woQV47h3; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Fzds2p87zDqRy
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 20:30:40 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 877DF6BC;
 Mon,  4 May 2020 06:30:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 06:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=YoeFQ
 Bw9D7vnH4QXxbMphWFvRaY3sDJQQBzDHl2zSfE=; b=u/v7CTJKrJYBPIcBMTDBB
 +rcMwr1FwB2y0wCqrnLiQkwtD1oHfDhi6aFX2uP65/bgIiCG+HCCaKJ2J9PIFrQM
 D2AlMoJfi6x8GtJm8o5JtK+AyDnQ1TTbnI0sjZyJNXnIMgpi8zN2OTBC9JXNLX7U
 cxZJQhNZNV7ADJH0g2+a8vFA1fj1+4d24PplsWTlmDi0ngJpslnNvBBYHAAVnYxj
 1XnyR9FnxIF9EcyWGf1+bkRL3eu9wKmjXvpUcBNxMw2+hcuSTy1KnpUWWC3SsAaN
 /x3wEqSlUZWzdjR2nBJwQ/wVIBVBIB6uP/NLmXn8kPsttnj4VwX7Q8drcbCfC9wI
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=YoeFQBw9D7vnH4QXxbMphWFvRaY3sDJQQBzDHl2zS
 fE=; b=woQV47h3ZF4kgyo4DuATwfcQedH4IKsTj+H06KLhgUxfF+nCR+C3Qzq8O
 twfaCJddL/dDWFZOW2plJACt0W6r7N4fyZhEWzcOM8x/GRhfZ1/R0rvxLxx7DXhF
 ZCJzd2gAoOLKfPLmAtOgu7HyZIYBHmLwT4xey9ctdiy6GyYgP6pTCBU1PBAeos88
 cdwVGaykzIs9cf8Dx2oCJ84Y2kbXJgVsqPvFFIwNMTaAuvmwoQR4NhV35mW3CIVz
 xmX/hOTkWWsoKDAlSQ7J9KzuuHcCMZgA9rKCY5toB2VwTiq+PV8HS6GaK3gN3GLT
 jDTWfD1Kg/bf5mcXYs9UBN3HDFcRA==
X-ME-Sender: <xms:yu6vXgWSrsuKsvB9IfVttd242vQWwei7xdGhBnkerRjKPZs7jZPCNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:yu6vXlWu6AU9HRpsK5lK-vYJITgmaHeXkOMi3M0Z2xXoRTQ9pNOhEA>
 <xmx:yu6vXkCpf0871b90bPfONNShb3yuKwDxl4t_CGp7gBtgEaEFPNVAAw>
 <xmx:yu6vXogX1xHBX0cq4C7QV2peC8FZBYsTFGzXAXToNgd9Hfm-6P_PtQ>
 <xmx:y-6vXuX0-DFOcV6L0jlHBHk1j_Zn3TQLCHlJ7niUaHcJH8sl9AzNiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9C2C0E00A9; Mon,  4 May 2020 06:30:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <789e1bda-63d4-479e-bfa3-12bf1603ebbc@www.fastmail.com>
In-Reply-To: <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
Date: Mon, 04 May 2020 20:00:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Deepak Kodihalli" <dkodihal@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:
> On 30/04/20 4:21 am, Nancy Yuen wrote:
> > I've talked with some people a while back (long while back) about=20=

> > multiple BMCs in a system.=C2=A0 Either for redundancy or managing s=
eparate=20
> > parts of a system.=C2=A0=C2=A0 I'm wondering what other people are t=
hinking in=20
> > this area if at all.
> >=20
> > We are considering similar designs and I'm looking into options for=20=

> > BMC-BMC communications.=C2=A0 Some BMCs may not be externally=20
> > accessible.=C2=A0Here are some options that we've looked at:
> >=20
> >  1. i2c/IPMB
> >  2. usbnet/Redfish
> >  3. i2c/MCTP/PLDM or something else?
> >  4. internal network via switch chip/Redfish or MCTP
> >=20
> >  =C2=A0I'd like to reduce our use of IPMI so I want to avoid (1).
> >=20
> > ----------
> > Nancy
>=20
> Hi Nancy,
>=20
> I think it depends on whether the BMCs need to talk to each other for=20=

> platform management, or if they manage their own hosts and we need one=
=20
> of the BMCs to broadcast out of band requests and aggregate responses.=

>=20
> For the former I think PLDM over MCTP could be a good fit. This is mor=
e=20
> of an "inband" use-case in my opinion so I'm not sure if Redfish is we=
ll=20
> suited. For the latter, a Redfish based aggregation is a good option.

I think this looks like the right approach. Certainly some thought would=
 be
required in designing the MCTP networks given the (intentionally) limite=
d
number of endpoint IDs.

Andrew
