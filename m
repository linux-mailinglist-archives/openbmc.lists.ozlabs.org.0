Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3DE489B7D
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:42:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXc4T3vMHz2yph
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:42:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=X0hR+nyk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SuBf6ev/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=X0hR+nyk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SuBf6ev/; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXc441XPcz2xBv
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:42:28 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B6C65C00B6;
 Mon, 10 Jan 2022 09:42:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 10 Jan 2022 09:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=U7PblR5d1jJxR9qW3UBgPwcRTm9
 gUDBs2UNTbgQ5xSw=; b=X0hR+nykdO8MGt8gOi9OXVCLjFkA77lFGCR6hK9CK7C
 0m/iB2mrIjVOSK+iLJZbgVceHIVExls/uyATFz3oJRIvNurWmXw/utLpIfbGvRJ1
 nPyAIMnAQkf2nT/CtJrBq1jm3qk1h0PM51ndj+h8a9uvHDTiCj1sJsWaXRc9WRQ1
 d58VKzC0TF7PdoY8d+OTslIGCbNRIcRUWptxlDw9FOqCO64u2aMzElhWz64JonJu
 Hj69yoZFrxbLahLmWYVDlDy3wRAwEzuGUIaYW+yjra9cg7XsMRbxPhhZR66aL4eD
 C7UqKp0dYxwyw3B4mNdqrhXwBzhp3zrswmRlcPE6I7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U7PblR
 5d1jJxR9qW3UBgPwcRTm9gUDBs2UNTbgQ5xSw=; b=SuBf6ev/HUQSl1+AJ3XATq
 KzgtCfA6g+bOItcqPnKdVxQImi8hwXsMvlzdzykoxanRAIbK5cYWIMTiACd920Ef
 sFor5dkNsP5vb0LHutPD9/R5mYuA0EPrDyDuOhKG+WlLyHkHu9+2idRitZIQHDMX
 e3Ip1G/C3YCfonyb1/hbBHbWBWev41qMLRZn71aF9nvRUCWxUfZr/cZbjxwheqEC
 BB1M7Eh+HGmCcG9RoOmEAfffzc4Oufia56BauZiKWttFXAxHtj241oqRrTgBd/pD
 T/wMeFWvESekGQZMbNoolLuvwPrC/c3gDkkrh8iHwv/UmMY9ARhhLKpX6uFIrGLg
 ==
X-ME-Sender: <xms:z0XcYb1VPtCPXDYI9Jgj9KO5leCR6XX9EXh32A2ICNfZM4KAIrabmA>
 <xme:z0XcYaFrxOM2xeJ3pSdJzPwXYqh80hBduSon1l_7dik73q61T4QFCkOWWb34IAI41
 YN4ttYXamTFgPpCOZU>
X-ME-Received: <xmr:z0XcYb7RIEE2_aaXFSxW439NXGrA-Rv__MBKklTtVftSiL_uNcrnMSC911_LSfBw-A-VdWaVpQKCRo6UDbbabjgpJZHyUq_GL6WkTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:z0XcYQ1udZvhHOpaqkz9oJztvYhMFsAveMExw0XhqyER7vpFe8xtTg>
 <xmx:z0XcYeFNH6h7XKsf-mrgajKFJmgGAwdhYQSbD96nnu5i-ZX1qpJ30g>
 <xmx:z0XcYR_rnh9K3AkAJfdlWaHWJuYj7Isx6ao-jY9BG8En-OTNXOKPdA>
 <xmx:z0XcYZMoQ0IQjO_qyjiZidod3xq6DYdXFki9-f6Ctu-lqCAk3dXF4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 09:42:23 -0500 (EST)
Date: Mon, 10 Jan 2022 08:42:21 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Derek Mantey <derekma@microsoft.com>
Subject: Re: Firmware update for auxiliary components
Message-ID: <YdxFza4Nd1us8BSy@heinlein>
References: <MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9@MW4PR21MB1922.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k5fgm5f1RN/OTzE3"
Content-Disposition: inline
In-Reply-To: <MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9@MW4PR21MB1922.namprd21.prod.outlook.com>
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


