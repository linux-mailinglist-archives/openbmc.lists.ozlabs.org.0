Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B5726BA
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:35:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjFM6pbFzDq5y
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:35:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="aKhVimXJ"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tYD42rB4zDqLl;
 Wed, 24 Jul 2019 08:33:40 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id m14so6669423qka.10;
 Tue, 23 Jul 2019 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JH500Za/hvby+Ab7pkG8hgVXYLz6CfPDe+IpQp/0ssY=;
 b=aKhVimXJJykXiImkectG2QqNVWODjxTl3lihKDeVAAnK0AAnBorzB25U/8olMnXWn3
 01KiV0tltUF3gviW56zkXtuxLIjYw7r+/Tug450jTT3Q3psJn4fNDYp13UueSPoXQpKc
 U/F2SBkX9gB2ucfTL2I/by3eLM/TaAIqDlgNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JH500Za/hvby+Ab7pkG8hgVXYLz6CfPDe+IpQp/0ssY=;
 b=PxTADpoeTeKDEJLKeiyxFFbuAY8ye/v6pmofDbAIPAfCxlmsSElge9XsouLLn4q6gP
 aJLLlGvKHCM1K5MZVpLHXK7rtBBZdreamG21OwRdG6l2CJCaauq66vVpktmd5LcaDlXp
 9s0Jf0usj4E0Kum4MjJ/ZvhZBOTGMDT7HeCbgmpbTdvQhV1GXGwi2Dvnnw5VFOAGA4CX
 xev1UcHGDZlqebyM5KNs0raRq3tgpn8GGC/pgFQT0PHAueL3iBZtilsTteArH6FjCGcD
 nJm7CmhaMDypN4Ed4xO/eIK2dTFCXTUcMztaLXDLUst5kLGbD83whnI3u4KLPvuq1jA2
 zTnA==
X-Gm-Message-State: APjAAAW2hB5NRXdL1L//FqjMR4o/8cf2KsFzCyTlq82Kgg6Up8mF2eP0
 IAwe1p8yWIxAyaxJ3ONbYGzSeU8+GDuYOtdeq+c=
X-Google-Smtp-Source: APXvYqx4liwJSfc37h1jJX9a+TAgM+kLnIK+BhE01JSK8gVK15XKOFf65LR9nkeJuce6Gf8EfT86S2RpINzFZwA4BKU=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr52208761qkn.414.1563921216425; 
 Tue, 23 Jul 2019 15:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-3-vijaykhemka@fb.com>
 <C9C6AC86-B353-4CDA-8B63-50587F48DF44@fb.com>
In-Reply-To: <C9C6AC86-B353-4CDA-8B63-50587F48DF44@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Jul 2019 22:33:24 +0000
Message-ID: <CACPK8Xc+1ZLoCQoERBjr7OQh3V0rV1g+mq+bPiJzCCzJix_13A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: tiogapass: Add Riser card
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jul 2019 at 17:22, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
> This patch also needs review. I separated first patch with v2 and that wa=
s acked. Please review this as well.

Do you have a coworker who has access to the schematics and can review
the device tree? They would make a great reviewer.

If no reviewer steps forward I will merge it next time I'm merging patches.

Cheers,

Joel

