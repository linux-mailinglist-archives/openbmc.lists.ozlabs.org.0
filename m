Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73378309614
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 15:58:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSclF4GRRzDqDL
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 01:58:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=pL5YqMcb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YRMC+1fh; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSc8g6mDMzDsX3
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 01:31:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E9BCD5C00D7;
 Sat, 30 Jan 2021 09:31:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 30 Jan 2021 09:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dDxoeesO9uMahrV2lnJK3g5iFVx
 mxxWBtmiZ3inOO7w=; b=pL5YqMcbzNh8xRM22CH4r7/4GgodvBsNSGM5bJHLQFx
 leQ89QKZAtwac/FI4stvZlJ0OYknnalRnazSbwEGZ4SGUZfANSL5cKqpZpXxyliB
 1qnHRuREP4Hk93bxQhk9RCVP3vQ1f3vokT1xEhMuDyNqE2gaxtOe+nySN4JaPzqx
 EUatTJM7H+NvsQfYUGkSOKIABPzROsa5bBNeVyQ9JuhhjcyBLI1YhfYyQv0LlLrw
 45r2O6XqGPPQj9Y8VRH+o0wmtXwjkMgN8dEcRlR2t64YLdtuGL+v7V43+X10QfNz
 2+jbJryav/t7qiUwrqcPUFyTpvJ9AVsFch0Fj6rQM7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dDxoee
 sO9uMahrV2lnJK3g5iFVxmxxWBtmiZ3inOO7w=; b=YRMC+1fh+/o0m1Oba7K3V2
 JBx+v0oYMIetjHLCbkzGbBuHjnwqtlqGTLCviAP399RcXhjXvo6Q/yfh1WUjEOwV
 gZ6HFAllkeeqnBEsAYti+eq61vTXTQSO+dCjXdTgTBHTwiOXpgoqksDYhvIi6tvP
 igei+p8NN21D5knapzfEUdn7k06WMVIZzVEJErU5K0t1psppCYxyzfqCY3xRDmLw
 pzwbcEeMXxcyVr9c/gL9QIh8ni7TzxckEHcnvNk26CujZMtDCniDYYVUjHwZ7k2d
 FyFvCKU+ELQuwYnjwb/Hyc1NZyeOPc0IkVsLypz6y42BzTz+32PwZUj+1DL4iQeA
 ==
X-ME-Sender: <xms:wG0VYBoxFg5nzAcJrAi08m7Xt2N8axECX976NgwudZcQFV4QBrs0bQ>
 <xme:wG0VYDpgfgdhRsIXxPHwHLYDt8VBiO8EFQ2m2FWHEgx9ycg_l4Ai6RooVIHgfDM-Z
 1RmABg_oiaQDosXjh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:wG0VYONsG7TZfayxWdJ3L-ey5BayRw4TD4KbsTgDqZDu2yni23E0pw>
 <xmx:wG0VYM66qNMTuLqhZfNGb2ZGwrXqUfT5nHmXHmujnl59eZTTG6g07w>
 <xmx:wG0VYA5i2Mxx0bpWwy3QzE19FvBl6YLhpBMwefVyRim3rqnpW2PKgQ>
 <xmx:wG0VYFgjRiKlcBwQ4jeL1XgWkz4E91KtN8VCrOUKwxtq5037xaXjxQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9ED2240057;
 Sat, 30 Jan 2021 09:31:27 -0500 (EST)
Date: Sat, 30 Jan 2021 08:31:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Progress Codes in BMC
Message-ID: <YBVtvlsJJJ4faFpt@heinlein>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UAzcu3xhxhOYcvOZ"
Content-Disposition: inline
In-Reply-To: <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
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
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UAzcu3xhxhOYcvOZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
> On Fri, Jan 22, 2021 at 08:52:14AM -0600, Patrick Williams wrote:
>=20
> There are multiple sources of the codes - on Power the power sequencing=
=20
> is done on the BMC and that is considered part of the server boot so we=
=20
> have both those applications indicating their progress along with the=20
> more traditional progress flowing down from system firmware.

The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
You just write the `Value` property.  The hosting daemon doesn't really
care where it came from.  We have this in the fb-ipmi-oem to handle IPMB
messages that come from our per-cpu-card uC.

> >The daemons
> >in question here already support keeping a history as well.  I think the
> >only think you'd need to do is extend it to be 32-bit or 64-bit progress
> >codes instead of just 8-bit, but I see no reason why that shouldn't be
> >acceptable.
>=20
> Our progress codes are much larger than 64 bits.  More like 64 bytes. =20
> Does that still seem acceptable?

Maybe we could change Value from a uint64 to a vector<uint64>?

> I'd also like to sort out the external facing interfaces for these codes=
=20
> though.  My straw-man proposal would be that these are just another log=
=20
> service with yet another additionaldatauri attachment in the log=20
> entries.  Is this a terrible idea?

I think you're asking about Redfish now?  I have no opinion on that.

The `xyz.opnbmc_project.State.Boot.PostCode` interface contains the
history of the `Boot.Raw` values.  I think you could generate some kind
of "log" from that.

--=20
Patrick Williams

--UAzcu3xhxhOYcvOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAVbbwACgkQqwNHzC0A
wRk3xw/9GXJ3/IqCpujzLiMPL+cSqUfbRMS5Wk29jxUUY2CzNowzE9O89GX6wHVg
mg8L9zWPYkfVVdLen604YjYPIJKSjK6TAwRtXIe7t/vDENouUIcqHP3iyfX/GUeg
XA8tm+MKoC9e88L34bLqAbqjylS+ILTCljCYpGP6v/FTquLsrlLDydtKZGYH88cS
PalZ2N/jidTH7SsumL9zBjcjlsZn1/i8u7otvhT+xgQvosThdC9FpuYHKsTN06HL
d9o5QgpMAJ0d5xq7BpsJxVm7P7G9SJI3gMpz0MQzwFH/++SZeCoPaAJc05hlRCzF
O7cnGhfS/+BaFoHLcRkiPyOOCZQV6whrXgr+JNOZTFWXNB+IJ7Q78fPso3nJJQu1
5fenjz1gmB/ggH1s3CfQsraapfSMuj0gGz1kV0lhayJbR809HgUN56E0qwbDuhNK
97w8PQ00NC8j7XbbIP5eC7saSnfeI5JD9mHygoqk4LHsQZMbnYmXcBb579rLuHwk
KmeDYF5GyjhJoTWaih96nAy9fYriAn+E0s+NAsPxJCioePYxwTJt5+H7Nfb0saF0
K56VvnWwXtte6ES6xe9cqOmwZ9h8ZJ8aFxfE+K7NVactSCcM77SoViuMDKQqRxh5
lqolgIogZG9prRAX1tabggKHO4N8Tt0yYznbuMkBDHkOPXJG2fU=
=zrnU
-----END PGP SIGNATURE-----

--UAzcu3xhxhOYcvOZ--
