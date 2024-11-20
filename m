Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF89D43DA
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 23:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtwgZ0S2yz3dHJ
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 09:16:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732114619;
	cv=none; b=mAUuMqtChQgd8EP3jYwwZD2zYCUCWtyFuLwoNIbaHaJZTEm545qkYM33+6wfHpGoRbGLqr4ChjLR90rM6jZWTJ1nG3D8OtnxlCmsr4RuK8x0c059si0jTl3GQU+yc0Z3a2vS9T4Fge+ORXluFyk9nGu0cDEstCGChNkbHrRmn7JBQh8wVUOAwQc9gTPz5lRdg9vhV0HvUwdWMz6l6Bhpc6wA8ecvrDKagjpBcKRRVPE1+SECbelngo3cgPq2qskcadhtHV6Jt1mbrD2dFLVr9tUSFOgxXMF9ZSuwukQMeam2jFaCX5PgGyze+8uvRWwhpotiDu3NEC5arJFhe3PlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732114619; c=relaxed/relaxed;
	bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkMeLBb+MMAQXsOaLsJ4MPEQ+vXvMAvCXGIkpc1SxwypjC4zwO9KeY4h2/B4CO8XlQyRPLAsDWFo90j5FkHI73jLQywcY2iw+onxGyDnhN/XcScaTWugz6FZFSzvsFz13CTIk9RBMp4+Ur2sDyfz5GdCW94wd40aH+knPjRRy0ftWqKwyqyR9pEk3ZgKmcuEgZ6SY5GEz7U8Ec/lx/U+ke09F3adMFxTwXoRmwcrBVIh0takKa8pMlscmUb6mk91klsKgiPRHlWdCZEI6Kmdi4f7et29Li54VcmEvQSRrSbc95Yi9NSB2pyWmblTuFW2Q/5Otw4uc8AB/ZZ2K8Uifw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KPDc5moP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KPDc5moP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtkwS6zXtz2xwc
	for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 01:56:54 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431695fa98bso18674525e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 06:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732114608; x=1732719408; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
        b=KPDc5moPLKmXRJQQO47EerRTq81A+iFfxKfKrn/hqEk9I0cm5ZYjw4qgOO9iviEduf
         14PMGZC9tay0xP4HWg4xpnWsCwyDs16ZtvXbbM47xgVcP2qybb2qzhR6Snu9ZQpIR5NE
         jZU7EMwIWiGPD8nQnAP38loxuxeuHxJt+j+3pMehyzmpoQ4/E+FbzD15nj2k1Rh4nz2y
         UigMjkqLvkY+0MwbeSI3RHyXGBa73rr/Rf2pJl8B6LyDF3pEh0sP+UFkVQ8EHY+rWNzW
         6f6Ky80ZdfO1v/VbXmZrIamfgjuwNpNCaXRVdSJgT+R/kekM+mFcjEsW14iXQzXa7vba
         UKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114608; x=1732719408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
        b=RvzPd+tCM1Vh2lWsxK8RI3vnUdNuzDT4RgiapZgRN/5ZrOphnbiL7I0Um7zVfCIMs2
         mJ4fb2FeKPzn1h0HXL0X4+Cby1k+5s8+h1uJxnz/XS2zx8tvFt+D/Db45lNYRlDhOrX4
         aXqjRi/yGxt0tRV8Nw4XLDXzkQCUzko/Rzct+jvViVKdIee/BlxQFfSwDR3Rcy3C32DN
         Spvsc/rJNXooEcsF0pOqUFAK6bomGZsFYtd9moYb2CnvJoDSofKzMXV7EMRGj2iBwVWd
         4UOh2Qm0p+5kUZfvQZgxwGqCJpkUn4ILrWQWoxoj3vtc2JzJQWpjxKSnoqIDED1uxRGm
         49+w==
X-Forwarded-Encrypted: i=1; AJvYcCXS2E/l6TISvJJYpkvh/+48V3MBAbPzLYnuC/inqtHljhTbsrgNzHNhCeyxiZa1Eo8uDIuMmDco@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEV4IJ9P1ppPDUI5MtdFG5u3m/80jvaDT8OMmRrMKYzCCD1Y6/
	0Un+SNzBV20Sn0s4cT692VVrluJSYi8XkWUSjmkC+uN1i6puD1VrOth6rUAi+vk=
X-Google-Smtp-Source: AGHT+IHrKfGLOGxnCvfbK0rlizot2Xe7bNWUl7+WlgkZB4qaV364sHZfb2rsYw8BE+EFPgwo4ike+Q==
X-Received: by 2002:a05:600c:4f83:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-433489868e5mr29893195e9.3.1732114608102;
        Wed, 20 Nov 2024 06:56:48 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ea7fsm2279732f8f.90.2024.11.20.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:56:47 -0800 (PST)
Date: Wed, 20 Nov 2024 15:56:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlycwx5h2jmtpvei"
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-4-a0987203069@gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 21 Nov 2024 09:16:18 +1100
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xlycwx5h2jmtpvei
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 04:27:07PM +0800, Joey Lu wrote:
> +static struct platform_driver nuvoton_dwmac_driver = {
> +	.probe  = nuvoton_gmac_probe,
> +	.remove_new = stmmac_pltfr_remove,

Please use .remove instead of .remove_new.

Thanks
Uwe

--xlycwx5h2jmtpvei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc9+KwACgkQj4D7WH0S
/k7LQgf9Gwj9QyarYndFEA5e8v9OUMxfn6Cu7vJ3gmwOZLcBm0Oi+KHCfrK/5oMe
BYJvIWmrL6AbSFQqaIp38aZmWH2UiKV3KCeRx2kikFou49njcPVyqAKzwpCCi5TE
6XTZpAg/OHN3kJOiLwN4RZVsnsA4pR1VQVIdch+oGFMyKEgyu85MLpjeQecxRCT/
RP/bgKRO/OTWrrtnIewHNV2YsehEzx/+wY9gCh6lEVzBJYDGNNkZf49WdTO5nF1G
KB/pOfKMX4LrldyqelhrRyOOkqDa2mtB5gVdJf5vGP64XwbyxPhzUbblHk/cc5O3
wThAhMtIKX1kBcxmm20loeBenE3nrg==
=CCaY
-----END PGP SIGNATURE-----

--xlycwx5h2jmtpvei--
