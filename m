Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E724F180
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 05:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZcsJ4bGDzDqCb
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 13:23:32 +1000 (AEST)
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
 header.s=pp1 header.b=TC7+lwfj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZcrX089gzDqDc
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 13:22:51 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07O31drB110638
 for <openbmc@lists.ozlabs.org>; Sun, 23 Aug 2020 23:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=vzSk0fJ8MdC36lgK2fRCDU7CRR1wb/HNig0nphNfUf0=;
 b=TC7+lwfjnSSdU3Hox2pa8qOTCGFbAo4SR1v5KQPrtMWb0FgjbwYrJQyEs+FevdFMXzvS
 lPLh2zWcBNG2ohB1cX6Y06xkI38U4H2qf2+3ByAtWD785uawWoEXD8QTC6XFtNVCC1sr
 GLRmYTK1Ui18PwnjgkWd4QmKfyYs9Wm6l1h7R6uARn5iqToKtJ0xl2Qyk0Phi9QsOVrC
 y5X/OJ5Skod+wKq8ZLT3xboEvzAxo57AdE+5ykckqTWx1Stmb9aO8ZYnZ6St/YwBRvJr
 zKhXxm6eDdk4HnXjeDTS4+2CB19V1thbIhZ2lW3B4T5/54FFUB6q/DNkPe5g0ktOA1zg IQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3344yxgnk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 23 Aug 2020 23:22:47 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 24 Aug 2020 03:22:46 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 24 Aug 2020 03:22:41 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020082403224163-531768 ;
 Mon, 24 Aug 2020 03:22:41 +0000 
In-Reply-To: <OF0D96B592.C63EA11D-ON002585CE.0011F8B0-002585CE.0012716F@LocalDomain>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mike Jones <proclivis@gmail.com>
Date: Mon, 24 Aug 2020 03:22:40 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF0D96B592.C63EA11D-ON002585CE.0011F8B0-002585CE.0012716F@LocalDomain>,
 <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 51103
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20082403-6283-0000-0000-000003A72CA8
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.456565
X-IBM-SpamModules-Versions: BY=3.00013704; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01424489; UDB=6.00764527; IPR=6.01207216; 
 MB=3.00033671; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-24 03:22:45
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-24 02:45:39 - 6.00011758
x-cbparentid: 20082403-6284-0000-0000-000002792F85
Message-Id: <OFA1F61B0D.4E9452AB-ON002585CE.00128E43-002585CE.00128E46@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: Re:  Server Power On mystery
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_01:2020-08-21,
 2020-08-24 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Resend as plain text.

