Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D51B35E0
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 06:04:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496RdG4L6NzDqWf
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:04:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Rcc5MLhzDqLB
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 14:03:28 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M42S4F115910
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 00:03:26 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gg28gkft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 00:03:25 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 22 Apr 2020 04:03:24 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 22 Apr 2020 04:03:21 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020042204032044-782 ; Wed, 22 Apr 2020 04:03:20 +0000 
In-Reply-To: <1af7b20c.18da.1719fb49f56.Coremail.slm_8269@163.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: shi  <slm_8269@163.com>
Date: Wed, 22 Apr 2020 04:03:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1af7b20c.18da.1719fb49f56.Coremail.slm_8269@163.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 15795
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20042204-3017-0000-0000-000002A0C5A5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.263001
X-IBM-SpamModules-Versions: BY=3.00012950; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01365953; UDB=6.00729502; IPR=6.01148315; 
 MB=3.00031813; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-22 04:03:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-22 00:21:32 - 6.00011270
x-cbparentid: 20042204-3018-0000-0000-0000DDA5D5C6
Message-Id: <OF30D260EE.ED6617FE-ON00258552.00113D50-00258552.00164769@notes.na.collabserv.com>
Subject: =?UTF-8?Q?Re:__I_wan_to_debug_the_=EF=BC=88export_TEMPLATECONF=3Dmeta-ibm?=
 =?UTF-8?Q?/meta-romulus/conf_=EF=BC=89_on_evb2500_board_?=
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_10:2020-04-21,
 2020-04-21 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Around 9:26 PM in some timezone on April 21, 2020, shi  <slm=5F8269@163.com=
> wrote:
>thanks for you info.
>
>I try
>the https://github.com/openbmc/openbmc/tree/master/meta-evb/meta-evb-
>aspeed/meta-evb-ast2500 image. the fitimage can startup. but the


Please consider adding more whitespace and vertical formatting to=20
your replies.

I'm glad you can build the initial evb image and that it works.

>readfish etc, many app not have.  so I still use the IBM Romulus

It occurs to me that this is likely to being a pure evb image and=20
not a obmc-phosphor image.  Try adding this layer to start getting=20
the features.

>image. it always nothing output after the uboot output the starting
>kernel info., for the  meta-evb-ast2500, it can waiting then popup
>the log in prompt. I want to change the dtb files, that just cut it

Please look at the documentation in the openbmc doc repository for=20
some additional suggestions on how to start modifing the image.

https://github.com/openbmc/doc

I don't remember which tty the evb uses for the console vs romulus.

>just like the evb-2500's dts, but still cannot startup.  so I changed
>the kernel of Romulus image's config files try to open the
>CONFIG=5FDEBUG=5FLL=3Dy, when  bitbake obmc-phosphor-image, there always

I've heard of this option but not familar with people using it for=20
aspeed debug.

>has error info:  ERROR: obmc-phosphor-initramfs-1.0-r0 do=5Frootfs: The
>postinstall intercept hook 'update=5Fudev=5Fhwdb' failed, details in
>/home/shilaimao/bmc/romulus-bmc/openbmc/build/tmp/work/romulus-openbm
>c-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do=5Frootfs
>ERROR: Logfile of failure stored in:
>/home/shilaimao/bmc/romulus-bmc/openbmc/build/tmp/work/romulus-openbm
>c-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do=5Frootfs.265
>07

The udev-hwdb image is a database of fixups for usb devices.  I thought=20
it was suppressed for Romulus but don't remember.  Also the problem may=20
be related to turning on the read-only filesystem feature but again I=20
don't remember.

Again consider making incremental changes.

https://github.com/openbmc/doc/blob/master/yocto-development.md

https://github.com/openbmc/docs/tree/master/development


>ERROR: Task
>(/home/shilaimao/bmc/romulus-bmc/openbmc/meta-phosphor/recipes-phosph
>or/images/obmc-phosphor-initramfs.bb:do=5Frootfs) failed with exit code
>'1'   how to remove this update=5Fudev=5Fhwdb error?  I also install the
>sdk from the development doc, it can make only zImage files. the
>default make. and I also need the rootfs. so I can debug by the bootm
>kernel rootfs dtb.  but how to separated changed and  compile the
>rootfs?  from the Romulus dts files, it is no big difference, so I
>think it should startup based on some changes.  if u have time please
>help me answer this questions.  thanks Steven    =20


I tend to do specific low level coding and not the full stack, so I will=20
ask you to read and hope others can help with your future questions.

>
>
>At 2020-04-20 11:04:59, "Milton Miller II" <miltonm@us.ibm.com>
>wrote:
>>On April 19, 2020 around 07:15PM in some timezone, shi wrote:
>>
>>>Subject: [EXTERNAL] how run =EF=BC=88export
>>>TEMPLATECONF=3Dmeta-ibm/meta-romulus/conf =EF=BC=89 on evb2500 board=20
>>>
>>>
>>
>>>I am now focus on the BMC=EF=BC=8E
>>>Build based on the openbmc https://github.com/openbmc/openbmc, then
>>>want to run on evb2500 board of aspeed, when download the fitimage
>by
>>>tftpserver then bootm, always stuck on the starting kernel. The
>>>hardware also 2500 type. Why not startup. How I changed the code
>can
>>>boot up?   Is there any clue on this?=20
>>>
>>
>>Consder trying the evaluation board config, as ranier will have ncsi
>
>>configured for the network and could easily have different configs=20
>>such as GPIO assignments.
>>
>>The ast2500 evb config is in the tree below:
>>
>>https://github.com/openbmc/openbmc/tree/master/meta-evb/meta-evb-asp
>eed/meta-evb-ast2500
>>
>>>
>>>Thanks
>>>Steven

milton

