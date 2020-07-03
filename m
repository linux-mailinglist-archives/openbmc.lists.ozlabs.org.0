Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C121337A
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 07:21:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yjx80gD5zDqfJ
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 15:21:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=NtML9HqB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ohM9qEo3; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yjw5681BzDqvj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 15:20:20 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4D5C1AA7;
 Fri,  3 Jul 2020 01:20:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 03 Jul 2020 01:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=WH0yhcukcl5ickx1mF+TSw+NzNF
 +0QmIbQgaCXB5i5M=; b=NtML9HqBRsfssopXN1aGU70HNC4rp/FeBQZwIY0YlNh
 /zEbqIlq7N+GLG0QZL/NjAoSsZ18mTMoWkvwyDLUOQAW6+EhB01cNbYF5xJL/qih
 XXOjCGr0CBLT4lSvveDCH3PXw3oZuzWbDWufpcPI3N6XDu5YIuSbn6W8hbhsBNqC
 ezzzEoTD8j14H8hfc6Aupcru0EE8TyXAG2AmvG7khM47Jr7nsBACXIBYLfJzOC+r
 dwFbgcrB9FyB7bL0Vgf9+o22UtpWDamjXMb7THmwS+fpPbZhyTHJY7PUuvZdOAk0
 get7KPdHo0+PnW2r7g6Znw1x6Q73wzsqKNhV/BnM88g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WH0yhc
 ukcl5ickx1mF+TSw+NzNF+0QmIbQgaCXB5i5M=; b=ohM9qEo3iU9KjI6ebcVWFR
 V5NLCwNAGFFkV7pgRSJR3w3pZfC55eICkzLdLhaFOcCf/3Y0wAjRdzCInV7rBYP7
 ENGMi2B/tGEDwANo/zOO4Edjz4GjS7veqDhrSj98YJ7uqaJKIuEdtzXlfGPpCKds
 WgBg+92cpoIhzYh0wazy4lPA/IMU3u6DcpK+f9Q8Ep7tikRwU0YmDR7GOjtq4nJB
 DdP9dXai8mMTE7pLoQJeBUA09pgx9MEOiNKtSYBqu/trbPRS1iVLj5HkHc7/Ju/E
 41mMkhSa2VokS3KZnIQhMXt/UnOB/a5gxUPaIinInQlpVH7cNEAIPWSfw/HFjSOg
 ==
X-ME-Sender: <xms:D8D-XuywxFPN0SXHrVHIPreZa9UhsQ1uxt8QOgz_77QroSTwHO-JBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduffdvjeefteeiuefhgfektdeiuedt
 heekgeelueffieegffeggeegleeltdeiueenucffohhmrghinhephihotghtohhprhhojh
 gvtghtrdhorhhgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:D8D-XqR4OWtug4JSzOdL_LKkB2NMlfxEFMqsJ_aSNhkc__lz365jFQ>
 <xmx:D8D-XgUObLDY-Sc-lcX3yzsHgkoJkgnZ8JPSLAHPSvEyCXivKtmX9w>
 <xmx:D8D-XkjiGboze4QYV7RLabMldLvLahsaYEaNZ-mdOGiCK-4rtItX9Q>
 <xmx:D8D-Xv-bzj-LpM_p4CySC6bDA-DE5RNmSYhTlzspj8qcCke5coB4Ag>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4EAB73280059;
 Fri,  3 Jul 2020 01:20:15 -0400 (EDT)
Date: Fri, 3 Jul 2020 00:20:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ren, Zhikui" <zhikui.ren@intel.com>
Subject: Re: Weird build dependency issue causing missing symbols
Message-ID: <20200703052014.GF3922@heinlein>
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein>
 <ac51ef67-40de-933e-a5a9-50d7506e073f@linux.intel.com>
 <DM6PR11MB441039521253333CFA3BEF22946A0@DM6PR11MB4410.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB441039521253333CFA3BEF22946A0@DM6PR11MB4410.namprd11.prod.outlook.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 12:18:34AM +0000, Ren, Zhikui wrote:
