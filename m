Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0426DFB3
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 17:31:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsgtY2KrLzDqHb
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 01:31:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=bLK2ZZ/J; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Bin0Hxy4; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsgqh3g3DzDqfP
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 01:29:18 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E4F25C00E8;
 Thu, 17 Sep 2020 11:29:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 17 Sep 2020 11:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jNg3/5W30sis0Ek9m2W4yQgIWeH
 dy2dPzkF3UUjiPOI=; b=bLK2ZZ/JBoE834Cqol2EcU+ndEIQwpG+/nO3SE3Hnb9
 dU2jcYtOm3nA4v00/gKhAKoal4ls4F+NnaXyj0hpBpgYSYqU/5OjEPjVOO5WJOHM
 rnGsIRrWn3hc1qsi1WCXtOdqb8nS3UWecvmnRcfPbOrur5diy5mNokI0KeG/PQh3
 PCBwxxX7z3os8ooYwq3lUuokT8440W/RNR3kPmMsUpt6bInnRKRaoWYkBPfsupTI
 FP0Uke4bk89haAcxMErVPjBCbXXRuCmF3XmeqD7snNdW41HqAKqmOkyaQOBvPDrk
 vqh2NvDCmiRq5ZFIqczKJVaD5KxgXJdlJijzUzfbh3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jNg3/5
 W30sis0Ek9m2W4yQgIWeHdy2dPzkF3UUjiPOI=; b=Bin0Hxy4VBPkONoPWUKcBX
 P/AZQIijYZMP82aUF5taBaLqF9AEGjWWDVoTD7JK0BIdXnpQXqlq9fK2jnhNPMZY
 nu08GSPV4F6SZ3oVMJoapdBdjJxKuJD0K/LqkLa1Fp+ubEpjwvk6JMPozpIwPNW5
 +TJ1yUN3+IoSnT/kAcI8OJh6GgR+kzQGadESCAkkAjavxDWynD7z2MkwR29NZq/T
 O446kSn5iJy48QEeTe1F3GuZFUheRT6ghDEKsmN7bBtB2LVOVk7BeKSn7iVYpWF6
 Kw6tSxuDH7QJulYVDvNRtL4eeG3LBCKaonPCwQGlYpziGQq0mZyqGilGkCl6H0lQ
 ==
X-ME-Sender: <xms:yoBjXwTWazoFRtmcZ5LzdWplJohH8ORZyDf1r5gPOz0N9XfmmDOCsw>
 <xme:yoBjX9zT180IyRwR2ePoeowE1Br-hVJG5GkwEeUgn0X8LzXFFvUep2YvYQz7q8Vph
 wh3nv2f8sZEMX8W7To>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekvdehudevkefhuedvteethfeflefh
 vdehiefgudegvdfggfetffevkeetudegudenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yoBjX900bZvuY_27yUQBuvAYz1xLTVfQMQUiqpU0rlv9eDfkdiTPpA>
 <xmx:yoBjX0B8nfFf58tp-5leq4U1W0bFhjX0t1sv1m9i5EXZyhK1BKUy2Q>
 <xmx:yoBjX5gr86SlTpqlsi27iuqcqcNlTrkhwhukLeFt9yavrC73fkOpDg>
 <xmx:yoBjX8sTL70BMnwBHDQGnmkBMoqmqes6Enxdf2JS-lwjtscz_e1v0Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD9C13064687;
 Thu, 17 Sep 2020 11:29:13 -0400 (EDT)
Date: Thu, 17 Sep 2020 10:29:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Josh Lehan <krellan@google.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
Message-ID: <20200917152912.GG6152@heinlein>
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline
In-Reply-To: <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Fran Hsu =?utf-8?B?KOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Would someone mind giving a 1-2 sentence explaination of what "sensor
margin values" are?  I'm certainly not a thermal control expert.

I don't care if there are multiple implementations of similar
functionality, but there is also work going on for a repository called
'phosphor-virtual-sensors'.  What little I could understand of
read-margin-temp's role seems to somewhat overlap with that effort.

