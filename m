Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B47C04B2
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 21:35:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sjEUUrCL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4mMD0zyvz3cLV
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 06:35:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sjEUUrCL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4mLW1ZpBz3c8r;
	Wed, 11 Oct 2023 06:34:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0031617D0;
	Tue, 10 Oct 2023 19:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81378C433C7;
	Tue, 10 Oct 2023 19:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696966464;
	bh=fdAjM/1OHOG19BZ3uAI1dllH2avLjsk/EooV7MDjJgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjEUUrCLTkOqda/EDGq3rqFQL27cCC0sWlwDYfWSn0D0EiFxkgUEZC5+sVWcfMh6p
	 6iNtYYozsc1ijRS8K7FaaJjhnVK7M51VTwu5wmQx83UCRnOgcj2HIt6jblVzbfiVoz
	 NMNqpg/ySEJf5MswnHewO3sVfbuUYq/T7WPTq24hz0scNpmcTtXemEjc5kSBdsjafs
	 L3wpY6LcnNxEq6RolngYppPelbkzXnSBL8w5TSShgNwe7YoNScyBYeZESJstmkaa1H
	 mV5JDhLEcLcxXN+3SBj16wf7U5DmLFRq6YdX6YHkP+wfbX1j1Z0OP8/kEzN1HYVouk
	 6tTHvPaeoIGqA==
Date: Tue, 10 Oct 2023 21:34:20 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [PATCH v3] i2c: aspeed: Fix i2c bus hang in slave read
Message-ID: <ZSWnPG6oIxrVFmbg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jian Zhang <zhangjian.3032@bytedance.com>,
	brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
	xiexinnan@bytedance.com, Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tommy Huang <tommy_huang@aspeedtech.com>,
	"open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20231006022233.3963590-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+tNCvmT9ovOY6AN"
Content-Disposition: inline
In-Reply-To: <20231006022233.3963590-1-zhangjian.3032@bytedance.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, brendan.higgins@linux.dev, joel@jms.id.au, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--h+tNCvmT9ovOY6AN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 10:22:33AM +0800, Jian Zhang wrote:
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
>=20
> In this case, the i2c bus will be reset, but the slave_state reset is
> missing.
>=20
> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout =
occurs")
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20

Applied to for-current, thanks!


--h+tNCvmT9ovOY6AN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlpzgACgkQFA3kzBSg
KbZ/7RAAihe3k0z4CpvqtiXFm+M8WD2j0iyfOzn0Q3Rv+NN+Y7hVMAxsDs0hTUiJ
81zj8PMMrBkMnEPhv0ytT7QKrv8N65H2ONXGmWtOPLinn2UsMSMtM53zNLg2iR5M
ASKLLr5gSqaTjJao9FCYKWP7G5rwYqF8gEcmp/S0aA2ElyGfkvOf9J3n92iwMRaV
CO859fdKlSaINuHIEw1Uh7q8ThdXAdON94vVDAREXPWax3Qle2fAMFjxEQQaBrbL
uUlBJuRwExDegv56w6RPmbA0CQ6M/BxEviFm2thICeg6Q94UAFXTQWg6Wyirdhrz
ufVHS8JZf1481aK4iUw3IFrIgRV7tTFfO8WVoQUn5EJZTZ2K1KB16RUgPdrUJebg
9sAxLJ6u4H+Hu0FeL/k8zd7IcQJkoJlUm3IkEsHSWGc/tGQ0kolAAKbQjLs8778/
LLo6c9qyVnhFyh60WaOAzppRyK/R1+UmJWYZYSozwk8lZ8OkUsrWHLH5hWa7tMyW
ZkoBrjSvGWjAfib9kLvpgtalcNwlOLr//RP9bT27IblhWiz63VUT8p2G1gqND5p8
jcyodY25zHqFDIpy/AdMVjzqupmSw3upInMOgnJqyeMCEigh2OdL8voL6dxBAQ0m
2rhGFIrH4BzpaUun1KA3zSjwuY84qDYGB54Rz9ng01MTh/9G1bs=
=VdsG
-----END PGP SIGNATURE-----

--h+tNCvmT9ovOY6AN--
