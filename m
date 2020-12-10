Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B30652D5421
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 07:50:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs4Kh6NY8zDqpv
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 17:50:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=alpu8007@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o71DZDHP; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs4Jx2gg2zDqgV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 17:49:16 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id p5so4118074iln.8
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 22:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OdCjumfptze5VIARG/OVO9XH7DZ9a8oeS8rGtPVCKh0=;
 b=o71DZDHPRPU5+PXFYuBMUAPNR66BbXsgjN3UKTDxeWPVY81obcUh7js7XKtlufoXJ2
 29RFOoUJpcQRDS4pdCaFYczhOcHwpkwSPn7Ruui3Nrz6tFWvpfoDO+WplU9Tv+TA3Pom
 3FUs2dahosED0h72k7dfjieOG7lKbSQ4fwLMOU47aZv3bQpXepEb41JH9RHQqX+XqNBS
 ZlhN+flxs0GmWRfUWGNlFsFvuXFPkEU2p8lC3GmeEpQoBbf6pOFcuMSkJDmtCzpqc6M0
 LDlcEMcQ14mgA3PmN2yMl9QUA14HHFqas7BcGLwDqbWFuL3B4pTGXuDW1J1LMN6UScPM
 07YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OdCjumfptze5VIARG/OVO9XH7DZ9a8oeS8rGtPVCKh0=;
 b=rIJGLjY4SX78oOM/Hv3ewMMxEmxLxPrwws7Dgo+kYtUcyMdoSJVhuVgA2o0OL4crnd
 FJAnkf2m98053U/KZXJj4+llScZRP9J0YuDmJT0ouDAoi8bC0l5v8h+jLFk4POX8YoYg
 E2O5jC19PJ9DNKuNby6R+hswUaAk/5tsOk1WT+XKFHJB2mllXjqfyIEyyXbueNhmOUjb
 H0Mx/tOd2TXE+krQmwENsvkEt9zar/BaGKXvevr/Wq+1XgcV3Dd4xJbW667SDdGGskPs
 I2pr38bfZstn9rYXpAhN12cB79L5aMbKS+wNstYM8GBKEzXjjJciZudZaDvQEGeEP4TB
 NyuQ==
X-Gm-Message-State: AOAM530I4PyZQmZKxG754ShYDfpzh4fX88rBYJbfDFlw6TDpoiO6UDsr
 USgvgNzbzA+RXBsQx7wgkAI4i7AZssuDinGDM5c5JZxDlaM=
X-Google-Smtp-Source: ABdhPJxOJIkI/SaXeLVOYiphBSJ2biUlZNUY75Na8B5FfM9+ScmKrcdjgvQ1KQb0FAWgkkzmX/nGxrXX7ziBPJa5SN4=
X-Received: by 2002:a92:c6d1:: with SMTP id v17mr8029429ilm.156.1607582951780; 
 Wed, 09 Dec 2020 22:49:11 -0800 (PST)
MIME-Version: 1.0
From: Alpana Kumari <alpu8007@gmail.com>
Date: Thu, 10 Dec 2020 12:19:00 +0530
Message-ID: <CANkkLs54p6eyhaniCfD1K=+BHds1FGP6f2q-u47wzP+sEiXUQA@mail.gmail.com>
Subject: [PATCH] Adding chips TCA9554 and PCA9552, to expose the presence
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c9b4f405b6169297"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c9b4f405b6169297
Content-Type: text/plain; charset="UTF-8"

Hi,
I have added chips TCA9554 and PCA9552  which will be used for presence
detect of FRUs, and line-names for miscellaneous GPIOs  .

From 38a17b3376c601a3796c1147b374d6aabfc8c12d Mon Sep 17 00:00:00 2001
From: Alpana Kumari <alpankum@in.ibm.com>
Date: Thu, 10 Dec 2020 00:04:55 -0600
Subject: [PATCH] Adding chips TCA9554 and PCA9552, to expose the presence
 detect lines for the op-panel, TPM, DASD planers, cable-cards, DCMs, VRMs.
 And line-names for miscellaneous GPIOs.

