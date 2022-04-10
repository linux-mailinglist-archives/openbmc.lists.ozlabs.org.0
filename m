Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCD4FAE70
	for <lists+openbmc@lfdr.de>; Sun, 10 Apr 2022 17:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbwg9639Hz3bXB
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 01:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=iLCVPt32;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=iLCVPt32; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbwfl1drPz2x9W
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 01:20:46 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id 75so6000376qkk.8
 for <openbmc@lists.ozlabs.org>; Sun, 10 Apr 2022 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EpIe/lqQkhx08lipwDb1RztcC1JFTrHgDzAu8Bq3XlI=;
 b=iLCVPt32Ejqzql80QNHFMtBnjRiOuJTHR8Tf5l97tB69vDQb5tKcdMJdvzmG5SHF78
 hpfOPYGJRuGbEz6mn/bg7WQUEbdXtgGsB9dmf7rksmQfVJY5aA36Eqi/IvHqUT7F+Gw4
 7/dOcbG1ZNBcR05m2A/Y5328SO7uDofdbvul4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EpIe/lqQkhx08lipwDb1RztcC1JFTrHgDzAu8Bq3XlI=;
 b=o51bnEjk8yQC2tPZ/SoT7R0IpMR33XcY0jVQqOiRG6e0B6bYbOtUWkP+uqUH9eEHHR
 kujlKYZV8dr37A2nddeoJ83AhHVmDOnwxNvAGnB4ee1al1PtJjMoopDyD1SYMIdA2D6U
 58DuI8rU+BvToAK3ZnofSkgSFs8j+rP3HkgINcumSrm4Cpi7gzxJxNhO6Vz/1FxDnsKv
 NmXmKrmwL19z9PRzRtadjrFCrcAIGFy4eIRbUEWsTKjKEkhC1Hd/YxNynUNphZysHuFz
 N+HXFDvVCcS/xBGrd4QzalqhAF8xrnLYHCp8E+aIJo9WeEs5e+Z/IrDbqx93F1Bug35F
 udlQ==
X-Gm-Message-State: AOAM531u7xJwvXquXbbXE3SGvBvtDNLjslgBjCadoq8fPNPWwOKnu8o3
 /GEBdQM/a0PbhYDMBBQkwWh0lA==
X-Google-Smtp-Source: ABdhPJxiR/F6nWURpocqLSYI5nZ4Gi9y2iX4AsFMdlwbsdkhoffq2K4Je19F4QExAGML/StdGNqMNg==
X-Received: by 2002:a37:8906:0:b0:69c:6cb:1d21 with SMTP id
 l6-20020a378906000000b0069c06cb1d21mr3468557qkd.440.1649604041609; 
 Sun, 10 Apr 2022 08:20:41 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 m4-20020ac85b04000000b002e1dcaed228sm21557230qtw.7.2022.04.10.08.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 08:20:40 -0700 (PDT)
Date: Sun, 10 Apr 2022 11:20:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] gpio: Add gpio_request_by_line_name()
Message-ID: <20220410152039.GP14282@bill-the-cat>
References: <20220131032405.105204-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wJnDPJhqGGlzIm5V"
Content-Disposition: inline
In-Reply-To: <20220131032405.105204-1-andrew@aj.id.au>
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
Cc: u-boot@lists.denx.de, sjg@chromium.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wJnDPJhqGGlzIm5V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 01:54:05PM +1030, Andrew Jeffery wrote:

> Add support for the upstream gpio-line-names property already described
> in the common GPIO binding document[1]. The ability to search for a line
> name allows boards to lift the implementation of common GPIO behaviours
> away from specific line indexes on a GPIO controller.
>=20
> [1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7=
af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to u-boot/master, thanks!

--=20
Tom

--wJnDPJhqGGlzIm5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJS9cYACgkQFHw5/5Y0
tyx7ZwwAhO08bL3+EZJpBH42ylmKTq1kFg0GkaP2/sKvPHnzgKRNb1+qgALa3/2r
fbhrXjj62fM30u4J/KUIk5LN+dRDa5/br6+b3E5aFuSyc4OsnAByofuG3/50DG/N
CSP3VSa0C3CR4yYzOzbXqwOEMUyQM6qISYDnzD4nFh9Kq9QGcJWBmoi+7O3oBdE8
TOuPq8rX6FIZNJ9lQNm+tDeLVRXjovnP5TZEgxBonrsF02Dihcx0EI0DuPDDg70b
UswyckrerChhZW+Z0e0Cf4XYjFb5N1JhsBEVz9ABC9DRABSsrHY/LNh1Zy4RM+ja
TacRo/Rn5SUgdaecR3JrCuZJOLsMVF1ZhmLgcXdW5H8WdMhNEUsvXpEZ44XhsCbf
4xrOFkSy1zAVWpA/p93lJ74AH+2PVkbNKcK3z9Dzl7XfHWi5o64uRKu9CDKPDvkQ
QrR0vwdKaRifY9DltqfoKOtBVD/G2T9cJQx+v1GyS2i/hLZb0zbLLyJwJjdjenct
wFCkOFED
=Tlfa
-----END PGP SIGNATURE-----

--wJnDPJhqGGlzIm5V--
