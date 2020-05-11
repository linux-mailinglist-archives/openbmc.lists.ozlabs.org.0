Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5F1CDDE0
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:56:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPCk1HqczDqQS
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:56:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=oWY/5q87; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GYZYOf3y; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LLgb2CpmzDqNd
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 23:02:19 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7BFBA2AF;
 Mon, 11 May 2020 09:02:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 11 May 2020 09:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=mTVVMXHrp9Rq0T/JD7UPmstSKDn
 pB+fuqPeO1bQ5fVg=; b=oWY/5q87uWN6do9V3YzuTxt7rzUqQTK6MCXpDztV74S
 xowaNpJuoDUGRDZxAaRUTsTTi1UENxMtk5RtYZvLKv19NwW43eg5W9lL0ShcnIT1
 +YLp8pTs8bfDCtqVD1IWLrzkzdIHf62CMpSWjlXnKRFsr4GRZEAN3xE9oe2KssF+
 FmOIGZJrB3Gfz4TZaORQRSiOrJzkyvbg4RVJi/Q2QQofp79W7tjT7YzRNFsOupKM
 ypwbGrf/6N/vdI12T1GgoeGbXjTCwMHt3MLJJbKCZnlpHIhJqntFq0GkSDvKXgI5
 971GJemv3yg7dsy0Y+RjER0M5+VvaVParmSiukKRhCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mTVVMX
 Hrp9Rq0T/JD7UPmstSKDnpB+fuqPeO1bQ5fVg=; b=GYZYOf3yk+1NRi5ewMcRR3
 Cah2paglXuJ6HjUwOcIq9aDXacEFiId0SNL6X7kK4AMAEASVavol2UuU4mhVfEob
 bnpsQsw6BCkNNsli3jswxrzT9YR1UZnn9XEfi0yo1h/vBfgpYbe0obz5LAWrS+wM
 Aq85udaVicmq8WJPG9BuGLAWSUe1GTKBrD22f+nY3jUT28trJaWW37OSmbVmALkA
 Jmjrt7xS1hecDEP2xHGXLrkxJIq574tMOx84qah05c4OUHkJCQnrAh8yOvMvaX7J
 PUnTCZsTLnvhCkauNY0cIJqYo9IpdKMDWFnglAK+sVObiiySNUzsIRf5rOkS5pvg
 ==
X-ME-Sender: <xms:1ky5XpgfJOyCOLhG9pFq_k-bIf4ApszUglKO9HsfoCG699rIMH_IoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucfk
 phepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:1ky5XrbbAUytArlsFVH6DX_WXwHz2c_qlA_OvM274dqsD_0NFCIkUQ>
 <xmx:1ky5XgaI-kATBUVy3W6H0fYQyOlSMpVhQsTcT_oPZX6iFrFQT74vyQ>
 <xmx:1ky5Xoy3Ke75pSZfEOYGzWo4GWYXRkA-LF4KaW2dmuzcf_lsS_hUqA>
 <xmx:10y5XhJgBbv67NrKO23G9x6EJeU-O8mq8e2jfMWsh4zYMIjJAsxxjA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 771473280065;
 Mon, 11 May 2020 09:02:13 -0400 (EDT)
Date: Mon, 11 May 2020 08:02:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lee Fisher <lee@preossec.com>
Subject: Re: Update tools (fwupd, swupdate, ...)
Message-ID: <20200511130209.GC10214@heinlein>
References: <703ee8c0b9265cdae7fa7fc2583be04e@linux.vnet.ibm.com>
 <cc83fa1c-1133-4357-ac04-31068c2ce859@www.fastmail.com>
 <b9642f30-158e-cc13-38ce-d55392f938cb@preossec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <b9642f30-158e-cc13-38ce-d55392f938cb@preossec.com>
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


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 07:16:34AM -0700, Lee Fisher wrote:
> On 5/7/20 9:16 PM, Andrew Jeffery wrote:
>=20
> > On Fri, 8 May 2020, at 03:33, Adriana Kobylak wrote:
> These days, you should not buy a Linux system if it isn't supported by
> FWupd.
>=20

