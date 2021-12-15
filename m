Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DB47834F
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:43:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYFZ6W3Tz3c90
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:43:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=hnheFIMb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=hnheFIMb; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDfYv5pGHz2yQ9
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 02:39:29 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id t11so22174132qtw.3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 07:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ozRREeC9pznS4YNxls4xjiBan+pb+jcDZgCJ47omT8w=;
 b=hnheFIMbJ2JmHb/xDLlAX/wP9e9m4Bkn2CWQv38ZELAmhAb1WypwSLqUG+6YB6YB+I
 6DFXyAhvcXnlrRQC9RlXMOVMBTqx32TdTZFoa/EanChEb/kqF4AmfdJsS9bsHwOitoEL
 zFlz0MK1kG9OSj7OULYjKnRTSfBvMn1zVUg6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ozRREeC9pznS4YNxls4xjiBan+pb+jcDZgCJ47omT8w=;
 b=FjjVCXiBTy3av86xEbK2eMlzIDuNTfLHHee9gsRR5ld9vLWTGhwLNyatQPafLxizc3
 6eo8egJqQWgtwjVI4isOdepZoD7CpjFaoq5U7TiHSc9aaHbFq6+ydBIavBfGjRTpMbi/
 LIZqbtdYmtwmWgwyWuKx0HSEaKEAQ5NDOWoGrGaaDuFMCSQol27LPjZgEeaA2wFKJJIB
 hoBolNi74MVbR7rwfc4i/NT1QlKL/6FtO8BSNy0bhD+FeEr/TUhGo6VR958+tasXq4QI
 cv+M5WLZKevgg73rDLdxhA4IZo+7DJiGgAraKsdMMeapfAMi+sLM/eqjV0qwLvVqlbyM
 b5ig==
X-Gm-Message-State: AOAM5306hzTdI5mu0oflW8+LDlz9Gov2RXf/pJ60n4XnTo9Sqqzr1WB3
 GVwoFfBHEuum8eOcvRQAHNkeNQ==
X-Google-Smtp-Source: ABdhPJwiSE90Kw925pBAacANnrdcQ+PagKbp2dlHQwsLfEp5ljCtRA3fsRyLxznINvqSH29tSX0I1w==
X-Received: by 2002:a05:622a:164e:: with SMTP id
 y14mr12529118qtj.647.1639582766343; 
 Wed, 15 Dec 2021 07:39:26 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b008-f6f1-3496-c51e.res6.spectrum.com.
 [2603:6081:7b01:cbda:b008:f6f1:3496:c51e])
 by smtp.gmail.com with ESMTPSA id u10sm1730814qtx.3.2021.12.15.07.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 07:39:25 -0800 (PST)
Date: Wed, 15 Dec 2021 10:39:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH v1 8/9] ARM: dts: Add Nuvoton NPCM845 device tree
Message-ID: <20211215153922.GB2773246@bill-the-cat>
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-9-yschu@nuvoton.com>
 <20211215130723.GW2773246@bill-the-cat>
 <CAPwEoQPu5uC=PGKo2R687R2Ed-GmA_ktG+9uvr4=yU+Kpp4rEQ@mail.gmail.com>
 <20211215133506.GZ2773246@bill-the-cat>
 <f2deb80c-6500-80de-658f-564f5ebda86f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline
In-Reply-To: <f2deb80c-6500-80de-658f-564f5ebda86f@gmail.com>
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
 sebastian.reichel@collabora.com, ctcchien@nuvoton.com,
 jagan@amarulasolutions.com, =?utf-8?B?55ub?= <stanley.chuys@gmail.com>,
 hs@denx.de, pbrobinson@gmail.com, kwliu@nuvoton.com,
 Stanley Chu <yschu@nuvoton.com>, stephan@gerhold.net, andre.przywara@arm.com,
 tharvey@gateworks.com, vabhav.sharma@nxp.com, fangyuanseu@gmail.com,
 seanga2@gmail.com, patrick@blueri.se, avifishman70@gmail.com, sjg@chromium.org,
 samuel@sholland.org, christianshewitt@gmail.com,
 giulio.benetti@benettiengineering.com, bmeng.cn@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:32:21AM -0500, Jesse Taube wrote:
> > OK.  The device trees at least need to be in linux-next.  That will
> > cover a lot of baseline review that needs to happen before we take it
> > in.
> >=20
> Hi Tom!
> If my understanding is correct device tree's should be accepted into=20
> Linux-next before U-Boot, or am I wrong.

Yes, they should be in linux-next at least before going in to U-Boot.

--=20
Tom

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmG6DCQACgkQFHw5/5Y0
tyw77wwAmaOFlr1CJBLujsK3bFEDNMZcJ2L/iX7H3iekwT1KjXmwekzy/gz4b8El
MgJHc2f5t+95vL7loUfm/OB53NMkY5gu0Ug77yC3UEt5aXz3XCn2NXSvFJbN4YJx
+QJfb4lKXqeNmFJzh59xb85ZhFCyzGPypaY4fWpeO4BY+dw2ULP2hdK5GWIYRJgh
6Iz03Pwz3ItG83eKsAw7FtWZRf0bcSbMLV230CwKMtZMdcg5kBY9UH1NKdt3wI/u
K8BT3N0SlydqofN/uJYJA6zxdrrh2VOu88x0s2klMKMMVUOTl0h8LpUlKtKxWSZi
bV0hYarzoPE+dXTo2ldK7MIA3Ws9BLVtrM9xIeXt58KSV9vBO8dGmz+Fn9NlseSn
gSazC3MA8oI84w9Csv/L4axrlgMwXhs7216zEKnvGAfAThp6zCAst89137tdZ1nV
NGCl6C1D8y4T381p11vApt7Ug9zxOhrgXCIuVL7UOoew6pgOVyhCqDpARb+K70Vv
rRAz1/fD
=POza
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
