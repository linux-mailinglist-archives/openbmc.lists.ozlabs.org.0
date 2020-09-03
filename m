Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A753525C678
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:15:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5Wr6JbSzDqlD
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:15:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=OBxBaGvG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WYQakkAl; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4hx4LF7zDqkV
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:38:36 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CCC315C033C;
 Thu,  3 Sep 2020 11:38:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 03 Sep 2020 11:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=cW3TGXwJanTy1BKmVoULeUgF6Ou
 XeUv1bRGrktdwTFE=; b=OBxBaGvGnFyVl1xV6hGQBzogdV9Jv+WZ7KBzhGaJ5ef
 x7SCqIXBMoX+y6CPtX62LZnKGRFjTajnPd9nLKw7K5rQfCw6VvOTDSIBji+8D5Ms
 lXX8pbe5m/kIl2XfHqV+c0TTCN19ZP4gzVd7lw2qszRe+8m3ZbFehk17wH08OPKE
 tbFcqJlqc4EQX39ZBEZj7fRJYkasTPn0WWhW7+YnKq1XVL4qesOh9tazSQHSIfmb
 h/qmSLeVAtltjmyGAG+/Ii7E3g7U/gW6MQYIbp3I3qKGDFKEPPbzkFyJIOHc4iPH
 y5xF0QbzELBeOgPQqmGM/h/xfT0Rog50ZZ34D0HLc3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cW3TGX
 wJanTy1BKmVoULeUgF6OuXeUv1bRGrktdwTFE=; b=WYQakkAlvslPfgtYTptkDT
 jagPFQ7Uad9GCZPlS+ejyAV+bM9QJDPCIi5uxYdY8o5HTFswu6Rpj958de1ZFDy5
 s4TloMqgysK4JEARFICB95v/mTaKaybYX8B1HLuS/a5BSoNJ3AvIiZTJCasj8n3T
 XgfXhUXaJB+P88Ov+1LqjoERj9Q5QKm4JFZq/6nPG8VyEhtVNDNvGx7rvurxV0XS
 GK6r26wg+o71O7yMwc20vpJkzi4+5KwEU5/lG0cm/sA3Z906sw/csJi5Dh/fKWOK
 b9UxYOU+zsXtFVGDGFxdK2t4Sqg+9bF75XK6KrjN3Gf62dBfD/JeTnj+h1R9utqQ
 ==
X-ME-Sender: <xms:9Q1RX9NH7XMzUlg8Z5xFuL1oM8kV7JA1crTS9wJIZEOf91NGUoNH3A>
 <xme:9Q1RX_9CCQOrmUzOxYz9GGnbbFS4WpCprsu8y5fKZCpvFJA5dp-jnxw92aneF9xP1
 EP81CBDfhEmEmEIK5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptedtleetleetkeefjefgieffkedu
 ueelheetueetffehlefhjeeugeefjeeftedunecuffhomhgrihhnpegsohhoshhtrdhorh
 hgpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppeejiedrvdehtddrkeeg
 rddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:9Q1RX8T4lnn0c8Fv4tYjZzpu1KherkdCeKP-0nNbG0iAnFEXLKzv5Q>
 <xmx:9Q1RX5tvW_oP4wbQ0uDDGvZH9ZBFCM6MRWGilfBURx6ttwU7nSmxUw>
 <xmx:9Q1RX1eLW0gHOat74zLnJKlcbfAlimK4_xY4xw4keNxJm4BIDF8byQ>
 <xmx:9Q1RX-G9rYEspLIcL14sApwGGJNtAjxC5R1HEBJAGomK88Q6TvrGCA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12BB6328006F;
 Thu,  3 Sep 2020 11:38:26 -0400 (EDT)
Date: Thu, 3 Sep 2020 10:38:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until
 host is powered up
Message-ID: <20200903153819.GC57949@patrickw3-mbp.lan.stwcx.xyz>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Guenter Roeck <groeck@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Josh Lehan <krellan@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 10:59:12AM -0700, James Feist wrote:
> On 8/31/2020 3:08 PM, Alex Qiu wrote:
> > Hi James,
> >=20
> > I just came through this doc (https://www.boost.org/doc/libs/1_74_0/doc=
/html/boost_asio/overview/posix/stream_descriptor.html).
> > Looks like that it's a terrible idea for hwmon driver to return EAGAIN
> > for dbus-sensors. With that, I think the proper fix is also to use other
> > errno instead in our driver, and this=A0caveat should be probably
> > documented somewhere.
> >=20
>=20
> Hi Alex,
>=20
> I hit something similar with peci where timeouts was causing the scan loop
> to hang. I remembered that back when we were developing ipmbbridge we hit
> something similar with i2c, and the work around was to use the tcp socket
> instead https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/referen=
ce/ip__tcp/socket.html
> as it could correctly handle the errors. This worked for me for the
> CpuSensor and is a easy to implement change that might be worth trying for
> other sensors
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
>=20
> Thanks
>=20
> James

I might have missed this but what are we going to do about the
Sensor.Value in the case when the data isn't yet available?  Is the
sensor only going to exist when the data is available?  Do we need to
define a specific value to indicate that a Sensor.Value isn't available?
Now that we've moved to a `double` for Sensor.Value it seems like we
could use NaN.

--=20
Patrick Williams

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9RDesACgkQqwNHzC0A
wRlM5BAAqiX4efsBpiVZOflNQAkwVsWm4cRICRtd9ed2Awe4Dt+QNLiVm106rjvb
4olqIDkqzOWJbYaj2/6qabwrYgKM/xisFGVjTfHP34U4fS3C3k+EDms2FKWJr7y9
Qp8nn3NLaih1NA3oB4LkE0RghM0w24Cd3GCh/jriK4KJaospM+9qzA58E+uikbwL
jyK0FCYerZutOpynJXTE9F2/aKk+jEyjYksLFMndmXZXj3Y+kALfBh+YE7h0wLDi
sbOaNfMDIRzQJTwNxH4jNlsakJCzOOSFTAK2yQMbo9AxGV53Dkjs1BSK/8zOVY52
6IlgjIUfSodlGhyAW0dsJcrsNj2V79inYDq9NNbMQLQ7G8nMLJ9DjObfn3DLUKWC
y4w3r+pzgNedFlALl36gA4yHWGwmC/KSQzoSFaYzzhGjPNNhd9uV1CiL1vJr07P9
6N68a6q4I5uXSOJlYuI9UXUKk+Yl9KAX1H0HvW8mpeBPCdq5f56oK7JIOCNZ3q9s
/xegACPuOcmEeMyV/iQMY7sRSE7hpbGaKejWefQ305ZjMTUSWS0P/+8g80X7O53H
G2AXKWHzC7hw+jyTVXKk1/YH/cXBR3qIrDQ+TddtdH5d+sAAEku84z0xpgyagjED
BYjLJQBY1EqZ431QVJIOpOABzaT/sPmDesq4N1jtmce/Hjdh/iY=
=deGT
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
