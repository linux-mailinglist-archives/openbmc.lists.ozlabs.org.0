Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFAD742E5
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 03:36:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vFDc3rlfzDqMC
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 11:36:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jhc9rqkd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Z6n04ffa"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vFD24p1NzDqBl
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 11:36:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC51B21F4C;
 Wed, 24 Jul 2019 21:35:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 21:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=4l6un
 VB53tvyJgqXC4EbMxdHnHkg5+JCoKmlRhl/5Rg=; b=jhc9rqkdzrN4NaJXlZbjk
 OGHZfObNduiz2E9FTSp4qem2V+4NZTY3QodCvIu8gAXrBTUJntpAI0cpjCYULQmm
 W2niJMdzEFvfsx2J06w0e8I+lGQJ0OCWBxxbpC7ETChV6OvQFW9AQsC9P9odBXeH
 pVXnJ3g4/fUboNIup9tLpDmRGSDkzknG2ShxPUNbKaD3jXXj6q+hOLqZXYR0gik8
 /6PE4GpGmY+2Ywle2jd69oiiiC1YmR01+risRyDGJFUk0Txc4wnICd8QHNbzuwrS
 pEtpACJHjLY+F2vqwQetDJn5vIo0noRLziIlbkFEC+6hZ2OTNqB8mXbsz5gEXdpx
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=4l6unVB53tvyJgqXC4EbMxdHnHkg5+JCoKmlRhl/5
 Rg=; b=Z6n04ffaOh3p5k5pRlpXon3s+9F0+nZBEW1miY2Hd7O2QKJgcgqxdftGC
 jXizwrI/nsywFpy/O2vzvnxwv2Uqhnfl93+Ex0N2R8jbtw7Ho74giDb/wKnv8m8s
 ZI2feMfT4QHwNFUbHwrtEUxjAYYA6thOrm/pqGd6JP1Wh1g1+6KjWUINIVrFCj13
 3ZVjtcGsc7gf6IhH8JdzmpYc8d71leH9Mrf3WEM+sEPHIknaEIvPItPSzEVRktsw
 oueUkLPqZ/Rj6D90TjL+GMQBO3qyBu6GmrGSsh7Cj5F/xaKqOIDZWfNsiKLQPIwK
 1Gu537wvfmniVBXxfDWeXKrT6cgHw==
X-ME-Sender: <xms:fgc5XQWaHlyFeFvfrBo03DsD97d0asUH_OZaBpNhdkwp6UxmYSJUYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedugdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehprhhojhgvtghtrdhnvghtfihorhhkpdhoiihlrggsshdrohhrghenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:fwc5XeT0kOdfaNTl26Wz7iCq9P_bLPpzI_o6P_eYY9md6lw7RC4z2w>
 <xmx:fwc5XTteTk6_ZWx-Hw91EwHHtYsPoElXNVET6T2JvovjzezZ-HuRtg>
 <xmx:fwc5XXY_bNjDwWa_sgQkb55oTktBXYUZ-7ocSDyWkgk5Cb6L4bdwCw>
 <xmx:fwc5XQ3feqjnlwWxbHCxnAQFSOOjDCPPtBwWHgJT6oBWP7mSgQuU9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DA661E0129; Wed, 24 Jul 2019 21:35:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
In-Reply-To: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
Date: Thu, 25 Jul 2019 11:06:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wilfred,

On Wed, 24 Jul 2019, at 14:04, Wilfred Smith wrote:
> There was a discussion a while back (2 years ago? In=20
> https://lists.ozlabs.org/pipermail/openbmc/2016-November/005307.html)=20=

> where the OP (Patrick Williams) expressed concern over the=20
> proliferation of command line tools. Patrick=E2=80=99s interest involv=
ed how to=20
> integrate iotools. Others chimed in questioning whether it=E2=80=99s b=
etter to=20
> provide compact commands for common needs or encourage exploration by=20=

> requiring longhand. Patrick inquired about the target audience for the=
=20
> tools.

I'm all for helpers for common tasks. If we can integrate them into obmc=
util
that would be ideal. The alternative is that we require people write thi=
ngs like:

# busctl set-property `mapper get-service /xyz/openbmc_project/control/h=
ost0/auto_reboot` /xyz/openbmc_project/control/host0/auto_reboot xyz.ope=
nbmc_project.Control.Boot.RebootPolicy AutoReboot b false

to disable auto-reboot or

# busctl set-property xyz.openbmc_project.Network /xyz/openbmc_project/n=
etwork/eth0 xyz.openbmc_project.Network.EthernetInterface DHCPEnabled b =
1

to switch DHCP on. Quite frankly that's a ridiculous requirement to forc=
e on
everyone.

Having said that some of these already have shortcuts, such as

# systemctl stop host-failure-reboots@0

for the auto-reboot line above, however the fact that it's a systemd uni=
t
isn't exactly intuitive either.

So I'm happy for people to propose e.g. sub-commands for obmcutil to
help out. We might need more feedback than just my opinion though :)

Andrew
