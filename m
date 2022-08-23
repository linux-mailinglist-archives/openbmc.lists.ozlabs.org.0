Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E707959F397
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 08:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCGKd423zz3bhK
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 16:24:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2zMr1Fh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2zMr1Fh;
	dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBcmC2G0lz2xrW;
	Tue, 23 Aug 2022 15:12:09 +1000 (AEST)
Received: by mail-vk1-xa2c.google.com with SMTP id w129so6609800vkg.10;
        Mon, 22 Aug 2022 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YdQGrWklXeVFiPKeSRXmiOvfeb1DgAPxXiyb46c4u8s=;
        b=I2zMr1FhhdmIxBlEAjJ4ekgFxXSdSA1iBngCg8mVx80HpomyAqpEzJbs1xt660rJc9
         X+qe/Wk+kWxzwChnvAYHc5f3JKXjso5cIYHopn2aUSE3AZmok1ACQ2VpKfABPmDYygtm
         wNmSNqAkFYDJRYpFK87FDFZPQhMj/Wy2TerRrEM2FBkymPWfYrsuNAqFKGDXS5ry7hq5
         QnwoBUa8NljlMRV6nS5exx78oYEJKCo60ND5lj1sNbqNraI2AzLB2prM7gHL/2ig16EN
         HbXdiG1bub1TGtJYQhYv+kONGTLc5w/ZeBjIpYt/QJrtDBUg+KjVFKJY2Eb7Wg2FrgFo
         fUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YdQGrWklXeVFiPKeSRXmiOvfeb1DgAPxXiyb46c4u8s=;
        b=dyxE7JUSQ4586vDIGmi/x6DjYzMX/fkMWZrGdIPIKuwe/wNfRuTvjNGcdayJn2c+Ys
         axGBThH0Zq8RPuUHeQATzZD12kjz+u2R4d4Ge9l9zrYs72uKDEzvtqfLVyS1d7dsubBY
         PSzrNnKzNzOQLWvbMJ1Z6JCcRoE3YJNd4xLrmyNd9rmriim7DAoDgW8VwjXTdcmlnAu7
         +wusTUf7GCOQA0aYV6KUXMmMhhT8n1N1WTbpsoQoxbeNakMC1mTmsWQpMJyL1r865PLp
         vFMu8JLKkOvmzpJJAVxAUex8n01ESHfv4RsBWxPaupIao3YMEUQdXrfZ2updgNhg8nNG
         PonQ==
X-Gm-Message-State: ACgBeo3vgrUwngHlRpzeg2yCLlylerX9GFf8drLB1kOPLliHNTUSCQoj
	dGVyyFdjf6AOwz0WllbKM9AKPkjTd4xz2VGT0SI=
X-Google-Smtp-Source: AA6agR6QHq3PkZHIOacwq4gw06AgTKbuQEctDnd1xbKmiTEczR0By1wozDzk3LalUpUxvHriK4FnIqLKPscU4b4EvBs=
X-Received: by 2002:ac5:cfe5:0:b0:38a:d2f5:55df with SMTP id
 m37-20020ac5cfe5000000b0038ad2f555dfmr5691669vkf.24.1661231523132; Mon, 22
 Aug 2022 22:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220822070204.GA6110@hcl-ThinkPad-T495> <CACPK8XfgYma8=qV0kKOKSSpXprC1sBZgKuaGsAhD1ifYG4KgTw@mail.gmail.com>
In-Reply-To: <CACPK8XfgYma8=qV0kKOKSSpXprC1sBZgKuaGsAhD1ifYG4KgTw@mail.gmail.com>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Tue, 23 Aug 2022 10:41:51 +0530
Message-ID: <CA+ezb7hkFc9DYUT8JbK7aEOb31NmXfhQzL=3xg6YtjKhr98Edg@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: Update for Facebook Yosemite V2 BMC
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000d3788105e6e19a3a"
X-Mailman-Approved-At: Wed, 24 Aug 2022 16:24:33 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d3788105e6e19a3a
Content-Type: text/plain; charset="UTF-8"

Noted.

On Tue, Aug 23, 2022 at 5:31 AM Joel Stanley <joel@jms.id.au> wrote:

> On Mon, 22 Aug 2022 at 07:02, Karthikeyan Pasupathi
> <pkarthikeyan1509@gmail.com> wrote:
> >
> > This patch includes the following updates for Yosemite V2
> > BMC.
> >
> > 1) Updated GPIO configuration for power control.
>
> Please take a look the openbmc naming conventions for the GPIOs. If
> you are not going to follow them, please explain why in your commit
> message.
>
>
> > 2) Added IPMB-13 channel for Debug Card communication.
> > 3) Removed EEPROM driver IPMB-12 channel and keeping it as
> >    "status ok".
>
> If you find yourself writing a commit log that contains 1), 2), 3)
> then there's a fair chance you could have sent three separate patches.
> Consider this for next time.
>
> >
> > Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> > ---
> >  .../dts/aspeed-bmc-facebook-yosemitev2.dts    | 49 +++++++++++++++++--
> >  1 file changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > index 8864e9c312a8..4d2ff7eb6740 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > @@ -119,6 +119,40 @@
> >                         &pinctrl_adc15_default>;
> >  };
> >
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/   "","","","","","","","",
> > +       /*B0-B7*/   "","","","","","","","",
> > +       /*C0-C7*/   "","","","","","","","",
> > +       /*D0-D7*/
>  "POWER_BUTTON","POWER_OUT1","","POWER_OUT2","","POWER_OUT3","","POWER_OUT4",
> > +       /*E0-E7*/
>  "DEBUG_UART_SEL0","DEBUG_UART_SEL1","DEBUG_UART_SEL2","DEBUG_UART_RX_SEL_N","","","","",
> > +       /*F0-F7*/   "","","","","","","","",
> > +       /*G0-G7*/
>  "LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2","LED_POST_CODE_3","","","","",
> > +       /*H0-H7*/   "","","","","","","","",
> > +       /*I0-I7*/
>  "SLOT1_POWER_OK","SLOT2_POWER_OK","SLOT3_POWER_OK","SLOT4_POWER_OK","","","","",
> > +       /*J0-J7*/   "","","","","","","","",
> > +       /*K0-K7*/   "","","","","","","","",
> > +       /*L0-L7*/   "","","","","","","","",
> > +       /*M0-M7*/   "","","","","","","","",
> > +       /*N0-N7*/
>  "","","I2C_SLOT1","I2C_SLOT2","I2C_SLOT3","I2C_SLOT4","","",
> > +       /*O0-O7*/
>  "","","","SELECTOR_BUTTON","SLOT1_POWER","SLOT2_POWER","SLOT3_POWER","SLOT4_POWER",
> > +       /*P0-P7*/
>  "","","","","LED_POST_CODE_4","LED_POST_CODE_5","LED_POST_CODE_6","LED_POST_CODE_7",
> > +       /*Q0-Q7*/   "","","","","","","","",
> > +       /*R0-R7*/   "","","","GPIO_DBG_CARD_PRSNT","","","","",
> > +       /*S0-S7*/
>  "RESET_OUT1","RESET_OUT2","RESET_OUT3","RESET_OUT4","","","","",
> > +       /*T0-T7*/   "","","","","","","","",
> > +       /*U0-U7*/   "","","","","","","","",
> > +       /*V0-V7*/   "","","","","","","","",
> > +       /*W0-W7*/   "","","","","","","","",
> > +       /*X0-X7*/   "","","","","","","","",
> > +       /*Y0-Y7*/   "","","","","","","","",
> > +       /*Z0-Z7*/
>  "POST_COMPLETE","POST_COMPLETE2","POST_COMPLETE3","POST_COMPLETE4","","","","",
> > +       /*AA0-AA7*/
> "","","","","HAND_SW1","HAND_SW2","HAND_SW3","HAND_SW4",
> > +       /*AB0-AB7*/ "RESET_BUTTON","","","","","","","",
> > +               /*AC0-AC7*/ "","","","","","","","";
> > +};
> > +
> >  &i2c1 {
> >         //Host1 IPMB bus
> >         status = "okay";
> > @@ -207,11 +241,16 @@
> >
> >  &i2c12 {
> >         status = "okay";
> > -       //MEZZ_FRU
> > -       eeprom@51 {
> > -               compatible = "atmel,24c64";
> > -               reg = <0x51>;
> > -               pagesize = <32>;
> > +};
> > +
> > +&i2c13 {
> > +       status = "okay";
> > +       // Debug Card
> > +       multi-master;
> > +       ipmb13@10 {
> > +               compatible = "ipmb-dev";
> > +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +               i2c-protocol;
> >         };
> >  };
> >
> > --
> > 2.17.1
> >
>

--000000000000d3788105e6e19a3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Noted. <br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 5:31 AM Joel Stanley =
&lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 22 Aug 2022 at =
07:02, Karthikeyan Pasupathi<br>
&lt;<a href=3D"mailto:pkarthikeyan1509@gmail.com" target=3D"_blank">pkarthi=
keyan1509@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch includes the following updates for Yosemite V2<br>
&gt; BMC.<br>
&gt;<br>
&gt; 1) Updated GPIO configuration for power control.<br>
<br>
Please take a look the openbmc naming conventions for the GPIOs. If<br>
you are not going to follow them, please explain why in your commit<br>
message.<br>
<br>
<br>
&gt; 2) Added IPMB-13 channel for Debug Card communication.<br>
&gt; 3) Removed EEPROM driver IPMB-12 channel and keeping it as<br>
&gt;=C2=A0 =C2=A0 &quot;status ok&quot;.<br>
<br>
If you find yourself writing a commit log that contains 1), 2), 3)<br>
then there&#39;s a fair chance you could have sent three separate patches.<=
br>
Consider this for next time.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeya=
n1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../dts/aspeed-bmc-facebook-yosemitev2.dts=C2=A0 =C2=A0 | 49 +++=
++++++++++++++--<br>
&gt;=C2=A0 1 file changed, 44 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/ar=
ch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; index 8864e9c312a8..4d2ff7eb6740 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; @@ -119,6 +119,40 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc15_default&gt;;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +&amp;gpio {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-line-names =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*A0-A7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*B0-B7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*C0-C7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*D0-D7*/=C2=A0 =C2=A0&quot;POWER_BUTTON&q=
uot;,&quot;POWER_OUT1&quot;,&quot;&quot;,&quot;POWER_OUT2&quot;,&quot;&quot=
;,&quot;POWER_OUT3&quot;,&quot;&quot;,&quot;POWER_OUT4&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*E0-E7*/=C2=A0 =C2=A0&quot;DEBUG_UART_SEL=
0&quot;,&quot;DEBUG_UART_SEL1&quot;,&quot;DEBUG_UART_SEL2&quot;,&quot;DEBUG=
_UART_RX_SEL_N&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*F0-F7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*G0-G7*/=C2=A0 =C2=A0&quot;LED_POST_CODE_=
0&quot;,&quot;LED_POST_CODE_1&quot;,&quot;LED_POST_CODE_2&quot;,&quot;LED_P=
OST_CODE_3&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*H0-H7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*I0-I7*/=C2=A0 =C2=A0&quot;SLOT1_POWER_OK=
&quot;,&quot;SLOT2_POWER_OK&quot;,&quot;SLOT3_POWER_OK&quot;,&quot;SLOT4_PO=
WER_OK&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*J0-J7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*K0-K7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*L0-L7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*M0-M7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*N0-N7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;I2C_SLOT1&quot;,&quot;I2C_SLOT2&quot;,&quot;I2C_SLOT3&quot;,&qu=
ot;I2C_SLOT4&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*O0-O7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;SELECTOR_BUTTON&quot;,&quot;SLOT1_POWER&quot;,&quo=
t;SLOT2_POWER&quot;,&quot;SLOT3_POWER&quot;,&quot;SLOT4_POWER&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*P0-P7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;LED_POST_CODE_4&quot;,&quot;LED_POST_=
CODE_5&quot;,&quot;LED_POST_CODE_6&quot;,&quot;LED_POST_CODE_7&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*Q0-Q7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*R0-R7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;GPIO_DBG_CARD_PRSNT&quot;,&quot;&quot;,&quot;&quot=
;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*S0-S7*/=C2=A0 =C2=A0&quot;RESET_OUT1&quo=
t;,&quot;RESET_OUT2&quot;,&quot;RESET_OUT3&quot;,&quot;RESET_OUT4&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*T0-T7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*U0-U7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*V0-V7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*W0-W7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*X0-X7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*Y0-Y7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&=
quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quo=
t;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*Z0-Z7*/=C2=A0 =C2=A0&quot;POST_COMPLETE&=
quot;,&quot;POST_COMPLETE2&quot;,&quot;POST_COMPLETE3&quot;,&quot;POST_COMP=
LETE4&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*AA0-AA7*/ &quot;&quot;,&quot;&quot;,&quo=
t;&quot;,&quot;&quot;,&quot;HAND_SW1&quot;,&quot;HAND_SW2&quot;,&quot;HAND_=
SW3&quot;,&quot;HAND_SW4&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*AB0-AB7*/ &quot;RESET_BUTTON&quot;,&quot=
;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&q=
uot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*AC0-AC7*/ &q=
uot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;=
,&quot;&quot;,&quot;&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 &amp;i2c1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//Host1 IPMB bus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; @@ -207,11 +241,16 @@<br>
&gt;<br>
&gt;=C2=A0 &amp;i2c12 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//MEZZ_FRU<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0eeprom@51 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D=
 &quot;atmel,24c64&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x=
51&gt;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pagesize =3D &=
lt;32&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c13 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Debug Card<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0multi-master;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ipmb13@10 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D=
 &quot;ipmb-dev&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;(0=
x10 | I2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-protocol;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
</blockquote></div>

--000000000000d3788105e6e19a3a--