--k5fgm5f1RN/OTzE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 08, 2022 at 12:44:17AM +0000, Derek Mantey wrote:
> I am looking at enabling firmware updates for some auxiliary components i=
n our servers that don't fall into the "BMC", "Host" or "PSU" bucket.  I'm =
trying to understand if there is a pattern I am missing, what other people =
are doing, and the possibility of changing the design.
>=20
> Right now it looks like the path forward would be to extend the "Version.=
interface.yaml" in the "phosphor-dbus-interfaces" repo (https://github.com/=
openbmc/phosphor-dbus-interfaces/blob/6f69ae5b33ee224358cb4c2061f4ad44c6b36=
d70/xyz/openbmc_project/Software/Version.interface.yaml) and add new Versio=
nPurpose for each component.  Then update the Image Manager, Item Updater, =
BMCWeb, etc to handle the new component types.  This seems like this would =
be touching components up and down the stack just to extend.  Is there some=
 other pattern or way of extending the software manager to handle new compo=
nents?
>=20

I think you want to see the documents changed by these two commits:
- https://github.com/openbmc/phosphor-dbus-interfaces/commit/f05e2050dbba80=
d130fa87875448cf48e97ce7f6
- https://github.com/openbmc/phosphor-dbus-interfaces/commit/ac7adcb5471eed=
5eaa9474a697dc1db254fa9187

These are intended to take care of exactly the usage pattern you are asking
about.

> When I look at the design, it seems like using an enum for the "VersionPu=
rpose" is a little too restrictive.  It doesn't allow for other components =
to be added, other than the "Other" enum entry.  But there isn't an extende=
d purpose string to allow specifying what that "Other" value actually means=
=2E =20

You are correct that the "VersionPurpose" { "BMC", "Host", "PSU", ... } is
rather limiting and with these changes it is effectively deprecated.  I add=
ed
the following wording:

        This property is deprecated in favor of Compatible strings and inve=
ntory
        associations.  The enumeration should not be expanded further.

> What are people doing for components like this? =20

Since this is a new change you won't see any code reflecting this yet thoug=
h.
There is a team at HCL that is working on some implementations of this for
devices on the Yosemite-V2 system.

--=20
Patrick Williams

--k5fgm5f1RN/OTzE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHcRc0ACgkQqwNHzC0A
wRlnfQ/8CePFA4aoPy3fpMM3Z+vKih9FVML2A0ZUlaAni7v+jdCTr/SK70/48p8T
J4X1bppMAvy0NaFTlBK3lPSW6mHQCy25qNIg6Q7denT1SnW1u1ucptmPa82k5P+5
1X8v75VJTiQsGXhCWe+BKnP4M1OkOWEp59tgJNkYE6kjVDhAq+fUe/x4sB2dwWvv
0cj17ydlrOx0ZhdHhoMASN8T2mt0Umbr9rUA5mlDgR6Wxm2SKss7L4xG0eqJlXju
GJ+1LGck8GJJ+sFCWmNYe9zwXUGHj7FTDsVmWLtb3rvrlRXxucEYGuJln1ig1bR9
nLPezGsuIUy2Qzgp5hUmSdU+eIVREitqq0YGdACAskuLzLA+v+xfATo8imjdEb9e
41Gz+siApE9VLiUiLVqh4WZCWL22tb1re8vJe/q8PktzE8oyfp+wv8kqmSiY+K2M
LuP8nNkXHvYEThWXsZ086HXuwV7DqjgFKoQrIvJeLvGqgdTSFlNgt25scQzkpufy
dk+aPXWlv3nbOESkbtfSzclZoogBUcZMI/zzZrud+871OgJGYU9lXp7xMJcqAgfy
dkpd+k37nd8ey4I/8EpzoAgOu9aQ9OEQXeFTo1U1OQGOSrOA56sezcJeDTEPlrFC
LgAvJGG5QaQJdrasVMD+g7tqLISEWw0JIhgI0934r2s2IxItkhk=
=dAss
-----END PGP SIGNATURE-----

--k5fgm5f1RN/OTzE3--