Change-Id: If4d7df8db5f30fb4c1155d39c50c560251fc9660
Signed-off-by: Alpana Kumari <alpankum@in.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 176
++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index bcc4568..8f9f4cd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -196,11 +196,11 @@
 &gpio0 {
    gpio-line-names =
    /*A0-A7*/   "","","","","","","","",
-   /*B0-B7*/   "","","","","","","checkstop","",
+   /*B0-B7*/   "USERSPACE_RSTIND_BUFF","","","","","","checkstop","",
    /*C0-C7*/   "","","","","","","","",
    /*D0-D7*/   "","","","","","","","",
    /*E0-E7*/   "","","","","","","","",
-   /*F0-F7*/   "","","","","","","","",
+   /*F0-F7*/
"PIN_HOLE_RESET_IN_N","","","PIN_HOLE_RESET_OUT_N","","","","",
    /*G0-G7*/   "","","","","","","","",
    /*H0-H7*/
"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
    /*I0-I7*/   "","","","","","","","",
@@ -212,12 +212,12 @@
    /*O0-O7*/   "","","","usb-power","","","","",
    /*P0-P7*/   "","","","","pcieslot-power","","","",
    /*Q0-Q7*/   "cfam-reset","","","","","","","",
-   /*R0-R7*/   "","","","","","","","",
+   /*R0-R7*/   "","","","","","I2C_FLASH_MICRO_N","","",
    /*S0-S7*/   "presence-ps0","presence-ps1","presence-ps2","presence-ps3",
                "","","","",
    /*T0-T7*/   "","","","","","","","",
    /*U0-U7*/   "","","","","","","","",
-   /*V0-V7*/   "","","","","","","","",
+   /*V0-V7*/   "","BMC_3RESTART_ATTEMPT_P","","","","","","",
    /*W0-W7*/   "","","","","","","","",
    /*X0-X7*/   "","","","","","","","",
    /*Y0-Y7*/   "","","","","","","","",
@@ -629,6 +629,65 @@
        reg = <0x51>;
    };

