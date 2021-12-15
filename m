Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC8478348
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:42:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYD76DZHz3bnG
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:42:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=BuCqLSUr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=BuCqLSUr; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDbpT6vm0z2ypK
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 00:35:13 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id u16so20264616qvk.4
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 05:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ihbK9qMYbEaOWKsAip6q/9Mzg+fEhBnVcARmrtF3lwo=;
 b=BuCqLSUrdjVZjfIfXeSpoyvWGQhAgsw0JShks8kh8P3ffv8VUMMeQuTvETm60KwiC0
 EkQyZsxuJFvbhGgoKF+7nYAzonby56tdKCJ+zTxbL/ISOEEFvgFOcQ2mOBEe+8QpBSBU
 7dAk0GUgMi2q0E9pHcVSygaedtKFpN+rYnpz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ihbK9qMYbEaOWKsAip6q/9Mzg+fEhBnVcARmrtF3lwo=;
 b=UgGL8GCDLWCsGGPUhIQjfXmVmQ7OVbNzFZfOeIr3SRc5yb7DkbtoYUkDrYbLZH2hSN
 CNd3Uag5+g9JZI+dZd5LdqCVCQtkhPzQ8AxbSG9sJ3kF3C8XH0Z3aQe/6zMphawm64Wz
 iZcuz3H4xTj8P76Bee21eCi2FDHjZwZtrDEfBz22mpruY4lFsHuG+mF159UvVYg+Gj8+
 pYv2pYIz9ic404hNQIKB27yw8D3dDPEczxrSeWYQNu/T9JUtIFbXLZV8ECawaqQ725kI
 f4EXT9mi9G9Fb2OxclpldXuMnavJsr9y/OnIzuCNJgxErwqUpKwPo3sYr/IM++rHjJHo
 /q7Q==
X-Gm-Message-State: AOAM531Pt9W+y8UgYdfmpGwuRtwx2e9fiOTMP9oMTzidwUTBt2vmlGHa
 Ey6Uyu7XveogwpG7ouyCVwD1HQ==
X-Google-Smtp-Source: ABdhPJy7k81vapyVBeNvO+e2PA8V6Mwx3kRi//zB3QZAeaZB1Auis/PHXbVt1maEpNYdm1ffk6COYw==
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr7450910qvb.107.1639575309878; 
 Wed, 15 Dec 2021 05:35:09 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b008-f6f1-3496-c51e.res6.spectrum.com.
 [2603:6081:7b01:cbda:b008:f6f1:3496:c51e])
 by smtp.gmail.com with ESMTPSA id o4sm995713qkh.107.2021.12.15.05.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 05:35:09 -0800 (PST)
Date: Wed, 15 Dec 2021 08:35:06 -0500
From: Tom Rini <trini@konsulko.com>
To: =?utf-8?B?55ub?= <stanley.chuys@gmail.com>
Subject: Re: [PATCH v1 8/9] ARM: dts: Add Nuvoton NPCM845 device tree
Message-ID: <20211215133506.GZ2773246@bill-the-cat>
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-9-yschu@nuvoton.com>
 <20211215130723.GW2773246@bill-the-cat>
 <CAPwEoQPu5uC=PGKo2R687R2Ed-GmA_ktG+9uvr4=yU+Kpp4rEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RDS4xtyBfx+7DiaI"
Content-Disposition: inline
In-Reply-To: <CAPwEoQPu5uC=PGKo2R687R2Ed-GmA_ktG+9uvr4=yU+Kpp4rEQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Fri, 17 Dec 2021 13:39:52 +1100
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
 hs@denx.de, jagan@amarulasolutions.com, kwliu@nuvoton.com,
 Stanley Chu <yschu@nuvoton.com>, stephan@gerhold.net, andre.przywara@arm.com,
 tharvey@gateworks.com, vabhav.sharma@nxp.com, fangyuanseu@gmail.com,
 seanga2@gmail.com, patrick@blueri.se, avifishman70@gmail.com, sjg@chromium.org,
 samuel@sholland.org, christianshewitt@gmail.com, mr.bossman075@gmail.com,
 giulio.benetti@benettiengineering.com, bmeng.cn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--RDS4xtyBfx+7DiaI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 09:32:00PM +0800, =E7=9B=9B wrote:
> Tom Rini <trini@konsulko.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=8815=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:07=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Wed, Dec 15, 2021 at 10:57:59AM +0800, Stanley Chu wrote:
> >
> > > Add a common device tree for all Nuvoton NPCM8xx BMCs and a board
> > > specific device tree for the NPCM845(Arbel) evaluation board.
> > >
> > > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> >
> > Which Linux kernel release are these from?  Thanks!
> These are new created because NPCM845 is an new generation BMC chip,
> not upstream to Linux kernel yet.

OK.  The device trees at least need to be in linux-next.  That will
cover a lot of baseline review that needs to happen before we take it
in.

--=20
Tom

--RDS4xtyBfx+7DiaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmG57wMACgkQFHw5/5Y0
tywMWQv/YBZWJ2nw8o6b82R7B8VUMhHpAIBeOchXvkuMPuzi5eaPpCjF/4JJZYAF
LA5qz4Hat0nmf4E/G4MS2vSGCXF3TelIjrOAnkmi+KBqBsfFFp2604Vo0xn6z41X
7yPipBO4qQxhZ97d84H/otxUChEkgctJyOfsOKTlI3B4AbKl/qCJgTixAX0Asus9
+Wyl0p/s+Zb7z1CugiIx8NonPY63Rsz65D7isbWfZZ+bLtnUhwYd1uUHLkHCBnfS
BKEU1EreWYA9OVkpLPbY0wkn3cSl5SSGrTr/tSmjEFxVARYsxGTgrPOmWpfUxssc
pKTmK0UW1q+8Qv02JnlGYXvFpTMOR9D3e40W5NtQdrDzu/vG5HMTbfccBFtdDv2e
v0nDz/97Zvl2DZEDqsv49Un7euMP/OJOnXKAM6TntF1blUmHm8JIzoO+tMHaPpps
Fa+y1AhdwO6Ar8/WDsfzGaB0b/oP76UORay5vHujSOU/49dKS9CJJKa2uicG3EYz
KsJ38bLW
=EXt3
-----END PGP SIGNATURE-----

--RDS4xtyBfx+7DiaI--
