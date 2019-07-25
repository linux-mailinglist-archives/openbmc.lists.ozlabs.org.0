Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F57438A
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 04:58:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vH3S5XNWzDqMG
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 12:58:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ahBexO3a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sq8DbJd9"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vH2s5d5YzDqLx
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:58:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E45421D25;
 Wed, 24 Jul 2019 22:58:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 22:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=SbgEA
 zbduwP86p/4oFPwzLAwmDbAGYpsvZXCcnNhMSY=; b=ahBexO3apGj3HytYdbY8e
 hRpb3+zVwph/dUx517utGshsEaRIzlhatay7NiJ4oS3ma2zOUmZEDhz34Lhszb7w
 ogY375XVeppSCM5EMhuJmfzQsk/LfKIGRcdQouRVsD0XX8qLn3Vn74CneXpuJ/A5
 8BcKRYqV4dKlTYLrFiHfIrCb5vzjSwpF78rfdfJ80NNrPwDgXhl/mt953LdxA33g
 OoqCMOfNNrqwpd/nGPUcKzKkmxB6auXpsY0Rpncn8mWlB+vv9LGacXxond4a4XsZ
 t5vwBB6CbxKTDcUCnM4dCwSceCdkGggpgsuyDB1i60+dZb+OLtDyIaH0hmWrCxHe
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=SbgEAzbduwP86p/4oFPwzLAwmDbAGYpsvZXCcnNhM
 SY=; b=sq8DbJd97S0EHNoZZL399AaOJa+Di83LavZxrEFFRvHSOZ4D2RizJiPR8
 /lKeVOxg03QNVltneIicXeWcfIA0xM+9VPi1TBv4HIfklw7zMBtvpULvt6fwj/Rm
 wLyypGCo0mbBl2N08y5RoPrrWR9GBw3FywHLh6zDYWij+KS35Z+nL/NbIZIBz9oL
 ki6sBsQG5Ws3Fi2NoEybpBuT/UpPyk8swGPm5iqHP4fmvbH8Ih3yaB7bBjlLyodq
 fVrofmZsPA872Jwkytlw2dLqNOCTZCErpn6nSuZKZMUHlJ0pNa09XjsSGW+MXpNd
 ue5c+KbwEzFKXKC7NF2QCccCm8k+A==
X-ME-Sender: <xms:wRo5XeJnmKwIzc1GKnXh3ND5VHOjtdUX2PWZZkAckc5SmpUiIIjq_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehprhhojhgvtghtrdhnvghtfihorhhkpdhoiihlrggsshdrohhrghenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:wRo5XQx3EazWxipLucQ3m2NVeWSWxupz926ZcQK1ksp_GboSkaZM6g>
 <xmx:wRo5XUsuFi2Z2C8b4M7unxTdHF_42he87JGnU5EMeWzwUm88L1-ZYQ>
 <xmx:wRo5XTAUNKD3MU3msrXGHGcLEOOL_DtRQS7mhtJkUruoFsps4eka_g>
 <xmx:who5XTHXm1LW2VDcz6sw6S14NPpOY-8_VX4ntSHLjQD95dLmDW2GLA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 328D3E0193; Wed, 24 Jul 2019 22:58:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <51140097-5a0b-4f5a-a198-c2c76b1013b9@www.fastmail.com>
In-Reply-To: <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
 <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
 <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
Date: Thu, 25 Jul 2019 12:28:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: CLI Tools
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 25 Jul 2019, at 11:58, Brad Bishop wrote:
> On Thu, Jul 25, 2019 at 11:06:13AM +0930, Andrew Jeffery wrote:
> >Hi Wilfred,
> >
> >On Wed, 24 Jul 2019, at 14:04, Wilfred Smith wrote:
> >> There was a discussion a while back (2 years ago? In
> >> https://lists.ozlabs.org/pipermail/openbmc/2016-November/005307.htm=
l)
> >> where the OP (Patrick Williams) expressed concern over the
> >> proliferation of command line tools. Patrick=E2=80=99s interest inv=
olved how to
> >> integrate iotools. Others chimed in questioning whether it=E2=80=99=
s better to
> >> provide compact commands for common needs or encourage exploration =
by
> >> requiring longhand. Patrick inquired about the target audience for =
the
> >> tools.
> >
> >I'm all for helpers for common tasks. If we can integrate them into o=
bmcutil
> >that would be ideal. The alternative is that we require people write =
things like:
> >
> ># busctl set-property `mapper get-service /xyz/openbmc_project/contro=
l/host0/auto_reboot` /xyz/openbmc_project/control/host0/auto_reboot xyz.=
openbmc_project.Control.Boot.RebootPolicy AutoReboot b false
> >
> >to disable auto-reboot or
> >
> ># busctl set-property xyz.openbmc_project.Network /xyz/openbmc_projec=
t/network/eth0 xyz.openbmc_project.Network.EthernetInterface DHCPEnabled=
 b 1
> >
> >to switch DHCP on. Quite frankly that's a ridiculous requirement to f=
orce on
> >everyone.
>=20
> Years ago when Patrick wrote the referenced note, the belief was that=20=

> the OpenBMC DBus API would be stable.  But that thinking has long sinc=
e=20
> been rejected - the OpenBMC DBus is not stable and as such it probably=
=20
> doesn't make sense to be sharing it (via busctl commands) with our=20
> users?

Yeah, lifting an obmcutil interface to represent something users want to=

achieve (`obmcutil dhcp enable`) rather than exposing implementation
details would be a win.

>=20
> >
> >Having said that some of these already have shortcuts, such as
> >
> ># systemctl stop host-failure-reboots@0
>=20
> It might already be too late, but we probably should not have presente=
d=20
> systemctl commands as stable interfaces for our users either, for the=20=

> same reasons as I've mentioned above.

Right.

Andrew
