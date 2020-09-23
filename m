Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F404C275BFB
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 17:36:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxMhh3ZH0zDqDK
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 01:36:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=wGO6wcWk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=lZsgw4br; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxMgk3k2MzDq9k
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 01:35:14 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D20115C021E;
 Wed, 23 Sep 2020 11:35:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 11:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wl/GjHWcZJ3oPiKy8ddCFaeONaA
 vukq0ut4fqO1Zj04=; b=wGO6wcWkE6gzF5kIeh70hlevI07F4J6qClv4SPyBIT9
 nMnXQZUw+4zwaz2t6MuH0EZJmkYbJXVcgXBRlE+EVLPbFBV3guD8gOgsWeS4xN05
 iMFeLx4qooALxMnly+xw/U9RHY+6hmMGobwD9K3eFSiXyPXyj0264sVhFKTQ75+S
 xdw3NLr9p8EGiKnoaBSRhBJwvOstzuOzC37+KNLsmh0x/XYg7RGDWvVFGKhxVvly
 evOoaW87CbLKbZLi7Rh9Szi41JthKxMmkPic2tkMszABp+66f0J6C7hXvpf+gron
 Ye6U/qGY3uSo7pm1xRUfipWQQ0fE0/uuUqlD0L39f8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wl/GjH
 WcZJ3oPiKy8ddCFaeONaAvukq0ut4fqO1Zj04=; b=lZsgw4br7r5N+xpYRh4Amj
 iiDaxBgHuHerI6jjgM3Xsjo8sVmI7JQbDXHxOZDPhlLEFctzxT0P8bvTsPSc+B7A
 wCIrCuhwJP4hfvnfnyASL9rLLJcpIGYHz39X2xntiEjRAD8ClY5XZ77ZSeXENkWA
 May1dXbU6fDYPLPuSGc1Y4smlueQ5HWRAD2qDAeQpuzkoGWVDwdFIb65K7y/qj/V
 n2zDLVpF+Wmjhn90TX+pA+vpzVDGL0XwBPS5h8XruaIUhcYdavqlFasnSK5BahiI
 I7PNSHtKG68X0DYbnGv6Gkdb8U7vO2aB1ebHwNs0ruMvTLNl1GPB7XJx8rwAnATw
 ==
X-ME-Sender: <xms:L2trX9i5PqnvYspbfhgFpUZQOBzBWa3Pz4rkzgmBshMUtshY38a0Jg>
 <xme:L2trXyBNw1VYzpOQjVUi8si0j-Z6_NYVefAiNpHxlfbIRnp3TMJu7hPRC6gED7MHy
 dmFcXnNKLerxO8vifU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:L2trX9HuUsyfloi4lvxs1WHyA4VB6dGP04ZhFnPy7cdiMho52g6wxA>
 <xmx:L2trXyThbi2YJExB2QA6MQDsNPGsErmzDn-uScngxuu7ZPH3YFpDRQ>
 <xmx:L2trX6z47_e0r-uew8UrUawtmoMhKWUBMJ3vbMcfURUUnTZ-mhHOXA>
 <xmx:L2trXwa1hlR6jHcxGFLA73f_9y2eifZ2zwIo4fGsECszkddLMcDeag>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id E25C93064687;
 Wed, 23 Sep 2020 11:35:10 -0400 (EDT)
Date: Wed, 23 Sep 2020 10:35:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashree D <jayashree-d@hcl.com>
Subject: Re: Read Firmware Versions
Message-ID: <20200923153510.GP6152@heinlein>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nVYOjVWOcH+Ezkzp"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nVYOjVWOcH+Ezkzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 01:34:50PM +0000, Jayashree D wrote:
> Classification: HCL Internal
>=20
> Thanks Patrick for your response.
>=20
> In phosphor-bmc-code-mgmt, I am seeing the software image is upgraded and=
 based on the image update, version is updated.
> But in my platform, I have to read firmware versions using oem commands a=
nd that version should be displayed under dbus objects.
> Whether phosphor-bmc-code-mgmt repo will be suitable to display the firmw=
are version using dbus objects?

Vijay recently added a simple BIOS flash management to
phosphor-bmc-code-mgmt, but there is also a openpower-pnor-code-mgmt for
the equivalent of BIOS management on openpower systems.  Since your code
update scheme is likely to be specific to your IPMB commands, I don't
know if that would be best in a separate repository or an extension onto
phosphor-bmc-code-mgmt.

Adriana, any opinions?

--nVYOjVWOcH+Ezkzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9ray4ACgkQqwNHzC0A
wRlKQg//Y//h6dQY/ozDpls+/qOYSEzdu+KJJGmDeZ6SA20pMp4MgWGXCopACSR0
LVOPD9Ohq96YvVyjihNEXFneAqwn3riXTFKr4Kqm/1TchlZ+TXPiwao2bcFmsZNL
x5l21OP77JM8aFB1zZ90pSs4Mtc46vlbHFgLXARSrDi81oQWvPbM8tfv7DKwFYmF
Oo4r1ObMY1UkAZxPe+kO1PTNxREGpuRlObTmVju7IDGXjb1nNn6MPEYXp6h5q6G+
qaywyw2aNtLperiqWncW3tbfngOFECYu779bF8/w4SpqIkN3CAdz9trhlEVbYD3Y
Rasqg0fMiF1sQfWMRFNdlQGbj2zTyov2lFif5Tdo9UkDxk7rqUVYkPuQoXq4Zbef
pONuZMRbGy/oNlWRePh0I+XAjP181iepwyveAwTIoRFHLLdqRMhK++9cguIUWW/R
Et0iSTZ7ukeSZ4Ib2oFSaaLp1pNeWlm5Zu1jayJ67g0C9bOOYolV259+llA91D3N
Bl55EphnBBybDr8VzRrV28pbLHbQ8e84aqlYoi6mll2Ow3xW2Ms5YpPpo8o8T80/
3Uf6VoKdZbQwK4dEu9A1rR0rg6dVyFi19rkmx+I4k6EGjZfNoFs4H0zr/keJnPJu
W96ryXCZEVRIZ3bWexD1d4eJ7iJfhftYVBsvqyiYF9QHo0r5+go=
=zGY3
-----END PGP SIGNATURE-----

--nVYOjVWOcH+Ezkzp--
