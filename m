Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2C11BF6A
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 22:52:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y9dP6k1dzDqtZ
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:52:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y9cg2pyFzDqZq
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 08:51:43 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBLFgZC040534
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 16:51:36 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtf8jfa5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 16:51:36 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 11 Dec 2019 21:51:33 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Dec 2019 21:51:26 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019121121512502-928645 ;
 Wed, 11 Dec 2019 21:51:25 +0000 
In-Reply-To: <HK0PR02MB27870548BFF1A91BC86ADC19F85A0@HK0PR02MB2787.apcprd02.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
Date: Wed, 11 Dec 2019 21:51:24 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <HK0PR02MB27870548BFF1A91BC86ADC19F85A0@HK0PR02MB2787.apcprd02.prod.outlook.com>,
 <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
 <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <b13a3d03-333b-e5b7-b6b1-28159f233a2d@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 46423
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19121121-8889-0000-0000-0000015886F1
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.243341
X-IBM-SpamModules-Versions: BY=3.00012227; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01302969; UDB=6.00692002; IPR=6.01085253; 
 MB=3.00029928; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-11 21:51:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-11 20:12:49 - 6.00010753
x-cbparentid: 19121121-8890-0000-0000-000001F1B6DA
Message-Id: <OF5A9152F5.0E07A908-ON002584CD.00770A3F-002584CD.0078102F@notes.na.collabserv.com>
Subject: RE: BMC update via TFTP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_07:2019-12-11,2019-12-11 signatures=0
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.com>,
 Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/10/2019 around 10:57PM in some timezone, Bonnie Lo/WYHQ/Wiwynn  wrote:
>In my understanding, the BMC firmware update flow is as below:
>1. Trigger reboot=20
>2. Systemd stop all service
>3. Unmount file system
>4. image is in /run/initramfs=20
>5. Do the flashcp command to update the flash=20
>
>If there is any misunderstanding, please correct me.
>
>Based on the discussion with Neeraj.
>We want to be able to update BMC firmware without having to trigger
>the BMC reboot command before the system do flashcp command.
>It means that we can do the flashcp first. If the flashcp command
>complete and success, then we do the reset manually.
>Is it workable on current upstream code?
>If not, why? I means is there any advantage to trigger the reboot
>before we do the flashcp.

The init script in the initramfs takes options from u-boot variables=20
and the kernel command line.  Some of the options allow that the
read-only and files in the read-write partition are copied into RAM
before the file systems are mounted, which allows the BMC to be
operational while the new flash image is transfered and written into
the flash.  Note that if a reboot is triggered for some reason you=20
can still end up needing additional recovery.

This state can be initiated by "prepare for update" mentioned in
the REST documentation for code-update.  I don't think it can be
initiated in the current Redfish.

The flow is:

1. Trigger "prepare for update"=20

    - This uses the variable cleared every boot to copy=20
       rw partition content to ram (tmpfs), and the mtd ro partition=20
       ram (as a file then mounted by loop device).

2. Upload images as before

    - They will be signature checked as compiled then coped to /run/initram=
fs

3. run /run/initramfs/update

  - This script will look at /proc/mounts and see that the mtd-ro and mtdrw
   partitions are not present, and proceed to flashcp the files to the flash

  - WARNING: do not try to hide the mounts by unmounting the mtd ro and
   rw partitions.  The root file system is overlayfs and will retain write =
access
  to the flash, and your BMC will crash


4. Initiate reboot at leisure to move to new code level

  - the contents of the tmpfs with the overlay files will be copied back to=
=20
    the rwfs file system in the mtd partitions

Note:  This is not the normal operation in part because the rwfs is
in tmpfs and therefore any panic or power cut will result in all modificati=
ons
to the rwfs being lost.


If needed I can lookup the exact variable names and contents to=20
communicate the desired maintenance actions from the phosphor=20
init script.  There are two variables, one for persistent settings,=20
one for transient settings which a script clears each time.   One
can also customize or disable this features by adding additional
customization files into the initramfs recipe.=20

milton


>>Thanks,
>Bonnie
>

