Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FC293E76
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 16:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFwjX4B1BzDqby
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:19:12 +1100 (AEDT)
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
 header.s=fm3 header.b=SeDDsZ2P; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=E24Ym32u; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFwhM5svRzDqLZ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 01:18:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F7BB5C007F;
 Tue, 20 Oct 2020 10:18:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Oct 2020 10:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=59oHap5gAKViZ67QoCGfPUIcoIo
 r+cN5t3cJcJXTj1E=; b=SeDDsZ2PIAPkoqsFMegacWgqODgG7QlmdftBQzl1E7Z
 CgNeCbcVzUuTM6ULfimx3QfRcjIh5eTMlcV7aJaocedurMucQGxYSa+Xrg8nIryk
 ssU3vTwCDOChk0Ac6okAUSZyt+kKEqjWjFNVaJjft2mZG3bwfVvj0Qg7v5KVmYq7
 DC2EXEYljrcrLy83jws7ZrBvTEJp2I6M4nE/8OttCpcC/1GMBpTi2xABE17ZBqCA
 tjzqsWNOpM9rUMdW1/3vZhTCRu1+UUQXviIoOQ0Q6Cg7nxy/UMpRPSl4kkp+hZvI
 FyJEPalgC5HDJTXnoZOLZvZ83xBwcelB3EvwMvTnfdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=59oHap
 5gAKViZ67QoCGfPUIcoIor+cN5t3cJcJXTj1E=; b=E24Ym32u2hMC4LeQWuzwoR
 rIm8tKIsZ2d49nb6+OsUcf52NYHhMnrbxGRD7hK+Q6rHolqms7mHaSdefGJylD+o
 jocwfc14/W225kYaiFTyVfduwafeFmAiv58MNrJGcvwlYwOGnkH2VgfFYPrEEKf5
 K4Yotgatlj6moZwghuGlXeMlxz6NuG5bwyvV72D7+Z1HsI9QfJj1lmbpzFaGnl00
 4d5KbepULS+Y6S5mdeyX53sBtZz7tOPwZdi/6gZOA7zaBjA6XTN1SkQo7G2klFi7
 2WM261/aSYjjZzrInDE3dCAEZkBTjiExfP94M+mcX+bB3qc4joOekJaSoEN3zMqQ
 ==
X-ME-Sender: <xms:nvGOX5Ow6hCRowi_g9g3pOliMXZSRfyo1PnPbh73aThAEQ_lIG_c6Q>
 <xme:nvGOX79cC5itaDHVFCXg81GrYc6YxnmSYEXOfeBY0-UI2ZUZqKClntZWG79mkaL1i
 3BRdq9rY01pjDD86rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeefgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtfeejteeutdefleefieeiveevkeeg
 ueevtdevfeeivdfhieeuuefghfekledvhfenucfkphepudeifedruddugedrudefvddrfe
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:nvGOX4RvngsyyVNnvB6csYVJ0G-s7FH8LVTsvcBxEC5YnoqyP4qBpw>
 <xmx:nvGOX1t_OdWXTBxYQ0a3uCzka48_uDcUcoHLR06mKDfzfkfPHttTJg>
 <xmx:nvGOXxfADgDP5PAo39Oz5dwVcB_aYo7j7U55pYIGrMhgQX86aFPEMA>
 <xmx:n_GOXxl5EClIj8ERyaNYydDzyasRmYbP5lMy06POuDf-_TVTq76aJg>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B321328005A;
 Tue, 20 Oct 2020 10:18:05 -0400 (EDT)
Date: Tue, 20 Oct 2020 09:18:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
Message-ID: <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
 <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Thu Ba Nguyen <tbnguyen1985@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 08:46:30AM -0500, Matt Spinler wrote:
>=20
>=20
> On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:
> >=20
> > I also thought about the solution for that features:
> > In the current hwmon we support GPIOCHIP=A0+ GPIO=A0option which used to
> > enable sensors to read. In the hwmon code, we just set that pin and wait
> > before reading.
> > I think we can support a similar option named GPIOENABLE=A0+ GPIOV. When
> > the status of Gpio pin defind in GPIOEANBLE=A0match with GPIOV.
> > That sensors will be read and update to Dbus.
> > If not it will be removed from DBus until the GPIO pin math GPIOV.
> > Maybe we can have many different solutions.
=2E..
> >=20
> > If you don't mind, can you tell me how IBM supports that features?
>=20
> We lucked out out in that the driver was only loaded when power was on.
>=20

Hi Thu,

Is this something you could do similarly?  Rather than have the driver
understand the GPIO directly you can trigger a phosphor-gpio-monitor
service that does a 'bind' / 'unbind' to dynamically enable and disable
the hwmon driver?

Matt, is that how you have the driver configured to load / unload (I
assume your case is for the OCC).

--=20
Patrick Williams

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+O8ZkACgkQqwNHzC0A
wRnFEhAAkBdIKSTgkPwCh7cwQqQj6ISZRbqTz9XVUhUEVJBI6VggJgAZ0moy7aOu
+07isVz3M/31wo+6HFzag4ruoQlJyioi/MCzr9pGE8kb0vPBoJori9mQo8kBi0/b
qRiJ+nK9mtnD/H1w7ByA+alD16YQ92ujNkmlPmV7nhnFZ7Ihl2K0WfjLH08juJtr
lOmfU7XaqAmQMuIqS/gKGPw4ppiZmoLuVz2hysUFXfTqpNKHdtplEujrplJF9AE4
+WlVLNkoaHmVDjft2JPLj0zfIiookmY8/tjv1ruwtX3d5X/o7sXNa7Dd8tm4+Q/F
IzrPH6h91Hmuff+my5OXzJRoVLbSET3rCwtiJtx863mr4KINq81nn0o6toOMcS8y
w+BUSoRUQxZ9SkwDNCX9rWGf3cpVGgEzBw7mVLp01LuYQzrEX0qZUuTpUmzgK6oH
rePlGOIa9CsVQ1zfz/RH+BMB5Sj4vrDGwggqap+5Ya5yhUPEnJ+JX+qF4qC/x6QL
s3B9eB8eH+SQ4iHN0hjCpM0d39DH5+nj2+KUwzF0vd40MZPxfF0DK6LHr34evSnh
FF4Rk+eO/xAc+DvgdBeYFXjIRjNfpiz0/qkPVwxUy5WR4zx0pwDX6dktnWF4sOYd
wYM1+n+ej1v0Y3W0wdQWkqZo0DbHQQPIXpPBeEdGDjvaIjI0pHE=
=Y5Tk
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
