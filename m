Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B3432A6B
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYD9m16TFz2yx9
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:49:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JAt+0EVa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JAt+0EVa; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYD9M11W9z2yS3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:48:52 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id o12so16782950qtq.7
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 16:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YvomduGCx61BUqvzrftY6/6wiJ0xGP5RfSU5MLpHJD0=;
 b=JAt+0EVaX2GzUQKx9YPdgk/ghQ6F1bksrmd9/huCLYKWIM3FZVT0PBKDb2QazAbv2y
 BJ6syWxXJMb2TTGLIduMZfK8pseWBoY1OVuC6lESpAZ2AFFA/iL2168IaCK1yo2EHV8l
 iyradyW0OybZOo/YOWDoQn0X892eJdqyqSSRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YvomduGCx61BUqvzrftY6/6wiJ0xGP5RfSU5MLpHJD0=;
 b=61HoMfGLTEi4/d7uZwj2TevfE9fmmo8xr7diYXL7J+VGBC3ZU4YS4xrSbufylngHBD
 wutrTAD7DL+cun3bemJzFevV/uswAG8kUfcaCe3sFa3pku7UI1giRib14yJxJi91afhZ
 eDH97X010uF+cE366ciVP2kmoFXmxi7TUroD3XyrlvZG5t2hMZ0I4KF8i+v8u64o2UGY
 p5lI/lmM1D48qj56h+CGlPNHNX6eDTv4msvKthzq9U3KFfv97YyfqukQMvWUoX+bVr08
 b74ss3bQ2inilyvLHE7tPBjvwfjsy2Pv1zD+ceuzqLYKccUlAOt8uQvOt4Oe2EErn278
 slFA==
X-Gm-Message-State: AOAM531ZNnWLcbmaDIbkZ6v4W0d4C2sP1ath7YRH0NTBHL4H2suM6Ry7
 ZlevEpgNSffUR0Z0LeUFSewtsmNkOT8ejVUcfT4TC8Wm4UA=
X-Google-Smtp-Source: ABdhPJx3s4do5N9OItGt4yMIlU/DH7GeWGirqIyLuKAkL30BNoh5wBMcqad8Nd4frhQr2JxJ9E5n7P8vKw89QBJx8Jk=
X-Received: by 2002:ac8:1107:: with SMTP id c7mr32511730qtj.392.1634600930431; 
 Mon, 18 Oct 2021 16:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <3a7fed78df06416da20ec72f14111c97@inventec.com>
 <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
 <CACPK8XeZ9esWimkv+RbeP3xyohzcPiUkXFhDWqB6ANjJ0aBvHw@mail.gmail.com>
In-Reply-To: <CACPK8XeZ9esWimkv+RbeP3xyohzcPiUkXFhDWqB6ANjJ0aBvHw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Oct 2021 23:48:38 +0000
Message-ID: <CACPK8XdzUf9nK_PNQcEJCs+9fMv-J=ZP4hetQ2ofbB=5GGALXw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 18 Oct 2021 at 23:43, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 18 Oct 2021 at 22:51, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
> <Lin.TommySC@inventec.com> wrote:
> >
> > Initial introduction of Inventec Transformers x86 family equipped with =
AST2600 BMC SoC.
> >
> > Signed-off-by: Tommy Lin <Lin.TommySC@inventec.com>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Thanks! I've applied this to the aspeed tree (but I've already sent my
> pull request for v5.16) and to the openbmc tree.

I spoke too soon! The patch introduces a lot of warnings that I will
get you to fix before I apply. Please apply your patch to v5.15-rc1
and build it to ensure you have seen all of the warnings.

