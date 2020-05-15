Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 900501D56C4
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 18:54:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NvdN3hQ9zDr4m
	for <lists+openbmc@lfdr.de>; Sat, 16 May 2020 02:54:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=jh+NLOyk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nlKEoOck; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NvcK5Z4jzDqvx
 for <openbmc@lists.ozlabs.org>; Sat, 16 May 2020 02:53:20 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1624C8E1;
 Fri, 15 May 2020 12:53:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 15 May 2020 12:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cqodLmuk2QmFyrhaCJmXUhB/Pmf
 6ckLzB8tDoLvogCk=; b=jh+NLOykqqjFpUg5+posLeO3YnjBAk8YP7vYe4cv8cQ
 jtUylhNHXRl5VEF6nUQztVx3OJmtnwGiKCFzQ5soFONlsfFwS3atljdt6GpkZy8X
 r/AVs9vcodPQMnkZTubi0BOi5TJSbh8nmoo+39raAboBRv1hc0Tkke93+KfnBB05
 z4dL6m+iEURK9ByyTGXOmzQ3eoN9TnaS/NHezSTf+3PvCfgO2oNZtQ8UR9mjQoSD
 rOy4qTRBdfRu9uLrfH0lcztz9soG7gSqLHmWt5m4IhKaOsDCn/DZ9EzBSNZbIb+U
 qWSA9STLfMOSXcFqD2opIDijiXnrRf04XdZkmSwOUAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cqodLm
 uk2QmFyrhaCJmXUhB/Pmf6ckLzB8tDoLvogCk=; b=nlKEoOckRfztW5WI/epHhS
 fpjc0z168LK2LZkvgtZbuAAvqp6tV5O6VAn56zY2gSColTtsfxIIEsqx2NA+0sBy
 VCq8p4sFYRoFtgKtKDEp2S2fNfSy/oX/JiUe9MkniFDGWDU5Af2Wo374YrIlCmO5
 Od6fBZvuEJ5p9wVxuD7KGqWNUdNZvPwo5+f9snS30g6GRYcGrl7drcdQOAM6P61r
 N1luDuWYA5ta5kFSAXyk2BxIbt9WeKleyxGFLfTSSIFam/3WQ1w6ZgG5ePaSW2q9
 XT2bbHsK7Vo3R/wqr+lw0Y2aMdSjkeb6LHGOVndZ0OX+u9TMXeoAyn6XrCptRvUw
 ==
X-ME-Sender: <xms:-si-XhzuRqKD2fVkmsjwcmz2llZXuzICXGe7-5K-oq2NgArddNzLpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-si-XhSm5uPv8NVp5LuBAw-6UFf4KstcxWab1GiwOeHLmciTn8Pk1A>
 <xmx:-si-XrUGO6wi2z5PdrGOSxyWwpgE0U7wUonTByXwITsAG0qIcngQNQ>
 <xmx:-si-Xjjl58ZwbWAb4K00YhDVEnUCWCuf4DfLitixpxQdokLSvw_oDg>
 <xmx:-8i-XmOAZFModFtDheRVGauciAyR5vvgTyi7uucRG25-H-rOq0BQCg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 479563280059;
 Fri, 15 May 2020 12:53:14 -0400 (EDT)
Date: Fri, 15 May 2020 11:53:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gil Montag <gmontag@habana.ai>
Subject: Re: problem trying to bitbake obmc-phosphor-image
Message-ID: <20200515165313.GH1166713@heinlein>
References: <VI1PR02MB5007850894D7D7DC219CDFE5A0BC0@VI1PR02MB5007.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mhjHhnbe5PrRcwjY"
Content-Disposition: inline
In-Reply-To: <VI1PR02MB5007850894D7D7DC219CDFE5A0BC0@VI1PR02MB5007.eurprd02.prod.outlook.com>
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


--mhjHhnbe5PrRcwjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 05:49:56PM +0000, Gil Montag wrote:
>   1.  When trying to run bitbake  in a schroot trusty (ubuntu 14.04) I'm =
getting that python version is too old. Need python >=3D3.5 and available m=
ax python 3.4 for that ububtu version...

Yes, this is a requirement for newer versions of bitbake (which comes
=66rom upstream Yocto) and there isn't much we can do about it.  I suspect
even if you could get bitbake to run with this older version of Python
you'd run into other issues.  Ubuntu 14.04 is 6 years old at this point.

>   2.  I tried to do the build in ububtu18.04 and then it proceeded until =
stopped with some timeout accessing github. (manually I manage to access th=
is github repo)

This looks like you're on the right track.  Github fetching isn't always
the most reliable.  Most people set up bitbake to create a download
mirror so you're only having to do this once (or when newer versions of
code come out).  I'd suggest just retrying until you get all the
downloads.

--=20
Patrick Williams

--mhjHhnbe5PrRcwjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6+yPcACgkQqwNHzC0A
wRkhVA//UPV1IIxTjUMsUILBB4noqzzdwsCdTlWLizGTMkjySnAJrZGTPjB0r3oN
HPU7gtyWj4E0YUE+S56zqDMZ5vuxoWwmxBsMtRv1hsEXHRpBeCk66lgp6F1rUDQk
DIzCrKuoKYC5rNK/2VAAlw9Ba1eP9+prqwFqDxV4h0G1eE80JHmF0re9eiuHsxM5
aFc7YFWvYKpEfrnM+XUKXJhTuwOWDJOBJj7nPoTnuzZzSUsTGZ5TYuhXJzBcWr21
g2EMbB8KDpNk8PibwOTsbjq1FLt+9a2D0cY5x2vGH45pK5XCSBEGlGvJYAamJGvi
RFZJcbmYlU56W3ZnWpQ8C4DM6B941dvHqd8p9SNS3RRbqSHaksdmlIS8uz+H/7lr
KMQ0RNyloc95pDNz309kUYNlPY3eVuH+oK57Z4S6CYwVVG3WggYMbwYDUCRqdKFF
lBrO587zQmkhK3aXc1wxKzcvUz/yw3j1pJGVjsOKqSikMYZQAiAgBgWZhKO6PwKT
MURKeD/UDmpu1Dnr24ueANl97EcfVQ5cAuqNT9e46kTqJ570i9GdguGrnVFsI2rY
k6ph8oDMwpCuP1mCuTU3FvgxdxbhwGKfhVz3V6JicKau+KRQqHhmg6luAvDuAgJr
1vwliW5dHgte0ZMqcEfCO52ayAvd6Agz5+97zbt+hrL2ACvMaX4=
=C6HS
-----END PGP SIGNATURE-----

--mhjHhnbe5PrRcwjY--
