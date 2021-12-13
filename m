Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23547314B
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 17:10:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCRLc4XkXz301B
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 03:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=lIKjJRDK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H6TImW/u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=lIKjJRDK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H6TImW/u; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCRLF19V8z2xWc
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 03:10:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0C24A320188B;
 Mon, 13 Dec 2021 11:10:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Dec 2021 11:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wC0X3edZBxx5bzjrKLx1XWYEam+
 rN7OhkY7xosojjdI=; b=lIKjJRDKNrvjDHEiHf3sxPUKMH3km8WwjJtbC3T7A9O
 YE5eUFY/UVraw7iy9370b7mD0r3/lFnWZFYU48TAEgNWmqemzl5hoR76K7aCxQ3N
 ALiWPRilhe/uZucXjxCsbcttzSnm9xgXZFUVqiodbi+bPqhV4N/TBScP7snY6hmo
 odpDHfl72WbZ79VBKRtJ9mDEux0+ojGmgv7jjWelLGCExbRskmzwxaC0cwz/nDWy
 WQYpFRfO2I8Umc9bmay9hoo2nMgbaW/ybmvHV4HJIOY+TJEtx/vpXavTzrV1m716
 kAPs02Y+e1AaeBm7gcrqOZEI27x0MuiauSBExG7gzlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wC0X3e
 dZBxx5bzjrKLx1XWYEam+rN7OhkY7xosojjdI=; b=H6TImW/u7Yvt9BHBXQJ42l
 hBFFruv7pz2FXS40LNZKUnhyVJj4CTFbVYgwWQDEX1OOIQbpHl4jP1bDWtzE5XgT
 YekFC1cs7oGQ38TXX0A8R2YAfPpn+3Fp7jldjR2jtapty/y8ij1ckRW5uXtHyR+9
 ucgmYMBziX9OKbHV2OwRR9KdwvW9AnGMLszofoE/+IMvdCWG7yDj6TlGrBbC+WV1
 YLeAxulZvJMSCZZnvGiqpNrC2t83TJ+UbYsXQiMPFbQ0i8cIVNqMP6nAx2A+f4DR
 d3l+RCUbSjKvxJ01BVscHfVjOaqc2dQJSjWZI2GTBlzz8OBdxbwgFRKp9Wsqu1vg
 ==
X-ME-Sender: <xms:YXC3YQo_AAxusV0th8yL87T4hioypg90f5BE-i_3UNERz5d8ppFdSw>
 <xme:YXC3YWrv62X4ossWvmwdTzWq9DLgem0dKQGa0nOn0sewdsLAbG6CmoxO4JiTCvQtO
 SHpkSx0KcFBsBqibT8>
X-ME-Received: <xmr:YXC3YVOEpvddUdjJI_i1PqDP0Nb-tTuLpa2EIjLMs6FLKeFEx_ks5K-mdjRGq0WuurIYY9OyJ3jiy_Zes94mXA3ipJ0scQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefieekvdejjeehteeggeegfeegffet
 uefggedtvddugefguefgfeejvdeuvdevveenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:YXC3YX5VMEiGL93KUj1fSnsGwGlT2IKnaqtBpyUSsBhCBL57Lrz3Cw>
 <xmx:YXC3Yf5ez3nCLZ05aiXlO-DHKHJCMSsJSmxtFi26N2_O2w2pdaUAYQ>
 <xmx:YXC3YXhCsoPTUnTCbueDr0e77S67b-uv10N18tNRn95ikQdoBN1TaA>
 <xmx:YnC3Yci48i0ab_eTZlZ5jXKvW1-2NWgmGULYDFwtL28AX6_koXVP3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:10:09 -0500 (EST)
Date: Mon, 13 Dec 2021 10:10:08 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Subject: Re: Virtual Media repository request
Message-ID: <YbdwYODNRJPuRady@heinlein>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7wJ9TD0V85do2jgl"
Content-Disposition: inline
In-Reply-To: <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7wJ9TD0V85do2jgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 09:56:55AM +0100, Czarnowski, Przemyslaw wrote:
> On 08.12.2021 17:56, Patrick Williams wrote:
> > On Tue, Dec 07, 2021 at 03:50:47PM +0000, Hawrylewicz Czarnowski, Przem=
yslaw wrote:

> > What did you have in mind for maintainer structure on this?  I'd ideall=
y like to
> > see someone outside of Intel be a co-maintainer with you since:
> >=20
> >    - This code was initially written as experimental Intel-only reposit=
ory
> >      without any community feedback and
> >    - The current code hasn't been touched in 2 years and best practices=
 have
> >      likely changed.
>  >    - You're not currently a maintainer on any other repositories.
>=20
> The code base exposed in provingground was under the development at that=
=20
> moment and actually shouldn't be submitted. The code is updated now=20
> (still needs some polishing I suppose) but I am ready to push updated=20
> sources and ask the community to review it.
>=20
> Right now I am the main person for VM in Intel, but actually I was=20
> thinking about some co-maintainership in case there are other parties=20
> willing to have contribution in the code. This could be worked out=20
> during review process.

This response feels like a bit of a chicken-and-egg.  Who is going to revie=
w and
approve the commits to the repository that assign a maintainer to the
repository?

Maybe Ed's proposal of using an existing repository solves that.  We would =
need
to make sure the current maintainer is accepting of whatever design directi=
on
you've decided to go though.

--=20
Patrick Williams

--7wJ9TD0V85do2jgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG3cGAACgkQqwNHzC0A
wRk3ww/9E+1KMNQrB8toMDgiZjRdKpr0iJiT+IybinwIldsUHT4MEJzvpONiY4N+
LnJOFTYrZCLtE6360EfwQeup7CQ7BXQK0xdy1EcluAznCbjDAu6lHAG/zgCQleY/
S8bjaJyrIB25XzsrnNooDog7XnILtSsLSDiwYE5+oWojxpeBv4FJEPzIWED7gGs1
txx1cw4LhieHxVZyFchwL2ERzOXlP/knutfiLp9weoq3s7s4FQ3MVjLay7rktx8e
E2bOY+wyr7rf4DEjMlBctwPv+abqbpi9ZXXVkfIf1wYWGoXXM2n7sfrIgWA/U/mx
KP98r8zcFkWm6gujQ5S14C4ojJ116i+LdNxkd4kKKqVZzaFtbeLoMxVk7a2hEtAS
i1zERPa0tz3kb72pGj9JKTjncAd3NdaaihrUyILT4hiofJRXvtgHm76j3KFIlf2z
8rpMI0qG3dYSPZ64DJf5qOAF1KrQCvXHqw/EHrqSy+iyZ5kMJMC2K+v7zk7v5ZoC
d9hcdxetr+bUuFZxUBrcKFE/7x2T8e9xIUXzrf2WaElNAFyqUXu6I3QMBlcsr/M+
3e1EMbFdGUhKSNiEArp0tAQLKx8TEp17DpG+sqPedaEyn2VsmZfq9KiiOUnKzcT9
NS7r3GkhQl/jKH4mGcQacCKhp6B3EtSdEabDqPApxHnwloUW2+g=
=+mlW
-----END PGP SIGNATURE-----

--7wJ9TD0V85do2jgl--