On Wed, Sep 16, 2020 at 10:37:14PM -0700, Josh Lehan wrote:
> Yay, this is great to see. I have some bug fixes to read-margin-temp and
> was just wondering how to contribute them. I'm really hoping this makes it
> into OpenBMC. It's the perfect preprocessor for phosphor-pid-control, I
> have found.
>=20
> Josh
>=20
> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
>=20
>=20
>=20
> On Wed, Sep 16, 2020 at 7:15 PM Benjamin Fair <benjaminfair@google.com>
> wrote:
>=20
> > On Wed, 16 Sep 2020 at 06:31, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <F=
ran.Hsu@quantatw.com>
> > wrote:
> > >
> > > Hi Brad,
> > >         This is Fran from Quanta Computer.
> > > Quanta OpenBMC team would like to share some useful tools to the Open=
BMC
> > community.
> > > Such as the read-margin-temp daemon (
> > https://github.com/quanta-bmc/read-margin-temp), we are using this daem=
on
> > to fill sensor margin value to PID to do fan control.
> >
> > read-margin-temp seems useful and widely applicable enough that I
> > think it's worth having a dedicated repo for it.
> >
> > The quanta-misc repo could possibly be used for smaller, more
> > Quanta-specific things.
> >
> > >
> > > We would like to have a repo named "quanta-misc" under the OpenBMC
> > github.
> > >
> > > Here is the maintainer list:
> > > M:  Benjamin Fair <benjaminfair@google.com> <benjaminfair!>
> > > M:  Brandon Kim <brandonkim@google.com> <brandonk!>
> > > M:  Fran Hsu <fran.hsu@quantatw.com> <franhsu!>
> > > M:  George Hung <george.hung@quantatw.com> <ghung!>
> > > M:  Buddy Huang <buddy.huang@quantatw.com> <buddyhunag!>
> > >
> > > Thank you.
> > > Fran Hsu
> > > E-Mail : Fran.Hsu@QuantaTW.com
> > > Tel: +886-3-327-2345 Ext: 16935 <+886%203%20327%202345>
> > >
> > >
> >

--=20
Patrick Williams

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9jgMYACgkQqwNHzC0A
wRkytRAAj3L7iQmMhDQrdDV/WmSOB2Anjg/aUcXpqcddMjhl98nFseXJjeH+Fgn6
nQ7o3FagsWktwyJgMt5FkKhC1nEjD5D8KkYHCL3X0NiTXRvYyDF7Ud1e0OZydiMK
qA42y37VCiUDSDQiaQOh7cU80l6ziMbBRoHWu2ySpnaCocMN5UB68diT5yWp4qUo
OwMOC7UMbV/rwOyQ2j0qkVUWEwwwkF8iJsbVm3vIhSx5YEHlmaGTjDk52G16gHub
kroIHeUfdIST2jbR/C2eqHLtOe4jQnryuozls8mGqC5P9Sk9Jw1iIigFl94XI2FD
EEJGiZXFTOVlmYqtMU1RXIfldXLHa2IJNJLazHhONTr+dUOM5RIl0B2VDKTaKD2X
Wc2Kp8Gec7dPxa9iD1xP3zzFjzufC33uyCMy01AIbSx55ywI+XwNoHvrV8GzO9AA
utghxHxFnN5q8hLad49P4R1BVm0/8W6rVJ6b8ZNn+OeFwnDHhBewIJw91XQqy7hh
3VEynv638oyAF1yYbf3FAfOHlfy2y0fm7Pm3/1Cnh7o2eJTK/Dk2yUdpDVMSiUD2
pWYzAMBo/QDVUKTk1V+qzW++dRflbNSiH0gIced9NRm6rSHVU9/Yv/4sWah7m2cA
2l+m1bPS/CdQg6ERJ2YGjDIWtYcmShvOfki0Zz/oncCswYk6FHA=
=o/f7
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
