Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C758C19B860
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:27:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t15v3QjfzDqjn
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:27:15 +1100 (AEDT)
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
 header.s=fm1 header.b=LgDNDX78; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TTPR7lu2; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t15K3nnWzDq67
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:26:45 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D9D15C00E0
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:26:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 01 Apr 2020 18:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm1; bh=mX4X30RNamhxWmtrBnJUy0jwvQsyhozwSJuort+xoas=; b=LgDNDX78
 XLUFDhPK7jKkQxoWYuTdMQBUM5z85JDIXV7e7wBCIzW8EzgEUPSx+2DOJyD2wY7Y
 rBtF8loHoI2wARbQ0ir+rGOXBWOfRyOM+90Z1+8M4N3tBvnowTt+K4njuJQoiFHe
 fyO1lw1VJSi88lxCL0L/HsB216xgvCxLJvX6tbqGjBzo4Duko+JF0SuPwqWvsuEC
 XRRHkHSY+6mJvbGpqqFvmsCSwfoFwVscnx82ZNX14PbNwv8GLvtwcK0vl7mBxyE2
 dvtvNXgstH+MqnTObgD1yAf5NUcCCpCOlvU7ulCkRi2mGhxViymoN1rkbxWRylDd
 /0x6nR+ux0r57w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=mX4X30RNamhxWmtrBnJUy0jwvQsyh
 ozwSJuort+xoas=; b=TTPR7lu2Y2UCBYLw0g1t+Sf8HzN5GoLDFFv0IJIMnK9xC
 kcj+450iV4fc0tK2/vstBXAIKRXKq/wuV8DmDGXQJPJ3Rii9a1+9foAjh6jhpOMf
 0rvSh486pGaAfYFZ4tbRx35o07s87MLEYTWqEOGuohsAZzZozB/6bOKxFyZCPWap
 mzhmof4tOpA3u0yD3H6m7qQ/sutWkrVNRsUTmFjWMFDQZ6F1AYDb08UA8nTJWvST
 Y/4na6WQzNFj0S0mYToCwWuEibCJb9PfNdtKlM6HvYp3Z4ylKx4sw5ebxtgLbeEm
 92oF45WKqt/+lMaA01RDnW30orKg0yuQpd3pMSWTA==
X-ME-Sender: <xms:IhWFXt9Kf9XLBSetHaBcrN40LeFYzupqNMjeT6GM4tqO7_624Q8bag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfggtggusehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
 shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucfkphepjeeirddvhedtrdekge
 drvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:IhWFXnPRlfL27A111M8eiOGOTip4Rf574Qa8HdPlPuvl-73ZBASMpw>
 <xmx:IhWFXqFR-t60GJKke-hHSii9wqeEk55GvL3p4-EnblJiobEJyEWFaA>
 <xmx:IhWFXlx18H1LeR6Wpm-z5iFk3rhVR8cUXRlD_ipUaTsARGcrByYLCQ>
 <xmx:IxWFXvqCMHtfzbTghPY1V9VtEEo8vGtOC1z-ieuP9fuCRJE1T9qwEw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92CAD306CD45
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:26:42 -0400 (EDT)
Date: Wed, 1 Apr 2020 17:26:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: meta-intel MAINTAINERS
Message-ID: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Can we get a MAINTAINERS file added for meta-intel?  There isn't one now
and I'm not sure who should be added by default for any code reviews to
it.

--=20
Patrick Williams

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6FFR8ACgkQqwNHzC0A
wRn6LA//WDvo0ARxrPFNmMffzfh6uIjymdRrYnh77Pu+kdLpGNFEI0P0Rv0w5cFu
r4yxuMRlBmsu5UIaku0jSyCWhNEEBEzHelpurp53hv/HT43BDkPS5FpkddOfVGDV
N3AYtgqbQZdZAMrdDS6N4mofJCmPAMnctlnphabUyQBAeLPwCC4PgesRT0btcean
+RTSQ8JOTZFE1xtYxb8816sjCn2N4dNK7+8RU68Vl8154jZt92A64FcpHrypfbbA
ZytlJSzve8gXqmrtj7J9HCXrn95rpevQP+LMgofy406CMU+j3mGdT4NRswLxezaI
4WIVFHhYGUPMj4vFNFpPpMCx0seBIG9qWnbUbIPQ5/5k0VfGYntIMJx3nuMIY1CT
G8IBS5fG2Fwj9rqkZlBhHBOr2cW0IffYKw+8k+/QIAy2IMcWV/jbJBpaU96nk/Oj
dzymigSY5J2EijjiLDXyaplM1VplBu4He2gRB3YwNwWOHWnqASyWBQcSfvAbg3sN
J+Mp5AfapsczxOUKf4kYKIs3ihKKyLaYtmEbrS1NrJ7+6Fb9sb6above1Yv/JJ2w
7p6KQlPms6W78EzqoV4vX4Q38TeyLGHvoQZcXOWfboBcPYH5ccp3Q8Iv2i3Dpt1b
CbzyMB0aquIDPLJW2zn6sXdbFpVPjOtDFD8jBRGCIkqpuWKCUTE=
=2/LG
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
