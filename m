Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A21D565C
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 18:42:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NvNB3svbzDr5Z
	for <lists+openbmc@lfdr.de>; Sat, 16 May 2020 02:42:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NrsW4MrmzDqsW
 for <openbmc@lists.ozlabs.org>; Sat, 16 May 2020 00:49:35 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FEXeeo071985
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 10:49:27 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 311rd70c67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 10:49:26 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 15 May 2020 14:49:25 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 15 May 2020 14:49:21 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2020051514492098-657844 ;
 Fri, 15 May 2020 14:49:20 +0000 
In-Reply-To: <61131589544441@mail.yandex-team.ru>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Date: Fri, 15 May 2020 14:49:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <61131589544441@mail.yandex-team.ru>,
 <46741589523578@mail.yandex-team.ru>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 42479
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20051514-3067-0000-0000-0000032A6146
X-IBM-SpamModules-Scores: BY=0.002165; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.101035
X-IBM-SpamModules-Versions: BY=3.00013098; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01377135; UDB=6.00736146; IPR=6.01159490; 
 MB=3.00032176; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-15 14:49:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-15 10:42:19 - 6.00011366
x-cbparentid: 20051514-3068-0000-0000-00006A1C73CC
Message-Id: <OF2D1D05D1.FA81C6D6-ON00258569.00516C00-00258569.00516C07@notes.na.collabserv.com>
Subject: RE: Veird power reading using ipmitool
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_06:2020-05-15,
 2020-05-15 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On May 15, 2020 around 7:19AM in some timezone, Konstantin Klubnichkin wrot=
e:
>Hello again!
>=20
>Answering myself, may be this would help anybody else.
>So the core reason is the quantum nature of the world, in this
>particular case - how fractional number are presented in IPMI.
>=20
>This is well described here:
>https://github.com/openbmc/docs/blob/master/architecture/sensor-archi
>tecture.md#how-to-best-choose-coefficients
>=20
>By default the upper limit for power sensors is 3000, thus the
>discreteness of the sensor value just doesn't allow it to follow the
>"real" values read from  sysfs files.
>=20
>To fix this it's necessary to add custom real limits to entity
>manager configuration file.
>In my case this looks like the following:
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>"pin=5FName" : "VR=5FP0=5FPIN",
>"pin=5FMin": 0.0,
>"pin=5FMax": 252.0,
>"pout1=5FName" : "VR=5FP0=5FPOUT",
>"pout1=5FMin": 0.0,
>"pout1=5FMax": 230.0,
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>The value of 252 Watts is taken from the power subsystem calculation,
>it's a bit more than the maximum value the VR can transform before
>shutdown.
>The same limits are set for currents and volts, and now I have sensor
>value presentation precision that allows me to get a given VR
>efficiency.
>=20
>Thank you!

Thanks for sharing your successful resolution!

milton

