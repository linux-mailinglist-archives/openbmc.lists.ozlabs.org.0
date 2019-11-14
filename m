Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73806FC4CB
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 11:57:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DJMj5201zF1Qy
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 21:57:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KGZPFoeT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CiDtotq1"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DGv32VQSzF7bF
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 20:50:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3EB9B56C;
 Thu, 14 Nov 2019 04:50:34 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 14 Nov 2019 04:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=H80EF
 xr/5rnTefUChJRZ8zsY5mXnHaI/cfPIpmNIfGo=; b=KGZPFoeT454G08shYx+xz
 OfOqsd716TcH2vAGkdpkETwFPBGHkmNp5o8WzbZhuMZ1VgwPgcbhZhUQqZbQs1o1
 Cw0HG3opEBsrzT3A1gekltaQPhfU2ckJ00f9sRBo4Ww4AM0IDqvp7vkYyNKceHLZ
 jmWezTzqmryNJBj5LfJeQLrhsOAxIAYqzf5jtJhC3XOMAnkb5EE5byWLDR4L5BIb
 3ifntQ7kdAsVwClIooZeo42eHTUid2k6Qr5Uv7vLXqFXzH/3TeSfW1pgib0wg3+Q
 F8E7D7PACqUjRLnO0uG78uHSGE0qbAUtSV4klJe0QgTeyOsn49gvI631tcZXmqjc
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=H80EFxr/5rnTefUChJRZ8zsY5mXnHaI/cfPIpmNIf
 Go=; b=CiDtotq1KgdsP7ptZ9eBqKh4xVfQm/X1wCIh21gDtvkCLQw93JL30kcBP
 VPlpalKZH5NsfIlJBAQattv7h07JrkBBKIq1WaqwcrOXdPeWe3wGwxv2OwqNJORh
 IXaqtlAz31plDGrrVzKNMpyDbeXz7au/cn3I4Uply3+XkD2ESuj2wmObJjcaeICT
 1Q0cAcBWNMmgL8R6QX4uqXRIJirL728c7bxVTOI/b6fXVm5vtYrCGpqK088rdPtz
 v19GpowpbLqYN0LcZQk/5eF59uxr4oo6+Umh58I806HErGMA4M2byy9ghy5h+jfj
 r7bC4m2GolUNcVHn6sd9E5jcaeMfg==
X-ME-Sender: <xms:aSPNXUePHXVDdvmFXpc6o06LrF8CWSw8fTPsBHw_-GIMI3xsXBw_tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aSPNXfjlTT7vVtinJsyXGmUYkwqhdIP1oRko_arPQTMy6oPQqHjcDA>
 <xmx:aSPNXR56rZS8LDvF6XNLYJCHpVeqOOg7HkOLHOd2VvwtIVQvDEMpbg>
 <xmx:aSPNXRgTBF3lEIMVTNIiVJLLBlsc2hkE4pbqjPfu-so_Ucob5GU0uA>
 <xmx:aSPNXd-0ts68mhL_YK37ce6xPILVlGGoMyWWv2G_yH_rMONEkq-MSQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83C2EE00A3; Thu, 14 Nov 2019 04:50:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-562-gfd0633a-fmstable-20191114v1
Mime-Version: 1.0
Message-Id: <2fa9a025-abf9-45f9-88bc-eddcc2726c89@www.fastmail.com>
In-Reply-To: <2edbb697-aa07-2610-3bf2-cbd7707c6259@mail.ru>
References: <2edbb697-aa07-2610-3bf2-cbd7707c6259@mail.ru>
Date: Thu, 14 Nov 2019 20:20:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9?=
 <9165394577@mail.ru>, openbmc@lists.ozlabs.org
Subject: Re: NCSI eth0 (ftgmac100): transmit queue 0 timed out error
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



On Thu, 14 Nov 2019, at 18:37, =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9=
 wrote:
>  Hello Xiuzhi, I have the similar problem using NCSI. Could you explai=
n=20
> more clearly how you have solved one?=20
> I use the Neptune Alfa OpenBMC kit from Portwell. It has an Intel I210=
=20
> network interface chip. A host is connected to it through PCIe. The=20=

> host network is working well. BMC has a dedicated interface (MAC0 +=20=

> RTL8211), it works well.
>  I want to create a BMC interface via NCSI + VLAN, but it does not=20
> work: see dmesg output below.
>  Please help me solve this problem.
>=20
> :~# dmesg|grep net
>=20
> [ 2.592506] ftgmac100 1e660000.ethernet: Error applying setting,=20
> reverse things back

This suggests a clash in the MAC pinctrl request - some other device has=
 already claimed a pin need by the MAC.

Can you provide or link to the devicetree for the the system?

It's odd as some of the subsequent messages suggest the RMII link is wor=
king in some instances, but you still get failures in others.

Andrew
