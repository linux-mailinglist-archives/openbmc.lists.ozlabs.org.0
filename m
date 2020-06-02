Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7751EBF6A
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 17:54:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bxRr1225zDqSK
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 01:54:16 +1000 (AEST)
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
 header.s=fm2 header.b=Z4A/u6Fe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eh3taR+U; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bxR13Md5zDqNp
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 01:53:32 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2CD7788D;
 Tue,  2 Jun 2020 11:53:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 11:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Wc3QuHslp9xJtLKWlaB0Ns/LDXd
 mAfwEp8YyI7IJOpg=; b=Z4A/u6FeBfTvhgX2xO2cirQ7yYLnSTkA1LILiga/05o
 brGgCqit95XYCY8maTmxuqrwPjh1BiX5hhbyA+8txy/RSVaKEYQ9eBuRV9cTFCdv
 JHEbV/fdPu4L69Vjm+yYeaRoD4KbdBN6jY4KYfippeHz6eX16fxnLJvt3p/aSIat
 65qpQJIQ7oSUb9OWmFBQpxI286avFwaKQycycugFtiyBa1y4TU8CByWV3tydmHUx
 X2Wuox7b0ewIvJgvSkZLE6fL+Za7T5F1+0FRKR3PPXIJaYPp1yX26zbtEin/p/jM
 oLcqFK2hB1lBqLPgnbMDOxfYya8vnE9rOWSRDeTlGdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Wc3QuH
 slp9xJtLKWlaB0Ns/LDXdmAfwEp8YyI7IJOpg=; b=eh3taR+UWYts4gJT1UxFID
 ZjWyumfBxgZqMnF8Orq6sfRnHtbFT+xpnwNN+mK5AGh4Ps6pI5oBpbqdwvCF/seX
 t53tbpncDo6ta7IjM42tpYwRZwbCxhCtvpWIdcAJaVPQZ2Deab26CCVC1+I1QSig
 XOYzqZKmjkT9BxPqGmrj90muZWBRdJTeznqHu0u+A5SC9cJoHSOQKfNGARM+y4O9
 k+pPBMmTLGlv47gK3OsHrMbnlivCECT2Jxv6mdpUpKASXjFBymF1kFrngFKwzGdo
 4C5DIbQLvL8sBhwd5QpHOaPNl68nL3Aeq+0JMmGvW7mNcYBhDvGltvs/8wS8Ejag
 ==
X-ME-Sender: <xms:-HXWXqGbU-Ef8KvfEqjoiQDfMNk1GSNjvQ2-pt4DOtgmvJBe1Eq_wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdefleektdeljefhiedtudfhveei
 udejleehkeetgfeifeeitdejgedvgefgffffnecuffhomhgrihhnpehoiihlrggsshdroh
 hrghenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:-HXWXrUFzmwC7n5safggkZWDdXQhAbNotrXwAtkqUye0sgPBbpbntA>
 <xmx:-HXWXkJkFZ1XfQrKIJpP164zINnp7W2YlGc79Pz9iX4t9s_2QKYkyg>
 <xmx:-HXWXkFo6gebz7PjIRIp--Bl3Yf4b_aOHLkUj6HW4fxGYl7BIxlJAA>
 <xmx:-HXWXiIr021lak61wCc89VBWQ6Z3-K5oQ9fGDdnFVlBJAWDGrY3fsw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B83403060F09;
 Tue,  2 Jun 2020 11:53:27 -0400 (EDT)
Date: Tue, 2 Jun 2020 10:53:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: Sd_bus_call - ELOOP Issue
Message-ID: <20200602155326.GB1717@patrickw3-mbp.lan.stwcx.xyz>
References: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
 <20200529180709.GH17541@heinlein>
 <20200529182107.GA7478@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20200529182107.GA7478@mauery.jf.intel.com>
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
Cc: anoo@us.ibm.com, openbmc@lists.ozlabs.org,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 11:21:07AM -0700, Vernon Mauery wrote:
> On 29-May-2020 01:07 PM, Patrick Williams wrote:
> > On Fri, May 29, 2020 at 09:29:48PM +0530, Kumar Thangavel wrote:
> > >        Also, Please let us know if any alternate method to  call the
> > > execute dbus method with the same bus/connection.
> >=20
> > My suggestion would be to see if one of the functions in ipmid-new.cpp,
> > such as executeIpmiCommand, can be exposed to providers for these kind
> > of recursive callbacks.
> >=20
> > Maintainers of phosphor-host-ipmid have opinions here?
>=20
> ipmid hosts a very small set of D-Bus objects/interfaces. I don't know of
> any standard commands that would call back to itself though. There is some
> context I seem to be missing here.

Hi Vernon,

There were a few earlier posts about what Kumar is trying to accomplish.
We have a server with 1 chassis and 4 hosts.  Each host card has on it a
micro-controller which talks IPMB to the BMC.  My understanding is that
Kumar is trying to reuse most of the providers by taking the IPMB
message, stripping off a header, and then reusing the existing IPMI
provider for handling the bulk of the message.

1. https://lists.ozlabs.org/pipermail/openbmc/2020-May/021631.html
2. https://lists.ozlabs.org/pipermail/openbmc/2020-May/021880.html

--=20
Patrick Williams

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7WdfQACgkQqwNHzC0A
wRltNQ//fPSMICGKrEpyDV6gYPoneGJ6mwoDJ9K7r8oYaX5bIFi2l0kCvMlDQNt8
6AKwAzgHTAhoUyujhdMX2mBiaUVZhuME0OSlVQ9sEiy0I7JWrHMsKIzz3gKr/7By
pKr2xgxnqAVW7MYn8orxHM4/s1DA3ytVbpr60/s3kkXXKXuQUUJotUdasLi8052U
X4xGsttucac0Q77vjrsM1n9H2YmO4wTNoQAm8/RcFmL/VCzfp7uWNOG1f8o7gEpq
zACcsECuOXNZEFg84+PaaU5lPBvjT5/dCGVph9Vk/ePCgr5Pvl9jcetL6sTUfHDl
1OdkPypKjpOSkaKhWFyw+Co+D7DGLNN0zIbPTVlLMyy2y/R+zGv9ShXF+FeGQmaQ
TIyrLkZNfTgsOHIHtARMtBahOi5ygx07Kxrjp/mV4WqBfwrl2Q9fkXogP83HXymo
O5IMcvs3IupTlgbtp7fv/il5tmZX6vRTTy3yMBy85uf8jj6Id7bvTDEmdnnX5fIP
ShjPzDDxfzLksiVlSI6CRdFyqVdCUV3D7hggon23ZvZADK2O0i4lGZwM69wh0U4x
p1uhnG/ytTBPw8oPqV58WmFj90rvacRXO4mBojTtK2wvSYcNxdU/s2+ELYI5nRga
YxOhqODdoNZ4Gs5I8sQ4hJ9eYiqE5wUK/ga5SzUr/9//wjGdVcA=
=wnQ8
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
