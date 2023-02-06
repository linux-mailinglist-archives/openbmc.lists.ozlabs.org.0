Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281068C224
	for <lists+openbmc@lfdr.de>; Mon,  6 Feb 2023 16:48:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9Vz62jrcz3cd8
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 02:48:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=oQNrNkvv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fEljSfxO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=oQNrNkvv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fEljSfxO;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9VyQ5444z3c7s
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 02:47:41 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 6F95C320095F;
	Mon,  6 Feb 2023 10:47:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 06 Feb 2023 10:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675698457; x=1675784857; bh=ma5kricEUc
	FK1TEnP7RBws19Oc88J25/tLW3PsOWSgY=; b=oQNrNkvvdJ2H5GDttnhiwahx0r
	TNyrohY9vSqVrsqFbzdH4kNBPKU0b+sflv6/gPymHQ4H7S8WXuKiwsLrhc97wZ/W
	C2fTC/gXNCRp3AZV4tL6n455jQ8tTfAsFrBlnAFlHevMVs7oBE0S+gJRBtk7xPQb
	NVmGmaHxzhg5ZBb4qfjtBXZC9Mg/3yvWoZpWkWG3V7wamknELzKCg4ddKex47i6y
	V/lsAv8uaqZ+L+Ya0jEXxkFr+PAl8iqhE5qM1ZZKu3kHGBSsTUdojiRTzGAmMHmD
	hbnLZ4Q93x5XbVBr8BebXZEZRXCtabmb5RU6iY+1oiWFLjZCSS6MPSifKEfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675698457; x=1675784857; bh=ma5kricEUcFK1TEnP7RBws19Oc88
	J25/tLW3PsOWSgY=; b=fEljSfxOr4AAAHSJIMReoDlq0Sl80EjKVNls2uwS6XKS
	qH7FIjLG9CJr+D8dUmYJBSq+BAVpkXpbxsUUZpxx6+H4FFr82lBkm03AJOoZJMHP
	53+LiWu5MzQ6D6PkZhIrusSCP8+odGpnjxzp6L3Kp9HBIf5cGamAoPMkWNl+YClo
	QXBFTj9lb0C0Wyo/WijScKK0jaMk34JTay/zlTs3I533b3+MB7y6l8wjvlPEiZgd
	f9YzWwGsgvrjN/HFpVu1H/M/XjRGfp1WEPuXrWDvoy9xvb5Sv3zTz2hdiFRyD06D
	g+QrmT2RukCVTi+ttGnFvfRHYeHe3Pxs8sr8dF2PeQ==
X-ME-Sender: <xms:GCHhY_0DNTqMO9mwQ_r_7Dqkv8Lm1lc9gw_dJpxmrSHSOUCn0F65_Q>
    <xme:GCHhY-EcWsUpWLsTtOtarptxt1jZ4cwzCjNQl6WfU3HtDqnOl7sPGUbl7LCfSaVDD
    yZ7oaHwUsvecQFx8ZU>
X-ME-Received: <xmr:GCHhY_7JHLJtxOwlJ0415lIivyPDCILbIB8Jh-bDU7FH5PP6ruUWokAGS3lavSy65_Jb9GO3xfGwyTYGrxua2roDNMpKpUBocBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegiedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegieevuedufedvgeetleekkefh
    jefgieeilefhtdegvdehkeffkeduvdfhfffhheenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:GCHhY02hx3JNNTRs1a3drbgEWhlAI5z8TMDKCOh7dk85QsW4fve_FQ>
    <xmx:GCHhYyGgKu8XmzyxT0l4pDIZ36gRjaep55tFaA-MNlONmU5hxWFDYQ>
    <xmx:GCHhY19wVt6NcUJWMMXx0-sypQwjuUi7Nu33YnB8iQRxPNjYqkShdQ>
    <xmx:GSHhY9PoLfP_MgnoM3xHg9jswKOQzLuxnyhWwuD8WE2e0OmcIrQZBA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Feb 2023 10:47:36 -0500 (EST)
Date: Mon, 6 Feb 2023 09:47:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: Support hardware watchdog for openbmc
Message-ID: <Y+EhF3fmwMVifi/0@heinlein.taila677.ts.net>
References: <PSAPR04MB45984F24B7B54446B6DCBA78A5DA9@PSAPR04MB4598.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KOlHvWbgFyzfNoIX"
Content-Disposition: inline
In-Reply-To: <PSAPR04MB45984F24B7B54446B6DCBA78A5DA9@PSAPR04MB4598.apcprd04.prod.outlook.com>
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


--KOlHvWbgFyzfNoIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 08:11:41AM +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrot=
e:
> Dear OpenBMC members,
>=20
> We have implemented hardware watchdog for Facebook platform and we want t=
o promote
> it to meta-phosphor level. The implementation is adding systemd configura=
tion which will
> enable device 'dev/watchdog'. The BMC system will auto reboot when watchd=
og timeout.
>=20
> The implementation can be seen at the link: (gerrit number 59881)
> meta-phosphor: enable hardware watchdog (Ic46bcd9b) * Gerrit Code Review =
(openbmc.org)<https://gerrit.openbmc.org/c/openbmc/openbmc/+/59881>
>=20
> Please leave some comments if you have any opinion, thanks.
>=20
> Best Regards,
> Delphine CC Chiu

It does look like meta-google has some existing configuration we may
need to reconcile.  I added Willy and William to the commit for review
as well.  They (Google) chose 120s for the watchdog interval.  I don't
think we (Meta) care too much on the specific value chosen.

--=20
Patrick Williams

--KOlHvWbgFyzfNoIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPhIRUACgkQqwNHzC0A
wRlcpg//e76S0g4w6ufj5nRQG/fluBBNl0MHvUUd9Cs9JqlVr9/Ns8lKSI8zW+W4
odZJQEQI4iBWwBCpHiqSp6gn29pcoMPYLTvv984/LN4DfSTZ62Np5fXvJxwVnQcE
dope71nPLvBjAvWowpETtgq77D1uh7ZKxVAHBwyA/S8Om9ofp/3J7jBggoUefQmz
RDgb73tiu18xTj7PckHXz/EgpQHmG88Smk4c8JMYuxrTeVPvkoCMLFXhBo8iUUVA
wa0oHlFyj8YweSgY0PPVwKBpjjEAif2TJl76eNo2XdzmMqCuZcQKVw+bsBhQh4U9
6/Kc5LTMv5C6WJvHRq3dyDdZCZm0el5bbpavyWFJvBbHkcPHbzKmHVI5sEmUn/Ax
BaQ0D+QjT55IvCuMs39XStLQIdbxaL3+isyfm83PUEvzU02xMzyL9jL11rxr/IkS
Hq1npnc9qwWdf9BZz6fEiMIUc6dT0imM2J8Ud/zJZv6nRmy+lBB63ET/uGYtXBvO
J1vKYySRnWeUFAAXNSwFU5rHa8n5wBXKUcRtH5ZMfERv1mynqoqzCxStf0xSzOkl
lhYp0THfoZe1oKlTYfp1+1H0afgv6lXZU+DL3AZT/olNkblhuCLGTrmQjCWDV+VF
m6vsV9pwjY8I3y47YCte1q4t+7mrNUtKrhs9LYqrfCqxT95oVkQ=
=CNIf
-----END PGP SIGNATURE-----

--KOlHvWbgFyzfNoIX--
