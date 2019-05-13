Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B82041AEB1
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 03:18:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452NHc5H6wzDq83
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 11:18:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IC07/M6l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wRMftoM4"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452NGl0thpzDqGC
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 11:17:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4AEC20A82;
 Sun, 12 May 2019 21:17:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 12 May 2019 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=k5Ryj
 7mXr/C6yt1EvUlDQjX+637yoFFFjpr//WhVJME=; b=IC07/M6lv/OBncokhfI68
 EbJ0VjEXdfc6IW3b8/aEswz5qLrDqURTwiw3tetXdQLTi+7Emu0G8FJNSNRfawZt
 UqvwmkJ6riO7rXjV5Ge/p9RfsMoo+CL/+SmBwj8QAWQJWKRI/KPvzstzqUXVGI/d
 JFydYvKh3xGC6pNdSKF8xkQztYdI+LUz9Copb8vHgzX8BtM2ccXrJmNfDmtVXLdZ
 lcY/Yv8dejyGiIDRZjnn9begoEXjQTdbHqJLo3dzfewnuhOiHpJtM90XqR6sx2Tk
 kvOdQTw8FpsvM1MP8luhZ8zsipyGAZ05mr6/C32mYG5YJbPsMeyTT40HZ/8FeZpi
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=k5Ryj7mXr/C6yt1EvUlDQjX+637yoFFFjpr//WhVJ
 ME=; b=wRMftoM4QcwjjnH5v8GTB0WeEFoQhXqK8lW4mLE/a7ZQ2N7n/RLur40uj
 I4sc8TMRd5wuBfKCE/fviSojLx6IOnWz0YSuCxRvMsiFAQ+j5JfOJ7MzWry0PXGb
 4pBb0VrF/rImeG3lYXWXVDsLKoryEUXpJX+e/iIZjqS1GWnz763TT+8vDtXOFqbV
 I8iaUsf+YWlMz/jWtNYekOMAzJJ0CiNB/8LbPigiUUH1ddpNDw0TqNnOpUXTMRlO
 kTCH2arVnd3bR1wV/eOGrMIOUpvABG4we/RAL8JtkqIA2Luj7MRi4I0CRbTVcUMY
 6jdbBoLiBsppNBC7gu9wpXA8SuviQ==
X-ME-Sender: <xms:u8XYXBnAticRcIH1OO-XP1yi_ruMHAOKCInI04MnNL6U0GYUIAFeqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleefgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:u8XYXCpTyyOS0tw5VO28N1M6z6qcFDVYQvARFFxPHSpt3eon5oDCow>
 <xmx:u8XYXM9egkjxT7agF9VmgSnktCbjnvpNx18stUiDeRhXnk9jSOSo3Q>
 <xmx:u8XYXL6dX6wkbJm7ubHKpYovcGR4SxJM4KuacOXAg4iIYhXRXz0yjg>
 <xmx:u8XYXEQl-s77p4PMVTXmePj2qgwKX2__zPD82jj1rXUaJnys4PV9Ig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 834277C390; Sun, 12 May 2019 21:17:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <350cbd1c-6874-4d96-95fb-64d87fde8bdd@www.fastmail.com>
In-Reply-To: <2CF17805-2A06-4E6A-ADCE-FB2EA655EB0B@gmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
 <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
 <88066601-2367-45ce-98f5-8193a02534fb@Spark>
 <D8F913E3-6078-4C81-A26C-FB2A45052C62@gmail.com>
 <5caee736-4e80-4522-b30d-0eee3c6ff363@www.fastmail.com>
 <2CF17805-2A06-4E6A-ADCE-FB2EA655EB0B@gmail.com>
Date: Sun, 12 May 2019 21:17:46 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Chou" <chou.brad@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <chyishian.jiang@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 May 2019, at 20:48, Brad Chou wrote:
>=20
>=20
> > On May 10, 2019, at 11:34 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >=20
> >=20
> >=20
> > On Thu, 9 May 2019, at 17:12, Brad Chou wrote:
> >>=20
> >>> On May 8, 2019, at 9:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >>>=20
> >>>=20
> >>>=20
> >>> On Tue, 7 May 2019, at 18:23, Brad Chou wrote:
> >>>> Hi Samuel,
> >>>> Thanks for your reply, I am using AST2500.
> >>>> I tried add gpio-hog settings into my device tree, and yes, the G=
PIO=20
> >>>> works as it defined.
> >>>> But all GPIOs defined by gpio-hog can not be modified in user spa=
ce by=20
> >>>> gpioset / gpioget utility.
> >>>> I need to set all GPIOs to pre-defined state and can change it at=
 run=20
> >>>> time.
> >>>> Set GPIOs in Device tree is trying to lock it by a fixed directio=
n and=20
> >>>> value.
> >>>>=20
> >>>=20
> >>> This problem is probably best taken up with upstream. Currently GP=
IO
> >>> nodes in the devicetree are ignored if they do not have the `gpio-=
hog`
> >>> property:
> >>>=20
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454
> >>>=20
> >>> Changing that might be a hard argument - it may impact existing
> >>> devicetrees that expect the current behaviour.
> >>>=20
> >>> However, I'm interested in what you see wrong with doing this from=

> >>> userspace? What requirements do you have that would need this to
> >>> be done in the kernel?
> >>>=20
> >>> Cheers,
> >>>=20
> >>> Andrew
> >>=20
> >> I don=E2=80=99t really need it to be set in the kernel.
> >> Just curious about how openBMC initial all GPIOs, especially for=20=

> >> AST2500 that has over 200+ GPIOs.
> >=20
> > Well, the GPIOs are muxed with other functionality (LPC, I2C, SPI et=
c),
> > and generally your platform design is going to only use a subset of =
the
> > pins that are left for GPIO functionality, so you don't tend to need=
 to
> > initialise the state of 200+ pins. Some take fixed values, in which =
case
> > you can use the kernel's gpio-hog mechanism to configure them.
> > Accessing GPIOs at run-time generally means you want to change their=

> > state, in which case we usually have dedicated applications that han=
dle
> > the state transitions based on other events (e.g. "Power-on the host=
")
> > and as such there's no need for a general "GPIO initialisation" scri=
pt.
> > These applications should apply the right state as part of their
> > initialisation.
>=20
> You are right, I should write several applications to control my GPIO =
state,
> Instead of a general GPIO initial script to initial all of it.
> Thanks for the advice.=20

Make sure you look through the phosphor-* projects under the openbmc
organisation on Github to see if the project already has something that
does what you need (you may just need to write a configuration file).

Andrew

>=20
> >=20
> > Does that help?
> >=20
> > If you have requirements outside of what's outlined above then I can=
't
> > see a problem with using a shell script to drive the libgpiod tools =
to
> > configure the necessary GPIOs, it just depends on your requirements
> > and how you feel like doing the system integration.
> >=20
> > Cheers,
> >=20
> > Andrew
>
