Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302674B5E13
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:14:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKmQ2y3Mz3bTr
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=RF5aRo66;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kY+nTSSj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=RF5aRo66; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kY+nTSSj; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKm12Z4cz30Dg
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:13:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A8BDB5C007A;
 Mon, 14 Feb 2022 18:13:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 18:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=zQOUGzaO5jH0YR0DE2qbAOYoi3kB4ThwHC/JzV
 v/jhw=; b=RF5aRo66KaZrmQSZ+VAGbgTikfZDDf/lLLsuRnszY+mqvAW7/2bbCm
 pOnrjJE+9t6W/rpa2dYk1whnf78eV+Dlyej1MzxRFLZgqOw9mWdKbe7WdMsiDHVv
 EJiwIzpRx1AyEjUPXXo/sKJ8voq+lqHso6Ot0updAJnzQDD83zemgQ3GyQa0BFg2
 OnJrRXev7J59il+XkA9mHSYhY5Jo2amkgh6HFt85pPZdfovL4OsN0X01yj2oe3Kl
 bcbfk58Ebsite5eo9ziiq6/Zrr32+l6nkWtWV07cDUuDxxY668viUxfBNXU6u7Ub
 Sxe4zgBfLytl0rE0loaScSM4TdfJ7g2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zQOUGzaO5jH0YR0DE
 2qbAOYoi3kB4ThwHC/JzVv/jhw=; b=kY+nTSSjw0qyQIn5njpvRSrpdJZ8hzi47
 EdBqyXoMisvxYEyiEks17K+mA6iHMmv5sJc0WWQ62PuKSNEamxqaOrVDEaE3l1uZ
 6Q4ZAyfX4XbqqsaSa49U8x+Bss1eGwp66n685nZF5cTCKIL8LpMaMF4C2WIvBgpR
 oQ4Zvlo+5p6f72PoB3QtreMTusJBGSgw0qkpMLpR99izXigqJBlA2N9CsKy3AD6B
 3H3fFkQjsHh9PnWdYReZNq3GmQH4+leysBxxcnwXtoJXKNtX6tC1fNghkRtbVCjQ
 MKXoBpd4eqcpIzciExVJMfPsZv/VLXPVmh2iU9ykcZK1rN4nxZRbw==
X-ME-Sender: <xms:L-IKYtg2KVng10UCJhJPn3SMKMSYdvMU3cNCMr2IhC2-9SF4f0btjw>
 <xme:L-IKYiCG6CQV4ARy1wOa0tE7gxuIXLF6sohpz6OIpoCeRnOuz13il6CK_1vlRSmXD
 4aSYQ6ofiYxcCt3k8A>
X-ME-Received: <xmr:L-IKYtEzYvxxy5lM7xz1Tceq8twmZPhPcJZGQu8B-QeadoYEb7ZvGFx3rGAKehAjh5YLIdt43iIYe9CwDxn-hNvPjBEXrx31>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvffeggfefteeigfethfeiveeuudeg
 vdfggfejfeehudetjeefffetkedtleehhfenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:L-IKYiRC7fe2x8hSqXrEhNq_EvT6AX-7syUONNRpk1LkrZxLu1XHPA>
 <xmx:L-IKYqxF5SaQdRt1J7aqXg7950EFdBmPLhlyd64IbVYJZCbneS7J3A>
 <xmx:L-IKYo7OrW-cUxGdbIM-A2bitrEEmYSrEIikRdP3N2atNi84AaY9qA>
 <xmx:L-IKYhkCMntw6NgQvI79FCiyyGPb3iJDhkAcLBfDjceyh7HAwz__3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 18:13:50 -0500 (EST)
Date: Mon, 14 Feb 2022 17:13:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Message-ID: <YgriLTCF5hvtPCMm@heinlein>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LDYq71dmuFXk9ftG"
Content-Disposition: inline
In-Reply-To: <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
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
Cc: Christopher J Engel <cjengel@us.ibm.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, U-Boot-Denx <u-boot@lists.denx.de>,
 "Alex G." <mr.nuke.me@gmail.com>, Simon Glass <sjg@chromium.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LDYq71dmuFXk9ftG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
> On 2/13/2022 5:13 PM, Andrew Jeffery wrote:
>=20
> We can decouple HW RoT and runtime control on enforcing secure boot
> (requiring one or keys) on FIT image. Conflating two raises lot of
> questions.

