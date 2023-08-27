Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6878A112
	for <lists+openbmc@lfdr.de>; Sun, 27 Aug 2023 20:47:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ubJ3uHXR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYjN65X1vz2xBV
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 04:47:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ubJ3uHXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYjMX0slmz2yVR
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 04:46:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1693161981; x=1693766781; i=j.neuschaefer@gmx.net;
 bh=vfCrl3xTZlAlJ4jDNXucspu42u1OeEtKo9/uQ35+XNg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ubJ3uHXRZFform7vw2uF9RHHDqO6P57ZfBEy2QwTE9C8AWAc6Cm3FpmrcEKhs+j8Z4KC5ut
 +kZsr14wxNnUulKwfgw6PbYkWVq6yunxpZdWRNcaAExjDpZ3UMJA3N3FTqDla6YuokQpSAy0z
 vNeRlrlOsc2oS187XMgg11Bm7z7OPPWsK2Ks7ysrLi5ZYk2i4T9tLpZec3UcWYh0MUP2uiqVP
 0Tax0z/N89pFOSxcJ0J2oEkzSKOv4E250BRorw5QVZOLra6cj7PdwNZEFr90RHq6sBeLxkvdR
 DzKBJLPrjixGMXxWB+Cji1bUw0J+MojiY1q5RIA7F/FfW3FH0Q1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([94.218.119.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1qJuLw495A-00Ii0I; Sun, 27
 Aug 2023 20:46:21 +0200
Date: Sun, 27 Aug 2023 20:46:18 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Mikhail Kobuk <m.kobuk@ispras.ru>
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: fix out of bounds write
Message-ID: <ZOuZ+n3PZWqxsG35@probook>
References: <20230825101532.6624-1-m.kobuk@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R079PLSdubHOUllH"
Content-Disposition: inline
In-Reply-To: <20230825101532.6624-1-m.kobuk@ispras.ru>
X-Provags-ID: V03:K1:siUKjmJQMOOsosCdZvA+NvPJoj4rupQ6qsUddR4Exd5YARSKzD+
 HK5apaMUtP530gLVsxDkQa8Bzt09WyoU3TFvkicyyLcaU23AqbEKoIpnv19cfGK034jVdzv
 ZkFOr40iHkBuZZgnUVZjUVPl7RFEf568k8OoILaMeEYKOX7PHmx/hloVj1aHPuMXJf9oobj
 nkvyFzxLQXkXu/7HqP2Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jDVIOE0RUD4=;u+RS0RRyx0ZYt28yQ9wu7oJVKVo
 tzwtjf6n5tExaojB5pyHxKR0Jyf4RRx+bv9hXlBa58nDL/Jh7Yoca0qSfVRiwPU5NZoyjcATx
 3RXqdws3+hqKGju4kqdlMqFhZMUR6kyXvei8cZlDpIS+PiwZDOBixBswO9omr+jaIXGAiZ7bi
 ruRA3Y+Yod7KoyA2egRseb+U1Gz0RRnhA5OV6THYBzpnaElTcb/I56nRqIYXMeUc+2BrfTytD
 ETBIb1v0vA9CEUrTznpFuEW3yJW/MH2ezRn3w4MEeW8cGMemswWOJhiTYQh6ZmW8o6RYJjHAx
 BfATn9rbPieEqSJ+G6a9hKW7NgIlcWecSjMwTf4qhRHktSwkdp0Rc32aF+zkDYRvEuJ8SGf2/
 8DVWu45xvdapeSd/repljTi8u7GeBGNBJNsGyXCluQ22HKsbBI9T3BkQlijxpEgY6kaBa6lcw
 qBQADBDjWsPL7I5Bs8+9VONgAAlKgpOeDLoxylNQkvTNnKrTviT/OYfSr2Cd5nDqU/SUe0CuM
 w/dn8VB5i+cx6Y4OoyQbUurfGWssSsDEfiEnBJCP7VYLKCZMfcGC9E8stQ7TRzhlpjHeBIUPI
 i8JISvn7I57vrvbV+eqShJa0Q7JcKVauGSWaqS5nFe8EBN/ZQFBW9kHj705+gOXBEFDBD+uGb
 zAiqGqhPf+shiCD+EIMZGZ+ezF6SWsbA7T/6B7Es7RUR8XJc668xw1lnA83r0ZM66lG1tF7fk
 RPiEFwAn9q1eChHV4FOLTc1CmPhgR1FzuritbuRwZLWDXzK+CrgL1BIgptcATBU2ix6BmIRQ2
 +TdZ2oM/I/eLAst/7LQl9F6yRzEkfbiDeXGXbrLOnyHLPH1kV9NGJJ2cju0fc9FJLKDr7W1/D
 /m8OmyCUriSaELBdHLTqn0n4f8ZCz/e9S/dJqnFb0cGb13rkX28ZmkcFzeMPDAG3w/PL6GwRU
 KKnvKg==
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
Cc: lvc-project@linuxtesting.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--R079PLSdubHOUllH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 01:15:28PM +0300, Mikhail Kobuk wrote:
> Write into 'pctrl->gpio_bank' happens before the check for GPIO index
> validity, so out of bounds write may happen.

Good point.

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks!


>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
> Reviewed-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 2d1c1652cfd9..8a9961ac8712 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -1062,13 +1062,13 @@ static int wpcm450_gpio_register(struct platform_=
device *pdev,
>  		if (ret < 0)
>  			return ret;
> =20
> -		gpio =3D &pctrl->gpio_bank[reg];
> -		gpio->pctrl =3D pctrl;
> -
>  		if (reg >=3D WPCM450_NUM_BANKS)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "GPIO index %d out of range!\n", reg);
> =20
> +		gpio =3D &pctrl->gpio_bank[reg];
> +		gpio->pctrl =3D pctrl;
> +
>  		bank =3D &wpcm450_banks[reg];
>  		gpio->bank =3D bank;
> =20
> --=20
> 2.42.0
>=20

--R079PLSdubHOUllH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTrmdgACgkQCDBEmo7z
X9sfNg/+JMEeSuR+27aDQ0RK06u4N58JgUVNTW7QY2Y/Q3L/s/SnqbtHdt5+fy/y
3OSCbm8x9e5GkwWvrfel6V8lw6LH05U+Q3y69N2yDTONzxUdjvpMtPApCU/IAf0o
TaoMHnF2kbEjLvxCy16MtXXu7/cb+/qs8+ZXPvhwB9uZB1Dwneya4bU+TZIgUlHY
06Lwc5fYXumglMlATdxNi7JlUvMID7K+Fa/VrexK8RGFQIV9IGg3hnk2sL/6k2Ov
bW9s0rDmA64f7AwUd/VpoHIIJrqHY3CcJoqsyybNhyCXMAD6gDniHz4xVLG4APaR
e5j+IaUKFs5jVKnJ6XO+B/60r7LEucQHHxW+7deaa++sqanJZNrv/5KnJJscZgec
2qKw/4mLouuD9I5sWjF9EFjFNzcmmjzpfa9RN1omP68MtERXDT+4jAYaMZDSfK2h
eD4fDldrqYCUcfQdM2T1VG8T0rTNBF6RG48ezzJ5sFM7QYeKn3sElhqt6p6Ns1K0
04I+8kdz4h6AUf7JrE7JuXpWAPObSR9g4hh/+Dw3aAxw82KmGTULFKGmWDYDPrWQ
y4MSW4HGYLhnmXsa8Z7TSK2cVgupYB7NQ+vaPpOpLe5q/28EbiIBngewNxGVButP
ZqzgL0QFoczYgk4APhdr15Q6ZQ+9VM4Av69MFknms31aOp0HldI=
=93BM
-----END PGP SIGNATURE-----

--R079PLSdubHOUllH--
