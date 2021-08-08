Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CA3E37C6
	for <lists+openbmc@lfdr.de>; Sun,  8 Aug 2021 03:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gj1Cz2Rhbz30Cj
	for <lists+openbmc@lfdr.de>; Sun,  8 Aug 2021 11:02:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=Fgj11x2w;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MViqgvMh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Fgj11x2w; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MViqgvMh; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gj1Cd0kWRz2yy0
 for <openbmc@lists.ozlabs.org>; Sun,  8 Aug 2021 11:02:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D965832008FC
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 21:02:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 07 Aug 2021 21:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ubejcTvXI6re4gKQ0jbgN5PgP8X
 5yGc1uNidVkMEm4c=; b=Fgj11x2wsaTCYsi23lwfjtfLd2u4UL+ldMIm+aJYTqc
 9KuaBMm8Er9pYnypnIYl5qDDi+s6rYQVh49Id3e3nIZHkJOSn8G4/ci6fTKmKKCe
 b5C5EZVSZYfnisvOy7/6kHQNr+72Tz4+NZudh164sPlJirldh2L8dPCmFsdzscMB
 HMzCrd49XZvOzVnJf79MZKnXcTMHdRepYqm6Nb4c6W/SVX41YV1yLKqqoPsqrNHA
 285MJcOmFHS4Ch867GVKaj4N2mDxIaiaEDCMPCDUG/vNOWfGFz/1kgfpOs4KPkYV
 55/TsaT540o9ARwHUfTLS+zwzdWqefohJ//jc0jyNyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ubejcT
 vXI6re4gKQ0jbgN5PgP8X5yGc1uNidVkMEm4c=; b=MViqgvMh626Nubl+m3xiPg
 ihIrF/xV5nSaNWwoBHA5OiaP3isFXB53u3tzAqf416VubJ+f5QOpSozy1GmCBle4
 g6etPjuZx/YTwTHkXLgFHiCZEUMGWDfa/Xhxa2hodywu5Z6wDUX5wdRcg9DfxBi/
 VCGvU4M95pVVG3vs7+Sqvpa+4stmIIyU2oELaffpLIX4hCH7CWLhk43ZD4eBx+P/
 dmCktQgrFNFvWdObUpPpeg3JNewMfSmkTvWpUt25VybGCuz7lk4wEB/ekiIqmuKB
 SzgRbJvjNNXGxAfb1Q7c/kS0jfkxo270rkMlwT/QeZTN4WU9zcWtBGja8q4PrDLQ
 ==
X-ME-Sender: <xms:KC0PYccow3cqt7qxJ1X0WKNfYtxMa1vF5y2uYDBCeyZuxIGa5jniAg>
 <xme:KC0PYeNCJcaHc0xCFGN6EdAfPEZ1INsl-w56KMrMgIeFIcD7qYxS6mkMh8OJvJ2eN
 MUgSipI0L7rz0XxYfo>
X-ME-Received: <xmr:KC0PYdjEmVIshq7uFYp50RbZOLP1yQEBLpGckDndJcPFftEdYRD_broA-L4jDW9-cWjHSF4dRBnCmFXoRO9bOulNfFIb-voqo6lAJM5pbMe1nQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeggddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduffdvjeefteeiuefhgfektdeiuedt
 heekgeelueffieegffeggeegleeltdeiueenucffohhmrghinhephihotghtohhprhhojh
 gvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KC0PYR9MVl4lK3fzM_13ZAq0q8qR0STR_uZ-suqWOfPYgKTmQlhg3g>
 <xmx:KC0PYYsH-v14kLGn2GvEoPx0AOOqDUdjMUK0iEbwqwdgzxi3EzMg-w>
 <xmx:KC0PYYG0RsX3MfhWO63f7gXozyaJngy34m9Yp4gC76T3Vt6YDo5HjQ>
 <xmx:KC0PYR7P68YDOoWh0x8S6AznIhOLh05kFH1Jpf-U8NDkyi_MPIPjVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Sat, 7 Aug 2021 21:02:31 -0400 (EDT)
