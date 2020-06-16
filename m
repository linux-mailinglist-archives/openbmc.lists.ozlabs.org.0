Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F61FC03F
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:51:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mgND4wMSzDqwf
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 06:51:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=LkHwFbw/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Oh2D8u6V; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mgMB4C6czDqsb
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 06:50:29 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 82BAE588;
 Tue, 16 Jun 2020 16:50:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jun 2020 16:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jtyZ0AvGEdsfypSUOXcxHcczCbE
 /IgPB1igEnhXqL4I=; b=LkHwFbw/GH8bjA8lh6AgidAqAetP59isaAP2u42ZfuE
 SxaE5F7YpESdb7jXSJriX9mZwN/PhlWO5phFrjHsleFCiRRuQcnp+yev+wIWJM/E
 5db2ZXgBScBaphyQvHl3XTVbcNM6pzAxoPQjeiSm42EQvzWw9ICbY1lgw3FxOPjj
 8y8gQSBE6nc2+lKdxC3bNJ9sFzYDqLBIu2Aax1vT/Tk913Ca3XxSSY+xnhPgqqK3
 uVfAG2rktsZdou1zu9OZ8mVb7i1KRmVBFjeMsJQusur65tzO0s9T+Nv/eF3Q54oJ
 PvHfXtmYxkVEcGwGKyYydaOFBOD+g4Wxd5zKggOXNwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jtyZ0A
 vGEdsfypSUOXcxHcczCbE/IgPB1igEnhXqL4I=; b=Oh2D8u6VKpo+I8xNJM3vBA
 GULtuVog7wjxqYN4jwISa15PpbljFhLsgY2i4OMmHSnFDGX8PS0NDHvANvpkhNB7
 tPfoI3PqwU31pePi01sGORuoIG7X9KUV91VkdSz6n+A7DJ76OrncLwI6kjNyX7zj
 OjmVrIZg5LNOWeRse8n0PoZ80v98Xc0f3AzLDNNX3T9jI5/bmKpya+Mzdop10DAR
 d9heXeMvnk2RaIe1IVsE/AuzZBkOR6PdQF0kFRipWll4QY3xl3176Qs8fdpXvfUN
 HzjdiPlCUzPGNlYHz7bSIR2jqJ9CphDo5//jHEK8EWY9Cx96PYKOj/SHy3XtrwEQ
 ==
X-ME-Sender: <xms:jzDpXg-FaiQ1eBxB9diguJB-HQPK7H5-QDpiB2FenBPzG_UnVtbAiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtfeejteeutdefleefieeiveev
 keegueevtdevfeeivdfhieeuuefghfekledvhfenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jzDpXos9sCgERTyWgpMVsv2RtiePsP1xUyzPGkCH3LRaNgM8LIqyfQ>
 <xmx:jzDpXmBu2ed8qzDkLwnyc9COJQChei8RpYS7WMfEvNThfjrxEAJ0fw>
 <xmx:jzDpXgerIVZFawpRaXHFQpp_mmGLs3vTLBzcG7oQX2Gk96Nytx8tuA>
 <xmx:kTDpXsZ2zF7t1MeShYh_szRxZf8xsjk1xExoZ8uhwQyyrqLNR7ciiQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9739C3061CB6;
 Tue, 16 Jun 2020 16:50:23 -0400 (EDT)
Date: Tue, 16 Jun 2020 15:50:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Message registries continuation
Message-ID: <20200616205022.GD4618@heinlein>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline
In-Reply-To: <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
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
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 01:39:18PM -0700, James Feist wrote:
> On 6/16/2020 12:47 PM, Matt Spinler wrote:
> > Also, it may be overkill to need to=A0 read in the same registry for ev=
ery=20
> > language, as there could
> > be dozens and realistically they will never all be used on a single=20
> > system, but if the desire is only
> > to load them at startup before the current language is known I don't=20
> > really see a way around it.
>=20
> I think this would require a default language and a bmcweb reload if the=
=20
> language changed? Its probably ok to change languages after startup, as=
=20
> long as the default language is loaded immediately to lower the chances=
=20
> of run-time issues. As changing languages is probably a very infrequent=
=20
> operation.

Couldn't two users of the same machine request / require different
languages?  I know that any machine used by the Australian developers on
this project I'd need to change the settings on so that I get the proper
spelling of color.

--=20
Patrick Williams

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7pMIwACgkQqwNHzC0A
wRmQaw/+OgYqDv3SkZxXle81o7oO+gkgUqJtNqD/wW8EdcYPgmPeHPxaxOjuKBLF
qS1rYsxrgHOdjW8q3bKGTpPNyCE2PITatwUKnJtcJrrsd8+f9+8oEWukK3hhbH3n
BzfDF9J17MP8Gism6/iEkf5Er4GbCH3m9DG99Nk/91csk1RwVposIss3crt//Faw
OkPoZwb25z/T4Tsh55Y+MqaEAndql+N0j6zI6zaRQyTJsHudNCrTc9HiwrerYAlA
Gog/hSEagOVvS0FlwD/sW/C2gmYL9/el1XWrzfRkfhc87nPkZur6HoQ+4lNFYfK4
4h1K4Qi94ywK3A0t6lMWhNarVQ9fKQcX8KfywfLHJpqBdMmHs0+QwGrlljYP6m/y
YB9avTmQoueczKU/p/LAGYSR1GvJR8QtOchOO+TdxkOh1YHywLzNBb8FSdpQ/q3y
9ohjV7JhXicYnjVgoyxdbwefkdVlDbqD8jvHE0wOSInNmgDHPLDaJSvbEpVza5AM
RPKM5Qab9wdiLghd1d2L/UaNyuijneunK7xDU7f8sv+7MKX2Hvec2qSiqztolAu2
sJkL7NEmXXzoOntQWFb/7CzQdULQ0GUC/lGJbQzDqBnTG/VDD/cAggd41MrNmVhq
Mcz/EdtBOKwp7Q5oGr0QQipHNUNBP0nYSn7CRC/2xyqcAefgk/4=
=ExkE
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
