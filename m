Return-Path: <openbmc+bounces-1173-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0BD159AD
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnXx4b4hz2yFY;
	Tue, 13 Jan 2026 09:46:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768211293;
	cv=none; b=RktQDZcZ5xudwIItuXHPiWz1zCbcOb+7pMUbl9oi2KyparQsUwoaMT3Tb0VEQUnKAxZcZhJNegNyurGkFNfQbt9tI/NBFv0IH5NUDXFIyiygU2LPUhsBDRDR4g5Y+OtrziYo0mHk+XGdNFzqXngCyLEeqzFP5n7JOXYoyvWKCZbie0Ir3fDctMWo+i+tZLs91CL6tWw6NmEtvkU6K0Cca/Gz+scuOlThdjrpTZOgXJsTVppyuBJQm0RnexXYqhYfKhsis4RWTY5I/QtZe6du2mUhHPOJCllSq5cIkwABBS88QCrx1pHKXwZOBshI1rUYlvxLCYIePApylIFD7WBHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768211293; c=relaxed/relaxed;
	bh=pHomYl2ivRajFrYS12hVcD69qEtT5HA49SWMPUby8IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRhV41sMon2xztui/+ovpirNFvND5wRu8wbBYclM7iL83tdeGqQtSUjhIQGjyGMwYu46TOy2o1WutT77K3+oZhLGSx0b4Z9fVTT2qXb/6FjL4DFCmVdGJqmZ0c506PYpN4broUKNno5sXZSNj8E5K1uX3l6/ICz46qYZSR9Kp7WTo3BomjMNRUvA6UlsEV5wW1Pd+I423zzAATEzrSbbVmotoTV/MCpE5DF+OHgE2kS6+IwX6U3sEFK5eVQtxoxYgJw/opIO4hdFrrYf2T86n75MEptOHHZZel8SJieFZf0BI7FWAGhwm2ZPZcB41Xb28fw7/8mS4Ear81qreaCxXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WRkCvHpC; dkim-atps=neutral; spf=pass (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WRkCvHpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqSHG2Ylfz304f
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 20:48:08 +1100 (AEDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so67812855e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 01:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768211225; x=1768816025; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHomYl2ivRajFrYS12hVcD69qEtT5HA49SWMPUby8IM=;
        b=WRkCvHpCVSWyLLLy3ZhkcI7RvJTRu/AlICeUB3xOE87YEpssTsdc57U+TVHjPOb3cB
         PcuWVaG+qd2BpQY+MnfDUYGTy2em0RUNQpmmRfxyu9MRntjC/kXkQCUa+VQ0Ybcxq0K/
         MJrMOMUxiqDu6PZF0u78BYiMahLbAhoypxbGqSUOouS+K9e20ypLpDeYDZswAkwuXqkP
         6eyNoXlVw0MjlTlceYFVUfSwQKVm27svbqgsNO/I50vSBA6eCFLg42gm2RmJMFzXR4TM
         heJrpb3yu/FFQC45XwBk6dJPsV2K1JnE8x8ESvSz+LiVzGvyUVytStnNPrQpM+3sSTIE
         98IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211225; x=1768816025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHomYl2ivRajFrYS12hVcD69qEtT5HA49SWMPUby8IM=;
        b=PzrtLWcQwkkl5FnOsKZOoHCZwe6AQnSGrDviRHfWtoUh2yvjGb0bQBbAtQN9RpefZo
         5Iks/JErKa1BoP7iB2gbTZBCRTgg+LEq9GHfceMN5ETpE6a1NUNVrDniyRvdeiVoosHm
         0ZoaUpQF92d3DU348FAdILjKVJJl1CU47CjjDAbem/Hz+GYCVWACddpmobltXtZ1Fnbo
         0oqjqcz9zl7mFKxArKZF+zeKN+E+8etoyTxhWq/5nYumCUnlJcuvqyLEgGZjJLzdpn/I
         LOgMwFufLvw207+xPqpxBMYgo3k7PG91zDhCF2NtHI09KPAOW1hznjTTLI0iFYgjOnbP
         WnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNvIqg2dKpWVjBKVzIxUZi9nkLGwYLCctsorRvhu410c/gRCbcyDmKg2eWfISmDOG5Etlna/kA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeVAa6mMkbrcZgD7GnDmeBf0TUAFCdFe+j4sGz8PwpTSO1kJE9
	1FUuK2Tr5F2RiWSlRQFMTbRQ6Sv8aiXo/Eav42SRCAHfcT5kUDvHMkx/XJtYGpe4TCE=
X-Gm-Gg: AY/fxX6vubomSDfQxlTWKO54RLdDQK/vRl/h6eXx0dvvRqKtR4t5QCPZvsCZeFQZLj2
	sCoo8ew1q+hz+woJb07CsYojRssXm/wOfUvip4ET/OcLtHbij4RE70y6JgD6MtqHq1hslnyrewt
	Y1v1eNJDb3sxxfaeSVaOKl4CJUX08KxYp3p8OOHU2RtEzqPS8u69C00Ki0cOwp8tlN2ogHoRaVH
	zXHikQSNsER+OG3IN6ArWiDc8NJ9yWDEngZRE6NmLL+Hb8HNtVOTvpKmURpAfd2dziE6v/OQHsE
	8tPpSrf36YM3ofkxuTUEQdiDVYWMocyIWBzrc6CulcLAEgFEA5udySD5t6xLPzULqZ2edqy8nsO
	I9RyNf+mZB2ROWY1E71FiSnU7FRpajIF7X342BhTAtEneQLkQ7wOI2rwMTzXGwL4HfakCXighvq
	isnEAcEhrP1NPI1Eu8OET/HIxBMAd5TRxrhfinryyqA5PJBXBw0bfeppeEKCFXyq1kG1W1zHh/Y
	A==
X-Google-Smtp-Source: AGHT+IHf77l9AfND69btVe1lX8mlVsMkWU02V7BH21A3l88Gzesx9Loyd0MkDTayntUnGr66ErNR8A==
X-Received: by 2002:a05:600c:34c5:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-47d84b3275fmr231217715e9.24.1768211225348;
        Mon, 12 Jan 2026 01:47:05 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e199bsm37403204f8f.16.2026.01.12.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:47:04 -0800 (PST)
Date: Mon, 12 Jan 2026 10:47:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
Message-ID: <rwvoi4v3wcrfcbj2sg6mknlasp5klrlpacgwgl2jvwh6ub6vls@iovrqjblvz44>
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gulhdosi7vr5zgpw"
Content-Disposition: inline
In-Reply-To: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--gulhdosi7vr5zgpw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
MIME-Version: 1.0

Hello Eddie,

On Tue, Dec 09, 2025 at 12:39:28PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this is the 2nd installment of the series converting the fsi bus to use
> bus methods for .probe and .remove. The changes since the first
> iteration---that can be found at
> https://lore.kernel.org/lkml/cover.1764434226.git.ukleinek@kernel.org/
> --- are:
>=20
>  - (trivially) rebase to v6.18
>  - add tags by Andi (for the i2c parts) and Mark Brown (for the spi
>    parts)
>  - Add a patch converting drivers/fsi/i2cr-scom.c (#8)
>=20
> In the earlier thread I thought I made a mistake for (implicit) v1, but
> I confused fsi with fsl and the problem doesn't apply here as it doesn't
> touch the shutdown callback.
>=20
> This series is not urgent, but it would be great to get this into
> v6.19-rc1.  With Mark's Acks and Andi's tags (though they are not an
> Ack) this should be fine to be picked up in one go by Eddie.
>=20
> As before there are two commit refs that should refer to the commit for
> patch #2 ("fsi: Assign driver's bus in fsi_driver_register()"). As I
> cannot know the commit hash yet, I wrote "FIXME" and these need updating
> when the series is picked up.

gentle ping. While my quest to drop .probe() and .remove() is still in
early stages, I'd like to see this series go in before it bitrots. It
should have all the acks necessary to merge it.

Alternatively, should I ask Greg (added to Cc:) to merge?

Best regards
Uwe

--gulhdosi7vr5zgpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlkwxMACgkQj4D7WH0S
/k6GiAgAkRS5olpPFZKwo4VTDgvbmksvaU1QbSMFn/TyV5Sa/8iUVJafCpS/9JLR
QD6bUHvbIFwaweQJDAyKbujbqu10t+mSKXD+j2Y3ZL+BoNb6Jb3OqvWkY0T3FCtv
V3/iv61qVcUJkGV503qJXp2wSF2Ktpq//DHF6VjDYGwUtXjeLQcWIK08CiNWK87b
CQl2kWQXAGDuJWss7/6EzaukWcjIlmeVHrSUB6zYEGf5g057po8Cv1jMgKrn/ibS
YEoVFtHskgwW7neXzzZeL7lszfTxHV/PZQw96O47PxB3nqucFG2SdQw/RVXTwhSG
S8/1GkvPICLnL+KkB9JxWxXqUBcD9w==
=0gfj
-----END PGP SIGNATURE-----

--gulhdosi7vr5zgpw--

