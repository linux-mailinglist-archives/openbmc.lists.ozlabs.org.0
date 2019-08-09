Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D587FFA
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 18:29:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464rKs42yKzDrDn
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 02:29:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464rJz5CKqzDrCX
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 02:28:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x79GR02L018080
 for <openbmc@lists.ozlabs.org>; Fri, 9 Aug 2019 12:28:25 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u9bunse6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 12:28:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 9 Aug 2019 16:28:23 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 9 Aug 2019 16:28:19 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019080916281866-638422 ;
 Fri, 9 Aug 2019 16:28:18 +0000 
In-Reply-To: <CACPK8XeTwyp_yt0fLL6DP=7nsHLjGXcT5N8tr5RJg1QYyx5Sfw@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Aug 2019 16:28:18 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XeTwyp_yt0fLL6DP=7nsHLjGXcT5N8tr5RJg1QYyx5Sfw@mail.gmail.com>,
 <20190807144654.23330-1-Ben_Pai@wistron.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 47547
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19080916-4615-0000-0000-00000037848C
X-IBM-SpamModules-Scores: BY=0.038065; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.002311
X-IBM-SpamModules-Versions: BY=3.00011575; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01244390; UDB=6.00656518; IPR=6.01025872; 
 MB=3.00028109; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-09 16:28:22
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-09 09:27:09 - 6.00010264
x-cbparentid: 19080916-4616-0000-0000-0000005A952B
Message-Id: <OF496DCF2B.B3BDA10B-ON00258451.00593E4B-00258451.005A7BAB@notes.na.collabserv.com>
Subject: RE: [PATCH v4 4/4] ARM: dts: aspeed: Add Mihawk BMC platform
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ben Pai <Ben_Pai@wistron.com>,
 Alvin Wang <wangat@tw.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel, and Ben.

On 08/09/2019 around 01:59AM in some timezone, Joel Stanley wrote:>Hi Ben,
>
>On Wed, 7 Aug 2019 at 14:47, Ben Pai <Ben=5FPai@wistron.com> wrote:


>>> +&fmc {
>> +       status =3D "okay";
>> +       flash@0 {
>
>There is no reg property so I think the @0 is incorrect.

The reg property is in the aspeed-g5.dtsi and the @0 is correct.

The layout is shared with witherspoon and the capacity matches.
Perhaps we should create a openbmc-ubi-32m.dtsi
similar to openbmc-flash-layout.dtsi.

>>> +               status =3D "okay";
>> +               label =3D "bmc";
>> +               m25p,fast-read;
>> +               spi-max-frequency =3D <50000000>;
>> +               partitions {
>> +                       #address-cells =3D < 1 >;
>> +                       #size-cells =3D < 1 >;
>> +                       compatible =3D "fixed-partitions";
>> +                       u-boot@0 {
>> +                               reg =3D < 0 0x60000 >;
>> +                               label =3D "u-boot";
>> +                       };
>> +                       u-boot-env@60000 {
>> +                               reg =3D < 0x60000 0x20000 >;
>> +                               label =3D "u-boot-env";
>> +                       };
>> +                       obmc-ubi@80000 {
>> +                               reg =3D < 0x80000 0x1F80000 >;
>> +                               label =3D "obmc-ubi";
>> +                       };
>> +               };
>> +       };
>> +       flash@1 {
>
>as above.

as above.

>
>> +               status =3D "okay";
>> +               label =3D "alt-bmc";
>> +               m25p,fast-read;
>> +               spi-max-frequency =3D <50000000>;

This would need a second include for the alt- labels.

>> +               partitions {
>> +                       #address-cells =3D < 1 >;
>> +                       #size-cells =3D < 1 >;
>> +                       compatible =3D "fixed-partitions";
>> +                       u-boot@0 {
>> +                               reg =3D < 0 0x60000 >;
>> +                               label =3D "alt-u-boot";
>> +                       };
>> +                       u-boot-env@60000 {
>> +                               reg =3D < 0x60000 0x20000 >;
>> +                               label =3D "alt-u-boot-env";
>> +                       };
>> +                       obmc-ubi@80000 {
>> +                               reg =3D < 0x80000 0x1F80000 >;
>> +                               label =3D "alt-obmc-ubi";
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&spi1 {
>> +       status =3D "okay";
>> +       pinctrl-names =3D "default";
>> +       pinctrl-0 =3D <&pinctrl=5Fspi1=5Fdefault>;
>> +
>> +       flash@0 {
>
>as above.

here too, reg is in dtsi along with compatible.

>>> +               status =3D "okay";
>> +               label =3D "pnor";
>> +               m25p,fast-read;
>> +               spi-max-frequency =3D <100000000>;
>> +       };
>> +};
>

milton

