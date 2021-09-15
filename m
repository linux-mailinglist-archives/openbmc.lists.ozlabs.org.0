Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C440BDBD
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 04:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8PB01Rr6z2yHL
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 12:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X4as+tR2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=X4as+tR2; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8P9T3FGXz2xr8;
 Wed, 15 Sep 2021 12:21:48 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id t190so1852792qke.7;
 Tue, 14 Sep 2021 19:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A+KAQJV7yr5BHufuqHUeYpeLECPeGugfRBKqmtmeEC8=;
 b=X4as+tR2z4jqAmk5O1K0ygHqymiDqUcDCapkO0TOoqLvDVqIuL0ILdEhs+u4/nVufu
 fBKOEhOmrgIWoAhtWCjGE0bSYU5Xb44ffJy2fERDSp8lJkW9K4Uwi18q3RgPjV0c/lT+
 gfi0fNv8Ewl5mdqg4deRUJb8qj7PsinrPIP70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A+KAQJV7yr5BHufuqHUeYpeLECPeGugfRBKqmtmeEC8=;
 b=yPKfFe2KNP3bF41C7pJ3LdkwhCiyq6Fx2Tn175JTZnH7jPWQjroQ1OE19QbFDOu1UO
 ELP7hjPyuoALcCYj9D5v73R11UV17EhaI1nAr46gRLqSF7Np/wVjfs/mBLJtU1YlVWgA
 KJW29wWdTHZeA8+qmCTew72T02o+W+cpl150A2TNDstObSu2eYoji2YnOu08mxRc2J1s
 5+e9qDqZVNWzR5I+ElOxCw6GvWCnbAs3rO4tnQrz1R9QyjrX+MmuqlbvvxtCpM4sNfM6
 ya+IQn84PWkXXcbp+5nNukP/4nqdkTnoflsiO/YL5Z6OcvW8lmH18Eik6Vqsbz1YG/qZ
 6QZA==
X-Gm-Message-State: AOAM532bMWqK+4dtCXfi5fYHSQMBlQ2rfcHczG8ttlAnRBLo9vSkSEdP
 Kjdphpuhim0/Q6Vf+/zyxTpeP61KBg74I2xN7YU=
X-Google-Smtp-Source: ABdhPJwdfQIBMrmxJzpwVpZM1a+IKrHbWPgYk9i5TDUgw+nGTgDCmDfk9YQHlYuUugQY8Pp8dlh4YM1r7rU7EdBiEM0=
X-Received: by 2002:a37:67d7:: with SMTP id b206mr7876480qkc.395.1631672504815; 
 Tue, 14 Sep 2021 19:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210910195417.2838841-1-anoo@linux.ibm.com>
 <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
 <23EB5226-63A1-45AF-A50E-2A9D6DABFC08@linux.ibm.com>
In-Reply-To: <23EB5226-63A1-45AF-A50E-2A9D6DABFC08@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Sep 2021 02:21:32 +0000
Message-ID: <CACPK8Xd9MK6oZ=Ac85EkKn7vPvEfqjMKSk=73_R=_16US+6gHQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF gpio
To: Adriana Kobylak <anoo@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Andrew Geissler <geissonator@gmail.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, Derek Howard <derekh@us.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Brandon Wyman <bjwyman@gmail.com>, shawnmm@us.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 20:46, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
>
>
> > On Sep 14, 2021, at 3:49 AM, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak <anoo@linux.ibm.com> wro=
te:
> >>
> >> From: Adriana Kobylak <anoo@us.ibm.com>
> >>
> >> The N_MODE_VREF gpio is designed to be used to specify how many power
> >> supplies the system should have (2 or 4).  If enough power supplies fa=
il
> >> so that the system no longer has redundancy (no longer n+1), the
> >> hardware will signal to the Onboard Chip Controller that the system ma=
y
> >> be oversubscribed, and performance may need to be reduced so the syste=
m
> >> can maintain it's powered on state. This gpio is on a 9552, populate a=
ll
> >> the gpios on that chip for completeness.
> >>
> >> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> >> ---
> >>
> >> v2: Update commit message.
> >>
> >> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103 +++++++++++++++++++
> >> 1 file changed, 103 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/b=
oot/dts/aspeed-bmc-ibm-rainier.dts
> >> index 6fd3ddf97a21..d5eea86dc260 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> @@ -1502,6 +1502,109 @@ eeprom@51 {
> >>                reg =3D <0x51>;
> >>        };
> >>
> >> +       pca_pres3: pca9552@60 {
> >> +               compatible =3D "nxp,pca9552";
> >> +               reg =3D <0x60>;
> >> +               #address-cells =3D <1>;
> >> +               #size-cells =3D <0>;
> >> +               gpio-controller;
> >> +               #gpio-cells =3D <2>;
> >> +
> >> +               gpio-line-names =3D
> >> +                       "",
> >> +                       "APSS_RESET_N",
> >> +                       "", "", "", "",
> >> +                       "P10_DCM0_PRES",
> >> +                       "P10_DCM1_PRES",
> >> +                       "", "",
> >> +                       "N_MODE_CPU_N",
> >> +                       "",
> >> +                       "PRESENT_VRM_DCM0_N",
> >> +                       "PRESENT_VRM_DCM1_N",
> >> +                       "N_MODE_VREF",
> >
> > Should any (all?) of these names be documented?
> >
> > https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-na=
ming.md
>
> Not sure. Seems the openbmc doc is documenting the gpios for gpiochip0 on=
ly?

AIUI the document is for GPIOs that are exposed to userspace.

It doesn't matter where they're coming from. If they are going to be
used by a libgpio application, they need to have names, and the names
should be documented where possible.

> The gpio names for 9552 in this patch come from the System Workbook, and =
doesn=E2=80=99t seem the gpios from the existing 9552 that also come from t=
he System Workbook are documented in the openbmc design doc, such as SLOT6_=
PRSNT_EN_RSVD, SLOT11_EXPANDER_PRSNT_N, etc.

They should be fixed, if possible.

Cheers,

Joel
