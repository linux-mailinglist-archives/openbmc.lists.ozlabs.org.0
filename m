Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039A1972B
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 05:35:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450bSZ5bXvzDqRp
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 13:35:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LfKmRAbD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NYYHNqyV"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450bRW4BKpzDqRJ
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 13:34:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B4C123C7C;
 Thu,  9 May 2019 23:34:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 May 2019 23:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=8PM7V
 aNmUlAwTcYqPyf7eZjTgk1Ix70sHGYFQYauXVc=; b=LfKmRAbDQh5kMKCUk7vVf
 iBJkh6FjaBAmS+qlz2KTE8NnW20tzoyS8wCNY1biHXTys1qqckN7HwUCm4Uo+RtC
 zVGuewAXqDfYjSHtzREW36JTA4TIG9wI0WA0JsSl7TXFWVm/X9Ua8eQypNepa897
 i0DAEjy2OT17U7BRY9gQuCZnmAfi2IYCD0Vi1BHMEHsibK+Upb3c38iORU5fb1iY
 dwap+MgSz5FSyjWvrIKlOQvp/TBUTidDxhfwoq8LXfVrOdJVe6JKj5EKdteuaMfq
 +9xhdIW+zYOiUgg93UTz4OMPJKq79Gq5pdq1+MNyyj3jvXmB2em6LylNiESHddDo
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=8PM7VaNmUlAwTcYqPyf7eZjTgk1Ix70sHGYFQYauX
 Vc=; b=NYYHNqyVeC/8KfFI4YZmMp2xX7qk6h8HRuaAmC8xcAnDaKN4e9Cuwqan1
 GHHL911TaWicxdLJr6hOg49U2XWz+EjSi+wFIBHsCCqcNhlpbumIBAsgZGr1nu8D
 ucfgoIwGFc1iSAxD7qWd7Ad2mII25xVUXVAG4CcHKmzlgvHPFXzcxQFskmZJdrdh
 08tadZ7pHMLrkppKDRrzmOWN57EQM3/XIQoWcJT3lnUlrmMGpEaplyKt991Sbs2u
 jTd7yde9dL8nquj7Fh7gWpeuCpj2IYmfmal/eTXITtXz2s540HP20hLYx6/VztfG
 MfbPnw8PrBLteqK4jvLx+n5wrqXXg==
X-ME-Sender: <xms:MvHUXLK1Wx1zDoguSGguLnOe8V93XzbE0PNrcnIL1ms2daL3RVFgxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigddujeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepkhgvrhhnvghlrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MvHUXFtSCNfwyEUZR6tY5AKTjWlwYwCD-gfM4EK_hfJLgh5GzlXejQ>
 <xmx:MvHUXFYwUPM-QHd109mzNNE1oW6BziZH1IJEdEcqbGKRsv5mlC3S_A>
 <xmx:MvHUXN0qyXlBv0UKusPngqpFpAAAlVHBk0Z_sPKU5Yxqk1JYIoPcqA>
 <xmx:M_HUXD50VwCpo6QJWvRZ3AT7_QesJE1YqTdwCVrKmxATZT2AvQnrzA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C34B17C3DB; Thu,  9 May 2019 23:34:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <5caee736-4e80-4522-b30d-0eee3c6ff363@www.fastmail.com>
In-Reply-To: <D8F913E3-6078-4C81-A26C-FB2A45052C62@gmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
 <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
 <88066601-2367-45ce-98f5-8193a02534fb@Spark>
 <D8F913E3-6078-4C81-A26C-FB2A45052C62@gmail.com>
Date: Thu, 09 May 2019 23:34:01 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Chou" <chou.brad@gmail.com>,
 "Samuel Jiang" <chyishian.jiang@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: How to set GPIOs to pre-defined value
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



On Thu, 9 May 2019, at 17:12, Brad Chou wrote:
>=20
> > On May 8, 2019, at 9:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> >=20
> >=20
> > On Tue, 7 May 2019, at 18:23, Brad Chou wrote:
> >> Hi Samuel,
> >> Thanks for your reply, I am using AST2500.
> >> I tried add gpio-hog settings into my device tree, and yes, the GPI=
O=20
> >> works as it defined.
> >> But all GPIOs defined by gpio-hog can not be modified in user space=
 by=20
> >> gpioset / gpioget utility.
> >> I need to set all GPIOs to pre-defined state and can change it at r=
un=20
> >> time.
> >> Set GPIOs in Device tree is trying to lock it by a fixed direction =
and=20
> >> value.
> >>=20
> >=20
> > This problem is probably best taken up with upstream. Currently GPIO=

> > nodes in the devicetree are ignored if they do not have the `gpio-ho=
g`
> > property:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454
> >=20
> > Changing that might be a hard argument - it may impact existing
> > devicetrees that expect the current behaviour.
> >=20
> > However, I'm interested in what you see wrong with doing this from
> > userspace? What requirements do you have that would need this to
> > be done in the kernel?
> >=20
> > Cheers,
> >=20
> > Andrew
>=20
> I don=E2=80=99t really need it to be set in the kernel.
> Just curious about how openBMC initial all GPIOs, especially for=20
> AST2500 that has over 200+ GPIOs.

Well, the GPIOs are muxed with other functionality (LPC, I2C, SPI etc),
and generally your platform design is going to only use a subset of the
pins that are left for GPIO functionality, so you don't tend to need to
initialise the state of 200+ pins. Some take fixed values, in which case=

you can use the kernel's gpio-hog mechanism to configure them.
Accessing GPIOs at run-time generally means you want to change their
state, in which case we usually have dedicated applications that handle
the state transitions based on other events (e.g. "Power-on the host")
and as such there's no need for a general "GPIO initialisation" script.
These applications should apply the right state as part of their
initialisation.

Does that help?

If you have requirements outside of what's outlined above then I can't
see a problem with using a shell script to drive the libgpiod tools to
configure the necessary GPIOs, it just depends on your requirements
and how you feel like doing the system integration.

Cheers,

Andrew
