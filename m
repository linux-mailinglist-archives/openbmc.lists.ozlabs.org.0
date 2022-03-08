Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E94D13B8
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 10:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCVr02QyBz3bT1
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 20:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=p4kRJ8tA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=p4kRJ8tA; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCVqb4jn5z2xDv
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 20:47:39 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id k2so18198855oia.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2022 01:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1ajLmwYXF0Kg+FwUbeiDi7e8Es+jjnoVsO4sqQlni2g=;
 b=p4kRJ8tAKUlkiNeThCaTKNhjGBKh7rVp88EfqxP7yETHI2AE76GbUsQiNjNpYUDodu
 os4RHGfYYRkxrw5mOGX8f8bE33Ei83vUThzJ3r/NgyLM+fM/VwL8UFty6cvPSfpze6CC
 Mzbk4E0yV9lkYqGqWpeUUdbtiXH0R8pn/pFgAMxeaJWnmn8Vrx7SAxqanazNmUOB937U
 Tnw6sEZq9AkRGENcQaSL53ni2jscEh4aqRUEKt/hhlNYgxr2t9up5w/A29DeTVi5GCV+
 2sisywCxsj6y4GqAsDW9e3N1nNuveHU9+lArmSjy/KEpHkjDzHJocPy2+IqMcF5tSo35
 HAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ajLmwYXF0Kg+FwUbeiDi7e8Es+jjnoVsO4sqQlni2g=;
 b=l23zkJyKlS3lZkPBSw2l2EVIC3uGYf1O4lRczBuJ4QUqWpY1Xy/od8crdjHbdgcqaL
 5EWtpeD3Sl/b63g4Yhk+53/DOooRObwkCn/W/d+nyT7x9kneVXPVA3tlcYaEYSMVg6O3
 7FmuitntskjnKdVacrach510JKBp1IvHnl86nfbwBArROIqq4TY9Tef/XrNGLjPPIsGU
 7YkYuffc5FHuF/As6rxeiaEZhIrdOkARwiyRKApVZhpxf065tAdUkmwhNCdPg4h0wiO9
 8ZvZ5w+h346ynRybro4eZV+oTvhbhdngr1Go0nsO4b1TyapOlbICf/rfYUGc2z+5MqNg
 lvRA==
X-Gm-Message-State: AOAM533ZDwIBsMQFek17ign23cKOl2dUEjQf6gouDq5b6+9FV+uKZe0z
 /RmsmwNlJ1BCI3eDeJXoQJ6azf6wO7WJs/TX26eOhQ==
X-Google-Smtp-Source: ABdhPJygguUXp7UILDd0fvwcU7b1NfRUaLAxO/fC5E6Hs3QzyYT42202KTh3j5Ojk9R5kPCGkFYdPO5umq9kd55NEGI=
X-Received: by 2002:a05:6808:19a3:b0:2d4:522a:3188 with SMTP id
 bj35-20020a05680819a300b002d4522a3188mr1981758oib.8.1646732855599; Tue, 08
 Mar 2022 01:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
 <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
 <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
 <CAGm54UHUC_7W9xGT49Ge3oO8Xf4-gDiq3Buvm-_D9K+3QX8M3w@mail.gmail.com>
 <b6fb257d-0fdd-bdf0-a18b-cb8f1db25195@kaod.org>
In-Reply-To: <b6fb257d-0fdd-bdf0-a18b-cb8f1db25195@kaod.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 8 Mar 2022 17:47:24 +0800
Message-ID: <CAGm54UHZGhaBYqpaquaqGMFH16d1JqSt=PGnXhsd8TCD8-B92w@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 8, 2022 at 5:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Lei,
>
> On 3/8/22 02:53, Lei Yu wrote:
> > On Mon, Mar 7, 2022 at 9:06 PM C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >>
> >> Hello,
> >>
> >>    On 3/7/22 10:41, Lei Yu wrote:
> >>> We hit some issues with the new driver, and here is some detailed inf=
o.
> >>>
> >>> * Our system (not yet upstreamed) uses `mx66l51235f` as the FMC SPI
> >>> flash, and we created a QEMU model.
> >>>
> >>> * When the dts is like "default":
> >>>    &fmc {
> >>>           pinctrl-names =3D "default";
> >>>           status =3D "okay";
> >>>           flash@0 {
> >>>                   status =3D "okay";
> >>>                   m25p,fast-read;
> >>>                   label =3D "bmc";
> >>>                   spi-max-frequency =3D <50000000>;
> >>>    #include "openbmc-flash-layout-64.dtsi"
> >>>           };
> >>>    };
> >>> 1. Run the image in ast2600-evb QEMU, it boots fine;
> >>> 2. We have a model (g220b) in QEMU that uses mx66l51235f as the fmc
> >>> SPI (`amc->fmc_model =3D "mx66l51235f";`), it boots with below error:
> >>>    [    1.848286] vmap allocation for size 268439552 failed: use
> >>> vmalloc=3D<size> to increase size
> >>>    [    1.848774] spi-aspeed-smc 1e620000.spi: ioremap failed for
> >>> resource [mem 0x20000000-0x2fffffff]
> >>>    [    1.849898] spi-aspeed-smc: probe of 1e620000.spi failed with e=
rror -12
> >>> 3. If I manually add vmalloc to the kernel command line (setenv
> >>> bootargs 'console=3DttyS4,115200n8 root=3D/dev/ram rw vmalloc=3D400M'=
), the
> >>> above QEMU model boots fine.
> >>> 4. On the real system, it behaves the same as QEMU, that I need to ad=
d
> >>> `vmalloc=3D400M` to make it boot OK.
> >>
> >> I don't see why. Is that the same kernel version and config ?
> >>
> >> May be check the allocations in
> >>
> >>     /proc/vmallocinfo
> >
> > It shows a large area as below:
> >
> >   0xc1d30472-0x406b4a0c 268439552 __devm_ioremap_resource+0x178/0x1f0
> > phys=3D0x20000000 ioremap
>
> Is CONFIG_VMSPLIT_2G set ?

Yes, it's enabled in aspeed-g6/defconfig
