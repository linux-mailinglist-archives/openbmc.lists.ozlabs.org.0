Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CE33820B
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:08:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR414Lpbz3dHJ
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:08:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FBxHuxw1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FBxHuxw1; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR3Y68lhz3cZg
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:08:09 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id t4so22698461qkp.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u7KFrj9Vg8dlzs8dbcg98gMt6rkSAHIv1KogSkD5xM8=;
 b=FBxHuxw18EX5zerz9GcwuUqwdrnlrzaz5n4QR4wQcQCOJdakJJo6kWsaBcmokk1j3x
 GCJjDMV7mbwI+JPxYOou2mxyXTKZhAYmVm5Bz9QkxlcrRaFvRVYR0MJmT4ZNMUqMUmOc
 X3gHa3fd5Mr/tufrKwSy/oUBAV9JKAbVZRNSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7KFrj9Vg8dlzs8dbcg98gMt6rkSAHIv1KogSkD5xM8=;
 b=XDe9zezvKxY8mb/ebpH+CW9+TY9Dv6e1FElJTYY+3HLTbVt0u4AryVa2G5/7aXnXkX
 Y3xAYJt3UJY62XD9sXgP8MnBoaEY7TmNzWXL5zesTBT5tUdkxEQGwfVbfHzSW2fXU7WU
 /9QFv6OKekAaDpvC4Ch0MU7MPUFAlmbadopyQvlCqlTCaKjJVlK+UoT9XjsMpyqGUge+
 EQegvGVi2QSoEsgwvgUq5U4pDZfqihS5+muaJqwl0wQZBdiXaIEn/ZTmN9E/aM6uKv90
 V73pcVAsB7Ni//c/qMX35yONFDIXsQVZf42fT2emmM7s7hecwuAkCoD5izuaHsmXaEtw
 O2FA==
X-Gm-Message-State: AOAM532S9V0guOPGAhXXYBIHyNV9/91ci8faDcc/VhbOAEqMJsMeAh9w
 sDku/tJWQCH3SH1lh5pgniv/751eLz5j9fRmAGBMZnJx2OU=
X-Google-Smtp-Source: ABdhPJyuyAHvmkI0cLGFp93nlL87HDz89AShYYq9kmpfKlaqUnF2Cfal+COlFjcGkxySgyy5AfyTi+CeirTs1z4rcjc=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr10428016qkn.273.1615507687202; 
 Thu, 11 Mar 2021 16:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-6-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-6-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:07:54 +0000
