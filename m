Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B135342E59
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 17:25:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2mN01qX7z2yZ0
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 03:25:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=TKFg4pfG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=TKFg4pfG; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2mMj3PHGz2y8P
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 03:25:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616257522;
 bh=ZpkTsQVJAs0NmjcD3kPzM+Qqlv9LHiEPdh8aPjoXU6w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=TKFg4pfGRP4tnVOXItunWvOkHGvYjwSoE0129cCYJgIS0Jk1yAG3E2746msZq0n54
 4e8mqrcaiBHNFnmsJhL7ivB0w2ADgjAS8IiGQqkemTajDVQ4UiLl6bSpAdvTuiDHH5
 L/6Ri1SJLxSs1y+Bxgrqn3ZygH0Y3xWKnchIJQKQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1ltRSY3f4R-00hyOH; Sat, 20
 Mar 2021 17:25:21 +0100
Date: Sat, 20 Mar 2021 17:25:19 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert nuvoton,npcm750 binding to
 YAML
Message-ID: <YFYh79cydgukgTSv@latitude>
References: <20210313175321.2515675-1-j.neuschaefer@gmx.net>
 <20210315162338.GA973222@robh.at.kernel.org>
 <YE+dmdBBk0BZ7BIO@latitude>
 <CAP6Zq1hsmTQfA+EvRmJsK2UosV3YAeRqNxA+jRaeYUx5T-wE1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OByzjVDcIkp4YBkT"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hsmTQfA+EvRmJsK2UosV3YAeRqNxA+jRaeYUx5T-wE1A@mail.gmail.com>
X-Provags-ID: V03:K1:5gJjv8CuTmoyg4ZYdvDNUl7h45WoDH2ALmkuUuiOumF3NA9yGzj
 k/LKmhSLnK0V0J56db+X7EpdYlj6F2yYt5WqHSHylG5AtBa/2Ami/8ZnoFycfXV9RW5woQE
 QZyfsqEtmFwa8im7O0+r4kz+ecHSR9DMco3DBfkxEe/+rWtMbx5NwH8nHCiCm+51Hj741Hw
 8q31mPXxMcfoU2yjnFnig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h3bbpHIxfWU=:9Fwy92oSnTi9znW9izPVaT
 dxpolH6gYH7XXKvbx+O8Mk97e/UqQPqLj9hpfLEy8Ww19b2Pa0JrOkeFbZXW5Zy9071HyabBH
 G76vTjEF6JzjhP4EvA3tRFU9jrQaclid6h/VyEgzECyWGkp44eYKJO9bzRN1vbfkXizAqPl1z
 +JhA2Q+J2HSJe1D+Kzsaag3oUc0ED1Bg2i1rLBS0911GdLhSk+oLvr16RQ73DzCPcALn7imtJ
 H42me/ZjGCRvkAUpAv+TkT5lzsOWB5xmrD01Tomk1HJZt4Z/T2Kg+OiCSs5FJvVdDOsBuWn/G
 tomrly+S0t551AY56p760ALloBqsoQzNMCYfDo44lk1Joo6Q0JA33jzCSUq7qFRFq7i9UBPk3
 g315lIiFD9xzz6c8VS9KuLJ0BAQmBTbVAtz41RAuWQubMiNxhgma3RI/OmUsrDw8Pfzw4zu4c
 WXu3S+HLyMFHOOL2WuwVXN/EBM/+NIBbQpgIjEezvaXuP7avs79kz61QP9dHgVtv0W42vnT6r
 ERa9tYjacXJZ86Tfn/Nkr2WHtUe3J0SbTfBk97I1qsBsRYZ75lJGl7X4jT8eglsZBsyHHqd+C
 ddLp1FyR5lkT2j2WmQwckwmEZkQu/EKws2JVPGAIsdZ8BkxkzEXvq4Vr8L2q+9RW0b1QJESkS
 6GdviuJx2JcNDvQLqGYka6UhUzHGP92BhewAXKwY5ufQUdhpHrityl1PSbYA0d16wem85E4Gs
 7HoLu77IpUyBS+ypiP/OjUHLa2dVKgj6lT8gIPm43LDf5cHoKFmYP1X230Xw85wManq2mTGeO
 +7UKdWyhXNcv08AyAOPdrBi6aQE1N7kuc9TlBBNmWa6q5+pa81GY6TzZU+3psZze0Z1CTtUJL
 n0uzPkGjhqCrM7fRWrRg==
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
Cc: Rob Herring <robh@kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 devicetree <devicetree@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OByzjVDcIkp4YBkT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:03:38PM +0200, Tomer Maimon wrote:
> Hi,
>=20
> Appreciate your help Jonathan and Rob,
>=20
> Just seeing the following EVB device tree
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-as=
t2500-evb.dts#L8
>=20
> And not a EVB board.
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bm=
c-facebook-cmm.dts#L9

I see.

>=20
> but still also option V2 is good for us.

That's good to know.



Thanks,
Jonathan Neusch=C3=A4fer

--OByzjVDcIkp4YBkT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWIegACgkQCDBEmo7z
X9u3SBAAi7yF8y7prcMxeGu6T/oC2LpqRpmxMKOL9+ltzU3sjL7us8m8fwabaXSU
dnrzNCEBzOrbhJxG5N23t4dttdjeH8dGU3bOUGkKwsedxltrTIHaOuJCoJZeKzn9
zYM53pYfarMiNYSPQNWhF5OPl71CyABQfeqdVK29hpVRxdAE8V8Ts9nQ1jPR+ete
SzmvZM3tDHCDQWPDVGCIWY5UZr2BYGOFGDOEyuH0XPsTODM6yXnRLw2RvFjPRtnX
4LGoso8IpWDoUBZEvaTXyprQZ4X5C2lcAb1FCxZ+mEjBPPhtgkcK1JVy99E6/y7A
BhkB2Vbv7bhkCrC6GVbPx4j7a45wegkEomDANGVKvTIw3CkrxCAfpVOGQY5Tv91K
emnFaNkRziV3/erQN52FuyYQNWJ4K58Ec7zt9GO5DZTRBXdg3GCPNf0e3mOFXLo5
8emly5xbSqA/Rh/lwBZcHlqx2ZIUFjRdyUdwawtKL9MMyGAGxe1kECKgKxwbtY0I
k25TpiBvJOIbJIeUkZtlO2QkbpUKwNeIEq1m/43OVtBzAT7SISu0ObakT6q4m44y
YDpjtUo258DbO+lVrB/WpIZzE6M/nW6aCvku9ahOMXAh4i6EYzILYieb0SZi/T7D
k/7J4twe1H9nXmeX3QkCMEMxKYG4wTbjhns1/PwdMKz0xUiMXCI=
=s8+L
-----END PGP SIGNATURE-----

--OByzjVDcIkp4YBkT--
