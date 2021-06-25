Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2903B463E
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 17:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBKxD2bXtz3btf
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 01:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q8YzMdka;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q8YzMdka; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBKwy0MLDz303M;
 Sat, 26 Jun 2021 01:02:25 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EEA56197B;
 Fri, 25 Jun 2021 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624633341;
 bh=+nC2189eKCU6T28/hcgTvLONm44gotEpXOHRDCHlrOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8YzMdkakrr+6yUHSuakRSX6dve5Mt0T++6DuB0We2J28fogIsOo9FQ11MXaOVy2u
 rMUydL3PCwwARSXaHl8pAA7iOIwtiBSx/3lJhrsDlT18J00aw03AkGPXCKWYYHn22c
 6x8x0KYIP+Rb18j/gcfQtkoTocm2zRF7nf/1glRBNHgDJwkOlZmOLG0/9g7w4UqlKO
 wxMSaeyFhVjQpGqSdpoLNLurW/2P4e4IEX8KG1GvlUu9S74GoSaRbFQEfYfYZfuzLG
 FaVEaVw+r0cBBB+ROFDPC6JXDaskPV1CI5+PhiaB1ieS6y8YtbbfDjtSzEy+ObKl92
 v37ZiTceM2Ppw==
Date: Fri, 25 Jun 2021 17:02:19 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 1/7] i2c: i2c-core-smbus: Expose PEC calculate
 function for generic use
Message-ID: <YNXv+2SpsTLStsIE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 openbmc@lists.ozlabs.org
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+2nERxd5au+gK8PN"
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-2-quan@os.amperecomputing.com>
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
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+2nERxd5au+gK8PN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 02:49:28PM +0700, Quan Nguyen wrote:
> Expose the PEC calculation i2c_smbus_pec() for generic use.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

You are the second one who wanted this exported. I agree it makes sense
for slave drivers. So, I'll skip the required user because two are in
flight. Applied to for-next, thanks!


--+2nERxd5au+gK8PN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV7/oACgkQFA3kzBSg
KbZ8xg//dLfzMR1eQtBMxT1tUHLNopwRIXCsraVBzK+s0nbpuIDwP7mxiTLlLnQ9
vp/mzzur/NvhOqJ7uBrc1tPIyo6fcNtH9sq1S1hGQcV6kFR/fZ920TvGo/uE1AvN
GHU8vUz2TBjYvctu9fiBIYecfDB0KAkYPHTV6zpANUn2CnifvIdBJ7E38IVUk5n/
b0cZEsjj1HV7Hnp+GHw5CPsHYOV3LP9Nlbu+z++AzcYhhbEXxUEFaiMUS4LQ58Px
idn6ndXW8L5r69OH7Y+YR2EvEKm4rwqs21rnh0Iql1U+eQVYrL9cafa1/uXdah3r
OKWrcFEhyomnHAI8QQ1aK6fIyDB9ms93asIwhKdy9oKO7ZDTXH5gsUvE35L+mhoZ
tv5IiOfNoI6stXCotmaqAWXIP5/B/ucuyEMiA5Dyjfa+uutIHgT+l4tGvchnpe3T
jKbmr7SlGW410XhyVc+No8zD0yug7YpC6IQ+AEWHMsSXR4dIU87ZTxcGRXZKeKv5
agJ5M0eRWRKjJpatkK/7mOumtaIcnT4jyGfXiwKOlsS8XIYzeq6WsT08EpVXQIKR
eQVYbm3Y1d8rI3AYts1le1VqEv69PShYBXuvbm4FG9H6fKkAVX9i2dLGwiS8GiWM
lskRRpMa6GpsLn0t+uurUWkgXzK+c06NBejGsWTs9nq5s41Y1bU=
=X8AV
-----END PGP SIGNATURE-----

--+2nERxd5au+gK8PN--
