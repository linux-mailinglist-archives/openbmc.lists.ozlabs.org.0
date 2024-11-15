Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D89D06B6
	for <lists+openbmc@lfdr.de>; Sun, 17 Nov 2024 23:45:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs5S83Qc0z3cPZ
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 09:45:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731660695;
	cv=none; b=bhEnw9jb3itNMfFmua9EkWCEeoKVzV837YJ8ePJZIVOD6ywkiXV8MflJ3L6XsC/cIsTHTPgt9VTVv0CMh/HVZz4MrCEGgqo2eYRMqXdhAcxRfpBzsoUcayePHCZBX4diNPBsg4IOBnYmImj7Xq3xcjS5bBk4tKLrUmZZgQ2ZuSz7kc41HiS8v/UPv6xE0VL6ONe4pWvwvE/8tXWXMwn9OaYTFXdSwECKlP8erQQE3aTD93xSHCIrH1oscc+KMmySGk4MDuAiQmWI2Xdt4jFhy2dwiRUAcEqMZjxUj2vKUGAUnHVg2ydUTO86sZ/kRfLDTSRH2Rau0PD+kRcf2DbwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731660695; c=relaxed/relaxed;
	bh=XkqWXf7ZvjAOVDTZSmrCmO9IUaeP8XfGOR0vYgcZ52o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYAcJ3WiD5psX83HBzjKrENF0h5iZ5R17Vi7FvTK6QR0JeDNlEi1UzDjsupRpdz+78523kq615JrbLUpkdXOcC/Rr1hgzB7sJqFLnGx2y0BVkWjIAtYmUU46prEGW/zPflJH2X+Crv7ILcidTi8LBsTUEQ9x0M3HZ15lJh2QJiOcglRvIdomdHmdDCXvNvVIJMUuNvUdBh/66A0iQLOFrO/fgJ34AN4WaD9vP7ZhpR655kaVmwt+v0gmx6j4YIVPZKXHPASyiVEKKVmzGJAhnOHW9Xx0fhfef3ecJPq3xJq52U1QFHJK88bILvRFQl0TA5O3W7xNNnhO6FB4ZcGN8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1210 seconds by postgrey-1.37 at boromir; Fri, 15 Nov 2024 19:51:33 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqW390xRrz2yfm
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 19:51:33 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tBrjF-0000SB-St; Fri, 15 Nov 2024 09:30:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tBrjD-000sSC-07;
	Fri, 15 Nov 2024 09:30:55 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id AA09D373AB0;
	Fri, 15 Nov 2024 08:30:54 +0000 (UTC)
Date: Fri, 15 Nov 2024 09:30:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
Message-ID: <20241115-scrupulous-mantis-of-purring-1c41fe-mkl@pengutronix.de>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
 <20241113190920.0ceaddf2@kernel.org>
 <da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
 <20241113191909.10cf495e@kernel.org>
 <42761fa6276dcfc64f961d25ff7a46b764d35851.camel@codeconstruct.com.au>
 <20241114070235.79f9a429@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vt3m2lwmvec4zdoq"
Content-Disposition: inline
In-Reply-To: <20241114070235.79f9a429@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 18 Nov 2024 09:45:09 +1100
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>, Jian Zhang <zhangjian.3032@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vt3m2lwmvec4zdoq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
MIME-Version: 1.0

On 14.11.2024 07:02:35, Jakub Kicinski wrote:
> On Thu, 14 Nov 2024 14:48:57 +0800 Jeremy Kerr wrote:
> > > routing isn't really my forte, TBH, what eats the error so that it
> > > doesn't come out of mctp_local_output() ? Do you use qdiscs on top
> > > of the MCTP devices? =20
> >=20
> > There are no qdiscs involved at this stage, as we need to preserve
> > packet ordering in most cases. The route output functions will end up
> > in a dev_queue_xmit, so any tx error would have been decoupled from the
> > route output at that stage.
>=20
> Ah, it's the driver eating the errors, it puts the packet on a local
> queue and returns OK no matter what. The I2C transfer happens from=20
> a thread.
>=20
> I wonder if there is precedent, let's ask CAN experts.
>=20
> Mark, MCTP would like to report errors from the drivers all the way=20
> to the socket. Do CAN drivers do something along these lines?

On CAN_RAW we send fixed size messages (struct can_frame) and there is a
bit left to mark a can_frame as an error frame. This basically means we
send the error notification inline.

What about using sock_queue_err_skb()? We do this in CAN_J1939.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vt3m2lwmvec4zdoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmc3BrsACgkQKDiiPnot
vG+fYgf/Va/T2YBUFonO4TuAsteq+Vjzg37H/7ok0NZCvgSfZ8QqVGaI54B/ByJH
fdknhCQ6xHUH0ov7SkK7I8TS2LZHQ3N092ApMCtENsfCTg5ZybIiibPS2Teb+lPP
lKbktQqtS/5UX/ZJdstAl43zm/MYrNMHnfV2D+BUXDMpr3JvMFX6B6/jeUwZ/lAS
6r5QAne4+DWNfWf+1S+YWsYHqI1r5cuzN1ZcVPM2WhTM0LdksgkojKAvV5t7zDes
zwlUtToIF6nfehDyeue5wjMy0WrPOZQs8cTVi0GK3Z2petxKnGFWAvn5mkVg6T0k
Wc7MKFi1s015Oh1cjnxV6VwvambeUg==
=XgKe
-----END PGP SIGNATURE-----

--vt3m2lwmvec4zdoq--
