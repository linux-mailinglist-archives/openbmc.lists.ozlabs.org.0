Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEACC35D564
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 04:43:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK908654Gz30GS
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 12:43:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQfIT23J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LQfIT23J; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK8zv1YDpz30B5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 12:43:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D2X7og052874
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 22:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=1EegNePvlfRJ5UCnwknjrsGUcTK3dCk5x+70rY0+tQY=;
 b=LQfIT23J9dz4tgv/5nlFRGvn+G/K/GG1H2ozfnSP1A4GBuWa1LE9AG2uReyCtS1wqc0x
 6dwM//jaWpPWob2VOy074SNcqGNo/RT/fQ+mJ1NwN33D2K6JXDc74EaBgW8fkiyvgSwq
 IFSG+PB+hJaM/owBVZg8Et+G3b4vWfy2eHdyuQSDs7vhcDlbDicOVtMAVlEjANe7pIEN
 YUs021NlquF7Cm3n/9Hd+JGYYUf3B8riEyIKSwDLquJM6wjjwJZBOK6TSAAfnBUebpKR
 +UokSKO+h9pWi+XlvX1esMl3R//MqbRoH7cFc7GrTYf7jHQOthuT9wXCH71jeUa1PFuJ hg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vujk5v3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 22:43:17 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 13 Apr 2021 02:43:17 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 13 Apr 2021 02:43:15 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021041302431439-860115 ;
 Tue, 13 Apr 2021 02:43:14 +0000 
In-Reply-To: <20210413013010.GA353@aspeedtech.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Steven Lee <steven_lee@aspeedtech.com>
Date: Tue, 13 Apr 2021 02:43:14 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20210413013010.GA353@aspeedtech.com>,
 <20210408015218.20560-1-steven_lee@aspeedtech.com>
 <20210408015218.20560-2-steven_lee@aspeedtech.com>
 <20210409184118.GA3934798@robh.at.kernel.org>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 12715
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21041302-1429-0000-0000-000003AD7C50
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.008445
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526390; UDB=6.00825164; IPR=6.01308223; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-04-13 02:43:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-22 13:55:12 - 6.00012377
x-cbparentid: 21041302-1430-0000-0000-00003A2C7F01
Message-Id: <OF2606E97A.D9A04B5B-ON002586B6.000DC6EE-002586B6.000EF1DC@notes.na.collabserv.com>
X-Proofpoint-GUID: cQ9jjfmehFSZsx7sq9nPiwzbEquoSnAT
X-Proofpoint-ORIG-GUID: cQ9jjfmehFSZsx7sq9nPiwzbEquoSnAT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v1 1/2] dt-bindings: mmc: sdhci-of-aspeed: Add power-gpio
 and power-switch-gpio
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_15:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, "moderated
 list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----

>To: Rob Herring <robh@kernel.org>
>From: Steven Lee=20
>Sent by: "openbmc"=20
>Date: 04/12/2021 08:31PM
>Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
><devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
>Ryan Chen <ryan_chen@aspeedtech.com>, "moderated list:ASPEED SD/MMC
>DRIVER" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery
><andrew@aj.id.au>, "open list:ASPEED SD/MMC DRIVER"
><linux-mmc@vger.kernel.org>, "moderated list:ASPEED SD/MMC DRIVER"
><openbmc@lists.ozlabs.org>, Ryan Chen <ryanchen.aspeed@gmail.com>,
>Adrian Hunter <adrian.hunter@intel.com>, open list
><linux-kernel@vger.kernel.org>, Chin-Ting Kuo
><chin-ting_kuo@aspeedtech.com>, "moderated list:ARM/ASPEED MACHINE
>SUPPORT" <linux-arm-kernel@lists.infradead.org>
>Subject: [EXTERNAL] Re: [PATCH v1 1/2] dt-bindings: mmc:
>sdhci-of-aspeed: Add power-gpio and power-switch-gpio
>
>The 04/10/2021 02:41, Rob Herring wrote:
>> On Thu, Apr 08, 2021 at 09:52:17AM +0800, Steven Lee wrote:
>> > AST2600-A2 EVB provides the reference design for enabling SD bus
>power
>> > and toggling SD bus signal voltage by GPIO pins.
>> > Add the definition and example for power-gpio and
>power-switch-gpio
>> > properties.
>> >=20
>> > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
>power
>> > load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
>connected to
>> > a 1.8v and a 3.3v power load switch that providing signal voltage
>to
>> > SD1 bus.
>> > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus
>is
>> > disabled.
>> > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
>signal
>> > voltage is 3.3v. Otherwise, 1.8v power load switch will be
>enabled, SD1
>> > signal voltage becomes 1.8v.
>> >=20
>> > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
>> > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio
>and GPIOV3
>> > as power-switch-gpio.
>> >=20
>> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>> > ---
>> >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 25
>+++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >=20
>> > diff --git
>a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>> > index 987b287f3bff..515a74614f3c 100644
>> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>> > @@ -37,6 +37,14 @@ properties:
>> >    clocks:
>> >      maxItems: 1
>> >      description: The SD/SDIO controller clock gate
>> > +  power-gpio:
>>=20
>> '-gpios' is the preferred form even if just 1.
>>=20
>
>Thanks for reviewing, I will change the name.