>On August 21, 2020, Mike Jones wrote:>I am trying to understand how
>the Server power button in the webui
>>works.
>>
>>As before, using raspberry pi, and I=E2=80=99ll leave project links at the
>>end for anyone that wants to use them. Things work up to monitoring
>>voltages. Note the conf project has a phosphor branch for the full
>>monty.>>To reverse engineer, I setup: dbus-monitor =E2=80=94system >
>someFile.log
>>
>>There is a message for systemd1.Manager; member=3DStartUnit and best I
>>can tell, somehow this gets routed to systemd to start some service
>>or run some exe. I see this mentioned in the dbus transactions:
>>
>>"obmc-host-start@0.target=E2=80=9D
>>
>>And that is in /lib/systemd/system and depends
>>on obmc-host-startmin@0.target, but that does not depend on any
>>service. So that is a dead end. It also depends on a reboot
>attempts,
>>but I think that is not responsible for power on/off.
>>
>>Then there are chassis services, but I cannot find a link from
>>obmc-host-start@0.target to objc-chassis-poweron@0.target.
>
>
>
>>>In this
>>doc: https://github.com/openbmc/docs/blob/master/architecture/openbm
>c
>>-systemd.md
>>
>>It shows:
>>
>>
>>ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
>>op-power-start@0.service op-wait-power-on@0.service>>But when I =E2=80=9C=
ls=E2=80=9D
>that path, the above dependencies are not there.
>>There is only a dependency on phosphor-fan-presence-tach@0.service
>>
>>There is some state service that lead to things with xzy paths, and
>I
>>eventually found /run/systemd/units. These have file names starting
>>with =E2=80=9Cinvocation=E2=80=9D in the names and link to GUID like node=
s that
>don=E2=80=99t
>>=E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how those work=
. Is there
>>some kernel driver that works like sysfs so that these nodes are not
>>traditional files?
>>
>>What I am trying to understand is two things:
>>
>>- Interaction with the power regulator
>>- Interaction with the host cpu
>>
>>So my hope is someone can connect the dots of the path from the dbus
>>to systemd through the targets to a service executable doing the
>work
>>so I can try to replace them with:
>>
>>- Something that turns the regulators on/off, with pmbus in this
>>case.
>>- Something that can behave like a host to keep the system happy
>like
>>a real system.
>
>
>
>Hi.  There is some design documentation here
>
>https://github.com/openbmc/docs/blob/master/designs/state-management-
>and-external-interfaces.md
>
>and that links to phosphor-state-manager which has a lot of the units
>
>that kick off power and state transitions.
>
>
>The op-power-start are for systems following the OpenPOWER reference=20
>designs.  The regulators are sequenced by an external microcontroller
>
>based on the state of a POWER_ON gpio from the BMC and a return=20
>PGOOD to indicate the state.  There are also other op- prefixed units
>that=20
>initiate the host processor initialization (after the units check
>that fans are=20
>running as you found).=20=20
>
>There is also a watchdog that is started when the host is started and
>
>pinged and stopped via IPMI.
>
>If you are prototyping for a x86 system, there are alternative=20
>power implementations where the gpio toggles to represent a=20
>main power button push and their start cpu sequences.  I think=20
>there are also arm systems but don't know what they are using=20
>for host interaction.
>
>I hope this advances your investigation and learning.
>
>milton
>
>>>Mike
>>
>>My repos
>>=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>>
>>https://github.com/Proclivis/meta-pmbus-raspberrypi.git
>>https://github.com/Proclivis/meta-pmbus-phosphor.git
>>https://github.com/Proclivis/conf-openbmc-adi.git
>>
>>The monitor messages for StartUnit
>>=E2=80=94=E2=80=94=E2=80=94
>>
>>method call time=3D1598039669.247458 sender=3D:1.48 ->
>>destination=3Dorg.freedesktop.systemd1 serial=3D33
>>path=3D/org/freedesktop/systemd1;
>>interface=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
>>   string "obmc-host-start@0.target"
>>   string "replace"
>>method call time=3D1598039669.276170 sender=3D:1.3 ->
>>destination=3Dorg.freedesktop.DBus serial=3D775
>>path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>member=3DGetConnectionUnixUser
>>   string ":1.48"
>>method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus ->
>>destination=3D:1.3 serial=3D4294967295 reply_serial=3D775
>>   uint32 0
>>method call time=3D1598039669.280376 sender=3D:1.3 ->
>>destination=3Dorg.freedesktop.DBus serial=3D776
>>path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>member=3DAddMatch
>>   string
>>"type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/freedesktop/
>D
>>Bus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChanged',arg0
>=3D
>>':1.48'"
>>method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus ->
>>destination=3D:1.3 serial=3D4294967295 reply_serial=3D776
>>method call time=3D1598039669.280701 sender=3D:1.3 ->
>>destination=3Dorg.freedesktop.DBus serial=3D777
>>path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>member=3DGetNameOwner
>>   string ":1.48"
>>method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus ->
>>destination=3D:1.3 serial=3D4294967295 reply_serial=3D777
>>   string ":1.48"
>>signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null
>>destination) serial=3D778 path=3D/org/freedesktop/systemd1;
>>interface=3Dorg.freedesktop.systemd1.Manager; member=3DUnitNew
>>   string "obmc-host-start@0.target"
>>   object path
>>"/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2etarget"
>>signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null
>>destination) serial=3D779 path=3D/org/freedesktop/systemd1;
>>interface=3Dorg.freedesktop.systemd1.Manager; member=3DJobNew
>>   uint32 1105
>>   object path "/org/freedesktop/systemd1/job/1105"
>>   string "obmc-host-start@0.target"
>>method return time=3D1598039669.280883 sender=3D:1.3 ->
>destination=3D:1.48
>>serial=3D780 reply_serial=3D33
>>   object path "/org/freedesktop/systemd1/job/1105"
>>signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null
>>destination) serial=3D34 path=3D/xyz/openbmc_project/state/host0;
>>interface=3Dorg.freedesktop.DBus.Properties; member=3DPropertiesChanged
>>   string "xyz.openbmc_project.State.Host"
>>   array [
>>      dict entry(
>>         string "RequestedHostTransition"
>>         variant             string
>>"xyz.openbmc_project.State.Host.Transition.On"
>>      )
>>   ]
>>   array [
>>   ]