Message-ID: <CACPK8Xc-Vg=CL5W+RrUTfz76g5nJ6AuSKfSqGLoiEXbpnLHPXQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 05/35] ARM: dts: aspeed: rainier: Add
 additional processor CFAMs
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> Rainier has two dual-chip modules and therefore four CFAMs with their
> associated engines. Add these to the devicetree with the i2c busses
> that have devices on them.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 281 ++++++++++++++++++-
>  1 file changed, 279 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index e147ff549517..6684485a2db0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -12,6 +12,39 @@ / {
>         compatible = "ibm,rainier-bmc", "aspeed,ast2600";
>
>         aliases {
> +               i2c100 = &cfam0_i2c0;
> +               i2c101 = &cfam0_i2c1;
> +               i2c110 = &cfam0_i2c10;
> +               i2c111 = &cfam0_i2c11;
> +               i2c112 = &cfam0_i2c12;
> +               i2c113 = &cfam0_i2c13;
> +               i2c114 = &cfam0_i2c14;
> +               i2c115 = &cfam0_i2c15;
> +               i2c202 = &cfam1_i2c2;
> +               i2c203 = &cfam1_i2c3;
> +               i2c210 = &cfam1_i2c10;
> +               i2c211 = &cfam1_i2c11;
> +               i2c214 = &cfam1_i2c14;
> +               i2c215 = &cfam1_i2c15;
> +               i2c216 = &cfam1_i2c16;
> +               i2c217 = &cfam1_i2c17;
> +               i2c300 = &cfam2_i2c0;
> +               i2c301 = &cfam2_i2c1;
> +               i2c310 = &cfam2_i2c10;
> +               i2c311 = &cfam2_i2c11;
> +               i2c312 = &cfam2_i2c12;
> +               i2c313 = &cfam2_i2c13;
> +               i2c314 = &cfam2_i2c14;
> +               i2c315 = &cfam2_i2c15;
> +               i2c402 = &cfam3_i2c2;
> +               i2c403 = &cfam3_i2c3;
> +               i2c410 = &cfam3_i2c10;
> +               i2c411 = &cfam3_i2c11;
> +               i2c414 = &cfam3_i2c14;
> +               i2c415 = &cfam3_i2c15;
> +               i2c416 = &cfam3_i2c16;
> +               i2c417 = &cfam3_i2c17;
> +
>                 serial4 = &uart5;
>                 i2c16 = &i2c2mux0;
>                 i2c17 = &i2c2mux1;
> @@ -30,6 +63,10 @@ aliases {
>                 spi31 = &cfam2_spi1;
>                 spi32 = &cfam2_spi2;
>                 spi33 = &cfam2_spi3;
> +               spi40 = &cfam3_spi0;
> +               spi41 = &cfam3_spi1;
> +               spi42 = &cfam3_spi2;
> +               spi43 = &cfam3_spi3;
>         };
>
>         chosen {
> @@ -320,6 +357,38 @@ i2c@1800 {
>                         reg = <0x1800 0x400>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +
> +                       cfam0_i2c0: i2c-bus@0 {
> +                               reg = <0>;      /* OMI01 */
> +                       };
> +
> +                       cfam0_i2c1: i2c-bus@1 {
> +                               reg = <1>;      /* OMI23 */
> +                       };
> +
> +                       cfam0_i2c10: i2c-bus@a {
> +                               reg = <10>;     /* OP3A */
> +                       };
> +
> +                       cfam0_i2c11: i2c-bus@b {
> +                               reg = <11>;     /* OP3B */
> +                       };
> +
> +                       cfam0_i2c12: i2c-bus@c {
> +                               reg = <12>;     /* OP4A */
> +                       };
> +
> +                       cfam0_i2c13: i2c-bus@d {
> +                               reg = <13>;     /* OP4B */
> +                       };
> +
> +                       cfam0_i2c14: i2c-bus@e {
> +                               reg = <14>;     /* OP5A */
> +                       };
> +
> +                       cfam0_i2c15: i2c-bus@f {
> +                               reg = <15>;     /* OP5B */
> +                       };
>                 };
>
>                 fsi2spi@1c00 {
> @@ -411,8 +480,6 @@ fsi_hub0: hub@3400 {
>                         reg = <0x3400 0x400>;
>                         #address-cells = <2>;
>                         #size-cells = <0>;
> -
> -                       no-scan-on-init;
>                 };
>         };
>  };
> @@ -434,6 +501,38 @@ i2c@1800 {
>                         reg = <0x1800 0x400>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +
> +                       cfam1_i2c2: i2c-bus@2 {
> +                               reg = <2>;      /* OMI45 */
> +                       };
> +
> +                       cfam1_i2c3: i2c-bus@3 {
> +                               reg = <3>;      /* OMI67 */
> +                       };
> +
> +                       cfam1_i2c10: i2c-bus@a {
> +                               reg = <10>;     /* OP3A */
> +                       };
> +
> +                       cfam1_i2c11: i2c-bus@b {
> +                               reg = <11>;     /* OP3B */
> +                       };
> +
> +                       cfam1_i2c14: i2c-bus@e {
> +                               reg = <14>;     /* OP5A */
> +                       };
> +
> +                       cfam1_i2c15: i2c-bus@f {
> +                               reg = <15>;     /* OP5B */
> +                       };
> +
> +                       cfam1_i2c16: i2c-bus@10 {
> +                               reg = <16>;     /* OP6A */
> +                       };
> +
> +                       cfam1_i2c17: i2c-bus@11 {
> +                               reg = <17>;     /* OP6B */
> +                       };
>                 };
>
>                 fsi2spi@1c00 {
> @@ -546,6 +645,38 @@ i2c@1800 {
>                         reg = <0x1800 0x400>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +
> +                       cfam2_i2c0: i2c-bus@0 {
> +                               reg = <0>;      /* OM01 */
> +                       };
> +
> +                       cfam2_i2c1: i2c-bus@1 {
> +                               reg = <1>;      /* OM23 */
> +                       };
> +
> +                       cfam2_i2c10: i2c-bus@a {
> +                               reg = <10>;     /* OP3A */
> +                       };
> +
> +                       cfam2_i2c11: i2c-bus@b {
> +                               reg = <11>;     /* OP3B */
> +                       };
> +
> +                       cfam2_i2c12: i2c-bus@c {
> +                               reg = <12>;     /* OP4A */
> +                       };
> +
> +                       cfam2_i2c13: i2c-bus@d {
> +                               reg = <13>;     /* OP4B */
> +                       };
> +
> +                       cfam2_i2c14: i2c-bus@e {
> +                               reg = <14>;     /* OP5A */
> +                       };
> +
> +                       cfam2_i2c15: i2c-bus@f {
> +                               reg = <15>;     /* OP5B */
> +                       };
>                 };
>
>                 fsi2spi@1c00 {
> @@ -641,6 +772,148 @@ fsi_hub2: hub@3400 {
>                         no-scan-on-init;
>                 };
>         };
> +
> +       cfam@3,0 {
> +               reg = <3 0>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               chip-id = <3>;
> +
> +               scom@1000 {
> +                       compatible = "ibm,fsi2pib";
> +                       reg = <0x1000 0x400>;
> +               };
> +
> +               i2c@1800 {
> +                       compatible = "ibm,fsi-i2c-master";
> +                       reg = <0x1800 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       cfam3_i2c2: i2c-bus@2 {
> +                               reg = <2>;      /* OM45 */
> +                       };
> +
> +                       cfam3_i2c3: i2c-bus@3 {
> +                               reg = <3>;      /* OM67 */
> +                       };
> +
> +                       cfam3_i2c10: i2c-bus@a {
> +                               reg = <10>;     /* OP3A */
> +                       };
> +
> +                       cfam3_i2c11: i2c-bus@b {
> +                               reg = <11>;     /* OP3B */
> +                       };
> +
> +                       cfam3_i2c14: i2c-bus@e {
> +                               reg = <14>;     /* OP5A */
> +                       };
> +
> +                       cfam3_i2c15: i2c-bus@f {
> +                               reg = <15>;     /* OP5B */
> +                       };
> +
> +                       cfam3_i2c16: i2c-bus@10 {
> +                               reg = <16>;     /* OP6A */
> +                       };
> +
> +                       cfam3_i2c17: i2c-bus@11 {
> +                               reg = <17>;     /* OP6B */
> +                       };
> +               };
> +
> +               fsi2spi@1c00 {
> +                       compatible = "ibm,fsi2spi";
> +                       reg = <0x1c00 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       cfam3_spi0: spi@0 {
> +                               reg = <0x0>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               eeprom@0 {
> +                                       at25,byte-len = <0x80000>;
> +                                       at25,addr-mode = <4>;
> +                                       at25,page-size = <256>;
> +
> +                                       compatible = "atmel,at25";
> +                                       reg = <0>;
> +                                       spi-max-frequency = <1000000>;
> +                               };
> +                       };
> +
> +                       cfam3_spi1: spi@20 {
> +                               reg = <0x20>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               eeprom@0 {
> +                                       at25,byte-len = <0x80000>;
> +                                       at25,addr-mode = <4>;
> +                                       at25,page-size = <256>;
> +
> +                                       compatible = "atmel,at25";
> +                                       reg = <0>;
> +                                       spi-max-frequency = <1000000>;
> +                               };
> +                       };
> +
> +                       cfam3_spi2: spi@40 {
> +                               reg = <0x40>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               eeprom@0 {
> +                                       at25,byte-len = <0x80000>;
> +                                       at25,addr-mode = <4>;
> +                                       at25,page-size = <256>;
> +
> +                                       compatible = "atmel,at25";
> +                                       reg = <0>;
> +                                       spi-max-frequency = <1000000>;
> +                               };
> +                       };
> +
> +                       cfam3_spi3: spi@60 {
> +                               reg = <0x60>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               eeprom@0 {
> +                                       at25,byte-len = <0x80000>;
> +                                       at25,addr-mode = <4>;
> +                                       at25,page-size = <256>;
> +
> +                                       compatible = "atmel,at25";
> +                                       reg = <0>;
> +                                       spi-max-frequency = <1000000>;
> +                               };
> +                       };
> +               };
> +
> +               sbefifo@2400 {
> +                       compatible = "ibm,p9-sbefifo";
> +                       reg = <0x2400 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       fsi_occ3: occ {
> +                               compatible = "ibm,p10-occ";
> +                       };
> +               };
> +
> +               fsi_hub3: hub@3400 {
> +                       compatible = "fsi-master-hub";
> +                       reg = <0x3400 0x400>;
> +                       #address-cells = <2>;
> +                       #size-cells = <0>;
> +
> +                       no-scan-on-init;
> +               };
> +       };
>  };
>
>  /* Legacy OCC numbering (to get rid of when userspace is fixed) */
> @@ -656,6 +929,10 @@ &fsi_occ2 {
>         reg = <3>;
>  };
>
> +&fsi_occ3 {
> +       reg = <4>;
> +};
> +
>  &ibt {
>         status = "okay";
>  };
> --
> 2.27.0
>
