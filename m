Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EED16B0FC
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 21:33:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RDK83LKqzDqSj
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 07:33:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=FexjIp19; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nUmLx4bq; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RDJR13BDzDqSS
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:32:22 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id A0DDC5D1C;
 Mon, 24 Feb 2020 15:32:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Feb 2020 15:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9YH+wEQLZH0uzH/nFlJE0tqoiHy
 MM33ZUCCiJqiIyeQ=; b=FexjIp19upHz1E8rgAe5xCDeUmygl/1yXfWKCD7rcDt
 wWhApDLF8xxVF6kAEQ8MqdOUZWLbXm9V1D5eLB21whlKry/YyNkCPw9c7ZizgV0w
 XHydJZ7ajSw3N9wV9Gid4HiXm0DBSjx9fh9XucHrQPO8LbI10jYZ471ScJSCI1dB
 qPggpMDmcl66OPh45RlShlSTVOvNwg+tEtmG5kAYiEfeQUMquFNvQEK1EJb381/w
 S5wWEEUR2kCZcXVw/tLiQN/ErNhCMGNj0qwGcak1Vg5MuB1PxMf936AsW232i5U7
 ctDU+IoppZpfd+SWpPYM3iIpzZqeUdzCMr0xG5Sa4/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9YH+wE
 QLZH0uzH/nFlJE0tqoiHyMM33ZUCCiJqiIyeQ=; b=nUmLx4bqeU5LZujaWrSfmP
 w8G/CMUdxPCZzcKw7mY+xx5sWbmNj6h5B6+uu+UgQG/UAgTy+y8iYlRH1ttPsSE+
 NNix5hKrs/QFyF1fx+6SSB7u0WCfwjBP+3VabsPHh1o83FVJsf664ZC5cboRTOT/
 sbpz1dKAUvuUiY4PMWrYz+I1Vy0S23HEXqTVh29F+QQglwOPYXjUhxtG1HvlE904
 8PBR5xwe7+LuSkL2fYYrj4nBHfKW8MPWTMAGIXQFTvqtR6lXq+IIP+8NC6m88Wqb
 zylUTbTDLSRMBEhsK4hnzFCG/J1LKFXMZfxOgt4AP5kvskx4uR5nUvkR3llz7/Ew
 ==
X-ME-Sender: <xms:0TJUXusWcnNY5w85R7wMHF1MU-qENXUKiCI_l1tuT4rZQc4pF1cu1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtgddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudei
 fedruddugedrudeftddruddvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:0TJUXnvZ8zPfEJLPJmPRGoZ1vd1VyZLEFlFD1acgUxt8AiHTNllhJw>
 <xmx:0TJUXkwIRx2UO5wD4ISlvZDwff2g91Qnl4U5XBfOEh7YGs2tY2Yr7A>
 <xmx:0TJUXtjZweWi3s2dZg4t9dvumcm2ik5Tccmz0wDK2B-j4CI1FVZm0Q>
 <xmx:0TJUXh4HjeRRE71sqBwVXQbh83SBhKzvcYrVl0HUMEm-ZZp9uCY1Hg>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7B7E3280067;
 Mon, 24 Feb 2020 15:32:16 -0500 (EST)
Date: Mon, 24 Feb 2020 14:32:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [sdbusplus] To generate a common header for public information
 of interfaces
Message-ID: <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline
In-Reply-To: <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 11:25:46AM +0800, Lei YU wrote:
> > > The idea of my proposal here is not to use "convertXXX" functions,
> > > instead, it is to provide the constexpr strings that could be used by
> > > client code.
> > > E.g. the client code does not need to call any function, but directly=
 use:
> > >
> > > * xyz::...::server::MyServer::interface, instead of a user-defined st=
ring
> > >   for the interface.
> > > * xyz::...::MyServer::MyEnum::Enum1, instead of a user-defined string=
 for
