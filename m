Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3E1AB60F
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 05:01:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492kX63CSMzDr5Z
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 13:01:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=iddvsSJW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lsLXy3f4; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492kWQ46ypzDr3b
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 13:01:06 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 220175C0244;
 Wed, 15 Apr 2020 23:01:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 15 Apr 2020 23:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=d0fO5
 O/mHrbNHZj/mmbJ5gNxaoovob0oWfba443uPI4=; b=iddvsSJWhpclzFTCLFHhC
 ZA3I0E+L4xy3U89229eeFCfbcRprsnRLGtUYQdnGWtd67qMUlnuk14oqLuT+MRPZ
 itTTq8rNCw3vQoOnibdyQzAwc2Pvc5d8p0h3LZCjZzm0P0l35nL/HzZzamk7qf2J
 +HyDZCaKyzO8dmYmo9Um5YsYUbvluEXXVxHDPGZ3I41DDuhDY79w8549s3eqAwLe
 KguJ3akdRsnsyUH0kqQo/nfRNUJYuuOOBotHwOf0GR9V8uIwUQr/E56o/Ohb0Wcv
 lNfYszXZeVRaW0PpAESunXz8Zb4z4wzzB2nffg+VTfWGHFXRoNHt7hZZ0GXtjunO
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=d0fO5O/mHrbNHZj/mmbJ5gNxaoovob0oWfba443uP
 I4=; b=lsLXy3f4hysVDUqEf5RNWFi/Ia5FVi6X3URo+9ei1hT3ccYZqZfR4Z6X+
 ZtvUVnO1hYZXOofMut7twF/pmf65SDKww/m28WB9yzt+dn0tair2jMg1N+CcsnCa
 5vcP5XDEdxNYzsjTfkKFwFsITTjN0DIhBJlE895SunKYPSwOvyFCrONsghD/Mwzi
 sDhPYAsull5eKTO6wJ7V1XtFrtu4Q3h+dOD78nOPLM8X8y3H4eqQ7N6g9//9PGgL
 hbkb10ZHcxYgH7qArBfM0LQ57pUpPd4hO4LiEhTeKwSMIjVXiieWL1aFWK0vRaKA
 4aWnVAzul6yK4Swq1x+2b6XfRUa0g==
X-ME-Sender: <xms:bsqXXokxUWcxbLhcRt_7n_zbOi6Yz8NekL80f4hNm5we1-fiWngYwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:bsqXXgBCmEQke9ymsleSd4n4sJ8HonqTJ6E89irQMErhugC-rrJATg>
 <xmx:bsqXXuvFxLqYrYB4kMwwD63-lb_zLtOsGumyNl8jNkLJxdUIwyiwPA>
 <xmx:bsqXXqvNDZOCTRAdhrtMfMMYqaQQYYt-5PQ-1trJoTGV5Tj3-AeraQ>
 <xmx:b8qXXgVMoDTEsZAmlAjCFXi9_XXHnPqco-rus-sZAgWcQec3wkG9zw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AA8C4E00B9; Wed, 15 Apr 2020 23:01:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <4b0f60fc-e4aa-446b-808c-5de40c12ad5a@www.fastmail.com>
In-Reply-To: <BBD9DDB3-49C9-4F85-9647-530AD7F3DC99@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
 <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
 <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
 <625f79f9-0490-4dbe-b364-959e2091fdc8@www.fastmail.com>
 <BBD9DDB3-49C9-4F85-9647-530AD7F3DC99@fb.com>
Date: Thu, 16 Apr 2020 12:31:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: objc console new design
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 15 Apr 2020, at 04:37, Vijay Khemka wrote:
>=20
>=20
> =EF=BB=BFOn 4/9/20, 9:47 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote:=

>=20
>    =20
>    =20
>     On Tue, 7 Apr 2020, at 05:11, Vijay Khemka wrote:
>     >=20
>     >=20
>     > On 4/5/20, 5:10 AM, "Andrew Jeffery" <andrew@aj.id.au> wrote:
>     >=20
>     >    =20
>     >    =20
>     >     On Sat, 4 Apr 2020, at 08:09, Vijay Khemka wrote:
>     >     > =20
>     >     > Hi Andrew,
>     >     >=20
>     >     > How is server launched as per new design code. With latest=
=20
> update,=20
>     >     > console server is not launching in our platform. I saw=20
> config option=20
>     >     > =E2=80=9COBMC_CONSOLE_HOST_TTY ?=3D "ttyVUART0" =E2=80=9C =
has been removed=20
> from bb file=20
>     >     > and also there is no triggering point in obmc-console-ssh=20=

> socket and=20
>     >     > service like earlier=20
> Wants=3Dobmc-console@{OBMC_CONSOLE_HOST_TTY}.service=20
>     >     >=20
> <mailto:Wants=3Dobmc-console@%7bOBMC_CONSOLE_HOST_TTY%7d.service>.
>     >     >=20
>     >     >=20
>     >     > I see udev rules added in latest patch for launching serve=
r=20
> which needs=20
>     >     > config definition of udev, do we need this for launching,=20=

> please advise.
>     >    =20
>     >     Yes, obmc-console now ships a udev rules file that launches=20=

>     > obmc-console-server
>     >     via an `ENV{SYSTEMD_WANTS}` directive:
>     >=20
>     > If this is mandatory then why do we need to enable UDEV config a=
s=20
> it=20
>     > should be enabled by default.
>     >
>    =20
>     It's not mandatory, just I don't know the requirements of any syst=
ems that
>     aren't using udev. The switch exists in obmc-console so you can im=
plement
>     support for systems without udev if that's desired. Maybe adding t=
he switch
>     was premature?
>=20
> As per new design, udev rule is the only one who can start server .

That's not true, you could implement the system as Kumar's original patc=
h[1]
if your system doesn't use udev. But I'm not aware of systems that aren'=
t
using udev.

Andrew

[1] https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/31091/6=
/recipes-phosphor/console/obmc-console_%2525.bbappend#19