> Maybe the problem is that this header server.hpp is generated not  a sour=
ce.=20
> Artifact created from the same source *should* be the same (except timest=
amp)
> If the source did not update, just a forced rebuild to create new binarie=
s,  I can see Yocto choose not to rebuild things depend on the package.
> In the case of boost, since it is devtool modified and the header is a so=
urce and not build artifact, it make sense to trigger all the rebuild.=20
>=20
>=20
> -----Original Message-----
> From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> O=
n Behalf Of Bills, Jason M
> Sent: Thursday, July 2, 2020 5:00 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: Weird build dependency issue causing missing symbols
>=20
>=20
>=20
> On 7/2/2020 2:33 PM, Patrick Williams wrote:
> > On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
> >> We have narrowed this down to being caused by two separate issues:
> >> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change=
=20
> >> the order of the PropertiesVariant in server.hpp.
> >=20
> > This sounds like a bug in sdbus++.  We should be sorting the variant=20
> > parameters or issuing them in array order.  I'll look into it.
> >=20
> >> 2. When the order of PropertiesVariant changes on a rebuild, the=20
> >> recipes that already have an old copy of server.hpp are not triggered=
=20
> >> to rebuild and are left with the old copy of server.hpp.
> >=20
> > This isn't surprising if what is triggering the rebuild is not a Yocto=
=20
> > variable change (or git revision).  Yocto doesn't cache the contents=20
> > of the packages, but caches the variables that went into a build step. =
=20
> > A hash of the variables are used to look up the potential 'sstate-cache'
> > files so that it can skip build steps.
> >=20
> > If you think a variable or a git-revision should have changed with=20
> > what you were doing, then maybe it is something else.
> >=20
> It seems like a header file change should trigger a rebuild, though?  If =
I manually edited something like a library header file, I'd expect everythi=
ng that includes that library to be rebuilt with the new header change.
>=20
> I tried to devtool modify boost to check the behavior, but that causes bo=
ost to rebuild every time and correctly triggers the dependent builds.=20
>   Maybe the case above of modifying a header file is invalid?

It doesn't matter what the content is: header, library, executable, data
file.  Yocto does not use contents in the decision of "does this need to
be rebuilt".  It only uses variables from recipes.  If the variables do
not change, the package is not rebuilt (unless explicitly tainted).

See https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#d=
ev-invalidating-shared-state-to-force-a-task-to-run for example.

--=20
Patrick Williams

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7+wAwACgkQqwNHzC0A
wRmU/Q//TFJCJ7D/e8AFYW9fqGfqko9F4f8fmPSun93kFrKBeIMuG6L3JSe025/s
s/K8XgLG78PzQGHExIHEsl+FGOqwVHwPg7yw+UfnHH5/n1wBMH3hhyvQt/V2yJMu
EPg56IQ14gOwlD0kRHJZ4V4gV9Lq/Jl1npK2mlf5ncdHyWpbBP1opOZs1OYcjGGP
jZPu5oa+KRX+ANWpYxKD/KOtY0yXeM4Bp5qSrVK7qLot+DX02Z9AtKBNSGJFFiz0
Pjaymx+M3qIBimLWoaP5Iljp+Dy+SWezYc9xMvlbpGKf+jWvTTZonuPHNItgsBjS
MtwrDQW3QIodVpSXaRsBo18LBExQW9RQtMUdCkMINV9eMQtVMEKHjuP2ifmkNhME
mJ27KJ/CF8GXfBqolwmUud9Zw/Swb8rHs8E7/hdr7WnZSNtjtff3kp8ZzIT1zroG
JRBmQ7MfuIgPcdQq3vSLPpEU+oYKdOn3uO6z9GpbriJmguzR+bd7S/HT2B9jG0EQ
ciP05FTWhptgw9sbdpIJZB+P6uQ1Nb2CnGfVK+z+JYJK6+KvJPbq12072hzeLTe9
fHaDmBORosumywHbKowScM6LlJBVJFtqZIy3ZOJNvF3TTQ3hBtZSsfv1ep9Hohxm
siXBibQ3pbtac63XDgG2Iw2g23wRv/GuwJt4HmcaMgjnHX9FjuQ=
=k7di
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
