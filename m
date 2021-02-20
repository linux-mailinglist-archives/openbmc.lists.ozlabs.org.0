Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CD320658
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 18:04:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjZYM52ZFz3cHh
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 04:04:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=WRk7FPOC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hYDeCmUf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=WRk7FPOC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hYDeCmUf; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjZY749wSz30NC
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2021 04:04:11 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CDBD5C00AF;
 Sat, 20 Feb 2021 12:04:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 20 Feb 2021 12:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Mhx80HVl+EHe0kgDvp4F8x0/+Wz
 fg+qv8jSlJ1RFGak=; b=WRk7FPOCAitJDuHoVEWRYpVm3d/z1/fntwEzHlJgPVU
 wRMs2wu57oh03fTjidocQddWU6cTK8y1Pz4mCXHXR593CqHX+U13+h/Mhc9rpENN
 xRG5vroue3O1DcJaXxy31loBgDAm7TPWnO9po1vKA+i/4oUOBXwXl4MilK4KfuKa
 mLgpYAqhm+E0loAFJxppmVo9tb3Vg/Wj1XxvGUAg4vXosB6pNPGu+vS4zRx1cRFl
 gi6YPnL0MBdA4JBID1c3S5SoFDTBasnEfdRDlSuh5kxx7yjedg0/yiVIyGKJfgeV
 cnWy+tjj1vqDZQgHBsjbzZMT4vVhmPmhjuEkLcTBwOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Mhx80H
 Vl+EHe0kgDvp4F8x0/+Wzfg+qv8jSlJ1RFGak=; b=hYDeCmUfelp659ZVHjvk6C
 /FEQojGb+xtH0neogYXYenMK21VLBscyKruSDvM/SX4hem23RXJp84UWvUagphle
 dGSwjLoHIRDM7vKjBxxpcQO+vgdE81g0mz3NqyoJ9F5zJzEmnumHoi2Yoarj9ytv
 SXy1LO2j6tyh/qGo+c+m5TRqwl5wzMPkfbLFfLbcSj4nigfyw4NqhpWHF9RzOe+g
 xL0KPMUjAlNpySCa1D8bv+DWHw0sb+OML9mXHbpR9v+6GTAFdrFclaUPV1+xt8HZ
 2uAGvnUrdzRO6DLLAeeYPxBqBgvutSLJbdbXfKMfu2XDuZWUoGItaC/dxB1HPoaA
 ==
X-ME-Sender: <xms:B0ExYLYkMV5uRSl0aLODKenqNnhXb8BInQ9Wx-kLoNhQRXbZ7qQPSw>
 <xme:B0ExYKWmJVbcUmmbTd-h7xRFCqlTUyEv-robd0qnjHbsTpfOp_3K9Snmi8BwAgQxA
 ELXc4BPtE0qjptiCgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeekgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:B0ExYK0nAdkQ3Vrk1EhoJ7ZO7C5BvbfOM10_tmbvgxXxiDE3HyFNgA>
 <xmx:B0ExYJY_SspFAHpBCS7hmCiPAb56sjkCNphGpProOpKvnkIjesUqLQ>
 <xmx:B0ExYFrgBJjTlGZwaVfgzwP0F4jUuDH8G3cx3NsRumCeICKeF7FWMg>
 <xmx:CUExYPrQL1nBDMtUH-oanEuxAufWmH1V20gvud-ng6sNej4KGaZaKw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82ED324005A;
 Sat, 20 Feb 2021 12:04:07 -0500 (EST)
Date: Sat, 20 Feb 2021 11:04:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
Message-ID: <YDFBBgX2kRHMlGQK@heinlein>
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
 <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
 <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M1l+PL+5sHIoxQhI"
Content-Disposition: inline
In-Reply-To: <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--M1l+PL+5sHIoxQhI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 05:23:56AM +0000, Joel Stanley wrote:
> On Thu, 18 Feb 2021 at 01:31, Thang Nguyen <thang@os.amperecomputing.com>=
 wrote:
> >
> >
> > On 18/02/2021 06:46, Nancy Yuen wrote:
> >
> > Code should be put into an appropriate repo, and repos created where ne=
cessary.  Then referenced in recipes from openbmc/openbmc metalayers.
> >
>=20
> It's a requirement.

My opinion is that there are two reasons that come to my mind on why we
follow this convention right now beyond just that Yocto is happier with it:

    1. We like to have a discussion before making a new repository to
       make sure we're not fragmenting the codebase more than necessary.
       Often problems/solutions overlap more than might seem obvious
       when you're looking at it just from your machine or architecture's
       perspective.  There may be some existing implementation that
       could be modified slightly to make it fit your needs, or it could
       be that someone else has the same problem and would like to work
       with you on implementation.

    2. All of our CI infrastructure is set up where machine recipes go
       in openbmc/openbmc and code goes in various code repositories.
       If you try to put code directly into openbmc/openbmc you do not
       gain any of those CI efforts we already have:
            * Build of your code and unit tests when someone
              makes a code change.
            * Unit test execution.
            * Code formatting.
            * Static code analysis.
       We have a lot of support at a repository level that doesn't exist
       in openbmc/openbmc directly, because it isn't approriate for what
       is there.

Hopefully this gives you some additional context on why.

--=20
Patrick Williams

--M1l+PL+5sHIoxQhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAxQQYACgkQqwNHzC0A
wRm0RQ/+PRmmrgj/F1+YyEpVm4a3DO+qIBe/C1l2EsLcpNnOe/NZrh9m9LbM00h1
XlSZZriPl6LAOhWHl3bwvclS1mMajHM4YRtAb3q80Qldt111NwC5I5Z/xVMymv93
IXbVINSFaFrNiqk/diGmOwUlyKHm0HOEsR7c0278b7Gomz/kyWsit9YqxTvK+SqV
aOeZaGHGii9Qq7qEICw6EhQ6F6oFWCjuKeyt19rCpSSPYXwZuomIM7pDvffO10u8
6KueUIfAM4X3vDJvSZjV/C0ryqwkBwvlfwSqbGII/scQGgHycgDzYafnBsZSS27+
d8rViRCDUB7wwMBx5dfgRwhezXHBAvBUPHOxtk1OliqvUc5v7zq/As2nkKrjTiYb
C5IfwTdnZKDI4jmVWFZFZI5im3T8D2CrJ0k7+frNlZyU20o6v45fR8MtwvP34z4f
nmNSKCgR36RYORDCN8N/I/GbXIRGUJj9gxgxyyGhHhdneBoitIGA4VhjcwX34F8z
YcMATc/1sQd+X239GXPFPnbTrCf1fHWe02UrICv+vzdhwco/HUqGr5gN2936SGu2
dj178F6ma5e4utipZ0seCG6W9xlkzt+uWnWiwzEcLm0BOPTNONG5g5wPdQweJx1A
MCngjnMDNLIGrwaKXM9igvIevz7tyjnS9PTK7V3iCqhC8XUKkyI=
=W8OO
-----END PGP SIGNATURE-----

--M1l+PL+5sHIoxQhI--
