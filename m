Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CA1C7E54
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 02:07:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HYg41RyQzDqwP
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 10:07:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HYfH5H3mzDqtv
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 10:06:30 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04701jrq122857
 for <openbmc@lists.ozlabs.org>; Wed, 6 May 2020 20:06:27 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t7g17g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 20:06:27 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 7 May 2020 00:06:26 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 May 2020 00:06:23 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020050700062246-1103220 ;
 Thu, 7 May 2020 00:06:22 +0000 
In-Reply-To: <TY2PR04MB3038B868F17436186E36E5559DA40@TY2PR04MB3038.apcprd04.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Manikandan E <manikandan.e@hcl.com>
Date: Thu, 7 May 2020 00:06:22 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <TY2PR04MB3038B868F17436186E36E5559DA40@TY2PR04MB3038.apcprd04.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 21167
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20050700-2475-0000-0000-000003055BA4
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013044; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01373027; UDB=6.00733702; IPR=6.01155383; 
 MB=3.00032042; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-07 00:06:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-06 22:59:05 - 6.00011330
x-cbparentid: 20050700-2476-0000-0000-0000BEDE7690
Message-Id: <OFFD6AE807.928B6728-ON00258561.0000957D-00258561.00009585@notes.na.collabserv.com>
Subject: Re:  sysfs entries not created for temperature in adm1278
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-06_09:2020-05-05,
 2020-05-06 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On May 6, 2020 around 6:02PM in some timezone, Manikandan E  wrote:

> Hi,=20
>=20
> =20
>  The adm1278 hwmon sysfs entries not created for temperature.=20
>  root@yosemitev2:~# ls -l /sys/class/hwmon/hwmon4/
> =20
>curr1=5Fhighest         curr=5Fsamples          in1=5Fmax=5Falarm
>in2=5Flabel             in=5Fsamples            power1=5Flabel
> =20
>curr1=5Finput           device/               in1=5Fmin
>in2=5Fmax               name                  power1=5Fmax
> =20
>curr1=5Flabel           in1=5Fhighest           in1=5Fmin=5Falarm
>in2=5Fmax=5Falarm         of=5Fnode/              power1=5Freset=5Fhistory
> =20
>curr1=5Fmax             in1=5Finput             in1=5Freset=5Fhistory
>in2=5Fmin               power1=5Falarm          power=5Fsamples
> =20
>curr1=5Fmax=5Falarm       in1=5Flabel             in2=5Fhighest
>in2=5Fmin=5Falarm         power1=5Finput          subsystem/
> =20
>curr1=5Freset=5Fhistory   in1=5Fmax               in2=5Finput
>in2=5Freset=5Fhistory     power1=5Finput=5Fhighest  uevent
> =20


A quick look at the upstream driver says that it reads the=20
power management config register at 0xd4 and enables what=20
is there, but (1) it doesn't account that the register is=20
16 bits on 1278 and (2) although the register is rw according=20
to the datasheet the driver doesn't appear to have proviisons=20
to configure it.

I'd suggest (1) unbindig the driver, writing the register,
and then try binding the driver again (or warm reboot) to see=20
if this works around the issue, and=20

(2) raise the issue with the upstream on the linux-hwmon=20
mailing list (or read the wiki in MAINTAINTERS).  The=20
driver is adm1275.

I'd suggest a binding that allows the config register to be
specified in the device tree but I am not familiar with the=20
hwmon comunity or practice for similar.

Hope this helps
milton

Speaking only for myself.