+   tca_pres1: tca9554@20{
+       compatible = "ti,tca9554";
+       reg = <0x20>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       gpio-controller;
+       #gpio-cells = <2>;
+
+       gpio-line-names = "",
+           "RUSSEL_FW_I2C_ENABLE_N",
+           "RUSSEL_OPPANEL_PRESENCE_N",
+           "BLYTH_OPPANEL_PRESENCE_N",
+           "CPU_TPM_CARD_PRESENT_N",
+           "DASD_BP2_PRESENT_N",
+           "DASD_BP1_PRESENT_N",
+           "DASD_BP0_PRESENT_N";
+
+       gpio@0 {
+           reg = <0>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@1 {
+           reg = <1>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@2 {
+           reg = <2>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@3 {
+           reg = <3>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@4 {
+           reg = <4>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@5 {
+           reg = <5>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@6 {
+           reg = <6>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@7 {
+           reg = <7>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+   };
+

@@ -665,6 +724,104 @@
        compatible = "ibm,cffps";
        reg = <0x69>;
    };
+
+   pca_pres1: pca9552@61 {
+       compatible = "nxp,pca9552";
+       reg = <0x61>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       gpio-controller;
+       #gpio-cells = <2>;
+
+       gpio-line-names =
+           "SLOT0_PRSNT_EN_RSVD", "SLOT1_PRSNT_EN_RSVD",
+           "SLOT2_PRSNT_EN_RSVD", "SLOT3_PRSNT_EN_RSVD",
+           "SLOT4_PRSNT_EN_RSVD", "SLOT0_EXPANDER_PRSNT_N",
+           "SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
+           "SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
+           "", "", "", "", "", "";
+
+       gpio@0 {
+           reg = <0>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@1 {
+           reg = <1>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@2 {
+           reg = <2>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@3 {
+           reg = <3>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@4 {
+           reg = <4>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@5 {
+           reg = <5>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@6 {
+           reg = <6>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@7 {
+           reg = <7>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@8 {
+           reg = <8>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@9 {
+           reg = <9>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@10 {
+           reg = <10>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@11 {
+           reg = <11>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@12 {
+           reg = <12>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@13 {
+           reg = <13>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@14 {
+           reg = <14>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+
+       gpio@15 {
+           reg = <15>;
+           type = <PCA955X_TYPE_GPIO>;
+       };
+   };
 };

 &i2c4 {
@@ -1004,7 +1161,7 @@
        reg = <0x51>;
    };

-   pca1: pca9552@61 {
+   pca_pres3: pca9552@61 {
        compatible = "nxp,pca9552";
        reg = <0x61>;
        #address-cells = <1>;
@@ -1012,6 +1169,15 @@
        gpio-controller;
        #gpio-cells = <2>;

+       gpio-line-names =
+           "SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
+           "SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
+           "SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
+           "SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
+           "SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
+           "SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
+           "", "", "", "";
+
        gpio@0 {
            reg = <0>;
            type = <PCA955X_TYPE_GPIO>;
--
1.8.3.1



Thanks,
Alpana

--000000000000c9b4f405b6169297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I have added chips TCA9554 and PCA9552=C2=A0 which =
will be used for presence detect of FRUs, and line-names for miscellaneous =
GPIOs=C2=A0 .<br><div><br></div><div>From 38a17b3376c601a3796c1147b374d6aab=
fc8c12d Mon Sep 17 00:00:00 2001<br>From: Alpana Kumari &lt;<a href=3D"mail=
to:alpankum@in.ibm.com">alpankum@in.ibm.com</a>&gt;<br>Date: Thu, 10 Dec 20=
20 00:04:55 -0600<br>Subject: [PATCH] Adding chips TCA9554 and PCA9552, to =
expose the presence<br>=C2=A0detect lines for the op-panel, TPM, DASD plane=
rs, cable-cards, DCMs, VRMs.<br>=C2=A0And line-names for miscellaneous GPIO=
s.<br><br>Change-Id: If4d7df8db5f30fb4c1155d39c50c560251fc9660<br>Signed-of=
f-by: Alpana Kumari &lt;<a href=3D"mailto:alpankum@in.ibm.com">alpankum@in.=
ibm.com</a>&gt;<br>---<br>=C2=A0arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt=
s | 176 ++++++++++++++++++++++++++-<br>=C2=A01 file changed, 171 insertions=
(+), 5 deletions(-)<br><br>diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-ra=
inier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>index bcc4568..=
8f9f4cd 100644<br>--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>+++=
 b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>@@ -196,11 +196,11 @@<br=
>=C2=A0&amp;gpio0 {<br>=C2=A0 =C2=A0 gpio-line-names =3D<br>=C2=A0 =C2=A0 /=
*A0-A7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>- =C2=A0 /*B0-B7*/ =C2=A0 =
&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quo=
t;,&quot;checkstop&quot;,&quot;&quot;,<br>+ =C2=A0 /*B0-B7*/ =C2=A0 &quot;U=
SERSPACE_RSTIND_BUFF&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;checkstop&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*C0-=
C7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*D0-D7*/ =C2=A0=
 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*E0-E7*/ =C2=A0 &quot;&quo=
t;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,<br>- =C2=A0 /*F0-F7*/ =C2=A0 &quot;&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quo=
t;,<br>+ =C2=A0 /*F0-F7*/ =C2=A0 &quot;PIN_HOLE_RESET_IN_N&quot;,&quot;&quo=
t;,&quot;&quot;,&quot;PIN_HOLE_RESET_OUT_N&quot;,&quot;&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*G0-G7*/ =C2=A0 &quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*H0-H7*/ =C2=A0 &quot;&quot;,&quot;bmc-in=
graham0&quot;,&quot;rear-enc-id0&quot;,&quot;rear-enc-fault0&quot;,&quot;&q=
uot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*I0-I7*/ =C2=
=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;=
&quot;,&quot;&quot;,&quot;&quot;,<br>@@ -212,12 +212,12 @@<br>=C2=A0 =C2=A0=
 /*O0-O7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;usb-power&qu=
ot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /=
*P0-P7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;p=
cieslot-power&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=
=A0 /*Q0-Q7*/ =C2=A0 &quot;cfam-reset&quot;,&quot;&quot;,&quot;&quot;,&quot=
;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>- =C2=A0 /*=
R0-R7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>+ =C2=A0 /*R0-R7*/ =C2=A0 &=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;I2C_F=
LASH_MICRO_N&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*S0-S7*/ =
=C2=A0 &quot;presence-ps0&quot;,&quot;presence-ps1&quot;,&quot;presence-ps2=
&quot;,&quot;presence-ps3&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=
=C2=A0 =C2=A0 /*T0-T7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot=
;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=
=A0 /*U0-U7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&q=
uot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br></div><div>- =C2=A0 /=
*V0-V7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>+ =C2=A0 /*V0-V7*/ =C2=A0 =
&quot;&quot;,&quot;BMC_3RESTART_ATTEMPT_P&quot;,&quot;&quot;,&quot;&quot;,&=
quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*W0-W=
7*/ =C2=A0 &quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;=
,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*X0-X7*/ =C2=A0 =
&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quo=
t;,&quot;&quot;,&quot;&quot;,<br>=C2=A0 =C2=A0 /*Y0-Y7*/ =C2=A0 &quot;&quot=
;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,<br>@@ -629,6 +629,65 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eg =3D &lt;0x51&gt;;<br>=C2=A0 =C2=A0 };<br><br>+ =C2=A0 tca_pres1: tca9554=
@20{<br>+ =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,tca9554&quot;;<br>+ =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 #addre=
ss-cells =3D &lt;1&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;=
;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio-controller;<br>+ =C2=A0 =C2=A0 =C2=A0=
 #gpio-cells =3D &lt;2&gt;;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio-line-names =
=3D &quot;&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;RUSSEL_FW_I=
2C_ENABLE_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;RUSSEL_OPP=
ANEL_PRESENCE_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;BLYTH_=
OPPANEL_PRESENCE_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CPU=
_TPM_CARD_PRESENT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;DA=
SD_BP2_PRESENT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;DASD_=
BP1_PRESENT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;DASD_BP0=
_PRESENT_N&quot;;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@0 {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };=
<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@1 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;1&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D =
&lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =
=C2=A0 =C2=A0 gpio@2 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;=
2&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GP=
IO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };=C2=A0 =C2=A0 =C2=A0=C2=A0<br></div><di=
v>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@3 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;3&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt=
;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=
=A0 =C2=A0 gpio@4 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;4&g=
t;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&=
gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@5 {<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;5&gt;;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =
=C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@6 {<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;6&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>=
+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@7 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;7&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt=
;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+ =C2=A0 };<br>+<br=
><br>@@ -665,6 +724,104 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &q=
uot;ibm,cffps&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x69&gt;;<b=
r>=C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 pca_pres1: pca9552@61 {<br>+ =C2=A0 =C2=
=A0 =C2=A0 compatible =3D &quot;nxp,pca9552&quot;;<br>+ =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;0x61&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;=
1&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>+<br></div><=
div>+ =C2=A0 =C2=A0 =C2=A0 gpio-controller;<br>+ =C2=A0 =C2=A0 =C2=A0 #gpio=
-cells =3D &lt;2&gt;;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio-line-names =3D<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT0_PRSNT_EN_RSVD&quot;, &quo=
t;SLOT1_PRSNT_EN_RSVD&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
SLOT2_PRSNT_EN_RSVD&quot;, &quot;SLOT3_PRSNT_EN_RSVD&quot;,<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT4_PRSNT_EN_RSVD&quot;, &quot;SLOT0_EXPAN=
DER_PRSNT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT1_EXPA=
NDER_PRSNT_N&quot;, &quot;SLOT2_EXPANDER_PRSNT_N&quot;,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;SLOT3_EXPANDER_PRSNT_N&quot;, &quot;SLOT4_EXPAND=
ER_PRSNT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;, &qu=
ot;&quot;, &quot;&quot;, &quot;&quot;, &quot;&quot;, &quot;&quot;;<br>+<br>=
+ =C2=A0 =C2=A0 =C2=A0 gpio@0 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg=
 =3D &lt;0&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955=
X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=
=A0 gpio@1 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br=
>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@2 {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;2&gt;;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =
=C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@3 {<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 reg =3D &lt;3&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
ype =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =
=C2=A0 =C2=A0 =C2=A0 gpio@4 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;4&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X=
_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0=
 gpio@5 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;5&gt;;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+=
 =C2=A0 =C2=A0 =C2=A0 };<br>+<br></div><div>+ =C2=A0 =C2=A0 =C2=A0 gpio@6 {=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;6&gt;;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =
=C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@7 {<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;7&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>=
+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@8 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;8&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt=
;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=
=A0 =C2=A0 gpio@9 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;9&g=
t;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&=
gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@10 {<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;10&gt;;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =
=C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@11 {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;11&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };=
<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@12 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;12&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D=
 &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =
=C2=A0 =C2=A0 gpio@13 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt=
;13&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_=
GPIO&gt;;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@=
14 {<br></div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;14&gt;;=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;=
;<br>+ =C2=A0 =C2=A0 =C2=A0 };<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 gpio@15 {<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;15&gt;;<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>+ =C2=A0 =C2=
=A0 =C2=A0 };<br>+ =C2=A0 };<br>=C2=A0};<br><br>=C2=A0&amp;i2c4 {<br>@@ -10=
04,7 +1161,7 @@<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x51&gt;;<br>=C2=
=A0 =C2=A0 };<br><br>- =C2=A0 pca1: pca9552@61 {<br>+ =C2=A0 pca_pres3: pca=
9552@61 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;nxp,pca9552&q=
uot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x61&gt;;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>@@ -1012,6 +1169,15 @@<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-controller;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 #gpio-cells =3D &lt;2&gt;;<br><br>+ =C2=A0 =C2=A0 =C2=A0 gpio-line-names =
=3D<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT6_PRSNT_EN_RSVD&quot;=
, &quot;SLOT7_PRSNT_EN_RSVD&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;SLOT8_PRSNT_EN_RSVD&quot;, &quot;SLOT9_PRSNT_EN_RSVD&quot;,<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT10_PRSNT_EN_RSVD&quot;, &quot;SLO=
T11_PRSNT_EN_RSVD&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT=
6_EXPANDER_PRSNT_N&quot;, &quot;SLOT7_EXPANDER_PRSNT_N&quot;,<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT8_EXPANDER_PRSNT_N&quot;, &quot;SLOT9=
_EXPANDER_PRSNT_N&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SLOT=
10_EXPANDER_PRSNT_N&quot;, &quot;SLOT11_EXPANDER_PRSNT_N&quot;,<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;, &quot;&quot;, &quot;&quot;, &quo=
t;&quot;;<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio@0 {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 type =3D &lt;PCA955X_TYPE_GPIO&gt;;<br>--<br>1.8.3.1<br><br><=
/div><div><br></div><div><br></div><div>Thanks,</div><div>Alpana</div></div=
>

--000000000000c9b4f405b6169297--
