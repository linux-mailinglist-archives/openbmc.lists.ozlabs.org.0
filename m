Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202689CF07
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 01:41:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=glnUb59w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD5GW0PZ3z3dXG
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 09:41:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=glnUb59w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCj9H0r8Wz3bfS
	for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2024 18:36:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kaac
	/HoSNF6kBNyIZvAXuiqRv4XHgDdylJjIFzS6jJw=; b=glnUb59wzYNl2lqMUYNX
	ZjUTjMWP3AF1osTTIZsoviN3OVy5BVJPkeMTiTK24l1kSjh67hVzj2X7pl933Z+T
	yFI4MjENYVeM0iZuomTYQMIpOfRHkW5XXs1Ke56fnzEtFh4XZ04yv5kXwAyknkFH
	RSv3fOKzz0XxOSYFNznus+MuvaBkHRwXMPA7wOEDzK/ktzSAQ/LnQRNh94tyfyt9
	SQU0i1k9pTWQN7r904M+8imA3//k81pjO1fr6cvj9vkSo8QcaBuPlInI2Cfg66WF
	vX1o+E++730gPmmHdiIZgXCxt+TA+529ZltqwmOtliGNB6G/Z7YJ3Yj5JyNEoBMn
	fQ==
Received: (qmail 704034 invoked from network); 8 Apr 2024 10:35:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 10:35:53 +0200
X-UD-Smtp-Session: l3s3148p1@ivmCsZEVfqEgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 10:35:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
Message-ID: <wcnu6qxxztplzpqtqc4t3bf53v6buto6ch6b5l5xoytrxxdgjz@gwzlifzzfrvx>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
 <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fm2sehicf2gvt3hb"
Content-Disposition: inline
In-Reply-To: <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>
X-Mailman-Approved-At: Tue, 09 Apr 2024 09:40:33 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--fm2sehicf2gvt3hb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> > +static int aspeed_i2c_xfer(struct i2c_adapter *adap,
> >  				  struct i2c_msg *msgs, int num)
>=20
> here the alignment goes a bi off.

Thanks, I missed this.

> >  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >  /* precondition: bus.lock has been acquired. */
> > -static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 sla=
ve_addr)
> > +static void __aspeed_i2c_reg_target(struct aspeed_i2c_bus *bus, u16 sl=
ave_addr)
>=20
> We  have the word master/slave forgotten here and there, but as
> we are here, /slave_addr/target_addr/

I can do this now. My plan was to convert it when I convert the whole
CONFIG_I2C_SLAVE interface. But "since we are here" can be argued.

> >  static const struct i2c_algorithm aspeed_i2c_algo =3D {
> > -	.master_xfer	=3D aspeed_i2c_master_xfer,
> > +	.xfer	=3D aspeed_i2c_xfer,
>=20
> here the alignment goes a bit off.

I also wanted to fix this afterwards together with all the tab-indented
struct declarations in busses/. But maybe I better do the tab-removal
series beforehand? Would you accept such a thing?


--fm2sehicf2gvt3hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTrGgACgkQFA3kzBSg
KbaYiw/+IdfDf8ES2q59HpvmAbphgCrIhyycf7z24hxpdlMNa8KCH+NGusDVZ8x6
DpMDISrjfNpwL+rpE0shnhzmKDo04CYGRceF5E71B2Gk/1s1ujxNOGP+VP0nW/19
jb8zMDFeuEnkKqF2T2e3lCpTLsP41V4Fl+wWNPL+AkS7hCBCjYyvDemtknRJjqzZ
OkawH3O73gJ1m07M10Q0IOLfDBMh6qFw2URTIMEgvfErroscCYruNq7BXisWfCHo
85iiYyiWeWgTpdp6SPFL+apD519ZnS4i6F4XrsVV/Kk02U7izS7QxYi74y7NDA97
JAQVUSy0JkVmAvwcncQhc5xYc+XJcO3lXd4Gw3UJieVVfwUWm/oKJ+qXeoFUPVUT
2zOltFsyZX1y0tVS6+A81It3lVzAsihUy4Z0vmPa5IyB1yFxHZ6ljsOV+slH0otE
+RfzSHL+tA/GdojNayLC70qTKri+goIxImhP4XZn3dc/5RaX9rSfooeNGkK89SJx
s7aK447F0zoeH5GiK3V3aXGY7XLFHE6WSBGy/MQorHu01PF16jlh7Hagyk1BsIM8
c13TUVcc9pgSHW5gPBqay2f+SfTJCtapK2KO497kfPmP4S5o2JXRYRwFezZa8ODE
YI8mFy0scsJxEv5P0WlByOFGFRbFkcaD+gMejTz5bBCUUAUVa+s=
=iumt
-----END PGP SIGNATURE-----

--fm2sehicf2gvt3hb--
