Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC479212EFD
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 23:43:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yWmn0pz2zDqpy
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 07:43:21 +1000 (AEST)
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
 header.s=fm2 header.b=LoQr1DgW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Vg8mfXAb; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yWm130D9zDqLZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 07:42:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9ED2C5C01B6;
 Thu,  2 Jul 2020 17:42:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 02 Jul 2020 17:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jvoNeWiOLZP3tofrgY52jR58gLP
 9XQCWCtmsV3YUBqE=; b=LoQr1DgWOFxfjngbYQp3qTyCpSK5z5wyVHh5O6ZQeza
 Wn7+QKbKiynGw7tw2DQpQlUf7oiehtKkeOCg2/RjpZLIGJS2RCQeVL9XOqMsJe6I
 qBApxebLAKu9fKojSpocvQd1f+mkIWis+i1LB70yVED3IdnkaXLZxifNBKN9pBSU
 mV6CLC2GBumFGH42RT/AzSCQVm1vFkKf8KEOCltTPSrGjhL7LAiKP1ylgI2C/i6X
 tKjAq883J/PFeSb0ZZ862mo3Bvb6PdMYXWzXL0YbZrY2sz4qKlmc0blIuljp4hUs
 dDBM8X9sVQQkMUzIeIiqI51rZE1ViUo99l8dBgs2wHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jvoNeW
 iOLZP3tofrgY52jR58gLP9XQCWCtmsV3YUBqE=; b=Vg8mfXAbGnnSSUqSOAduT3
 i8H6NsTST39yotwaQq5C5J4k04jD+KfscfeRKkyUnPKiccdUWP14xcX+Q1s7ew+0
 IBkxwBIwMUqQmTviFly22yKyfRXaqdXUbL45b/XDY35NX2q3nyan/+LEnWCHXc8n
 DLsAXaLKbXZ/usrX/2ERpRPyOrHcKSlNi7a9PJ7i7GHNGh6ItFFvzfETxnWVwS/G
 p+4TcvroE0wPSHCoABk2sEfZiV4CWjk4UoMUed1Rz/cd6JB2uAYuEo4v7/VzJx3D
 FDz7AwoA6v3ovJGCWbqng0H8ETKYIWxTNinHqjzeWqPnnHrObM4paLdVthyaMtMA
 ==
X-ME-Sender: <xms:zlT-XmgX69_VyWEKmQ2AUyvKMPu0JXuNQTkahluF8vmv0rokUXFY5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhluc
 fvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfh
 rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
 drgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueejhefhtdel
 udefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojh
 gvtghtrdighiiinecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:zlT-XnCD9pk6KfQVLOUqZrMhVYOL3cr3K4YkLtqFCPg0r5nbbnJ5Mg>
 <xmx:zlT-XuHurEo2HCjpGa5_CbLqQKtu0-WveeVsnH2tg-uOaepDpjYtLA>
 <xmx:zlT-XvRHj8Sp2uGvqTb8TkLj9iTFJKtvo3G_C5EzMw9RhzCnO1_30Q>
 <xmx:zlT-Xi8HMGf_BFX9XBO6yfub_Zg4TfHtaVKPCmBSSmvfqz8OqUcutQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 379163280060;
 Thu,  2 Jul 2020 17:42:38 -0400 (EDT)
Date: Thu, 2 Jul 2020 16:42:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Weird build dependency issue causing missing symbols
Message-ID: <20200702214237.GE3922@heinlein>
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline
In-Reply-To: <20200702213328.GD3922@heinlein>
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


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 04:33:28PM -0500, Patrick Williams wrote:
> On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
> > We have narrowed this down to being caused by two separate issues:
> > 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change th=
e=20
> > order of the PropertiesVariant in server.hpp.
>=20
> This sounds like a bug in sdbus++.  We should be sorting the variant
> parameters or issuing them in array order.  I'll look into it.

sdbus++: server: fix PropertyVariant order
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/34344

--=20
Patrick Williams

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7+VMwACgkQqwNHzC0A
wRnlcA/+JtGZ4Mz+lcRXQXJETkaqyMaTS8ryy+A1iDKLT0T29WEmbVe/dEspCwbj
xQ9GdLZGnzp1CbjeUZZSoiNkCm+5JC+1sf5efX43EraWwt0J54+yno8wamgsP6rv
3jIFiCN4ZS2AhbfNit+G53Y9TswJbb3Srt+XAtjKwRn+Epm7pQAOUy+l8T8QCpj+
/npfIGkwdk5bs2d7rzTfgYfDWbBYgjIPX0eJ5o4wlKXH9Q6+jCS+sPNzdek12+qY
HQdgYX8YlzcfrELG3D/2Dtes7o+ZBqdio+cKVyiH4/zGKYgVQZZ6cm7HUmA4ryyT
ceAZTu+W5Rtpv3PTJhw9p4TJJ7RqTqWEFZU3Xs12qzR94ozNuY+n8B9b3SnSN3Yv
nV/jVOVu7k+zmAV3pxlsQXK05iuThhdt4ClGt7iYZNrpcrQ9SShrjWgETl6OGnve
amwDv4SuopEnzDkK7RbM0bLdMOo81/ZcvnqTxkccL+XOXoaczt6RWAk4vnGHyJ5+
d8K3GLVkmTyB7wgCiOI8yCKXVLnRfIN2LuVFQnbK/YjayRsty+M0UmgIIq09D/T8
4RHRtIua0Q1g21Vhe6Rf4vrqBxo6R9YEpjFMIZRd+mSVV8nP8LjA/BVZN9ppp0Vc
mti0O2KS62gH6zsQOUKXMA1iB/FKTQ28VdLDnVroRfDswWQy4tM=
=ux8Z
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
