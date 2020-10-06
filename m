Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10E2844C6
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 06:26:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C54Cd694GzDqJ1
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 15:26:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xaywtb8/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C54Bh39SlzDqHK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 15:25:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09641GYW095036
 for <openbmc@lists.ozlabs.org>; Tue, 6 Oct 2020 00:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=pVGURSjnYdXOaXb0gVMx5cMZHPzUIb/9d+J+VbghsW8=;
 b=Xaywtb8/oojJUsB62mwZhmHKbdBdDGNp+tY28fmz+seAvjElfsg2nbHJf7vipufLrfIH
 KaKVGyuwkcujyxJRG8UHCzdX1igpuZvta5yENSJj4tmUYmZGLsHgtyYIShhCvigoGXyf
 +vlbUxaZYLRILSfXgq33tnljs4pVB8GQUeBe4J9yJPEV8zzo5btMnWV9kwlTSwC8vr1b
 JuwappXmEcWFDYSxWECdD2sYSEq0FwaKxd0PiTFLbP6jkUUaKn/GVfCKa+531Kkdvmz8
 EgXpOOiS1AZ2kIFBStj+3lrHrIhjAG4HiFOO1XnrBjfzJgmacaD45KgxZd+Bi8u9yNn3 Bw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 340g6whpcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 00:25:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 6 Oct 2020 04:25:10 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 6 Oct 2020 04:25:07 -0000
Received: from us1a3-mail226.a3.dal06.isc4sb.com ([10.146.103.94])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020100604250678-5287 ; Tue, 6 Oct 2020 04:25:06 +0000 
In-Reply-To: <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2020 04:25:06 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>,
 <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-2-andrew@aj.id.au>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 62091
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20100604-4409-0000-0000-000003D1E82A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.404685; ST=0; TS=0; UL=0; ISC=; MB=0.000048
X-IBM-SpamModules-Versions: BY=3.00013960; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01445014; UDB=6.00776711; IPR=6.01227720; 
 MB=3.00034402; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-06 04:25:08
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-05 23:53:04 - 6.00011920
x-cbparentid: 20100604-4410-0000-0000-00009776EC80
Message-Id: <OF049DC1D4.E5E0E847-ON002585F9.0017C7A1-002585F9.00184577@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH 1/3] ARM: dts: rainier: Add reserved memory for ramoops
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_01:2020-10-05,
 2020-10-06 signatures=0
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On October 5, 2020 about 10:23 in some timezone, Joel Stanley wrote:
>Subject: [EXTERNAL] Re: [PATCH 1/3] ARM: dts: rainier: Add reserved
>memory for ramoops
>
>On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Reserve a 1MiB region of memory to record kmsg dumps and console
>state
>> into 16kiB ring-buffer slots. The sizing allows for up to 32 dumps
>to be
>> captured and read out.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index e6f422edf454..46a0e95049fd 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -47,6 +47,14 @@ reserved-memory {
>>                 #size-cells =3D <1>;
>>                 ranges;
>>
>> +               ramoops@b7f00000 {
>> +                       compatible =3D "ramoops";
>> +                       reg =3D <0xb7f00000 0x100000>;
>> +                       record-size =3D <0x4000>;
>> +                       console-size =3D <0x4000>;
>
>This is conserative. We've got plenty of space, how about we make it
>bigger?
>
>$ git grep console-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
>"%x\n" | sort -n
>8000
>8000
>10000
>10000
>20000
>20000
>20000
>20000
>20000
>60000
>100000
>
>The median is 128KB, which sounds reasonable.

How big is the dmesg after we are booted?   How big is the default=20
kernel buffer for 2 cpus (the kernel config has a base size, but=20
also a dynamic size with a base + n * cpu min at boot).

Having the console space larger than printk buffer will not help.

We could config the buffer up if we are not capturing enough of a=20
boot and some runtime.

>
>$ git grep record-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
>"%x\n"
>20000
>400
>400
>20000
>20000
>20000
>10000
>10000
>10000
>10000
>20000
>
>64KB is the median record size.
>
This probably affects the effective compression, assuming
each block is a seperate compression input.

>> +                       pmsg-size =3D <0x4000>;
>
>Do we want to add ftrace too?
>
>Should we also add max-reason =3D KMSG_DUMP_EMERG?
>

The admin guide lists KMSG_DUMP_OOPS and KMSG_DUMP_PANIC ?
https://www.kernel.org/doc/html/latest/admin-guide/ramoops.html

We could have something monitoring for OOPS , copying to a log and=20
then unlinking the pstore after committed.

>Logging reboots and shutdowns is informative (you know if a reboot
>was
>intentional or due to a crash that wasn't recorded) and allows for
>testing.
>

That should be exposed from audit logging?
but yes.

milton

>Cheers,
>
>Joel
>
>> +               };
>> +
>>                 flash_memory: region@B8000000 {
>>                         no-map;
>>                         reg =3D <0xB8000000 0x04000000>; /* 64M */
>> --
>> 2.25.1
>>
>
>

