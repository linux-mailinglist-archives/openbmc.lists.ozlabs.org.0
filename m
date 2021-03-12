Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F89338231
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRMh3PJBz3cV1
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jz9JBe5i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jz9JBe5i; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRMR1Wktz2xZr
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:21:54 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C03xmb040839
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=TrRJLJ2HEB8WggnKVUR/UG326FOf7k97X7BE14qqovs=;
 b=jz9JBe5i0x8D083kFpARKZ24+nbz785zLFMmBOU5lalwka2Eoun+P9EcAiUaiVkmb0wu
 oMiXN1JvnCGsRLCCkD27cum7z4GIByOdQj0eGnoCIQK4u5IJN8mKYTPIBN6s+euFD9I7
 exsnyHdar/xThJmYK3ZwIllIyqYt/6wtofu0C2haEMr0vc5SKTsqmR9AXWTF6IqfaPPa
 tySKgRBQj+ku8hjeKYxZkdZG6GcrrQSxA9tbFgQtYsUgCNcDynygFGh4YH5W3mG5fgY8
 ThNu3v0UCoMn/sN475ohHPAUqCVRJShFgdUxSGGmBiyXZpecH/8gJzNggdg1JnGZgUJo Wg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774ky5u6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 19:21:50 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 12 Mar 2021 00:21:50 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 12 Mar 2021 00:21:49 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021031200214879-831117 ;
 Fri, 12 Mar 2021 00:21:48 +0000 
In-Reply-To: <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:21:48 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>,
 <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 13623
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21031200-3017-0000-0000-00000444742A
X-IBM-SpamModules-Scores: BY=0.081019; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.135329
X-IBM-SpamModules-Versions: BY=3.00014828; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515836; UDB=6.00818898; IPR=6.01298485; 
 MB=3.00036309; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-12 00:21:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-11 01:59:58 - 6.00012362
x-cbparentid: 21031200-3018-0000-0000-00006FCA7BED
Message-Id: <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
Subject: RE: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_12:2021-03-10,
 2021-03-11 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----

>To: Eddie James <eajames@linux.ibm.com>
>From: Joel Stanley=20
>Sent by: "openbmc"=20
>Date: 03/11/2021 06:09PM
>Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>Subject: [EXTERNAL] Re: [PATCH linux dev-5.10 06/35] ARM: dts:
>aspeed: rainier: Add leds that are off PCA9552
>
>On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com>
>wrote:
>>
>> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>>
>> These LEDs are on the fans and are connected via a
>> pca9551 i2c expander
>
>This change doesn't make sense. The pca9551 is an i2c LED expander,
>so
>we don't need to expose the pins as GPIOs and then attach a gpio-leds
>driver to them. We should instead simply configure the pca955x driver
>to drive the LEDs as LEDs.

I'll refresh your memory on why we have been doing this in our=20
devie trees and then let you consider if this is desired or not.

The led system insistes on creating a compact map (no holes) (as
does the reset subsystem).

However, this means the relative led number for a pin changes=20
as the prior pins change from gpio to led configuration.

For example if pins 2 and 7 are leds, they become leds 0 and 1. =20
Changing pin 5 to also be an led means that pin 7 is now led 2=20
not led 1 on the led subsystem.

The workaround we have done for existing systems has been to use=20
gpio leds for pca family devices.

milton

>
>>
>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 41
>++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index 6684485a2db0..514a14d3f914 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -263,6 +263,47 @@ fan5-presence {
>>                         linux,code =3D <11>;
>>                 };
>>         };
>> +
>> +       leds {
>> +               compatible =3D "gpio-leds";
>> +
>> +               fan0 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 0 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +
>> +               fan1 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 1 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +
>> +               fan2 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 2 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +
>> +               fan3 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 3 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +
>> +               fan4 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 4 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +
>> +               fan5 {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca0 5 GPIO=5FACTIVE=5FLOW>;
>> +               };
>> +       };
>> +
>>  };
>>
>>  &ehci1 {
>> --
>> 2.27.0
>>
>
>

