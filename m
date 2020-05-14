Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 415BA1D38AB
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 19:52:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJyt3RkNzDqfq
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 03:52:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NJy930ZtzDqdx
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 03:51:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EHYUWD043112
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 13:51:40 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3119dg2h88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 13:51:40 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 14 May 2020 17:51:39 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 14 May 2020 17:51:35 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020051417513537-676291 ;
 Thu, 14 May 2020 17:51:35 +0000 
In-Reply-To: <20200514135251.GC1166713@heinlein>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Thu, 14 May 2020 17:51:34 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200514135251.GC1166713@heinlein>,
 <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-3-andrew@aj.id.au>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 12239
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20051417-5525-0000-0000-000002816EF4
X-IBM-SpamModules-Scores: BY=0.070694; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.424974; ST=0; TS=0; UL=0; ISC=; MB=0.023635
X-IBM-SpamModules-Versions: BY=3.00013092; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01376720; UDB=6.00735898; IPR=6.01159071; 
 MB=3.00032163; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-14 17:51:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-14 16:25:58 - 6.00011363
x-cbparentid: 20051417-5526-0000-0000-0000D0D87806
Message-Id: <OFC0BE98E6.EFA0EF41-ON00258568.00621B0A-00258568.00621B14@notes.na.collabserv.com>
Subject: RE: [RFC PATCH linux dev-5.4 2/4] ARM: configs: aspeed-g5: Enable
 modules
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_05:2020-05-14,
 2020-05-14 signatures=0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On May 14, 2020 around 8:53AM in some timezone, Patrick Williams  wrote:

>On Thu, May 14, 2020 at 10:57:01PM +0930, Andrew Jeffery wrote:>> This is =
a step on the path to enabling kprobes, which depend on
>> CONFIG=5FMODULES=3Dy.
>>=20
>> Setting CONFIG=5FMODULES=3Dy results in the following change in kernel
>size:
>>=20
>> Before:
>>          $ size vmlinux
>>             text    data     bss     dec     hex filename
>>          8140500 2440582  178904 10759986         a42f32 vmlinux
>>          $ stat --printf '%s\n' arch/arm/boot/zImage
>>          3445200
>>=20
>> After:
>>          $ size vmlinux
>>             text    data     bss     dec     hex filename
>>          8240349 2388862  172304 10801515         a4d16b vmlinux
>>          $ stat --printf '%s\n' arch/arm/boot/zImage
>>          3458368
>>=20
>> This gives a 41,529 byte increase to vmlinux and a 13,168 byte
>increase
>> to the size of the compressed kernel image. In the most constrained
>BMC
>> flash layout (arch/arm/boot/dts/openbmc-flash-layout.dtsi) this
>change
>> decreases the free space in the kernel partition from 1,011,248
>bytes to
>> 998,080 bytes.
>>=20
>> CONFIG=5FHW=5FRANDOM=3Dy seems to come along for the ride with the
>> `./scripts/config -e modules && make olddefconfig && make
>> savedefconfig`. The measurements above include it, I haven't
>> investigated why it gets enabled or what effect disabling it might
>have
>> on the numbers.
>>=20
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  arch/arm/configs/aspeed=5Fg5=5Fdefconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm/configs/aspeed=5Fg5=5Fdefconfig
>b/arch/arm/configs/aspeed=5Fg5=5Fdefconfig
>> index e124b4ddd442..e30f27a413f4 100644
>> --- a/arch/arm/configs/aspeed=5Fg5=5Fdefconfig
>> +++ b/arch/arm/configs/aspeed=5Fg5=5Fdefconfig
>> @@ -46,6 +46,7 @@ CONFIG=5FNEON=3Dy
>>  CONFIG=5FKERNEL=5FMODE=5FNEON=3Dy
>>  CONFIG=5FFIRMWARE=5FMEMMAP=3Dy
>>  CONFIG=5FJUMP=5FLABEL=3Dy
>> +CONFIG=5FMODULES=3Dy
>>  # CONFIG=5FBLK=5FDEV=5FBSG is not set
>>  # CONFIG=5FBLK=5FDEBUG=5FFS is not set
>>  # CONFIG=5FMQ=5FIOSCHED=5FDEADLINE is not set
>> @@ -152,6 +153,7 @@ CONFIG=5FSERIAL=5F8250=5FDW=3Dy
>>  CONFIG=5FSERIAL=5FOF=5FPLATFORM=3Dy
>>  CONFIG=5FASPEED=5FKCS=5FIPMI=5FBMC=3Dy
>>  CONFIG=5FASPEED=5FBT=5FIPMI=5FBMC=3Dy
>> +CONFIG=5FHW=5FRANDOM=3Dy
>>  CONFIG=5FHW=5FRANDOM=5FTIMERIOMEM=3Dy
>>  # CONFIG=5FI2C=5FCOMPAT is not set
>>  CONFIG=5FI2C=5FCHARDEV=3Dy
>> --=20
>> 2.25.1
>>=20
>
>We're already using modules on the facebook/openbmc kernels and it
>hasn't seemed to cause any issues.  Is there any argument why we
>shouldn't begin moving some of the drivers to be modules?  Any easy
>change would be to make all the hwmon content as modules and load
>them
>based on the device tree.
>
>I think there is a DISTRO=5FFEATURE we should enable for userspace
>support
>of modules.  Let me know if you want me to investigate that.

This gerrit is still open.  It also adds content to the rootfs b
ecause it tries to pull in vmlinux into the root fs as part of the=20
base kernel recipie:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/26092

actually this one that has failed since September:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/25536/2

milton

