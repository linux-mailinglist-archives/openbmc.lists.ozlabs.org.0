Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0D8C63F2
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2024 11:42:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XcIJ2pI5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfStx6QzHz3c2K
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2024 19:42:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XcIJ2pI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfStM1Hf6z2xjK
	for <openbmc@lists.ozlabs.org>; Wed, 15 May 2024 19:42:01 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-351ae94323aso3222513f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 May 2024 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715766112; x=1716370912; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnBW2wIdOANUMFWC1zrvWKgqwYpieENGNFpABuQzlks=;
        b=XcIJ2pI5Xz4K0srDt3NBNowL5b8gQEf/PzOlftH06lBcmko3TDkyiHbvT4YPcFgg3p
         +jwiqq0D1izsBc0ZOumG23H5+ANtfRNkICbVM9g312Iubft9nNjfoMvABXI7UyZMdwvo
         b5kdd+JqlsdSCLYy97iV6ovF/KrDtE0xHpUX0nRCfzVd0jk9W9/AD97agBXXJTfM7G2L
         98m1DYD8/Fk/l8Cvo3Hh0J9uy9F6zMdez4GF1mDzp6iogCnFOkWnubCUzeC8gfj1PLee
         6+U92ZqU+JCe6Ty+VQDzTqvQxAxgXZmCeJaMtKB8GtVLub8blbfIqqfMXprOPsT/VpmO
         Acfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766112; x=1716370912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnBW2wIdOANUMFWC1zrvWKgqwYpieENGNFpABuQzlks=;
        b=QVNr1jvvU6WWUC8T2DMEnd5AE3Cu8OMeqGIUhjm7FnzfMQ2nsyE7nMTiX9TsCnPfWc
         0mNDFYiebIC5xHmwjJFjlwGVbkdcty5/dq9urXqqUwHywxNN2Iiglla2xczhEb02uwuD
         h7jrMTDZiyfmZIm0zYm2FU0U/yCBhDqOZwRCKZWtmxg6Xhn0nwy+aquC6+sNJfClKE8r
         4QWNyC2Q3EcvfWEddlKW03r0QGrOIFEqVU7tpd5+HoFT6AJcpnah37DdYwomjbDaKj0t
         mm5J8wblSBS9bRm4uLnd30VHTvlX8XaJ+oxFWZVgEQF+Eyjq4WxBa8aePahgIIf70Lnt
         MwjQ==
X-Gm-Message-State: AOJu0YyOWouRpY0nEba1z6QFSZhRrYmIhjiYGKMKI2VubE/CDyak4+mM
	GZkq2Hbvyr7aPF/A4TR94m0uVn96cVlsQ18we7IN54ddtggRjj4A8KhrETbdeQ+9GHC0CtqhsDP
	6HK5/ftm2TBnPLrxthIRcHqpRRvS2BgQQ
X-Google-Smtp-Source: AGHT+IG2JpOpZLw+kJZcoixM9sAeZEotmugZ/c3SXzDlgsnf8ChzmBLqqc6Zp5eApDjxOO8TzKtMF/yTd40trSdxsDw=
X-Received: by 2002:adf:ff92:0:b0:346:14d2:fef6 with SMTP id
 ffacd0b85a97d-3504aa62f2amr11102374f8f.62.1715766111488; Wed, 15 May 2024
 02:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com> <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
In-Reply-To: <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Wed, 15 May 2024 17:41:40 +0800
Message-ID: <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts: Aspeed:
 Add Facebook common dts
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,
     Thank you for your reply, Do you mean something like this?
compatible =3D "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,ast260=
0";

Thanks,
Peter.

On Tue, May 14, 2024 at 7:52=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-05-13 at 22:49 +0800, Peter Yin wrote:
> > Initial introduction of Facebook common
> > equipped with Aspeed 2600 BMC SoC.
> >
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >  arch/arm/dts/Makefile       |  1 +
> >  arch/arm/dts/ast2600-fb.dts | 66 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >  create mode 100644 arch/arm/dts/ast2600-fb.dts
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index 6f4b4d8a17..3740a4452d 100755
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       ast2600-dcscm.dtb \
> >       ast2600-evb-ecc.dtb \
> >       ast2600-evb.dtb \
> > +     ast2600-fb.dtb \
> >       ast2600-fpga.dtb \
> >       ast2600-greatlakes.dtb \
> >       ast2600-intel.dtb \
> > diff --git a/arch/arm/dts/ast2600-fb.dts b/arch/arm/dts/ast2600-fb.dts
> > new file mode 100644
> > index 0000000000..69ff575419
> > --- /dev/null
> > +++ b/arch/arm/dts/ast2600-fb.dts
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2023 Meta Platforms Inc.
> > +/dts-v1/;
> > +
> > +#include "ast2600-u-boot.dtsi"
> > +
> > +/ {
> > +     model =3D "Facebook Common BMC";
> > +     compatible =3D "facebook,common-bmc", "aspeed,ast2600";
>
> I'm not convinced about "facebook,common-bmc" as a compatible. Is there
> actually a reason to specify anything here other than "aspeed,ast2600"?
>
> Alternatively, perhaps list all the relevant platforms, like the p10bmc
> dts?
>
> ```
> $ git grep aspeed,ast2600 arch/arm/dts/ast2600-p10bmc.dts
> arch/arm/dts/ast2600-p10bmc.dts:        compatible =3D "ibm,everest-bmc",=
 "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
> ```
>
> Andrew
