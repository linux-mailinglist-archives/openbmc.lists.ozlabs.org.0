Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043D1C7578
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 17:56:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HLn30tCjzDql9
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 01:56:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=PHsUpMAo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WJrU7Aqz; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HL3k5ZMRzDqVN
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 01:24:17 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4321E799;
 Wed,  6 May 2020 11:24:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 06 May 2020 11:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xTGRKS54hLFwyBnMl009JKcintn
 GlG44nDbNDs4Ki78=; b=PHsUpMAotfIobUHijnXaaTyBwuoCMiLa3hVwpj4KdhY
 YZE+DFipR1L9nmmvu8u9AWhIB+7R2bAuUhvIBOZ1ovxmRP+Ov4P2ItWMypnDvYd7
 w++LesjyK3NH2KdCcI+16VEqWGukmpJa6YWJhbh0JymS7sEjN/ey3jarT1DVl0LH
 OO6v4cnUBBJjL6XYBpN/fatYme+qUrtiRwg+Sh/PBu4ysC1dM3Egq3dAAA4yJi6B
 JqE7w2tCZcgPvaF1f6HOQmYFik4MPmbyiGDSzGAuQznYv41RFUXAjfBNDa0152gu
 AjUnYYHQjq548RSMnKvgNLoN01m2BNFF3f9+028WiyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xTGRKS
 54hLFwyBnMl009JKcintnGlG44nDbNDs4Ki78=; b=WJrU7Aqz/BXHdEMnh+ZskL
 AQaP3x9u+LIRtDx4dMQhq8Yfgc9PZ5bNJQKil5GI/i7/hCMOSo0uUnK9KmUNODiY
 aHC/rg5lHf4JCUZ3ojWKNmLg1QV9Gu8PcAPQksYiWsDSyQ4c423pq52emphP90gF
 9tcEJLswnemql8YUOgsxFDL2uQSUmmxz+9LFa6IZBTf7+Hjvx+5uwPWYYXgBWU+r
 G5mPh3ZPK2bixRxd7s5MwOLwTFceRn6O3XUxYclE9PdDdx8SkVmXmGPCIN1Bl+F8
 5Oz2kNh8Eafqipf33qFINC5cWql+HAmEjdmiv6SkQdGWLJZYLCK3OKlfta89LaZQ
 ==
X-ME-Sender: <xms:nNayXqooKCI8QZF0Hd2rcuYEezuiJxmgJnWcsFmUUDW0_-s8mYuJvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeikeduteejleekfeeufefgfeffjeef
 tdfhheevteeliefhleevudelueehgfejhfenucffohhmrghinhepfhhrvggvuggvshhkth
 hophdrohhrghenucfkphepudeiiedrudejiedruddvuddrkedvnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:nNayXoEwwaM2LR3AZbUdQcU43hSG0lzmH9v2x8djVFf2GZ6irUZwvg>
 <xmx:nNayXgSS7HPTZvvgcNbON_j1QaVYg4Cr3z-wls4R4XaVzwSCErqyUg>
 <xmx:nNayXuM2RC7UTdMONE21WE6lMSJng3u6dZ0IXVkqrV3LPNHz_1gPbQ>
 <xmx:nNayXj7q8vb6tNJdcvZDEruo-26yEEKymWW2pg1NLHq3PvS7JBqPag>
Received: from localhost (mobile-166-176-121-82.mycingular.net
 [166.176.121.82])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3CEF3066115;
 Wed,  6 May 2020 11:24:11 -0400 (EDT)
Date: Wed, 6 May 2020 10:24:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
Message-ID: <20200506152410.GA4865@heinlein>
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
 <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
 <7c9a2b08-1224-9828-9175-41566532602a@intel.com>
 <1f8f6dd4-c62e-7165-c1ba-7466e407d594@linux.vnet.ibm.com>
 <35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com>
 <d523bbb9-59a4-4b15-6527-68f842c0f3ec@linux.vnet.ibm.com>
 <cae1cc3d-b4f3-ac09-e023-b469b45cc478@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <cae1cc3d-b4f3-ac09-e023-b469b45cc478@intel.com>
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
Cc: openbmc@lists.ozlabs.org, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 09:14:05AM -0700, Johnathan Mantey wrote:
> Ratan,
>=20
> We're not using Windows. What is the Linux kernel/systemd going to do
> for the Metric? So far the only value that has been applied to the
> Metric is "0" (assigned by ??). As the Microsoft article points out,
> using a low value Metric for "private" nets is to be avoided.
> Our DHCP servers are supplying a Metric value of 1024. I'm sure other
> network managers use different values.
> I don't know how to solve this issue. Especially for the IPMI use case
> of assigning a static address. IPMI doesn't have the ability to assign
> metric values. At least with Redfish we can have that feature added.

Lower metric values have priority (0 is most preferred).  By default
systemd-networkd sets DHCP routes to 1024 per [1].  You can set an=20
alternative RouteMetric in a systemd-networkd network file to set up
a different preference.

I do this to automatically tether my phone to my computer when I
plug it in directly and prefer the network routes provided by the phone
by setting RouteMetric to 512:

```
$ cat /etc/systemd/network/30-iphone.network
[Match]
Name=3Diphone0

[Network]
DHCP=3Dyes

[DHCPv4]
RouteMetric=3D512
```

[1]: https://www.freedesktop.org/software/systemd/man/systemd.network.html#=
UseRoutes=3D
[2]: https://www.freedesktop.org/software/systemd/man/systemd.network.html#=
RouteMetric=3D

--=20
Patrick Williams

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6y1pgACgkQqwNHzC0A
wRl1HhAAlHAk10XdoJ/AP+jGWfOwcXM/nwkykL+Zz/q5PK6DIjwYiHU4BVj0ObN9
RcwMqJ5GV3i4Adzrcm4C8uNlkgCu2ZuUFfIWV+EjzHMGwyD7XVgtL2gnriLhmEZb
9OMoaACuyRba9JwXDFcoioChzHzJ7hMFRQMjF+YbujB1jygn964xM5UfHVTE1XEk
5th/FgF3NVTJHLkzpQ9bxccBBAYntYj8NKK25Mkt1owpnVY/98AvWJksMMaFdKNV
KTkahwjQYh6Csiatq3EnatX4J50ecdPIl39PhPxj2aGc56OrSWVXVqo67MtLq+1s
VXnV6FKdwQ8RXTObnRDM3hTKz0rBFXxZpJJKflH+ZTZM7yEJfgO5i4Nec0x/h4aX
lXH2WTbXNn2znsmvslnV2GFQJjT1xhYnz90WfkRGKvfn1XWRlFF+8urlW3TTnxb1
UWZYZNA44vYWAYYAvETidxX1iG5x1YDMfHLnpcm5qsQ7mfKJWGn5O5PoYZ54ak0Q
UJart6XyOMj+1Ezlrb6OKYGcswfqpdwEAabZN1O/Gxr36RTR+Ej5Yq5T+vp4rmw+
occZ4UrzTElwAt3qzeGMbmVFRDGMqPtG46zMpUbLzHe+9atbSnoeRMA7DeUhMGU6
JzNCRoeTitfm4oYwhsPMoZliJSHVAlJvTe15s+Uvqzap5JvGwYg=
=MspN
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