As an end user, I Like fwupd.  It recently told me about a firmware
update for my mouse that I didn't realize even had firmware.  Alright,
everything has firmware but I would have never looked for a security
firmware update to my mouse.

> If OpenBMC doesn't support FWUpd they'll need to duplicate most of the
> infra that FWUpd has.
>=20
> Having OpenBMC support FWupd would be a very good security feature.

I would be curious about how fwupd plans to support enterprise-level
deployments in the long term.  As it stands right now, I don't see a lot
of value for fwupd for any large system deployment.  I bet most large
deployments already have their own firmware update infrastructure
anyhow.

Some features that seem to be missing from a large deployment
perspective:

- Private repository.
    * When we are in development we have unannounced systems with
      unannounced hardware (IO cards, processors, etc.).  We couldn't
      push our images to a public repository at that point, but would
      want to update the same way we eventually would in production.

- Individual signing keys.
    * Even if an image comes from a vendor, for security reasons we
      would want to sign it with our own signing keys.

- Large-scale roll-back.
    * fwupd does have roll-back at an individual system level.  Can you
      can you do it for a whole deployment?  (It seems like roll-back
      only works if the end-device has room to save the roll-back
      image?)

- Continuous deployment techniques:
    - Test cluster deployment.
        * How do I create a test cluster that gets firmware updates
          earlier for qualification purposes?
    - Blue-green deployment.
        * How do I limit the roll-out updates so my whole deployment
          doesn't get updated at once?

I can understand how it would look promising from a hardware vendor
perspective and when I worked at a hardware vendor I often wondered
"why can't we get our customers to update to our latest and greatest
code quicker?"  The answer is that an organization of any size and
history has been bitten by a firmware update at some point and put in
their own processes and infrastructure for managing firmware updates.
Unless fwupd can facilitate those processes, there probably won't be
much uptake from large deployments.  Even if it can, there ends up being
some legacy infrastructure that would need to be migrated from.

--=20
Patrick Williams

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl65TM8ACgkQqwNHzC0A
wRkynA//aOnWTCszkyOXbmJDaKnv3AWkslO+boItnJiVjMdoYxCj5bYddSRx9ivx
wh/d4nCuGzEBBsghmawnb9rAHRZkcLgKmYNUlsbC625M8abA6ApXSOUNLYzlhxYf
v34b473Jq5cPWtbayRcdFnR9Nxa4cuW3BP2Ep1AjnPGdXN2IuHJnH59rh/+SKhIG
Ei+LpSdAqYuNmNMAnWxeCy+iuJIt8CJd/ft7NQCyR+lyno+ybMmbyOpkLZPtwwnh
OGe9U/1l6kIw8idcr0q14PO6tWe0RSVQsLhwqQJTS374qgokSRgPXIcZSkVZS4Yz
gZJfp7mep5w7ViWRVenN5968jnSW5xPa5v4HE+DURRdq5ynmGUdWZxyezVV77uP4
vQqy6Bn6dGpex0y5+efy6gP5n9RyoHhLWcgh9LCtJu3lNTd4Om2gmyE7oynnoA2t
am5oe9MQP+Gw7aqGcTFqBX8hHA9ywHy36MoSqm5hbQFZZIftfPUko9PgC3e6OPvP
nE13D+YuJve0VsQXyM2b0hRhyxaRqHDO9rpDBbR4yjZgkAiqNDXbsLq21xbAm+E9
muHKbgF5MQCbKtTVLPNzDHvBIJEaBbWU80cYcTmUTiHvsSqZQY1SZFX1s9RcbNXR
dXnTu65vISpkZRdIJmL+nryvHqm7ezQ/Q/jkikApVWXCMh150WI=
=OkhH
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
