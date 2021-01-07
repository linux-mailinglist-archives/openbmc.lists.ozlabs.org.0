Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC512ED4BB
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 17:50:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBXK22HLczDqgw
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 03:49:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ZIXSmaPQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kqMkZCrL; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBXHt3nNnzDqXR
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 03:48:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EC3B5C01A4;
 Thu,  7 Jan 2021 11:48:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 07 Jan 2021 11:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=NQoSq4xQEN8+hBRcTyF0AksgEh5
 9VAl9Fl0bkVBKQdU=; b=ZIXSmaPQBJ6F5tm695QZ/XYEbB65xIIEU9ew/v8vFVD
 zzfC6jVr0M1F8IUgcIIL+CnuGjH+WogX54KYvBu7Lx6vPw1zlnjxBBGMS6wOMC3V
 zVTRniwa8PSy46hKmX4fPfeIcUtTfHHrpoQ8M6QpO+ggnL8vXk+RCaTU+OTI2IF9
 481aiBge8zOhXhokGnYkSpbVcC8i9ToeXjKx3nnzJqjEvD59x/H99moT+K5qep+d
 G8dR2cAkTk3GoHlCgmw+jcOmV3uB2Lyml6DbmFzbWx3dPgjlWtM4PBh0qWTyoKsg
 /mNDymfSiwIo/fqyE/XB4BnmN+KsLc0404dllRHUIjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NQoSq4
 xQEN8+hBRcTyF0AksgEh59VAl9Fl0bkVBKQdU=; b=kqMkZCrLHsmiXYJuqXSecH
 q74w0oiniY3ThogPyVi2E/55Z3AFjhz+1dnRr6pDFYVSwnzfF7emTkX74L9r9/WA
 9eJ+to6PslberZ5fuiA0wsGpH82JFdkLpcbNA7BOTbQvkHNAlrB2dtWEW5z7nF2w
 K7/TrS531h1E+jSvloJNaSSPsrj9HD2abu41EMTtjiGh+T1USZEejPgoO47XgocK
 bJ9IOALmzAKpsJ2tvjoiojKD0PJIPYH8ZM2d2CJttwv0EEfXZIXvPwgBbRxjtWNk
 fw2WccT1ulAnvFb7jygRylQXS/pup1P4wPYqHX7wFjblBYIrAAPNdGjbUIYssmQg
 ==
X-ME-Sender: <xms:dTv3X0gTt2dgza2r-CYL_og5QUrCPXKMjBPxXrrqyEsF4TeWWLBzFg>
 <xme:dTv3X9ABnCJeMycWaxvHq1Ch_YVbGLvzyBlE1YutOdD8_ychVwl6jHiWJhZ3mCkq4
 r6d7lepkGEcWymOAmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegvddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepueevveffjeehffevudefhfetfedv
 leekieejfeduteekffdtheeltdevlefggefgnecuffhomhgrihhnpehsthgrthgvrdhhoh
 hsthenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dTv3X8H9LelTIr6ZB51ehFQI3sjQOjYDobyTUd8e9uEvdjn_02XtNg>
 <xmx:dTv3X1TdXyutbPrN0aZosXR-jLWvnBMJi33Rxgfu9C7Nhva9VYQJrA>
 <xmx:dTv3Xxx5XrYvGJmF9Oi0pngRIbt-HRTkJNSFeF7hyUFFUsqu5YhMkg>
 <xmx:djv3X6ueED6XmentxGseX0LAKx_dpyG1IveiZbtkLQ_Pb8JIcYdioA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFD151080063;
 Thu,  7 Jan 2021 11:48:53 -0500 (EST)
Date: Thu, 7 Jan 2021 10:48:52 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Maxim Sloyko <maxims@google.com>
Subject: Re: Changing LEDs status in response to Power Events
Message-ID: <X/c7dM7/uDIDTlFI@heinlein>
References: <CAFR_W8pjBgn=V9ye-R9ThvyvqwxqYnY94vAX0q1h4sVEaLWN2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uQ1CAkDMDT4m6iQg"
Content-Disposition: inline
In-Reply-To: <CAFR_W8pjBgn=V9ye-R9ThvyvqwxqYnY94vAX0q1h4sVEaLWN2Q@mail.gmail.com>
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


--uQ1CAkDMDT4m6iQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 04:52:32PM -0800, Maxim Sloyko wrote:
> Hi all,
>=20
> We would like to change the state of some of the LEDs in response to some
> power events. For example, if the system goes from Standby to On, the LED
> needs to change from blinking fast to blinking slowly.  The way we are
> doing it right now is we have a script that runs every second, polls syst=
em
> state over D-Bus (xyz.openbmc_project.State.Chassis and
> xyz.openbmc_project.State.Host) and then, again over D-Bus, ask
> phosphor-led-manager to switch LED into a new state. This does not sound
> like a good solution to me, so I have a few questions:
>=20
> 0. Did I miss some existing way to do it in OpenBMC?
> 1. If not, does anybody have the same problem and how do you solve this?
> 2. If not, Is anybody working on a solution for this?
> 3. If not, any thoughts on what's the best way to handle this? I can see =
at
> least two approaches:
>    a) Implement some callbacks in x86-power-control, so that one can
> register their services/targets to be notified of the event.
>    b) Implement this in phosphor-led-manager, so that it can listen to
> D-Bus events and respond to them.

This usecase is one of the reasons phosphor-state-manager was
implemented using systemd targets (or at least one of the nice fallouts
of that design).  The intention was that system-specific things like
this could easily install themselves into dependencies on the state
transition targets.

Unfortunately, if you're using x86-power-control as your state-manager
I don't think you get this feature.

--=20
Patrick Williams

--uQ1CAkDMDT4m6iQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/3O28ACgkQqwNHzC0A
wRmt3w//QY5dNR5dY+VNqd7jSBPIg2+yvfSF5xQgulbBzlc4K2CfodPoxWhWd/UD
hoft515Tn94j5GbMrvgs9wwVPnzKXhMagme2kK9n4i4DfS2BQ1yVkbseKFAI9iiP
YfIY4axfke3rbZMnpdSrhrrmirhGeGjcntVwaeGOHN3TwFgRdmk3Dea/hFEGVsIf
nEVCRmnwg/EVtqofAKvnZ/0Uqe8pfEHtVphrEPslYadIRrg1D0cn+620SwNYR2i4
DJ0cTmCpTcf61sr27Cd8aO00dTdqnaTrI+pUUj2R3shQCcZxNW4ER6aV8lHUK3jQ
jHcaH6TIOCCKY3X3aG0f+qouLwPVAfhX1MTYY/86eItKdPVrWR8PXVhsgzZkr7PL
64Nv28C3KLRdjuGlRSmUZwIeDtw3LjqZXmG3Yje2Jju2UdMBrJTc0q9jeFT7NYpn
sYma6qyL1yQB63reJVltkfE+/wsfiby1q0rZyAsVlzYDE15SlwzTBhba4IIMLYsC
o84khnfruU8JqgnIsLODq2w7hdBdLA8IZedb67i1T+ku5BuO2n6kcIwM5k+hEY1O
KIakF6XCBQqVjqaZDf8NhnmskWiJx4ZZnUFDy3CDPZdYbWFbo4nlzw6d8uQ29l1G
4Lx/PQ/xKslsh2oDbYIelzNav6N2R0rW6hjRarPhU29+vy2aB0k=
=bT8C
-----END PGP SIGNATURE-----

--uQ1CAkDMDT4m6iQg--
