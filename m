Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B674168845
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:22:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PNCm56j8zDqZy
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:21:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=YJD38pJJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wYYBGzoB; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PNC13r4WzDqRY
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:21:17 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B35F1D58;
 Fri, 21 Feb 2020 15:21:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Feb 2020 15:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0qayHbu85nOMHgKQXBZPvwNAkwg
 RJY159l6K+HSjpyg=; b=YJD38pJJdoQ9cz4phqMYR10FeL2RgGOD9GeF4TyeRxz
 A83541xYjrlDxtA1kKoGCou1e09+SoUskiZd/2rE/U31fTHrA0uGvi3Fm+l4Z1+8
 4uJX//NMDiL3uwfXC0jMFKz2jaTP4orCe6H1yeFNs8AMF73IvsqPYNfxNv8cyBKj
 XmSQZXMFvz5VcMp29uKtptrGDy2BFFCYoXhiPiMC4fkdfOPQpIvCSemHU4EBj9xU
 /5M0Qj6b1z+cRsh+Et/nCewHl48POuq8LiY4aAwXPecHYu/GFLDZfv6DYKL9Wg8H
 AEukS9ABG/ULu3nxJ30qaPNij+dP6PB1mtzUDC6aCPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0qayHb
 u85nOMHgKQXBZPvwNAkwgRJY159l6K+HSjpyg=; b=wYYBGzoBo4Q8rfpKiHbYMU
 jQcWTYWPrvc3soREKxFJUw+ZbVVecxWqLlHHTx51DbhiRDxmvVU8G9hHC0/4om84
 jiPtznJkwEwZJkeR9lJtLbN+aTgb2JQmed7u1PenOT3MRhkPbqmvFyTW2PWZub96
 oOfSicIMUpO1QytOlRxZg1wyKLpXsNuxNoBw7aSUsaV/c6scxgME4aMM4kcJ1mgt
 IL6kP3u2ZIn/xAjJ3e2Snl/5wQLTpQr3aOHi9Ch6zdDn4L4xcfn+1zYhqknw0zxz
 kRowRzPm5MK9EjSTReDBqqhlE40rB8TcGvpn4rYxHcAa82OdY70u+LByNrBkgIeQ
 ==
X-ME-Sender: <xms:uTtQXpfdD7xUWnr8qcpZroayDYtXqe-FRySdJsOhRZWE93hTCJj0TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecukfhppeduieefrdduud
 egrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:uTtQXjavr2_zVcttJnKfWnNB3avCaZtbfEpryVCHIbmXuyUo_VcmHg>
 <xmx:uTtQXpqE0MPhHpc_L0wELBGF7mvN8Fr5gW11oXET7sCq2cf_p9BpZw>
 <xmx:uTtQXugzbm_MMVj8zJrJzVocPy3Qfg6GQsnZZqrSs8od7Sxvv3qRaw>
 <xmx:uTtQXnvqOJugrQ6G20Ex9NE6ruFKRs3b8Tre5dWoAKlkS7GwMo7G7w>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 733D03060BE4;
 Fri, 21 Feb 2020 15:21:13 -0500 (EST)
Date: Fri, 21 Feb 2020 14:21:12 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: AST2500 I2C problem
Message-ID: <20200221202112.GB67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <1699551582274510@sas1-1199a7868807.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <1699551582274510@sas1-1199a7868807.qloud-c.yandex.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 11:42:00AM +0300, Konstantin Klubnichkin wrote:
> Hello, collegues!
> =A0
> I've faced a problem that don't know how to solve without tricks like ove=
rlay
> DTS.
> =A0
> I have PCA9555 device on I2C-11 bus, it's described in DTS as follows:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 3.128679] pca953x 11-0020: failed writing register
> [ 3.133860] pca953x: probe of 11-0020 failed with error -110
> [ 3.139801] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 11 registered (dma m=
ode),
> irq 44

Errno 110 is:
    #define	ETIMEDOUT	110	/* Connection timed out */

I think on i2c devices this happens when there is a NACK condition to
the slave address on the bus.  The odd thing here is that usually the
probing infrastructure handles the parent device (i2c bus in this case)
not being ready by returning EPROBE_DEFER in the device probe function.

Is 'bus 11' a virtual bus behind an i2c mux / switch?  It is possible
that either the driver for that switch or the pca953x driver isn't
properly handling this condition and not sending back EPROBE_DEFER.

--=20
Patrick Williams

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5QO7YACgkQqwNHzC0A
wRkebw//S5VETBwrov748rRXIT50hvlattQrQelV1ZvWtRSs8J9WLSZFzaqrO9Mq
Zrvmb7+lZVV9FuzvLvPQD55ZJBuRp9Fiw7+KWPkIwxwo0E+xQHke3Svvsb3i5/nO
uxOQ5h1a7ZPEuEHIhX7OW5QVKaYCp5bVQO2DvxRkxTnkBnAhooTJ6Pm4mWldh/Ti
v06FYsMZfjo1zfVevJb37oz224Q7HUAUZQTBT3tdSULuJ2/R7ykisQfylK+k4H4w
56IR2NFW7fuvEkcYhUS8rwgseUD4biKxJ4vK2yPpTRVfnQsnxB0SbXhClszsxrzV
Cj/YILdgkzwtS8r2VT3ugUWgW8WFRoYIrYmcjo1SLf+VWOIikbRCFh6CFsHw5MQL
QcgBMAORMQdv6TD+ZB6/bzdhi6prlX6IWVlUg99GE2aZc5xbWQpg153CdF/LHCUq
jHwn8RDidyABZzik1T0MJLJuRhlLYiRNklSpZjlrJJ8pTIrOBs+2nVpC+VIjKoGH
wwkHmN7PxBg6wpRMUkFuwIuhww6P720bgNBR5SgV7JYNMTJpAQnlADcN1/tXYvtj
s5z9tucg3zs9opSlYY2C1a1kcvrKuGj7ylAvj7phnkC722ktA/8lyHRP8MEQfBE2
n1IxY4M2n7XGbeiQyRa6RP2P2UiQvs2cawMPO9OroUEY/oCu4kA=
=LQDN
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
