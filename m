Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508E4B94C3
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 00:57:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzZdq3fwqz3bcl
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 10:57:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=Pb64gmvW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=Pb64gmvW; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzNbX4jq2z2x9V
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 03:25:10 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id d3so2856198qvb.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uDddTCyvelXzOwxw249PzX+YQ0LpztbaozTQIL/vEAo=;
 b=Pb64gmvWFmbR218PTggi9V23MABbakKQxMN7pqGb5rGvnAQfETfdMRZhw70ILqUtlu
 fgkz4ZsvQsvdxdS990tkyMSpkmTB97uf4lKG8glYvCPgo6VuTfEItVqH45lnNnvS8Yxj
 YnwLHs7cDbHhHW/6yDVBK6EVPsz4PpedKvjhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uDddTCyvelXzOwxw249PzX+YQ0LpztbaozTQIL/vEAo=;
 b=pZBX9H8FELBGJcN7UsQRJ80VOzc/lAv9lnalM67ZGtrxf9Gbn+tXIc93kgDZmcu22R
 H/ezX8lf86o1+JeQ6xHmeC1dhY60PUIPwAbYbuJx26vTvLcOSY029sRhDAn/SsOdVljA
 BuOft3/ZIXjVp62crOwxee6zE3nH8v0sMfuiMKv0eOPxojsoCPnXYRLz89VeAP7AdiVn
 sg9YkhuEapna+opytAyVFr+Q+mmSxKqmEKhwsk4Dl+tr9b/23InE3EAr2hspwzK5e3H6
 7gUm6FVDa89R3Htsh05c+Syss9O0mf3iR2WeqLKumvl0KWyMm/7POS+h0S/4nAwnkpI/
 hKeA==
X-Gm-Message-State: AOAM5309ImBA2FYxBqyfNR0cZJ05eRUTzSbPxgmoua0s1cbVrwFKPN12
 GBC6JSewRGnPqvZPoLCuvOdHcA==
X-Google-Smtp-Source: ABdhPJxWO50pLO2dhCFSxf2b7tiiQoAVAgnjBnr7wem/2BMPcNEPpD3VKCwq+OAF7r9ht8m65TBY/w==
X-Received: by 2002:a05:6214:500f:b0:42c:11af:f8a9 with SMTP id
 jo15-20020a056214500f00b0042c11aff8a9mr2385685qvb.51.1645028705665; 
 Wed, 16 Feb 2022 08:25:05 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id d23sm1862338qka.50.2022.02.16.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 08:25:05 -0800 (PST)
Date: Wed, 16 Feb 2022 11:25:02 -0500
From: Tom Rini <trini@konsulko.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Subject: Re: [PATCH v1 2/9] clk: nuvoton: Add support for NPCM845
Message-ID: <20220216162502.GB1576803@bill-the-cat>
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20211215025800.26918-3-yschu@nuvoton.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Thu, 17 Feb 2022 10:56:47 +1100
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
Cc: festevam@denx.de, tmaimon77@gmail.com, narmstrong@baylibre.com,
 lokeshvutla@ti.com, hannes.schmelzer@br-automation.com, lukma@denx.de,
 u-boot@lists.denx.de, sr@denx.de, michal.simek@xilinx.com,
 kettenis@openbsd.org, harm.berntsen@nedap.com, dsankouski@gmail.com,
 openbmc@lists.ozlabs.org, weijie.gao@mediatek.com,
 sebastian.reichel@collabora.com, ctcchien@nuvoton.com, pbrobinson@gmail.com,
 hs@denx.de, jagan@amarulasolutions.com, kwliu@nuvoton.com, yschu@nuvoton.com,
 stephan@gerhold.net, andre.przywara@arm.com, tharvey@gateworks.com,
 vabhav.sharma@nxp.com, fangyuanseu@gmail.com, seanga2@gmail.com,
 patrick@blueri.se, avifishman70@gmail.com, sjg@chromium.org,
 samuel@sholland.org, christianshewitt@gmail.com, mr.bossman075@gmail.com,
 giulio.benetti@benettiengineering.com, bmeng.cn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:57:53AM +0800, Stanley Chu wrote:

> Add clock controller driver for NPCM845
>=20
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/clk/Makefile                      |   1 +
>  drivers/clk/nuvoton/Makefile              |   1 +
>  drivers/clk/nuvoton/clk_npcm8xx.c         | 213 ++++++++++++++++++++++
>  include/dt-bindings/clock/npcm845-clock.h |  17 ++
>  4 files changed, 232 insertions(+)
>  create mode 100644 drivers/clk/nuvoton/Makefile
>  create mode 100644 drivers/clk/nuvoton/clk_npcm8xx.c
>  create mode 100644 include/dt-bindings/clock/npcm845-clock.h

Following up here, Sean had comments and while I've seen follow-up timer
and serial patches, I haven't seen a follow-up clk patch.

--=20
Tom

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmINJVoACgkQFHw5/5Y0
tyybHwv/e4D5ZbyEVwRTVf6VUggRylly5ymUJb2r7gfodo5C2rI7ExkTuW1Au1hz
M/JRVJZZKkqskUcxVooScEwl0bhqFwI2Gs4eWH71LeZljSuDFWWdgk5OC9pHyfRR
A7TG1FVHFOLwPR+x2cKtF5mw2NUbsrtqeHTw8psqVQB8tMSJVTWlJdh2hGtJpgfj
W3EytdKcx0l/4UQswCJFm3fnODksZibSs9C+/pP82LwjP3YCk6HDMjICCUJM5eMI
pADOjI5lBc1MFfWxp1110kdRkf/sc2wPZHZwMiDL+9Y7QSaJh6ezb08+9HzJAN7Q
pzxUdkbR2MUGrXCfzMpSVbeEOYTSUSJKM86JNn941v/+egAu4ReuJ3LNpZKkv1dy
iOCa41bWf95lYzYu/MF0UML99nsW4Csc60A6jXtbq7yqEiGNHpdbQm1UXYv+dVN5
gUUt2ZaHObhi5NoBdLf0iJ0VyVlU6WY7nFcqF26eW5+OJRw4QUkPhLjvoGGI0UkL
4aNB9E8X
=hcYA
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
