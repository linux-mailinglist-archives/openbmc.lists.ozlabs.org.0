Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB1176A11
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 02:35:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WfjH1V7nzDqdn
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 12:35:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WfgZ6nZ4zDqhk
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 12:34:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0231UV3p004878
 for <openbmc@lists.ozlabs.org>; Mon, 2 Mar 2020 20:34:09 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfhqq9mh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2020 20:34:09 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 3 Mar 2020 01:34:09 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 3 Mar 2020 01:34:06 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020030301340569-1125266 ;
 Tue, 3 Mar 2020 01:34:05 +0000 
In-Reply-To: <tencent_50CE0F4E75A8AC62FF7879B0299213180707@qq.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-2022-JP?B?GyRCRm5MbiVgJWslNyUoJWklNBsoQg==?=" <1181052146@qq.com>
Date: Tue, 3 Mar 2020 01:34:06 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <tencent_50CE0F4E75A8AC62FF7879B0299213180707@qq.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 23855
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20030301-3649-0000-0000-00000254A4E1
X-IBM-SpamModules-Scores: BY=0.034212; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.047799
X-IBM-SpamModules-Versions: BY=3.00012677; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01342101; UDB=6.00715350; IPR=6.01124490; 
 MB=3.00031052; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-03 01:34:08
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-03 00:07:47 - 6.00011072
x-cbparentid: 20030301-3650-0000-0000-00004F6312DA
Message-Id: <OFC06EDD92.C74E64C3-ON00258520.0006EF08-00258520.00089D80@notes.na.collabserv.com>
Subject: Re: What does openbmc system do after update BMC Firmware and taps
 reboot?
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_09:2020-03-02,
 2020-03-02 signatures=0
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Around 03/02/2020 01:30AM in some timezone,  "=E5=8D=97=E9=87=8E=E3=83=A0=
=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9=E3=82=B4" <1181052146@qq.com> wrote:

>Greetings:
>
>I am learning how openbmc update BMC firmware. I am following the
>guide
>"https://github.com/openbmc/docs/blob/master/code-update/code-update.
>md" to update BMC Firmware. It works well for me.
>But I still do not know, why in step 7 should I reboot, and what
>reboot do?

The low level workings was described better in the deprecated API=20
documentation; as it says only the API is deprecated and not the=20
underlying mechanism. =20

https://github.com/openbmc/docs/blob/master/code-update/code-update-depreca=
ted.md#preparing-for-bmc-code-update

>Later I found in
>"https://github.com/openbmc/docs/blob/master/code-update/code-update-
>diagrams.md", which tells that:
>        [*] In a static layout configuration, the images are stored
>in RAM and the content is written to flash during BMC reboot.=20
>        Reference the update and shutdown scripts provided by
>initrdscripts



>I am using a static layout. And I found two scripts named "shutdown"
>and "update" in "/run/initramfs/". So I thought it is that, the
>update applications put the firmware image in /run/initramfs/ and
>when I tap reboot, by some means the "update" script runs and the
>"update" script using "flashcp" command to write the firmware image
>to the /dev/mtd. Is that right?

Yes, the shutdown script is invoked by systemd and undoes the overlay=20
mount.  This happends for both reboot and shutdown.

See the third bullet here

https://www.freedesktop.org/wiki/Software/systemd/InitrdInterface/


>What happens after I tap "reboot", and who calls the "update" script,
>and how it calls the "update" scripts?

The shutdown script finishes unmounting the overlay, from which initrd
was running.  The shutdown script just runs using the busybox and libc.
The shutdown scripts notices the files in /run/initramfs and calls the
update script.


There is a big reason to do this at shutdown:   Its very unwise to try=20
to run off a file system while the file system raw media is being=20
replaced.

For a static layout, there is only flash space for one copy.  The init
script can make a separate copy (the deprecated API doc explains how)=20
and then you can erase and flash at runtime (with full services and
network to monitor progress).  The update script will automatically=20
detect the code-update mode; don't try to fake it out you will only
crash the machine.

If you want your bmc to be online set update mode and reboot (it gets=20
unset for the next boot every boot).  (I've seen slow flash take=20
30 minutes to erase; others take just few minutes).

>Can someone tell me? Thanks a lot!

Feel free to ask more questions I try to answer questions in this area
daily. (I'm the author of the low level mechanism; the code-update API=20
was written by others).

>
>Best Regards!
>Liu Hongwei
>

milton