I won't claim to be a security expert but I don't understand this statement.
What are the "lots of questions" that are raised?

> There's not much case for disabling HW RoT, which implies the bootloader
> (U-Boot or more) has to be trusted after board is manufactured
> (OTPstraps, especially OTPCFG0[6], are programmed).
>=20
> There's indeed a case for disabling secure boot on OS FIT image -

Why wouldn't you want to replace the bootloader just as easily as you can
replace the kernel / OS itself?  I don't understand why this is more special
than any other software.  Bootloaders are replaced on "real" systems all the
time.  There are multiple efforts to be able to replace BIOS/UEFI with a fr=
ee
implementation as well.

I would consider the "HW RoT" to be the software in ROMs and not anything
which can be replaced, like u-boot.  Why are you extending it to include u-=
boot?

> If bootloader is trusted, it's possible to remotely push the policy to
> disable runtime FIT image secure boot. Such policy push must use secure=
=20
> transport (someway authenticated) and storage (simplest U-Boot env).
> This is helpful in cases like booting diagnostic images if board has to
> be RMA'ed and diagnostic images won't be signed by production keys.

For second-hand / recycled hardware, I'm not sure the bootloader _is_ trust=
ed.
It is also possible that I punt on some aspects of supply-chain security and
simply replace it all when it arrives in my hands.  ie. If I can securely
replace all the bits, I really don't care if it was tampered with in transi=
t.

> There's a key-requirement policy already implemented [1].
>=20
> [1]=20
> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microso=
ft.com/
>=20
> Board code can patch "required-policy" =3D none at runtime based=20
> appropriate logic.
>=20
> Regards,
> Dhananjay
>=20
> >=20
> > With that in mind:
> >=20
> > To escape the manufacturer's key-chain for owner-controlled signatures
> > the concept is the manufacturer-signed SPL (or u-boot payload) will load
> > keys from an external, write-protected EEPROM. These keys are used to
> > verify the next element of the boot process, providing user control.
> >=20
> > To configure owner-controlled keys the EEPROM write-protect must be
> > disabled. This may, for example, be done via a physical jumper. If left
> > with write-protection disabled the matching public key for the signature
> > on the payload can arbitrarily be installed into the EEPROM which makes
> > secure-boot verification moot. The patch avoids the run-around in this
> > last behaviour by providing a platform hook to read the state of what is
> > effectively the EEPROM write-protect pin.

Isn't this jumper proposal just like the TCG Physical Presence requirements?
This is a software implementation and requires a particular hardware design=
 for
it to be done right, but it seems to be along the same lines.

--=20
Patrick Williams

--LDYq71dmuFXk9ftG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIK4isACgkQqwNHzC0A
wRnNwA//e6Fil3ULKlZbLpBeZZaiVm2JnSgVaqUxtOzcty2HzR0E5+Msol9UhUVm
DpS+t/oxg9PLXYoVClI7lAqFN19ADHYW+RXT+2lU3vHjckY5V94HiuWgKu8kyxi8
mXvRlNWsGewyogcyPhbJgroRobtpCP3TsDFpX6YXgAOpOSe4re+I37JWNSjbPI6x
DlBkVveobpfk6SoG3/VhrKZjNx2TcXAPSP5l059UhzDE8YUD6vOBy+rReOl+DJk/
sj8O8VMKOWvto6tXS7neHEJ5rUGCHmwOmrlLLZtBu7WcYd0R/bElRuPEO8JwhJ0R
qU/qVR0FGoQtkQtzeicRIMRN77Mk3LBM7Dt9AoTrxecEnXumjjWAXyB/j+1LGGvu
sxSJo0busvkmQo1kJ1YUu3UXCV7SPLTmWaLJUN+JGszXwFQE7dMGi/K+nyOGJ4gf
yPmmpr5EDBgtbC2c4KVB75U14cZ0jjHvWeKifVMijIzB7a6YTRcqz6t3EL+FMwUI
fnpg64+laJgBoktki5UrIEC62ybr1QGII49TFmO0myC6Jf1S5AKOR7p8vV7yUbnY
dPT+dlI+GhyERDsLJhwhRfWnqWM7Cmv4IXCA5d30jhikbom54aJW0Hcfqf/m/TRv
kVG++CfGmNOcPW+hlc0U9vRLj0MqChuuEivg3tMU+2zKVvY7fEU=
=J9cm
-----END PGP SIGNATURE-----

--LDYq71dmuFXk9ftG--