Date: Sat, 7 Aug 2021 20:02:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Yocto override syntax change.
Message-ID: <YQ8tJueJyk+fXr39@heinlein>
References: <YQ1FD5q8KbhbXVBK@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pmRP6NIJBqT7X+HS"
Content-Disposition: inline
In-Reply-To: <YQ1FD5q8KbhbXVBK@heinlein>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pmRP6NIJBqT7X+HS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 09:19:59AM -0500, Patrick Williams wrote:

A few more discoveries.

1. LAYERSERIES_COMPAT and BBFILE_PATTERN syntax still has an underscore.

    LAYERSERIES_COMPAT_phosphor-layer <-- correct
    LAYERSERIES_COMPAT:phosphor-layer <-- incorrect.

    If you were a little too aggressive at making this change (like me) you=
 can
    fix it with:

    $ git grep -l "LAYERSERIES_COMPAT:" meta-facebook | xargs sed -i 's/LAY=
ERSERIES_COMPAT:/LAYERSERIES_COMPAT_/'
    $ git grep -l "BBFILE_PATTERN:" meta-facebook | xargs sed -i 's/BBFILE_=
PATTERN:/BBFILE_PATTERN_/'

2. local.conf.sample has changed slightly and CONF_VERSION needs to be
   incremented.  The suggestion from upstream is to use your favorite
   diff-editor to compare the two such as:

   $ vimdiff ./poky/meta-poky/conf/local.conf.sample meta-facebook/meta-tio=
gapass/conf/local.conf.sample

   Except that we don't have this file updated until we do the subtree pull=
, so
   in the meantime you could compare against this version (use wget/curl):

   http://git.yoctoproject.org/cgit/cgit.cgi/poky/plain/meta-poky/conf/loca=
l.conf.sample

3. LAYERSERIES_COMPAT will need "honister" added since that is the next Yoc=
to
   release after hardknott.

   Potential fixup:

   $ git grep -l "LAYERSERIES_COMPAT_" meta-facebook | xargs sed -i 's/hard=
knott"/hardknott honister"/'

--=20
Patrick Williams

--pmRP6NIJBqT7X+HS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEPLSQACgkQqwNHzC0A
wRnc6xAAqD5rkCrtkBssOWy92vZmP6lHNHnnTly+ODECDshT1ClQT+2iDybmFBrR
boEftdGokFnqmsKG3kAil1Qk1OQMu1BslAlIYuCV6voVvrWFC4f0S12Nai/5dABK
wQZAcr4rEbIixj0FyDVAXG7qg+pz+ySqjMF4Beex3+KWtMbSObiNZyaAxBZVJ2FU
4O+AaKqIUXPGfQIDl3l7yHvZtj4eaJle/cijeH2vOakAvSiPFeFHdo+5qCJKkxLN
MCl82pBeU9jmoIErs/GvyLE3fn4ndQpPIeuRVTxoDk6uLv9xvklk0FSiYzK/sKLa
oJ0XSRDBk4T4OA2qc5YKHBMIsy77CvTYaV7+WrIJUYWw7Afk9G+pj1MmEDOODibZ
aXrHCawk7YGtPsQisGfEEGwWbFNsUwHstLSKLn53BgD7YHscIN7ytTqL4I9WmEeU
/D/w+OQp+ihJRekCm7F/bkvQc+JUeXCzeKo1rJHJKFts1BQV/OpgzjpzeGlt13VC
iWJaKN5lzIj0kKAsvFgXgKtUIcFApWm7hDfeH2yhsA8WkFd1WyZtCdndyQtPZYz+
fkfbd72FEY8JAJ0j0oS/U+YffD0Jgw0mk+FqN7x/LT2gJSfms61eKsi8aEwcXsPZ
t6vh+PUMq0mZX4/NEWj+/fvtuETqM/o/J84EN8ApUaPB/b5qrFg=
=L4Lt
-----END PGP SIGNATURE-----

--pmRP6NIJBqT7X+HS--
