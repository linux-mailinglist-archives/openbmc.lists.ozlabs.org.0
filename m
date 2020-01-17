Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667A141442
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 23:44:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zx2q2BK9zDr1R
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 09:44:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zx256rG5zDr0t
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 09:44:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HMgWw3019148
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 17:44:09 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qtmxqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 17:44:09 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 17 Jan 2020 22:44:09 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 17 Jan 2020 22:44:04 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020011722440418-890725 ;
 Fri, 17 Jan 2020 22:44:04 +0000 
In-Reply-To: <43f91d13-9830-f9be-fff0-ee86e32a40e4@intel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Date: Fri, 17 Jan 2020 22:44:03 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <43f91d13-9830-f9be-fff0-ee86e32a40e4@intel.com>,
 <a1f915ec674647f383696f113915d404@SCL-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 9587
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20011722-3165-0000-0000-0000025F9007
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.217546
X-IBM-SpamModules-Versions: BY=3.00012404; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01320621; UDB=6.00702549; IPR=6.01102947; 
 MB=3.00030370; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-17 22:44:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-17 17:28:18 - 6.00010897
x-cbparentid: 20011722-3166-0000-0000-0000DF2BCCEB
Message-Id: <OFFA7BD6D4.6E728564-ON002584F2.007BDC5B-002584F2.007CE222@notes.na.collabserv.com>
Subject: RE: Intel S2600WF (Wolf Pass) BMC MAC addresses issue.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

About 03:29PM 01/17/2020 in some timezone, Johnathan Mantey wrote:
>
>This is expected behavior.
>I believe the MAC address is generated randomly the first time.
>I'm not certain if this will remain the status quo.
>The MAC addresses are pulled from the
>/etc/systemd/network/00-bmc-ethx.network files.
>It is necessary to write the information, and then reboot the BMC for
>the value to take effect.

It's the behavior if the platform is missing some support.

>
>On 1/17/20 1:16 PM, Bruce Mitchell wrote:
>> On my Intel S2600WF (Wolf Pass) the original Purley BMC FW gets its
>MAC
>> addresses properly and consistently,
>>=20
>> when reflashing the BMC SPI FLASH the BMC will still get the
>correct and
>> same MAC addresses.
>>=20
>> =20
>>=20
>> Then all I change is using OpenBMC (from here
>>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5FIn=
tel
>-2DBMC=5Fopenbmc&d=3DDwID-g&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKB=
U02rc
>u4F5DWd-EwX8As2xrXeO9ZSo4&m=3DnAfDq6tUDSiK=5FKGsv8J=5Fgf4rZRggfe7L3fFnWRBD2
>xQ&s=3DoiK3NIjr0m1wrqSiymjsJO5bn9SQFCRcKpaOjzAXkss&e=3D ) and then the
>BMC gets
>>=20
>> different MAC addresses each time I reflash the BMC SPU FLASH.
>>=20
>> Is this the present expected behavior?
>>=20
>> If so will it be corrected to behave like the Purley BMC FW for MAC
>> addresses?
>>=20
>> =20
>>=20
>> Thanks!
>>=20
>> =20
>>=20
>
>--=20
>Johnathan Mantey


Wolf Pass uses the aspeed AST 2500, which does not have space to store
the MAC address inside the SOC.

Das U-boot, the booloader that OpenBMC uses, will write a MAC into the=20
hardware if one is configured in the firmware environment ethaddr=20
variable.If one is not set, it will generate a random MAC from the=20
administratively assigned space.

Likewise, the Linux kernel driver will use a mac programmed into the=20
hardware if it is valid, or it too will generate a random MAC from the=20
administratively assigned space.

Other OpenBMC systems extract the MAC from a FRU object in the inventory=20
and write this to a d-bus variable which then triggers a call to store=20
the MAC in the u-boot environment via the fw-setenv utility.

I don't have any specs or hardware for WolfPass so I ccan't comment on=20
where the MAC address is stored.  If you have trouble finding the code
to transport the MAC to the U-boot environment I can search for the=20
pieces; I know the path exists on romulus and witherspoon platforms in
the meta-openpower and meta-ibm layers.

milton