>
> Regards
> -Vijay
>
> =EF=BB=BFOn 7/22/19, 12:41 PM, "Vijay Khemka" <vijaykhemka@fb.com> wrote:
>
>     Added i2c mux for riser card and multiple ava card and its sensor
>     components for Facebook Tiogapass platform
>
>     Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>     ---
>      .../dts/aspeed-bmc-facebook-tiogapass.dts     | 230 ++++++++++++++++=
++
>      1 file changed, 230 insertions(+)
>
>     diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/ar=
ch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     index b7783833a58c..8d0bcb3cd419 100644
>     --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
>     @@ -12,6 +12,27 @@
>         aliases {
>                 serial0 =3D &uart1;
>                 serial4 =3D &uart5;
>     +
>     +           /*
>     +            * Hardcode the bus number of i2c switches' channels to
>     +            * avoid breaking the legacy applications.
>     +            */
>     +           i2c16 =3D &imux16;
>     +           i2c17 =3D &imux17;
>     +           i2c18 =3D &imux18;
>     +           i2c19 =3D &imux19;
>     +           i2c20 =3D &imux20;
>     +           i2c21 =3D &imux21;
>     +           i2c22 =3D &imux22;
>     +           i2c23 =3D &imux23;
>     +           i2c24 =3D &imux24;
>     +           i2c25 =3D &imux25;
>     +           i2c26 =3D &imux26;
>     +           i2c27 =3D &imux27;
>     +           i2c28 =3D &imux28;
>     +           i2c29 =3D &imux29;
>     +           i2c30 =3D &imux30;
>     +           i2c31 =3D &imux31;
>         };
>         chosen {
>                 stdout-path =3D &uart5;
>     @@ -124,6 +145,215 @@
>      &i2c1 {
>         status =3D "okay";
>         //X24 Riser
>     +   i2c-switch@71 {
>     +           compatible =3D "nxp,pca9544";
>     +           #address-cells =3D <1>;
>     +           #size-cells =3D <0>;
>     +           reg =3D <0x71>;
>     +
>     +           imux16: i2c@0 {
>     +                   #address-cells =3D <1>;
>     +                   #size-cells =3D <0>;
>     +                   reg =3D <0>;
>     +
>     +                   ina219@45 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x45>;
>     +                   };
>     +
>     +                   tmp75@48 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x48>;
>     +                   };
>     +
>     +                   tmp421@49 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x49>;
>     +                   };
>     +
>     +                   eeprom@50 {
>     +                           compatible =3D "atmel,24c64";
>     +                           reg =3D <0x50>;
>     +                           pagesize =3D <32>;
>     +                   };
>     +
>     +                   i2c-switch@73 {
>     +                           compatible =3D "nxp,pca9546";
>     +                           #address-cells =3D <1>;
>     +                           #size-cells =3D <0>;
>     +                           reg =3D <0x73>;
>     +
>     +                           imux20: i2c@0 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <0>;
>     +                           };
>     +
>     +                           imux21: i2c@1 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <1>;
>     +                           };
>     +
>     +                           imux22: i2c@2 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <2>;
>     +                           };
>     +
>     +                           imux23: i2c@3 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <3>;
>     +                           };
>     +
>     +                   };
>     +
>     +           };
>     +
>     +           imux17: i2c@1 {
>     +                   #address-cells =3D <1>;
>     +                   #size-cells =3D <0>;
>     +                   reg =3D <1>;
>     +
>     +                   ina219@45 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x45>;
>     +                   };
>     +
>     +                   tmp421@48 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x48>;
>     +                   };
>     +
>     +                   tmp421@49 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x49>;
>     +                   };
>     +
>     +                   eeprom@50 {
>     +                           compatible =3D "atmel,24c64";
>     +                           reg =3D <0x50>;
>     +                           pagesize =3D <32>;
>     +                   };
>     +
>     +                   i2c-switch@73 {
>     +                           compatible =3D "nxp,pca9546";
>     +                           #address-cells =3D <1>;
>     +                           #size-cells =3D <0>;
>     +                           reg =3D <0x73>;
>     +
>     +                           imux24: i2c@0 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <0>;
>     +                           };
>     +
>     +                           imux25: i2c@1 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <1>;
>     +                           };
>     +
>     +                           imux26: i2c@2 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <2>;
>     +                           };
>     +
>     +                           imux27: i2c@3 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <3>;
>     +                           };
>     +
>     +                   };
>     +
>     +           };
>     +
>     +           imux18: i2c@2 {
>     +                   #address-cells =3D <1>;
>     +                   #size-cells =3D <0>;
>     +                   reg =3D <2>;
>     +
>     +                   ina219@45 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x45>;
>     +                   };
>     +
>     +                   tmp421@48 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x48>;
>     +                   };
>     +
>     +                   tmp421@49 {
>     +                           compatible =3D "ti,tmp75";
>     +                           reg =3D <0x49>;
>     +                   };
>     +
>     +                   eeprom@50 {
>     +                           compatible =3D "atmel,24c64";
>     +                           reg =3D <0x50>;
>     +                           pagesize =3D <32>;
>     +                   };
>     +
>     +                   i2c-switch@73 {
>     +                           compatible =3D "nxp,pca9546";
>     +                           #address-cells =3D <1>;
>     +                           #size-cells =3D <0>;
>     +                           reg =3D <0x73>;
>     +
>     +                           imux28: i2c@0 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <0>;
>     +                           };
>     +
>     +                           imux29: i2c@1 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <1>;
>     +                           };
>     +
>     +                           imux30: i2c@2 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <2>;
>     +                           };
>     +
>     +                           imux31: i2c@3 {
>     +                                   #address-cells =3D <1>;
>     +                                   #size-cells =3D <0>;
>     +                                   reg =3D <3>;
>     +                           };
>     +
>     +                   };
>     +
>     +           };
>     +
>     +           imux19: i2c@3 {
>     +                   #address-cells =3D <1>;
>     +                   #size-cells =3D <0>;
>     +                   reg =3D <3>;
>     +
>     +                   i2c-switch@40 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x40>;
>     +                   };
>     +
>     +                   i2c-switch@41 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x41>;
>     +                   };
>     +
>     +                   i2c-switch@45 {
>     +                           compatible =3D "ti,ina219";
>     +                           reg =3D <0x45>;
>     +                   };
>     +
>     +           };
>     +
>     +   };
>      };
>
>      &i2c2 {
>     --
>     2.17.1
>
>
>
