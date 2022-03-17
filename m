Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA514DC4D0
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 12:25:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK4ZB1KNtz308F
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 22:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Q6sIsGfi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Q6sIsGfi; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK4Yl0CRQz2xsW
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647516277;
 bh=rz/kIL0ebTYiAvUOeOo0SqZ21Y/rMB/+G/lC/CVXaQo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Q6sIsGfiyqni72VWRmGARY9030nqerCMxTyZYypf7zOCJ2aoqz9MUCWmcZLLFClnp
 qWfwv1tuBNtmlrHUNubSsGLrUZMy8U2fhAfev797vI6yRwPfxyJ+Jesig/CBWOMCfS
 ksTFPWu8IIXBGgX2AUC/3qJ7M3gp9CBIzYDGXG/k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1nxZTp1uqu-00kNsD; Thu, 17
 Mar 2022 12:24:37 +0100
Date: Thu, 17 Mar 2022 12:24:35 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jialin Zhang <zhangjialin11@huawei.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: Fix return value check in
 wpcm450_gpio_register()
Message-ID: <YjMac/pwFH5Z+Lxs@latitude>
References: <20220317065851.495394-1-zhangjialin11@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gVWGy808rXGFxfpb"
Content-Disposition: inline
In-Reply-To: <20220317065851.495394-1-zhangjialin11@huawei.com>
X-Provags-ID: V03:K1:3F1BaI76xUMu3QZtwU5ZFOFb2sBVwOzw0CAV5Hyo2V7xYEktmBw
 gZR2rtZY1OnA73RRDWfv6qQI2A0SZj0aJ2Q251Ogm04ZWRWjzd+XgLm9YwuyROraf7JeKbN
 fiSrUi4XYYc20D3HzXJtlubZ6RgxhjcDyqt1bTDggseLs7dhW+soMvdffLXmqpDLEdxiJ9p
 kxHyBXB7Yy0z1l5ZBWksg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NsN/WGv/mSs=:Cnc2bfkzOWHRjCU6R40qYH
 G2zybI/25E0oeQdE+CKGHePm8GLjf6KLzuIo0hEAaN0to2A/OgqpTx3qlpgz3I9BHYfKC/loh
 1cNr86pyKNRTlDIkrLew5rIvK8NNZrj/LhHpMDyIwUfZd/8KhB7puCDozAwRze9dQr7QaRM50
 5q9gwdQl/REjRTzc14FrHuCz4co/n1SfW5w0NHCER/ANOkc0SD954x+8zeuC3RtDMdM2FmmR0
 bj0uPG4OPD0mBICAsZ9ufaFpnUkZa3+MQR9wCXQuPsETzxH9Qlcy9jaUR2L7mSm6o3NL6YHqZ
 IKTA9qvZSptBKyZX6K1P7aNV1+VI/kRVj72Lg0U0+GPmbpyredNhqctdCX7IdIBTB97eXOkXB
 kx2QSynGjIP4+lyWYlh+lklHWzhpJ2a85k1knEh58gJemZfgxc6HVQuAPzlNmwTXoC2OG5OoO
 G+B3waaapTwRQWjl4aRrJoNaz/gLVaXfR1jcdqbTIBpB9/nQUv5B9T1lV7y/qmL4U5tkiBQxT
 CgxTtivrwchEl4WmBrsYWvhWrHz5cwpqLpB6+IQb5L2vh6F/xaPZx6cEzuFVW969xiyq19B2H
 Ash+q63zfWAjHJxFJKyjXv4ijFNYHRG0g3Eo4g+cYTCbfd4LJprQ6P9/kv0+LOc9CF3Fzix5R
 iM64LcsXdiMI/wAmgmhKVkamTpv1YhDtH2bXp5LGt2qHbgsEKJenWnyaUdbfgT+Eay13b37Fg
 JLpRarf84ML/S6DzwOe8r11LAMDGeSKeNg3FKDPZwAK9gla+WMhf9gWMYEqbmJRsXnmGKAONO
 fbXE3lvm0WGFhByZP4G30oefC+QRcDy6iyhUohGYT7XKafZlfctH6Ngp1Q6vlpMDSbJrAcSpq
 caeeiranVbCn6BMAeEfiljKB9NZBtQFagdylmWU5AAg9NfqpW7Z8LuAvvwi9lWPNVYmMC7cfF
 saoyMkVzsea1X/y4BGiDAz6aKLq9foVhslSCk9tA9VNQ8e8usEZBzQqm+LL8L3wdbmVTYYQiM
 4lj7uuKZB1+klbGZ5hotUFyR0P5UdHEL7/dn90po5MbUuKPXm5eekkNwgV0jzcOWYdmIsDOWO
 Ux23WNuiEzRcig=
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, j.neuschaefer@gmx.net,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gVWGy808rXGFxfpb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 02:58:51PM +0800, Jialin Zhang wrote:
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().

Right.

>=20
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 661aa963e3fc..a71b684b9b44 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -1019,8 +1019,9 @@ static int wpcm450_gpio_register(struct platform_de=
vice *pdev,
>  	int ret;
> =20
>  	pctrl->gpio_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (!pctrl->gpio_base)
> -		return dev_err_probe(dev, -ENOMEM, "Resource fail for GPIO controller\=
n");
> +	if (IS_ERR(pctrl->gpio_base))
> +		return dev_err_probe(dev, PTR_ERR(pctrl->gpio_base),
> +				     "Resource fail for GPIO controller\n");
> =20

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks!
Jonathan

--gVWGy808rXGFxfpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIzGjkACgkQCDBEmo7z
X9uHzg/8CgMmkm5zckLAtMOv/xJMr+xEhsotnEUf87aBvGKvjZhDzhYXXu3hlAIM
LLwNRfVpKdqupE3Hh3asBW113EiNH/cymS9jbTyxS02b9wn3G0a2svAGdFgYKsmC
MT/5RWgUpj5eJo2q5PfJMRSQqQW4LP4ZPQyNvBPCqS93IFAJpuBAe4uQKcp589Kk
0ZrPrOaodBKPv3V0Bdrole4gCuq67mV/erYRWx3/9nl9326jPDr9pzPtO9E63QQP
uXaX5yyNw8EqVcJXyi4AFKF7C8iELvRwRrZ+xR2oW9mb/LEUohjFx13OPiX9rtaU
px/EkKMCVvfyVOhSULlsGxGTZE7f2qHFPJkkHNAg59FC8dWP0MxZkVoz7q1UCaOd
zRXd51IwY3yH2fmdAjDT6/p3xjcPumYtzgy4LikxvSG3kbcbqLDB+5R2p/kXmHMj
HVNTkyDEYExRUByqIgDX5A6zWy4nZU8OgmGCZuzveRnZP+QSDnft6vRchLhwRE1P
JF7Gm/Lwzb6kWOus1bYlAv7HvUAjPLdd8KKAtt6Fm9dR6cwyh1HfNDr7tuhuSDLu
irk7KhP99uYuK0as5kOGy4yQjZ503uoEYgtaGNzMlCilAjHpe8rR5+cf+v5S8EG1
wgPjX8O+lwINQxwyNrUB2cJ/IdLiZrWCvrLwGuwweiews3uD7jI=
=2Ou/
-----END PGP SIGNATURE-----

--gVWGy808rXGFxfpb--
