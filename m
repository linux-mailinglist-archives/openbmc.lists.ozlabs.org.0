Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE224C345
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:21:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXVJG4wRYzDr4Q
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:21:02 +1000 (AEST)
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
 header.s=fm2 header.b=BD3RtOkT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EONjY8Xf; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXVD310pkzDqrT
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:17:23 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 999225C00B5;
 Thu, 20 Aug 2020 12:17:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 20 Aug 2020 12:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8TetVE05eeZIZyf6muL5qRW46iK
 Px24DsfPlLPJ4oM4=; b=BD3RtOkT98z5Va6UoeC085djEdSprR+1WW7Xlk8fuFf
 B3iAwSP2dAphVAX+P71/3rEQQp6y9Th/mJs5Lq87jm4FSnSNwsR9urRWH8FyrWH0
 qZMLBcp5XiLyxF1b1Lq0Atfl9fBbLNNCYCG2Jf8dhPPqARWnkVPBJqLh0sgZfODn
 EZRcPfaXblyCUG7sLRNAeMr9Hf66HR+re+J70jL8bl+7rLPcCbouIavWYkF0e9iD
 S9gXHNq0pxamk1XGXwqLuK0U3pCrj1UUuC1c7GaROn47qBbb+W70Ts6M4tFgHCTS
 ssaBgOd1/Otry/dPN7mlkD/pQc66F25MQWbWFjjG4Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8TetVE
 05eeZIZyf6muL5qRW46iKPx24DsfPlLPJ4oM4=; b=EONjY8XfvwSoUvAq27R0Ts
 9IViMkEoY9fHth2vxdoh/aUDa3tHTaQ6vq/8qeNP7cXSNxB4xRrcLCFU12+zQTFf
 3+pohsb7tmxVzhO7Ld6e+AA44yCTgjCPppjvye69SFYepNX+DyEblIV4bhl5frAm
 EgTFDIWNqP7Qs3yzEcBD1N+nbix5UENFMjQuialbrMQQS+e5q2EclV3TG3JDZ+t4
 DgaTHyBl9q89in0V4MwJ8zdJj311iA4FHi4phAz6OrzHIflZLo3CgKPGHZ838izo
 wuVzcdNoVzZumMxrH6SSWmW8kSCGfwUt3jWww/a60c/fKZE7tMS1EqEf7A82EGeA
 ==
X-ME-Sender: <xms:EKI-X8edKAIhTHDch3YW1tmOns5LMAtDEItza2ZrjJSLC0n3WP5ukg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddutddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecukfhppeduieeirddujedvrdduvdefrddvvdenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghkse
 hsthiftgigrdighiii
X-ME-Proxy: <xmx:EKI-X-MTdrYZOQm563WUrV_r73Z592ZEmHKTPWFaTK55-lOb_CVWzg>
 <xmx:EKI-X9jByOz-mQE0CjsOgryRiwAeBL-VzSi6Q9DCNurvPZTaDoJ98Q>
 <xmx:EKI-Xx8Fpne6sy3XbZ6IKCIZtjL4B3sQJs4dLR4I0XQiRNzZ_sSVEA>
 <xmx:EKI-Xx7AJSjwhPG1lugu4MD1IvtpzP7ZFQdm9FdcvdvSE7D0KzuTCw>
Received: from localhost (mobile-166-172-123-22.mycingular.net
 [166.172.123.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44A42328005E;
 Thu, 20 Aug 2020 12:17:20 -0400 (EDT)
Date: Thu, 20 Aug 2020 11:17:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Maxim Sloyko <maxims@google.com>
Subject: Re: Board Sensor Calibration
Message-ID: <20200820161719.GB3532@heinlein>
References: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
 <20200820161532.GA3532@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20200820161532.GA3532@heinlein>
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 11:15:33AM -0500, Patrick Williams wrote:
> On Wed, Aug 19, 2020 at 10:39:15AM -0700, Maxim Sloyko wrote:
> > Hi OpenBMC!
> >=20
> > We would like to have a value reported by a certain sensor changed
> > according to our calibration results. This is a temperature sensor and =
the
> > calibration has nothing to do with the sensor itself -- so no need to
> > change the driver or anything -- but with a sensor placement on the boa=
rd.
> > Basically we want to infer the temperature at a different location by
> > calibrating the sensor.
> >=20
> > Are there any tools in OpenBMC that would allow us to add the calibrati=
on
> > curve to, say, phosphor-hwmon and have it report the value different fr=
om
> > the one reported by the underlying sensor? Did anybody else have to deal
> > with something like this and what was your solution? Do people more
> > familiar with sensor architecture have any recommendations on how best =
to
> > handle this?
> >=20
> > Thank you.
> >=20
> > --=20
> > -MS
>=20
> There is work being implemented now under phosphor-virtual-sensor[1]
> which is intended to cover exactly this case (among others).  We have a
> similar situation where sensors need to be calibrated based on values
> from one or more other sensors.  An example might be a voltage regulator
> which reads high as it gets hotter.  phosphor-virtual-sensor will allow
> you to forumlate a secondary sensor (the "virtual" sensor) using math
> applied to one or more real sensors.
>=20
> --=20
> Patrick Williams

Forgot to include the link.

1. https://gerrit.openbmc-project.xyz/q/status:open+project:openbmc/phospho=
r-virtual-sensor

--=20
Patrick Williams

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8+og8ACgkQqwNHzC0A
wRnE4A/+PQL9Oadtq8eFsqO3L+KPAfDB0GTEujxCR/lXc504wEqg5zzH0g1i0v8S
/bIpimxly1mpCMF2zCZF0ASRWc+3dCUDEz9jcbqAr5xDVEQQ81KKqo5lyy51uQRN
zndFz2L2+qd3YOQvEmgehdz8edgL9Bq8cIT1EB1wYLsCC5t7UaYDSMk+xDnaurza
lu2vOsP83vf9skntn+9K5JPc9hiL8d2Jf9jukaX1ZkTBf3gRmGhjbNRNl2bnlK/R
zWoBqcTPWokgpkbq7htO4inivYcHaDTLX6O+feBel1HU7qhkOg6SyxfAWnytN5+0
oL9BCMoT03sOwi1nR8FTKxL1yR27QY9AEB6Gw0DGX189EwS2mtjbPSfN4H/7Bm6T
89LkfGJlI74040+IRZx6M3J+Ek4V0rsO7YMKDprrprG7r+AM5B5xXZk3vMlglO6m
pNP3poDmoCKCjP94ORQ8wzeMuvKwfiXERXhxqdqNydOZPI8NoCH9BY5oKJNMriVX
v6K77GZ6hhR5xkHoVseyc5kWcShVYr9bz/Frp0tYyLJEvcPiJsqEfncj116+h/c8
Quo64sSz6YIcUqBBjtBtx57TjlkgTKIVIP7ZfOu+nWcMvkrDEWfC8H5BowxZ/o0v
1E+jN4bTztNUS+DvecBSWd/tI0HvRLL4Wi9SBokLHav4f6R1G9U=
=Muic
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