> > >   the enum.
> >
> > I don't see any reason any code should ever directly utilize the enum
> > strings.  We generate code already to safely convert them to and from
> > real C++ enum types.  Why would you want to use string comparison
> > instead?
> >
> > Can you elaborate on why we should be enabling this usage pattern?
>=20
> There are cases for a service to use a "enum string" directly instead
> of getting the string from enum by `convertForMessage()`
> E.g.
> * https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/activatio=
n.hpp#L43
> * https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandl=
er.cpp#L218

Examples of poor code are not a use case.  Both of these examples are
trivially converted to convert<enum>ToString APIs.  We should do that
rather than facilitate unmaintainable code.

>=20
> Some of the cases could be changed to use `convertForMessage()`, but
> if one does want to directly use that, or use it as constexpr, why not
> provide it directly?

Because it limits our future ability to change the string format.  When
people decided to reverse engineer what sdbusplus was doing and hard
code strings, they made it so we cannot change the format of what
sdbusplus is sending. =20

There was a commit recently, as an example, that requested we add an
Intel-only "Management Engine" enumeration to an xyz.openbmc_project interf=
ace
rather than a com.intel one.  If we supported enumeration inheritance,
there would have been less need for this.  I don't know how we might
implement enumeration inheritance, but we might need to change the
"on-the-wire" string as a result.  Right now we're hamstrung by people
having hard coded strings.

> I do not think it's good behavior for a client to include another
> server's heaader files.
> E.g. if I am writing client code and want to set a property on another
> service (e.g. foo.bar), I do not really want to include a
> "foo/bar/server.hpp", because it's not part of my client.
> What I want is some constexpr strings, like interface name, property
> name, enum string, etc.

With the current state of things, programming choices are:
    1. Include a header poorly named "server" into a "client" code.
    2. Reimplement what is in that "server" header file.

Under no circumstances is a good approach or one that should be
encouraged.

> Ideally, sdbusplus would generate the full client binding code. But we
> do not have that now.
> So I am proposing to move a bit forward to generate a little client
> code that would benefit the client's usage. The client won't have to
> write the full string manually anymore.

So maybe we call it "client" rather than "common"?  Common implies that
there are header files that are okay to import under any case and I
don't see that to be the case with what you're proposing we define.

Again, I don't have any issue with the interface names.  I do take issue
with the enumeration strings because they shouldn't ever be used outside
of sdbusplus (or a similar dbus binding).

--=20
Patrick Williams

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5UMs0ACgkQqwNHzC0A
wRkpNg/9HYuQ0eGaCKm19BO4puNdzFzrEMyAhE9ON4CQQruRONMMymq6ScS0X/Iv
6VIzaPabPKRkxvteq5K4+o446RzNlZKJpnUWgNfeo3eAVvjyx0OqEHy0uKycKQ7G
A/TLz6iHMXbnP22RNnjldUax9K2BZCpXRX4HWIG2vIWCTPulA1fprl4+3l04Yb6D
+g10aw2XSJzpl7c5Jrxyyoki54pVvg3POpZT64jqxzs7Wc/ULS940l0pUbDLKamM
mK2zV91bkNSZbG0929RKOILlV0bht3R6NI1vtpLzUZFoZAx2chZBc5RWXTtImivw
In7p1gdDYYhi00luykFg0wgXK/LkodjxrYUFCouNLK82DEb8AUQM8Y4ona9ZPUgS
5Dg9iQUyVui4a15UE/RLinsvOfl2ip97SaCbOLhqFUS+cpGJcQ8Q7RuVHMU4UmHG
NrJ4PilteN/Xoe+XxiQsXM+zhtHxybhZdSNvXmoR1B4/Sn+yQdX9MJX4GHNIHyL+
KQmLm8C7PFCNmak7WVtN8DmYVqU4lCjEGepOTLhmQDHE4GC/SOBLdQf5Z3n0QwNz
6IOW4EeAlFOYyVXNTyL85Cpxex+q4Hoh1KSqDlFqglJDozC/x+fVRm2ONwmdAnvb
GqEGVGuGPSjqndxyQo9p0YejFGUrsSn+Z1Ifb6HfGrftQBculVA=
=CKwh
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
