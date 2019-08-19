Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4291A6A
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 02:15:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BZFJ1JlTzDr84
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 10:15:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cYW+58k/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wPVL8+bh"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BZDn541szDr7b
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 10:14:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A02721B7C;
 Sun, 18 Aug 2019 20:14:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 18 Aug 2019 20:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=uWtq8
 i9Iw3/CGIUhqjhw9oRRzNsSJCl7NwblaV8oAno=; b=cYW+58k/5Qrey1pVd25Ss
 xFZQYH8InXLB38H5yI+fzajZPn4H7kMcNhBgeVTsB3Tp2LHDt7WmURSEirddjYko
 3n5ZTTvj7u6qXjR0AHFutjmL1KvIftPwzSDgP5umn/EYhYc9axNf5RTHMPLK/rsw
 Eh01szf4cMZ6k+JbFHGEfZzsVVlWXXAI4hdG6Sd0cqms33VkHdzegFM8XZly2zFf
 weQlOmXWBSztw2d+M8e702z6dvc+YL61nL2HXQi1zQRPJrMuUNKMyvqIhZcUjOcv
 B0c+KOunpJhWORIVSV9mZnFESNZAgfk58T7TNf70Y+F5H+jWJkflG2ufghrduCeH
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=uWtq8i9Iw3/CGIUhqjhw9oRRzNsSJCl7NwblaV8oA
 no=; b=wPVL8+bh2Tx+hcFUNUTJ7pR3te4cNncOCOGq5LLRx12U0NDtr6q/Fdrez
 qflK3r4epslmcQa0Rgj3SHCIhlPDYwD48iNwDps9VbWWZzw7wZ0ceM1jB7ExZQXt
 wsjvV4wR0j4yooGFqvUgcgXtlaO0glVpwizivmw8NBjsrNGdFSNFcXxbfWDNHiFd
 WXnZibi5vRknMZf/Y0aH8spDi3U0NMQRj2f6GpWbSILtyOICcvs6L9ni94DxayV+
 fLaTmG3ZoTJCtFUI5QU+rW1Ir2yegB/jQebMd/tFDyw2vjKnJGbAL71bFUc9hohy
 CVIriC5oOKnvgHqhxXay3ILyTlc6g==
X-ME-Sender: <xms:9ulZXRsUzxSrU5ItZi_Fgtj_jl2yWisV9vPP3KwJZCecvH6yjd2kYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefkedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:9ulZXfBkm72dN317_ArlhxdzfEnb1v0zVyFuaW4V3IeQOB9y5CFkIg>
 <xmx:9ulZXR4a-sXmZsgLpmgDdoM8tlhppxnEDs1ALd1VkRyp0ClsjRa_oA>
 <xmx:9ulZXfCjV1lb6Gj4sHd7pK6X4ETimFnXYLEw8HT5dGQy7RV6A7p21w>
 <xmx:9-lZXSOtbltb976JIQ7Z75KD5954TzeKC4Bzb4nPNlqs3a4BpAeL9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9F764E00A3; Sun, 18 Aug 2019 20:14:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <96f668f0-9580-44a4-9bbd-ca6324494017@www.fastmail.com>
In-Reply-To: <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
 <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
Date: Mon, 19 Aug 2019 09:45:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Matt Spinler" <mspinler@linux.ibm.com>,
 "Andrew Geissler" <geissonator@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: where to store application json
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



On Sat, 17 Aug 2019, at 02:24, Joseph Reynolds wrote:
>=20
> On 8/16/19 8:31 AM, Matt Spinler wrote:
> >
> > On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
> >>
> >> On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
> >>> As we start moving more and more of our applications to using=20
> >>> runtime parsed
> >>> json files, it seems like a good time to come up with a standard=20=

> >>> location to put
> >>> the json files. I think a requirement is they be in a writeable=20=

> >>> filesystem
> >>> (although that may bring security concerns) so that you can edit a=
nd=20
> >>> restart
> >>> services that use them on the fly for bringup and debug.
> >>>
> >>> /etc seems like the right spot. But if so, where in /etc
> >
> > While convenient to the developer for testing, to me it doesn't soun=
d=20
> > like good practice to put read
> > only, critical files into a writeable spot?=C2=A0 How could we even =
trust=20
> > data that comes back to us from
> > the field when a user that can get into their BMC can just change=20=

> > these?=C2=A0 Or accidentally
> > delete a file?
> >
>=20
> One security concern is that config files offer a good way for hackers=
=20
> to get persistent access to the system.=C2=A0 That is, if they are abl=
e to=20
> get root access to the BMC one time, they may be able to persist their=
=20
> hack across BMC reboots by modifying some config files.=C2=A0 IMHO, to=
 make=20
> it harder for them, as much as possible of the file system should be=20=

> read-only, and read-write config files should not offer the above=20
> mentioned service to hackers.

What are some concrete examples of what you're concerned about here?

Are you suggesting hackers are exploiting flaws in the config file parse=
rs?
Because in that case we should just fix the parsers. Or perhaps configur=
ing
the system in an unsafe way?

Anyway, having any writable storage provides a place to drop payloads
and generally wreak havoc, but having an unconfigurable BMC is not a
direction I think we should go, it seems pretty restrictive. We do need
to be careful about how we treat the content though, as it can't really
be authenticated.

Andrew
