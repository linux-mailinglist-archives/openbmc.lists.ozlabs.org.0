Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A018427AE
	for <lists+openbmc@lfdr.de>; Tue, 30 Jan 2024 16:09:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=iN0oQqAn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPT9R5cV3z3cV4
	for <lists+openbmc@lfdr.de>; Wed, 31 Jan 2024 02:09:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=iN0oQqAn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=trini@konsulko.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPT8q3yrnz3bx0
	for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2024 02:09:14 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-60403c28ff6so684347b3.1
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1706627349; x=1707232149; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzP/PmNuSGwVg1Y0YIKpJZ4Po68koHNaSFqHhUIYdZY=;
        b=iN0oQqAnSAgF2xvqlp+ucNW4rzp2tcDG/SoboSK995VQR7JYKlf9e9bM9Kbg7BN5iF
         AT+nZh4A0QiQnYNoH8Kbw5TX6FArUta1STQwXTrr+a82TmtfEvNLWMxrnjw5WwUch96z
         npFWsNvMmj0IjPs8a6lkSo/yil0PMytx1Xwms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627349; x=1707232149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzP/PmNuSGwVg1Y0YIKpJZ4Po68koHNaSFqHhUIYdZY=;
        b=xLgPn/rYnhQAZ64sZILxx32JDrI3wFnm2fY8veQUKohl/GdnccNSc1BqNN5ieFy1LN
         m3dDT01hdlOcRpRXB5VBf4Cn9xbjC8l5nmZFjD8+rCM2rpOOVOyySBRz2/kMdfvBIprn
         Q5s9nI+ob9w4/MLsLNFXjY9u3r5UkVpY/gFJZndEtEL1JKGVckyLvfPSMlOt6bfQPBsW
         4GTVARJxeJIyZM6YKFm0fXKuTypTYnUbdJFtEJxo6QI3k3+9x8HMTdQLYVe73WkBDPtS
         GQcUW/NWCo30r5jeelIxKCC6R0WhmpfZCAIWrbI3lz+G1FEATzF9ZNSOjeRYLBRD+bc5
         iM1g==
X-Gm-Message-State: AOJu0YxT3wXd3nKqVhIwlPdtepQabJjyo8k3ZPkyAxmUfA9SvFHoEgSw
	QQ55I71tpVRy5vBdRzaSOdh2nAUpIGw0KzZvKMrr5Q2LWjNOTJ1EjYXv3CGwxMg=
X-Google-Smtp-Source: AGHT+IFwu+2qkjPxw4cUNvrRp72t1EpHk424R1kEIwOC7xgru6g9+OtIvtfTupoQ3KltSNWeC8IjTg==
X-Received: by 2002:a05:690c:f88:b0:602:cd33:533e with SMTP id df8-20020a05690c0f8800b00602cd33533emr8105287ywb.25.1706627348680;
        Tue, 30 Jan 2024 07:09:08 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-3119-0000-0000-0000-1005.res6.spectrum.com. [2603:6081:7b00:3119::1005])
        by smtp.gmail.com with ESMTPSA id q206-20020a815cd7000000b005ffc86f6a04sm3234517ywb.52.2024.01.30.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:09:08 -0800 (PST)
Date: Tue, 30 Jan 2024 10:09:06 -0500
From: Tom Rini <trini@konsulko.com>
To: Kelly Hung <ppighouse@gmail.com>
Subject: Re: [PATCH] dts: ast2600: add x4tf dts for asus product
Message-ID: <20240130150906.GR1152441@bill-the-cat>
References: <20240130104045.199879-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kFPOJKzhK0rsrwMO"
Content-Disposition: inline
In-Reply-To: <20240130104045.199879-1-Kelly_Hung@asus.com>
X-Clacks-Overhead: GNU Terry Pratchett
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
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org, kelly_hung@asus.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kFPOJKzhK0rsrwMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 06:40:45PM +0800, Kelly Hung wrote:

> This initial device-tree provides the necessary configuration for
> basic BMC functionality and work on ASUS X4TF production.
>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
> ---
>  arch/arm/dts/Makefile         |   3 +-
>  arch/arm/dts/ast2600-x4tf.dts | 239 ++++++++++++++++++++++++++++++++++
[snip]
> diff --git a/arch/arm/dts/ast2600-x4tf.dts b/arch/arm/dts/ast2600-x4tf.dts
> new file mode 100644
> index 00000000..3c478058
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-x4tf.dts
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2020 IBM Corp.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model =3D "AST2600 ASUS";
> +	compatible =3D "aspeed,ast2600-evb", "aspeed,ast2600";

Compatible should be board unique.

> +&uart5 {
> +	u-boot,dm-pre-reloc;

All of these are bootph* now.

And is there effort being made to upstream the dts files for these
platforms to Linux?

--=20
Tom

--kFPOJKzhK0rsrwMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmW5EQgACgkQFHw5/5Y0
tyzCQAv6A5BHtX8Fdo9rXkw7V0BcSmxCaaeLM29zd8gEzmcjnbE/VZZHocfmittY
PPbcca95jOVFd+5K+H5xGnIMYzpEiNzl+Ctgbe2iolRLqOqo0CK3eevG1chc8dmq
txqCE3JyJZrO+N9HpBbq8F+kJEJgo85/8pUOTxTwr/bYnCewQPETRZWG0nZROhyv
jb0cB7BOq97HqUb1QlWSxR4DOXy4J40LAamcam9U5ODwo+ubkEWBaIP4FtI0ddxt
Fu+KFEppjzTK7D+/HSCzvw0Fi/KpJ+F0T/pYnIz05T/PnWwsj2oJ34rqJKaBL44Z
u83QwJwqn90oDYucIxAIiz70UTsz+CKCg3S9B4nRJ8ez+J/n/72cvuShBFrqemQK
FPVTT5oNkU5TBAH3thFVt2FHMBM9SrhGch7bKk+/yIzcpFr3MMtB1Hzh97EbKieg
mYJZxYbcnoc8p4rOe7kLwfNXi8YrjVDgyTOnSyPda4tR5UVwcVosBaC8rJYPrkvd
UeIJuzRs
=COYR
-----END PGP SIGNATURE-----

--kFPOJKzhK0rsrwMO--
