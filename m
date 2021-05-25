Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B1F390CBD
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 01:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqV94127rz2yy3
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 09:07:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Mvl0tSmi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LCbnZqyD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Mvl0tSmi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LCbnZqyD; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqV8n6lzcz2xdM
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 09:07:21 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8771A16D3;
 Tue, 25 May 2021 19:07:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 25 May 2021 19:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=WOjun
 4fxGjdITpde8FL93FAgzsjHz5ftF2Yrq5ld384=; b=Mvl0tSmi14OaY9xwAfcJF
 mwDfZ0b5Wag+MysXXGtWmthl/wKYx3X4FIvIYzfWOYYAHVeY4Hn3P4FM6GxHWPEW
 5pK4r3RRNX6kQsHz1f+7TTUgDhscaWSNV5EacbcmMGJ3ITX7ob0nbwjZs8sU0+GL
 nlGppo1lop9H1j+EjKyvYch9g+kHgABEo2stDPRyXH/7Q5/SGXmDRFCyvQieQVFv
 D3op8I6j1JkQk+qZHxYIo1v97bJOB3/EBtLya6UCQdA5W+V8aSf+yjGlJoC66FF/
 XdX9d6MXXS1aCo2+1ghtp6efOktsT+RJQ7eZ5qt22taq/X1PR3nB5UdFdVKS5OKz
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=WOjun4fxGjdITpde8FL93FAgzsjHz5ftF2Yrq5ld3
 84=; b=LCbnZqyDfZ7OP4OcWaA9KJbJFNmxb2pWbAT17khoh/tnKQDx3DCOoOnPf
 h3QFvc+MtjT9R6LgaRlionWgdjOiLb3ezV8R9t4Lblco3L7H7LZ5fC3+S0DHPRfk
 0CfxftyCB2lux3Ku9J2M1svZuMJoVDXX60K0jkS1B7ZMTi9VC1FPcxbMd9GSXNex
 P/V5SOMr3QuXxOK/ns5pKx/PbDPSjUsMImoYR+x7Tqawryaz7TWWkJHs/plavSaq
 eXZMUO9EvRjE80K2DTPjFyr5SqPifYloSkzw0ywkvVFBovCNzvMZOAeE8OOnCDLH
 TcNqQhY1eHJuFBaRTKZdTdGST0EkQ==
X-ME-Sender: <xms:I4OtYIOw7nYo4mxlg3skQyfwYjobgOVQ5v5NI5LJV0v_1ZIf5Rwlog>
 <xme:I4OtYO_18LAsfH2IoJxLWPGb8Y9XzfhF5V1fJDDn8W0q3_7rNazR15x5NFMVobl23
 FLC2DG90ZWuLZySLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekvddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:I4OtYPTIQcWCXO2H7tKIHumG8ZZIO1yALhOGp38wFarks_DsQs_2Dw>
 <xmx:I4OtYAs0YTUAoSdnrPy0mPSYDTXHRC23aF_G7JJKE8eMEZu73-M40w>
 <xmx:I4OtYAfPjM9EklpJSMFMMP_soX4SAp6XmevV4tJVqdwupqp2OBQzOg>
 <xmx:JYOtYMGVyLZ7RcZejJe5PV6p0sVbG4Y7xVpq8E3AC88cOIMUBN1vSw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9D440A00079; Tue, 25 May 2021 19:07:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <9d6af632-ce29-4b4e-b039-077913cc9e0d@www.fastmail.com>
In-Reply-To: <3c87dea1.379a.179a29ccce3.Coremail.ouyangxuan10@163.com>
References: <5ad9e979.1337.1799386d2c8.Coremail.ouyangxuan10@163.com>
 <682a1194-bb2c-42c5-a4d5-1fb3a7ae750d@www.fastmail.com>
 <3c87dea1.379a.179a29ccce3.Coremail.ouyangxuan10@163.com>
Date: Wed, 26 May 2021 08:36:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>
Subject: =?UTF-8?Q?Re:_[openbmc-qemu]:_Add_read_mac_from_eeprom_in_uboot_by_i2c_a?=
 =?UTF-8?Q?nd_lead_to_the_image_unable_to_start__in_QEMU=3F?=
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
Cc: openbmc@lists.ozlabs.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Byron,

I've Cc'ed the openbmc mailing list on this reply.

On Tue, 25 May 2021, at 17:50, www wrote:
>=20
>=20
> At 2021-05-24 08:22:58, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> >Hi Byron
> >
> >On Sat, 22 May 2021, at 19:32, www wrote:
> >> Hi Andrew Jeffery, Joel Stanley & C=C3=A9dric Le Goater,
> >>=20
> >> chip=EF=BC=9Aaspeed 2500
> >> uboot =EF=BC=9A u-boot-2016.07  commit-id: cc6c5bef00ebbac0b37
> >> platform: romulus
> >>=20
> >> I enable read mac from eeprom by i2c in uboot, and lead to  the ima=
ge=20
> >> unable to start  in QEMU. The startup process stops at "Starting ke=
rnel=20
> >> ...=E2=80=9C
> >> I'd like to ask:
> >> 1. How can I solve this problem? Do you have any suggestions?
> >
> >Can you please configure your kernel with the following and re-run?
> >
> > CONFIG_DEBUG_LL=3Dy
> > CONFIG_DEBUG_LL_UART_8250=3Dy
> > CONFIG_DEBUG_UART_PHYS=3D0x1e784000
> > CONFIG_DEBUG_UART_VIRT=3D0xf8184000
> >
> I set up these four items and didn't print any information.
> then I add "*#define DEBUG*" in the file of *arch/arm/boot/compressed/=
head.S*,=20
> It's just one more line printed.

Sorry, I failed to mention that you also need to add 'debug' and=20
'earlyprintk' to your kernel commandline (i.e. append them to the=20
'bootargs' u-boot environment variable) for the CONFIG_DEBUG_* bits=20
above to be useful.

Let me know if that helps.

Andrew

>=20
> thanks,
> Byron
>=20
> >This allows us to see the kernel log before the UART driver is probed=
.
> >
> >Also, please ask these questions on the mailing list. Other people=20=

> >might have similar problems and so a public discussion will help them=
=20
> >too. Posting publicly can help you also, because you're relying on at=
=20
> >least one of the three of us to reply to you in a reasonable timefram=
e.=20
> >If your question is public anyone who has the skills and time can chi=
me=20
> >in to help you out.
> >
> >Andrew
>=20
>=20
> =20
>=20
> Attachments:
> * image.png
