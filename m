Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E34D5BCF
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 07:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFGy349Mfz308F
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 17:59:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/bqfdCe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E/bqfdCe; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFGxY4sZzz2yMy;
 Fri, 11 Mar 2022 17:58:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C198761D48;
 Fri, 11 Mar 2022 06:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808ECC340E9;
 Fri, 11 Mar 2022 06:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646981933;
 bh=57QZ3z3TEDeIuuizUKu4lfq1+BF92zuxMI5WApqedIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/bqfdCeMyOPzV6SS9ZruCs09qR+6vq8r1D1pyHSqRBRr9HN+JA6/AWG8pEfA2uKT
 3otvhvpBZf0OG3sUzODx2C7OLX18Ni/nq3XHNUMM3y/q9GXdQ2Au3AbdzuiE9e+ko6
 dCQIX8fa8v69mNfE71hxT3B1GxLH9tn0m6/F3RbYlZThnGObIz8umKrsLKGCqU3udv
 kMIdklBvY1wg+Gf3ZqMZx/ia9FvEtvmv+9gG1/Darl2KwHsF3N3QG/6JmetdYqpUAl
 ApnoeX9PXhnBfGMbeLB8jv/k2Th3dJdggjwGT24HDrsYrQKtUiHvygPJuVhzhhU+0S
 rgZa5ome2AaRQ==
Date: Fri, 11 Mar 2022 07:58:46 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 3/4] ipmi: ssif_bmc: Return -EFAULT if
 copy_from_user() fails
Message-ID: <YirzJj/BBUQTbKS3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c+D6WiTH4AhpNkI6"
Content-Disposition: inline
In-Reply-To: <20220310114119.13736-4-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--c+D6WiTH4AhpNkI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 06:41:18PM +0700, Quan Nguyen wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> The copy_from_user() function returns the number of bytes remaining to
> be copied but we should return -EFAULT here.
>=20
> Fixes: 501c25b59508 ("ipmi: ssif_bmc: Add SSIF BMC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

It is nice that you want to keep this patch seperate to give Dan
credits, but I still think it should be merged into patch 1, so the
initial driver is as flawless as it can be. You could give Dan still
credits by mentioning him in the commit message IMO. Dan, would you be
fine with this?

> v6:
>   + New add in v6, thanks Dan for the patch     [Dan]
>=20
>  drivers/char/ipmi/ssif_bmc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> index 62db97773654..91ac2cae756e 100644
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -87,9 +87,8 @@ static ssize_t ssif_bmc_write(struct file *file, const =
char __user *buf, size_t
>  	if (count > sizeof(struct ssif_msg))
>  		return -EINVAL;
> =20
> -	ret =3D copy_from_user(&msg, buf, count);
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(&msg, buf, count))
> +		return -EFAULT;
> =20
>  	if (!msg.len || count < ssif_msg_len(&msg))
>  		return -EINVAL;
> --=20
> 2.35.1
>=20

--c+D6WiTH4AhpNkI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIq8yIACgkQFA3kzBSg
KbZEgBAAiUx2Df2QUChkO0IP8Cx64ymzUxiS8tVADYlH1t77TAN/0RmIWSkUXD4U
eHPAqnUOUcScJqidUpOhNT8v/4JKeW2/SSw7NpJyDL3n9BqddH+3QRDVDxuvT7ga
I9pVMmEPoU5PjSOfWyzfMzbJhs99UwcFtkqOvZRUSQsoUxWsVoPCs6Aknwstz6DD
bmfDpwJxNKRadqLA/bO6uQcpxUvCQM4hIq/zKMWnF8Yqsxg8Rr4raQJFGj0VIcp9
Zd4WIs4ZauwTu0RGbOX7++6QslOY6FN0HfVqTuWWGsBF7Z9dep51gC06vFM9+92t
lTofulwsmdMNAKKRz2QFAsL9P7fL6pA5sF+qCKJdu3NcYIKm9Ql+nm0UQt9Oq8ZY
fJqR6uPYlcv773QThNTSj8dhWCbvGDsxRxGV85DBt3syfohIKt1q4hkD9QsoDlpg
bS5SVmVwNxRTRSqWk1Swuf0ARHqF6SHBj6XIR1c/w5FGrTJ7GMHn+KPeUlK4Qr+d
az0Sm7lOQCJeW3RnT7c3FMDL3D8vLWt1qvwxBY4IcBQmor4v+5PlMFKxbIYcsnYt
vThbUi+zj+XfbVFLdv2+7iOgNM+69pYMfkHfH7tnyhoCPeo5VCtH6urycWRx1Zlb
CkfWmKciuaVVasw5wHT8svjZqVqKFqkfecbL29RMHbkim4743Q0=
=s5hT
-----END PGP SIGNATURE-----

--c+D6WiTH4AhpNkI6--