> > +       pwm_tacho {
> > +                       status =3D "okay";
> > +                       pinctrl-names =3D "default";

> > +               fan@0 {
> > +                       reg =3D <0x00>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x00>;
> > +                       aspeed,min_rpm =3D <750000>;

  DTC     arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:70.24-37:
Warning (reg_format): /pwm_tacho/fan@0:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:78.24-37:
Warning (reg_format): /pwm_tacho/fan@1:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:86.24-37:
Warning (reg_format): /pwm_tacho/fan@2:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:94.24-37:
Warning (reg_format): /pwm_tacho/fan@3:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:102.24-37:
Warning (reg_format): /pwm_tacho/fan@4:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:110.24-37:
Warning (reg_format): /pwm_tacho/fan@5:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:118.24-37:
Warning (reg_format): /pwm_tacho/fan@6:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:126.24-37:
Warning (reg_format): /pwm_tacho/fan@7:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:134.24-37:
Warning (reg_format): /pwm_tacho/fan@8:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:139.24-37:
Warning (reg_format): /pwm_tacho/fan@9:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:144.24-37:
Warning (reg_format): /pwm_tacho/fan@10:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:149.24-37:
Warning (reg_format): /pwm_tacho/fan@11:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:154.24-37:
Warning (reg_format): /pwm_tacho/fan@12:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:159.24-37:
Warning (reg_format): /pwm_tacho/fan@13:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:164.24-37:
Warning (reg_format): /pwm_tacho/fan@14:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:169.24-37:
Warning (reg_format): /pwm_tacho/fan@15:reg: property has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb: Warning
(pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb: Warning
(i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb: Warning
(spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:69.22-75.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@0: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:69.22-75.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@0: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:77.22-83.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@1: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:77.22-83.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@1: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:85.22-91.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@2: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:85.22-91.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@2: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:93.22-99.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@3: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:93.22-99.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@3: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:101.22-107.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@4: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:101.22-107.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@4: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:109.22-115.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@5: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:109.22-115.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@5: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:117.22-123.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@6: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:117.22-123.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@6: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:125.22-131.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@7: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:125.22-131.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@7: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:133.22-136.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@8: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:133.22-136.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@8: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:138.22-141.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@9: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:138.22-141.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@9: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:143.23-146.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@10: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:143.23-146.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@10: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:148.23-151.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@11: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:148.23-151.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@11: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:153.23-156.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@12: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:153.23-156.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@12: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:158.23-161.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@13: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:158.23-161.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@13: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:163.23-166.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@14: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:163.23-166.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@14: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:168.23-171.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@15: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts:168.23-171.18:
Warning (avoid_default_addr_size): /pwm_tacho/fan@15: Relying on
default #size-cells value



> > +               };
> > +
> > +               fan@1 {
> > +                       reg =3D <0x01>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x01>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@2 {
> > +                       reg =3D <0x02>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x02>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@3 {
> > +                       reg =3D <0x03>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x03>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@4 {
> > +                       reg =3D <0x04>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x04>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@5 {
> > +                       reg =3D <0x05>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x05>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@6 {
> > +                       reg =3D <0x06>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x06>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@7 {
> > +                       reg =3D <0x07>;
> > +                       aspeed,target_pwm =3D <25000>;
> > +                       cooling-levels =3D <125 151 177 203 229 255>;
> > +                       aspeed,fan-tach-ch =3D <0x07>;
> > +                       aspeed,min_rpm =3D <750000>;
> > +               };
> > +
> > +               fan@8 {
> > +                       reg =3D <0x08>;
> > +                       aspeed,fan-tach-ch =3D <0x08>;
> > +               };
> > +
> > +               fan@9 {
> > +                       reg =3D <0x09>;
> > +                       aspeed,fan-tach-ch =3D <0x09>;
> > +               };
> > +
> > +               fan@10 {
> > +                       reg =3D <0x0a>;
> > +                       aspeed,fan-tach-ch =3D <0x0a>;
> > +               };
> > +
> > +               fan@11 {
> > +                       reg =3D <0x0b>;
> > +                       aspeed,fan-tach-ch =3D <0x0b>;
> > +               };
> > +
> > +               fan@12 {
> > +                       reg =3D <0x0c>;
> > +                       aspeed,fan-tach-ch =3D <0x0c>;
> > +               };
> > +
> > +               fan@13 {
> > +                       reg =3D <0x0d>;
> > +                       aspeed,fan-tach-ch =3D <0x0d>;
> > +               };
> > +
> > +               fan@14 {
> > +                       reg =3D <0x0e>;
> > +                       aspeed,fan-tach-ch =3D <0x0e>;
> > +               };
> > +
> > +               fan@15 {
> > +                       reg =3D <0x0f>;
> > +                       aspeed,fan-tach-ch =3D <0x0f>;
> > +               };
> > +       };
> > +};
> > +
> > +&mdio0 {
> > +       status =3D "okay";
> > +
> > +       ethphy0: ethernet-phy@0 {
> > +               compatible =3D "ethernet-phy-ieee802.3-c22";
> > +               reg =3D <1>;
> > +       };
> > +};
> > +
> > +&mac3 {
> > +       status =3D "okay";
> > +       phy-mode =3D "rgmii";
> > +       phy-handle =3D <&ethphy0>;
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_rgmii4_default>;
> > +};
> > +
> > +&fmc {
> > +       status =3D "okay";
> > +
> > +       flash@0 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bmc";
> > +               spi-max-frequency =3D <33000000>;
> > +               spi-tx-bus-width =3D <2>;
> > +               spi-rx-bus-width =3D <2>;
> > +#include "openbmc-flash-layout.dtsi"
> > +       };
> > +
> > +       flash@1 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bmc2";
> > +               spi-max-frequency =3D <33000000>;
> > +               spi-tx-bus-width =3D <2>;
> > +               spi-rx-bus-width =3D <2>;
> > +       };
> > +};
> > +
> > +&spi1 {
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_spi1_default>;
> > +
> > +       flash@0 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bios";
> > +               spi-max-frequency =3D <33000000>;
> > +               spi-tx-bus-width =3D <1>;
> > +               spi-rx-bus-width =3D <1>;
> > +       };
> > +};
> > +
> > +&wdt1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart5 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +       status =3D "okay";
> > +
> > +       //Set bmc' slave address;
> > +       bmc_slave@10 {
> > +               compatible =3D "ipmb-dev";
> > +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +               i2c-protocol;
> > +       };
> > +};
> > +
> > +&i2c2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +       // FRU AT24C512C-SSHM-T
> > +       status =3D "okay";
> > +       eeprom@50 {
> > +               compatible =3D "atmel,24c512";
> > +               reg =3D <0x50>;
> > +               pagesize =3D <128>;
> > +       };
> > +};
> > +
> > +&i2c5 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c6 {
> > +       status =3D "okay";
> > +
> > +       tmp75@49 {
> > +               compatible =3D "ti,tmp75";
> > +               reg =3D <0x49>;
> > +       };
> > +
> > +       tmp75@4f {
> > +               compatible =3D "ti,tmp75";
> > +               reg =3D <0x4f>;
> > +       };
> > +
> > +       tmp468@48 {
> > +               compatible =3D "ti,tmp468";
> > +               reg =3D <0x48>;
> > +       };
> > +};
> > +
> > +&i2c7 {
> > +       status =3D "okay";
> > +       adm1278@40 {
> > +               compatible =3D "adi,adm1278";
> > +               reg =3D <0x40>;
> > +       };
> > +};
> > +
> > +
> > +&i2c8 {
> > +       // FRU AT24C512C-SSHM-T
> > +       status =3D "okay";
> > +
> > +       eeprom@51 {
> > +               compatible =3D "atmel,24c512";
> > +               reg =3D <0x51>;
> > +               pagesize =3D <128>;
> > +       };
> > +
> > +       eeprom@53 {
> > +               compatible =3D "atmel,24c512";
> > +               reg =3D <0x53>;
> > +               pagesize =3D <128>;
> > +       };
> > +};
> > +
> > +&i2c9 {
> > +       // M.2
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c10 {
> > +       // I2C EXPANDER
> > +       status =3D "okay";
> > +
> > +       i2c-switch@71 {
> > +               compatible =3D "nxp,pca9544";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               reg =3D <0x71>;
> > +       };
> > +
> > +       i2c-switch@73 {
> > +               compatible =3D "nxp,pca9544";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               reg =3D <0x73>;
> > +       };
> > +};
> > +
> > +&i2c11 {
> > +       // I2C EXPANDER
> > +       status =3D "okay";
> > +
> > +       i2c-switch@70 {
> > +               compatible =3D "nxp,pca9544";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               reg =3D <0x70>;
> > +
> > +               pcie_eeprom_riser1: i2c@0 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <0>;
> > +
> > +                       eeprom@55 {
> > +                               compatible =3D "atmel,24c512";
> > +                               reg =3D <0x55>;
> > +                               pagesize =3D <128>;
> > +                       };
> > +               };
> > +
> > +               pcie_eeprom_riser2: i2c@1 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <1>;
> > +
> > +                       eeprom@55 {
> > +                               compatible =3D "atmel,24c512";
> > +                               reg =3D <0x55>;
> > +                               pagesize =3D <128>;
> > +                       };
> > +               };
> > +
> > +               pcie_eeprom_riser3: i2c@2 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <2>;
> > +
> > +                       eeprom@55 {
> > +                               compatible =3D "atmel,24c512";
> > +                               reg =3D <0x55>;
> > +                               pagesize =3D <128>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&i2c12 {
> > +       status =3D "okay";
> > +
> > +       psu0:psu0@58 {
> > +               compatible =3D "pmbus";
> > +               reg =3D <0x58>;
> > +       };
> > +};
> > +
> > +&gpio0 {
> > +       status =3D "okay";
> > +       gpio-line-names =3D
> > +       /*A0-A7*/   "","","","","","","","",
> > +       /*B0-B7*/   "presence-ps0","power-chassis-good","","","","","pr=
esence-ps1","",
> > +       /*C0-C7*/   "","","","","","","","",
> > +       /*D0-D7*/   "","","","","","","","",
> > +       /*E0-E7*/   "","","","","","","","",
> > +       /*F0-F7*/   "","","","","power-chassis-control","","","",
> > +       /*G0-G7*/   "","","jtag-mux","","","","","",
> > +       /*H0-H7*/   "","","","","reset-button","power-button","","",
> > +       /*I0-I7*/   "","","","","","","","",
> > +       /*J0-J7*/   "","","","","","","","",
> > +       /*K0-K7*/   "","","","","","","","",
> > +       /*L0-L7*/   "","","","","","","","",
> > +       /*M0-M7*/   "","","","","","","","",
> > +       /*N0-N7*/   "","","","","","","","",
> > +       /*O0-O7*/   "","","","","","","","",
> > +       /*P0-P7*/   "","","","tck-mux","","","","",
> > +       /*Q0-Q7*/   "","","","","","","","",
> > +       /*R0-R7*/   "","","","","","","","",
> > +       /*S0-S7*/   "","","","","","","","",
> > +       /*T0-T7*/   "","","","","","","","",
> > +       /*U0-U7*/   "","nmi-button","","","","","","",
> > +       /*V0-V7*/   "","","","","power-config-full-load","","","",
> > +       /*W0-W7*/   "","","","","","","","",
> > +       /*X0-X7*/   "","","","","","","","",
> > +       /*Y0-Y7*/   "","","","","","","","",
> > +       /*Z0-Z7*/   "","","","","","","","",
> > +       /*AA0-AA7*/ "","","","","","","","",
> > +       /*AB0-AB7*/ "","","","","","","","",
> > +       /*AC0-AC7*/ "","","","","","","","";
> > +};
> > +
> > +&lpc_snoop {
> > +       status =3D "okay";
> > +       snoop-ports =3D <0x80>;
> > +};
> > +
> > +&emmc_controller {
> > +       status =3D "okay";
> > +};
> > +
> > +&emmc {
> > +       status =3D "okay";
> > +       non-removable;
> > +       max-frequency =3D <52000000>;
> > +       bus-width =3D <8>;
> > +};
> > +
> > +&vhub {
> > +       status =3D "okay";
> > +       aspeed,vhub-downstream-ports =3D <7>;
> > +       aspeed,vhub-generic-endpoints =3D <21>;
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_usb2ad_default>;
> > +};
> > +
> > +&rtc {
> > +       status =3D "okay";
> > +};
> > --
> > 2.33.0
> >
