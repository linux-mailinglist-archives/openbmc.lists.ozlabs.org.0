Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BA3FF6BC
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 23:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0vwL2WGJz2yNx
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 07:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=lylERyu5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NACPyy95;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=lylERyu5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NACPyy95; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0vvq526Hz2xfP
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 07:59:02 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B740032009BE;
 Thu,  2 Sep 2021 17:58:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Sep 2021 17:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=3pEMi6P4W7Wt54D71epyXiioyiY
 mRfJP0EPG80PBeWQ=; b=lylERyu5FWnz36rfnbDO2+8qv/04T60pzCXLLg2vTH/
 UTBpeJzdOeLV1OLBswlOjjcmbLlkXHemFWc8Y4Icebn0rFLLR/ogLqjqFe/8RbFB
 0rAR5Es1KkPb745KzXYb0lOoHOu/wru6W7WBQcwSZnzIdVagiL7Md1twatAhrRC0
 /VerlWbnsdiqD7l3PvMnEeJoCMJgly5rIVAGmdBPRbs9H9YcRGxb4f93VINncXqv
 zqh9GJH9hrJGTpo12k59enTM5lXemwr+GJIRlfCD5VOr6/Q/9BD4Ovjs/5XjMSDx
 s+duYma6LNdXXXioZ6Y3i521q8gmEprKyDkOdt78WIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3pEMi6
 P4W7Wt54D71epyXiioyiYmRfJP0EPG80PBeWQ=; b=NACPyy95w3d+wmwe/lh8ZX
 MsQzaBlWXfQKFfBA34Ou3x7vW55inI12B9a5XqWCC2+kIsOd03p/s2F3rQYYsRAF
 7AqKtopt8YCsiWINDMTmMa7JsMu7Alwl5RONaJTzZ/jBDM6cmWVkEe+m7RnKhnT8
 4i4sxiYqZmK+9TRJLUAd1weVWEDqOAz0c6+O9IxyM7/rP6LS90NuSQDzBFAk9lA3
 K50vLdK9CCGbMbi8XlKu49UPLOHxi3CBY+xhd2dHzE4Y48Yvo64oQGA710wovJHK
 +7vB50nppDnhhkRRZs+iSRQCZ01Om8B5k/g/jNt6+0hTzZVobE+AhVqJ1dGFlpLw
 ==
X-ME-Sender: <xms:IUkxYWelzZPvi6FP3CvZkxgGSIbAzEwAj1RXvJKGBa1pAYtEHBcIkA>
 <xme:IUkxYQMTFMZG7-Ou84YdDb_pL9uIrXaOdh5UfSltvLBH35TE9fOPJpngsp2hzQxub
 x4Vo2osd5iUzipT79I>
X-ME-Received: <xmr:IUkxYXgixXf_RDxk3C8F_8dOJIRMh8ZAUJrgf6MNTAl7phAjWRssEQcCSGVinw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:IUkxYT_pajexrnqBICvHA4ykQMQ4H25eKqHo81QXJgxavHZHNMnJaw>
 <xmx:IUkxYSuua4plJrC6K2CFy8oSO3EuGFlykxmJgfmeJ_GNLWC7xYSJag>
 <xmx:IUkxYaFm3gi9WlgQuw9FurPa7MczeSWIPHe3tLWSG3-r5y_-9EGkqA>
 <xmx:IkkxYXU9GH5oI9c0DuTLJgdydr5a6cfE8uCWixXQT-7fgzKFm2ha_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 17:58:56 -0400 (EDT)
Date: Thu, 2 Sep 2021 16:58:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ren, Zhikui" <zhikui.ren@intel.com>
Subject: Re: beep code manager  for openbmc
Message-ID: <YTFJHVW+bYoa1vIT@heinlein>
References: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WIYnqY3/gBsOQBgg"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WIYnqY3/gBsOQBgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zhikui,

A few questions...

On Thu, Sep 02, 2021 at 08:15:21PM +0000, Ren, Zhikui wrote:
> Hi All,
>=20
> Beepcode manager is a stand-alone beep code service should be created to =
manage the beeper hardware, and provide D-Bus methods to expose the beeper =
function globally, all other services can use the beeper hardware by callin=
g the beep methods.
>=20
> This package has been included in our distribution. Now we would like  to=
 upstream it and make it available to the community.
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-co=
mmon/recipes-phosphor/beepcode-mgr
>=20
> Since it is now a very light service that only have one source file and a=
 service file. I am wondering whether this service can go to an existing re=
pository.
> If not, we would like to request a new repository for it.
>=20
> Thanks,
> Zhikui
>=20

I see it creates dbus interfaces but I don't see them defined anywhere.  Ca=
n we
get that added to phosphor-dbus-interfaces?

It isn't obvious to me from looking at what interfaces are there who would =
call
it.  I see various "beep code" patterns:

    {beepVRWatchdogTimeout, "1-5-1-2"}, {beepPSUFailure, "1-5-1-4"},
    {beepCPUMIssing, "1-5-2-1"},        {beepCPUCatError, "1-5-2-2"},
    {beepCPUErr2, "1-5-2-3"},           {beepVoltageMismatch, "1-5-2-4"},
    {beepCPUConfigError, "1-5-2-5"},    {beepPowerFail, "1-5-4-2"},
    {beepPowerGoodTimeOut, "1-5-4-4"},

How do these get triggered?  Do arbitrary programs call into the "BeepCode"
service when they hit their own event?  This doesn't seem very maintainable;
shouldn't the beepcode service react to events through some other method,
similar to what is going on for Redfish events?

How easily configurable would this be for someone who has a different beepc=
ode
policy than Intel's?  Are you planning to update it with some JSON config or
leave that as an exercise for the next user?

--=20
Patrick Williams

--WIYnqY3/gBsOQBgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmExSRsACgkQqwNHzC0A
wRkQhQ//RAUC1w6crY08Wbxa4QRGbwyh3GmWEZBMvTU5HcpP1GYeWlOUGOyIo/4V
6uq8qXXMyN459LFc0bE39OcVbxknDelCBaVlTy1GyR3OMqmPogs3gAg0IsrUOTvC
xbGtFtNoPPtaPfIdtBc5S3vPkouSxz5JwxJsFHvrA8SxjspEN8Elcg8U+fFNue2g
8F7atgSDhdJzKRPLjiyvgeSxEiF072UtUiB137r3r+rH7BFcBgo2mTs65Ow6s1k/
gp4i700dRjXrqMZN8q2Y7+UTAumwzTTdDubesPMnSkMpQMuB7r6W2FXff7AReJwZ
W5zPKR6SzwhsnHe6oHw6iITMLkfmSwZz+h1ktvjlhI/IESfDg+4GXsAdC2J7I0Rt
R7DSbNdJlcm8R9NCLBOirjKjKgeOhD2gS6N0d6lyRoxz1Xzp1qoncCEKJ0+jMzFb
u7jQPWdvtjgrLheHNXVn8qbPGrWEBiYSa4a5mcO6S72h7SJbV2GBmBUle53kDNcn
OzEXJDsox5czEHm5HGvfpQJDXVmu3WgF2L+DyNZZUcj+CsnTJXi//AL3YPKZg43q
TvC+hVMXhHFmVAT8CqYWNMPf/x9uohdBYyHjcY4ietvjBsSJlx4U4gI0jNe6tgad
PL3auuLiH2qx/JkQtHGhG9nFS6Km90Ji+o/wWcD8lJTlpUiM9ck=
=DXSr
-----END PGP SIGNATURE-----

--WIYnqY3/gBsOQBgg--