is this a clock gate or a power on gpio?


>
>> > +    description:
>> > +      The GPIO for enabling/disabling SD bus power.
>> > +    maxItems: 1
>>=20
>> blank line
>>=20
>
>I will remove the blank line.
>
>> > +  power-switch-gpio:
>> > +    description:
>> > +      The GPIO for toggling the signal voltage between 3.3v and
>1.8v.

Which way does it toggle for which voltage?

Oh, you said in the change log but not in the binding.

But please, use gpio controled regulators as Ulf suggested and is
already used by other mmc controllers upstream.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

Ulf> Please do not model these as GPIO pins like this. Instead, it's better
Ulf> to model them as gpio regulators, since the mmc core manages them as
Ulf> regulators.
Ulf>=20
Ulf> We have a vmmc regulator (corresponding to vdd) and a vqmmc regulator
Ulf> (corresponding the signal-voltage level). These are also described in
Ulf> the common mmc DT bindings, see
Ulf> Documentation/devicetree/bindings/mmc/mmc-controller.yaml
Ulf> .

milton

>> > +    maxItems: 1
>> >=20=20
>> >  patternProperties:
>> >    "^sdhci@[0-9a-f]+$":
>> > @@ -61,6 +69,14 @@ patternProperties:
>> >        sdhci,auto-cmd12:
>> >          type: boolean
>> >          description: Specifies that controller should use auto
>CMD12
>> > +      power-gpio:
>> > +        description:
>> > +          The GPIO for enabling/disabling SD bus power.
>> > +        maxItems: 1
>> > +      power-switch-gpio:
>> > +        description:
>> > +          The GPIO for toggling the signal voltage between 3.3v
>and 1.8v.
>> > +        maxItems: 1
>> >      required:
>> >        - compatible
>> >        - reg
>> > @@ -80,6 +96,7 @@ required:
>> >  examples:
>> >    - |
>> >      #include <dt-bindings/clock/aspeed-clock.h>
>> > +    #include <dt-bindings/gpio/aspeed-gpio.h>
>> >      sdc@1e740000 {
>> >              compatible =3D "aspeed,ast2500-sd-controller";
>> >              reg =3D <0x1e740000 0x100>;
>> > @@ -94,6 +111,10 @@ examples:
>> >                      interrupts =3D <26>;
>> >                      sdhci,auto-cmd12;
>> >                      clocks =3D <&syscon ASPEED_CLK_SDIO>;
>> > +                    power-gpio =3D <&gpio0 ASPEED_GPIO(V, 0)
>> > +                                     GPIO_ACTIVE_HIGH>;
>> > +                    power-switch-gpio =3D <&gpio0 ASPEED_GPIO(V,
>1)
>> > +                                     GPIO_ACTIVE_HIGH>;
>> >              };
>> >=20=20
>> >              sdhci1: sdhci@200 {
>> > @@ -102,5 +123,9 @@ examples:
>> >                      interrupts =3D <26>;
>> >                      sdhci,auto-cmd12;
>> >                      clocks =3D <&syscon ASPEED_CLK_SDIO>;
>> > +                    power-gpio =3D <&gpio0 ASPEED_GPIO(V, 2)
>> > +                                     GPIO_ACTIVE_HIGH>;
>> > +                    power-switch-gpio =3D <&gpio0 ASPEED_GPIO(V,
>3)
>> > +                                     GPIO_ACTIVE_HIGH>;
>> >              };
>> >      };
>> > --=20
>> > 2.17.1
>> >=20
>
>

