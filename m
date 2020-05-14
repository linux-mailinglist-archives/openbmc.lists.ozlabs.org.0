Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5381D31F7
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:58:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCmt1qXDzDqft
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:58:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=oN2LiJth; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=yej5M4rA; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NClq3D7CzDqcg
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:57:27 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8303AC13;
 Thu, 14 May 2020 09:57:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 14 May 2020 09:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cSfAm5suiHAWJ3WP/DPf2u5PCyR
 hLG8L8zRnbMkXPdo=; b=oN2LiJthX9jV+izCAOtcSlFBP/XfsWvq/BNh2U2qZOG
 /ptKO9qSSOchboqFvHpyx5p/LEvOqRydIydxniVS8ty4tADT9/H5iK69aga4oAcz
 iAzqNAbdSkrvBAQyEwqemqDnAW4jPyHi2RAD7SDWO1Zk0XyXDIvLSCaO8v7SPNe2
 IklxwsJEDrMH+xGt4Sp4ugw8hgYI2lqMGHg1YPoRz+KloTpHzqwul8kc9yL84NUh
 Tiyb9QxYwdmmmnx576l+vVo7lbaqVaAujkyVn5AAaSj1+A63iUSPZliGp3Wb7cyr
 0u1K7jHqNbtnQoPajyjR5Kqrg6eswcnMgcg46u1/ggA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cSfAm5
 suiHAWJ3WP/DPf2u5PCyRhLG8L8zRnbMkXPdo=; b=yej5M4rAcLgExv86WufuiI
 WV3oyTLZqIHJfwXeGW3Y8wCcaJ2rRBH1tFqWxNTvcqUblh3hFzvFij3byayLIdSe
 yFIm2HWqZrgkdpnJnTVnRrCNBPkeEIXS3yT0EZBT/kwn39k1XJeln7DwGFMBAjC5
 OOxdX7CmWL/uFqnW86C3gYrTVnLX1YonUm7R0dQ8A5dIMAVDfPBQnX9XuGbmtYva
 dkH/dD19bfHkaEUDN0KuQgrmrFZhRXekAgTeiDPu1zierNIH+Qscz/jDh1w3XjGL
 nPq7yx473u9cc0PyQwofKLkyI2rCa09l+MaoNTXijLb+flMJnC1B5re6itsLBAkw
 ==
X-ME-Sender: <xms:Q069XmKsag7XzpiJh_SY7PyZqy_V5Tc8lutmHrU-CgqH5KSv_R4atg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejiedruddvtddrud
 ehvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:RE69XuKNmShdwNbS6M85_ZGA66oTd4_bQi2oeEzvrfSCld83DTOODQ>
 <xmx:RE69XmvNkv6i_k6HQ_gMTxEOLqKzxCDIs6tFh74Qcq0Ce3jtfTx7WQ>
 <xmx:RE69XrYEl7bofPfQEjdyJ1HCkNZE4ZnTe9YmqlVMPD6J0ineqvzARQ>
 <xmx:RE69XmmBS3HS_0AGFRALY2b3FlkJDxs7W9l4e62xOMMVNsXRsCz4hA>
Received: from localhost (mobile-166-176-120-152.mycingular.net
 [166.176.120.152])
 by mail.messagingengine.com (Postfix) with ESMTPA id B456C3060F9B;
 Thu, 14 May 2020 09:57:23 -0400 (EDT)
Date: Thu, 14 May 2020 08:57:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sui Chen <suichen6@gmail.com>
Subject: Re: An IPMI Request Visualization Tool
Message-ID: <20200514135723.GE1166713@heinlein>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 03:38:47PM -0700, Sui Chen wrote:
> We're working on a GUI tool that allows the user to capture and visualize
> BMC IPMI requests.
>=20
> The tool accepts 2 kinds of inputs:
>  1) Load a DBus traffic dump file generated by dbus-monitor on the BMC
>  2) Capture IPMI requests on the BMC -- the tool connects to the BMC
> console by launching a program of the the user's choice (example: ssh or
> telnet), then starts "dbus-monitor" on the BMC and checks its outputs for=
 DBus
> calls on the IPMI daemon and then draws the IPMI requests on the canvas
> accordingly.
=20
> A screenshot is attached to illustrate what it does:
> [image: scrnshot_compressed.png]

Neat.  I wonder if we can use this to analyse dbus messages with high
amounts of latency (especially once that are infrequently latent) in
order to better target which processes we should move towards async
calls.

--=20
Patrick Williams

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl69TkIACgkQqwNHzC0A
wRlz8Q/9EMZPsRstTUoxYd7R3IgXyoSylNQz9sw3nJhIknKR5W6x9jSeRfs8HHSl
tcyN8gw+gLYnQwfVBrTpKMjvA5dk/4dTqjGztsHyM/2wdAnOezyU7xjHrpN4Mpbn
kWIkRk9teVDU3toAz3JJu0LZbbDmd2kJ1yameyBIU7pFanVmfEuJDml00o+rgxHo
kwTTegeuwSBtwwtYHGKM4plHRvYfsn+3xYoecmOOqlRTqx7om5W4AXaVLrE9FSAS
X2iBwV3j/TMrvR0ZtwAVk6csAXq0z4Hla0tJl4Cx7HxsnrtFonwpFfh0TN5tFNy5
mbRMTr+W7y0+lyF3DoGNPiBv9WfvoD1xljmXpV2xW9OMh121VViZzir3bJKSQX8M
fdz7IWjRq3BzkKYoubp2hbE0aP7aGvmnf3WRr2PhK4f3Q60pjvEyMFiPizVuQ2R5
r+wyMCBPAmltpH7+Dcyllwewix9Re+/AREiK+TSajyhSIFctiB6oCYv8RdN98VEo
Rrq4+ZJaY0ylXOXy/WMJ2qsbrUk+yTAeeDtN9GMzUx2kAPzSQdVnwunPIKgrSlRe
mM+Yq59aCTkYBe+7vOMDuGTlCaBH7O4yv1GJMrRSLrOTlV1YawhT7moyvgrQ5Ps7
0gz0eN1VLPdynSkxYjcLWxW/W+F6H4k54qVPvi3AKjAUpqU3BhQ=
=ARSB
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
