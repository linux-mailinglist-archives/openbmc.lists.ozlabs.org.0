Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1404D0DBC
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 02:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCJKn74Qxz30QR
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 12:54:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ayVqGkUG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ayVqGkUG; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCJKN4QkYz30DB
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 12:54:10 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so20342863ooi.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Mar 2022 17:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5X2Kb60PNEHhqYQOte1utXQHgWkr6hrvZbtjI40mFV0=;
 b=ayVqGkUG7PIQqaTqzasMtjAVt9dM9fR2vYS3u0YQnDmhKWupA/8L0qzZp4Djeera+/
 +8Uo9e+6MCGYmvwsRTNEmJI0vSszthTL5u77uHC/XWYap/yDJlJuZJqd2asX6Q1Bd4wh
 MpmUSo9XDLMhu43su1SzY1WJoIEqqt17TXdNiEZTQVEs0h1/NrYzjAQmYINsCLfDd6dy
 eT7GBfLO0oWX+803fR67VHVvNRr1If065zL9twkQ2UKrB9/IhJSlJdp3t+oJoYJ53pIz
 64gw1Dx5WMNo8Wd3EkH3olSeJgZe39OUC0Zt10AyN629gXjl+tzzgMXOmwp1brd8dxV4
 BB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5X2Kb60PNEHhqYQOte1utXQHgWkr6hrvZbtjI40mFV0=;
 b=NKJWWbAudJWcy71noFbq60Xh+ArNWD6CQ2Y0VRkAgO/mOlLV/DZLZtLkURqgy6aveX
 DqObCGuJQHTRvlFf6o9mEnZQZE37n7SQrwdQsA5we1ZaRpaNCjyCN5dUepCC+RXok0K/
 H9CLkrWfG3JbsKtR5fUULaCjAb76MZJtl8zeqMkPTCo5pM7w1zh2uaih9vz2CawLbgmO
 Fk9/tMCD/tAaMW/JtYPqatcO1LJmPl5EZEFKYw0dpxYidq0AVjd57iWBtuS97D4d7S6s
 xuiL8cPgRSxLSeMrL0nDRyuqKLuOn7ZL4MeKv6uj+IxQAMLcVVLQyUMz88PWCEX6VXmD
 lutA==
X-Gm-Message-State: AOAM533pJjJtnArIDV1D8ECZpnUlZXqUumuuiACR//FWCpvAD0gCyxXW
 k2p4ILYlDHt0zZPBRle+WuWBigmSWWn0JLBMyfSiGQ==
X-Google-Smtp-Source: ABdhPJwgjhorgGawv9xJL6YepnhtwiN1+BqDtpKRJ+fo731gHjCBmfbUrV5FK0H77c05RPQgMKmKmm2KCv4zIQy0Z58=
X-Received: by 2002:a05:6870:a102:b0:d9:bcaf:7181 with SMTP id
 m2-20020a056870a10200b000d9bcaf7181mr1090440oae.8.1646704447981; Mon, 07 Mar
 2022 17:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
 <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
 <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
In-Reply-To: <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 8 Mar 2022 09:53:57 +0800
Message-ID: <CAGm54UHUC_7W9xGT49Ge3oO8Xf4-gDiq3Buvm-_D9K+3QX8M3w@mail.gmail.com>
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

On Mon, Mar 7, 2022 at 9:06 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
>   On 3/7/22 10:41, Lei Yu wrote:
> > We hit some issues with the new driver, and here is some detailed info.
> >
> > * Our system (not yet upstreamed) uses `mx66l51235f` as the FMC SPI
> > flash, and we created a QEMU model.
> >
> > * When the dts is like "default":
> >   &fmc {
> >          pinctrl-names =3D "default";
> >          status =3D "okay";
> >          flash@0 {
> >                  status =3D "okay";
> >                  m25p,fast-read;
> >                  label =3D "bmc";
> >                  spi-max-frequency =3D <50000000>;
> >   #include "openbmc-flash-layout-64.dtsi"
> >          };
> >   };
> > 1. Run the image in ast2600-evb QEMU, it boots fine;
> > 2. We have a model (g220b) in QEMU that uses mx66l51235f as the fmc
> > SPI (`amc->fmc_model =3D "mx66l51235f";`), it boots with below error:
> >   [    1.848286] vmap allocation for size 268439552 failed: use
> > vmalloc=3D<size> to increase size
> >   [    1.848774] spi-aspeed-smc 1e620000.spi: ioremap failed for
> > resource [mem 0x20000000-0x2fffffff]
> >   [    1.849898] spi-aspeed-smc: probe of 1e620000.spi failed with erro=
r -12
> > 3. If I manually add vmalloc to the kernel command line (setenv
> > bootargs 'console=3DttyS4,115200n8 root=3D/dev/ram rw vmalloc=3D400M'),=
 the
> > above QEMU model boots fine.
> > 4. On the real system, it behaves the same as QEMU, that I need to add
> > `vmalloc=3D400M` to make it boot OK.
>
> I don't see why. Is that the same kernel version and config ?
>
> May be check the allocations in
>
>    /proc/vmallocinfo

It shows a large area as below:

 0xc1d30472-0x406b4a0c 268439552 __devm_ioremap_resource+0x178/0x1f0
phys=3D0x20000000 ioremap

>
> > * When the dts set `spi-tx-bus-width/spi-rx-bus-width =3D <4>`, and use=
s
> > pinctrl_fwqspid_default from @Joel Stanley's pinctrl patch:
> >   &fmc {
> >          pinctrl-names =3D "default";
> >          pinctrl-0 =3D <&pinctrl_fwqspid_default>;
> >          status =3D "okay";
> >          flash@0 {
> >                  status =3D "okay";
> >                  m25p,fast-read;
> >                  label =3D "bmc";
> >                  spi-max-frequency =3D <50000000>;
> >                  spi-tx-bus-width =3D <4>;
> >                  spi-rx-bus-width =3D <4>;
> >   #include "openbmc-flash-layout-64.dtsi"
> >          };
> >   };
> > 1. It fails to boot in ast2600-evb QEMU:
> >   [    0.586654] spi-nor: probe of spi0.0 failed with error -5
> >   [    0.587654] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 00 00 =
00 00 00
> > 2. It fails to boot in the g220b model with the same vmalloc failure is=
sue.
> > 2. With `vmalloc=3D400M`, the g220b model boots fine in QEMU.
> > 3. On the real system, it still fails to boot with `vmalloc=3D400M` due
> > to the below error:
> >   [    0.970091] spi-nor spi0.0: unrecognized JEDEC id bytes: ff ff ff =
ff ff ff
> >   [    0.977902] spi-nor: probe of spi0.0 failed with error -2
>
>
> I could not make Quad work reliably on HW. This is the next step after th=
e
> new driver is merged.

Got it.

>
> Thanks for tests !
>
> C.
>
