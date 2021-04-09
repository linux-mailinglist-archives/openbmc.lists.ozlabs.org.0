Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94AF359E49
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 14:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGxgB5s35z3bTj
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 22:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=WyrJnMAz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=f2CLwROV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=WyrJnMAz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=f2CLwROV; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGxfv6K3Gz30L8
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 22:05:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C8DBC5C012B;
 Fri,  9 Apr 2021 08:05:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Apr 2021 08:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=lZV7qSu+hqJ16COcLhjMTX6Vlb+
 w4PzhXFt8oanP/tw=; b=WyrJnMAzWdwGgpuUNMbbv/e847G8F7EKRmZrEqf/NHf
 C8ifhC0udMAUcUZsC8vhLIvtrseQmwucxGKvQI+KjFZIY4Rm0GpDxAV+HxzHv0ni
 69QXLynkwbMK+w4FHkrknxKPWlQSDPPyv/shZdF/y0n0eClSr9OEAfkPvdZrIAs+
 06HT8Hdlc+UO2VUMsWjTq/BBi/0XdtBChQivNouGwCXswDdDZ0wSXkgbAL6tNjvL
 ifhW9qeHYFTSlNWcOqS6DIfv8ZYhcTd6ot4RdCwl6KxkQH+X5Hs2IcDg7ZkFYzLy
 a11JmGMzk44SHxA/AW9GbtgB1/j95x/72VSC4+2Vkjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lZV7qS
 u+hqJ16COcLhjMTX6Vlb+w4PzhXFt8oanP/tw=; b=f2CLwROVNQDsgTLckuxJJ3
 a8TJ9J1fDyD29LKYESw38nJEPEYeiKEoUV6i4UgQshB8enMuYGWL06dbcC19+IbM
 O8rU/x7DjYZuLBiaTAGewuUyFt28N0sBYFAScE6Qpp+bSxPUfNY6ZlEytXCJmA5p
 K0lQ7GrFEfLcxJLaSqYs+PU7eS2Eit5vBd/8lSYKePtiSo5J1GV73/uCgQq+Xmkx
 LJrsLLwiOW8KCkm/jprki3ZL2G5m8Jy9wp72TFz0a69gjObtbfgpIuzzGIrushYH
 tYIySatW30qaqnNhlBg6c6SzLBdLAm2BY27reFkovSnfXNKn47Ud0evLuE5i684g
 ==
X-ME-Sender: <xms:I0NwYJLiQp0XHACZ1ubF351QwegfnO5ZwiRPY86B4-IjFyINNdqjyw>
 <xme:I0NwYFLAl89fNT1ZpRD45J7RqKkyI0aaA5zGmNPwEH_qlfZ__kGCYtECI-h7fx9vM
 MD9sRXw6kbqOMyXdCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:I0NwYBvnXhmTjNXI4F5x_fUG-zBzuwWkT6MhZSWp5ilz1rSMvc5DxA>
 <xmx:I0NwYKYU0syq7Y4xd4fDFLSRbNz0lhmXQMsJjToJyn8Hgg35aqz_iQ>
 <xmx:I0NwYAazSy0BQzM8Mm8WeYI5RjMpXRTc9MsGmXZPVfly9MO8V7YAPQ>
 <xmx:I0NwYG3roCywckdTv1VL_fHjzvrXuJlL-9AJPc6DPPbhAt28gi4IDg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 353AD240066;
 Fri,  9 Apr 2021 08:05:55 -0400 (EDT)
Date: Fri, 9 Apr 2021 07:05:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
Message-ID: <YHBDIZqvHI0THFh3@heinlein>
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UdMkVHjTsasnDAs1"
Content-Disposition: inline
In-Reply-To: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
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


--UdMkVHjTsasnDAs1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 02:24:55PM +0200, Ambrozewicz, Adrian wrote:
> Question of extending xyz.openbmc_project.Sensor.Value interface (so it=
=20
> allows for more types or nested paths, if necessary) is something  I=20
> know should be considered, but seems like more or less straightforward=20
> to address.

I suspect this would be the more difficult direction to go down.  There
is already enough code that looks for sensors at specific paths that
you'd have to track down and fix up.  Also, there has been some concern
by some maintainers in other cases about having information in the paths
have meaning and prefering to reduce the reliance on that.

> There is bigger issue I see now - mapping D-Bus sensors to concrete=20
> Redfish properties. Mapping sensors at inventory level is sorted out=20
> with use of xyz.openbmc_project.Association.Definitions interface.=20
> However - I don't see (or know of) any method to link given D-Bus sensor=
=20
> with it's designated place in Redfish schema.

I think associations are the right approach to link sensors with
inventory items.  There is a design document underway to define some of
those assocations for inventory items and it seems like your needs
should be an extension to that.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41468/4/architecture/db=
us-inventory.md

> I've done some PoC implementation of ProcessorMetrics, which relies on=20
> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or=
=20
> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation=20
> queries D-Bus for all sensors associated with given CPU and populates=20
> properties if proper mapping was found.

I'm not really grasping what the contents of this mapping property are.
Generally we want to stay away from free-form strings having programatic
uses.  Maybe if you can define these mappings as enumerations?

What is the additional information you need besides the assocation from
a sensor to its inventory item?

--=20
Patrick Williams

--UdMkVHjTsasnDAs1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBwQyAACgkQqwNHzC0A
wRnr6Q/+NlfPFly8AijjiyCW/ezyrp/CaMTz/UUdfcjQLKZlup6yPJsHQ6nc2iTr
LaN/Ef09W3C8rD8OVC79MUSYrG2uIZqN1deBm0bgVelYNwy166uyt5LyIMV4dntL
K9SwpcFMMS9fDY2e3jwjYh6PQ7MZw0pMd8hafQxOgtjzrxp0hXfM+G+Jjnko2wYP
BkMW2Mf5OUoTxv21BR2uNmHWnc+tLv2CxTP7vlH6YhIk9snaWaKNGlAduSr5C1nm
dafi0Ur5C3I7CV5okHe3gX2NZuA/uDkydPLpEoyGd1+6+xSBbLHaX8w4Icsavx8C
a6FrXvOSW2x1ocU2apKySwDBUQY3djoPAZMtk5uf3B2L6BLZOXaWSVKgrdOrnaLE
dDW2vnMp3ND/dNGdf5lZhv3ecJhRxgu3S6Nq7Kp5eR0/9Gq8ga8p0CHOLenmaYci
sUK5gLQSn8ly7sdf1qW6R1hCu+1oU76M0sNjmE42IlQkSkTMnJUS2BWbAY/ArZAa
yJ6aLHAaazZFH7plpxGpxW8/Xv/FfqSp47FAt9RTe8cuF1/GUq5uJUw6OmUQ2FDw
Ve2FKFCtoQyQ7QqBU2bJT7aVaRIBMou2tXUcdplYh+Opf+jWr9nW9UHTwYTfPiWk
BzMrBJJtFEUfD86nQp1cNXBws9CO0OKLyv3kIZPGGBiHVBqiJ68=
=3KsJ
-----END PGP SIGNATURE-----

--UdMkVHjTsasnDAs1--
