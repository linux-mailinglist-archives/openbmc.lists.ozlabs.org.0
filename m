Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F36505A735
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 00:53:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bBqw2YzzzDqxq
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 08:53:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bBqP4xCpzDqxG
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 08:52:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SMqFBL104359
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 18:52:30 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tduxy05rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 18:52:29 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 28 Jun 2019 22:52:28 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Jun 2019 22:52:24 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019062822522324-846473 ;
 Fri, 28 Jun 2019 22:52:23 +0000 
In-Reply-To: <CAO=notxU2_mJYSRVwHa=njcgXdVy+v_iUjMAmL-tj17PbN2Vcg@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 22:52:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAO=notxU2_mJYSRVwHa=njcgXdVy+v_iUjMAmL-tj17PbN2Vcg@mail.gmail.com>,
 <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
 <87653f09ac5f171ad42bb118e64ba058@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 40407
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19062822-5525-0000-0000-00000034E79B
X-IBM-SpamModules-Scores: BY=0.031236; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.077618
X-IBM-SpamModules-Versions: BY=3.00011348; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224678; UDB=6.00644594; IPR=6.01005870; 
 MB=3.00027512; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-28 22:52:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-06-28 21:25:29 - 6.00010103
x-cbparentid: 19062822-5526-0000-0000-0000005909A5
Message-Id: <OF1470AD7B.0B11CFCF-ON00258427.007DA575-00258427.007DA57D@notes.na.collabserv.com>
Subject: Re:  Re: phosphor-ipmi-flash: Next Iteration of Control
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_11:, , signatures=0
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On  06/28/2019 at 05:21PM in some timezone,  Patrick Venture wrote:
>On Fri, Jun 28, 2019 at 12:56 PM Adriana Kobylak <anoo@linux.ibm.com>
>wrote:
>>
>> On 2019-06-28 13:37, Patrick Venture wrote:
>> > I was thinking, since I'm going to extend phosphor-ipmi-flash to
>> > support updating a BIOS -- it might make sense to make it more
>general
>> > further.  I was thinking about how right now, there are default
>> > services you can implement for each thing, prepare, verify,
>update,
>> > and currently we don't install them (although I was going to
>implement
>> > a default prepare service).
>> >
>> > I was thinking that possibly adoption would be easier if they
>were
>> > targets instead of service files directly and then we'd always
>install
>> > the targets:
>> >
>> > - phosphor-ipmi-flash-prepare-update.target (always called when
>> > starting up a process each time a new process is started)
>> > - phosphor-ipmi-flash-verify-bmc.target
>> > - phosphor-ipmi-flash-update-bmc.target
>> >
>> > Then a user can just install their services into the targets and
>not
>> > have to really worry about doing anything more.  I think it's
>equally
>> > as usable as before, but ... I don't know.  This way, it always
>> > installs the targets.
>>
>> Yeah I think it'd make it more obvious to have the targets
>installed
>> than
>> having optional services. Also this could allow services to be
>started
>> in parallel, like verifying 2 different images at the same time
>> triggered
>> by the target (just thinking out loud).
>
>Yeah, someone mentioned needing to run additional services, and
>although they could chain them from the initial service, might be
>easier with just having a target.  So, I'm going to roll that patch
>into review today.  It'll require some recipe changes, but otherwise
>I
>don't anticipate any issues.

Unfornately a simple target may be difficult:  Currently=20
prepare-for-flash-update may curretnly set a firmware variable that=20
requires a BMC reboot to take effect.  In this mode, the initramfs=20
copies the file system to RAM during startup so theat the flash is=20
available for writing the replacement image.  (Doing this step=20
allows the flash to be written while full services are written).

I suppose this could be turned into a target, but it would imply=20
a BMC reboot loosing other sessions and may be unexpected.  The=20
existing targets would need to be modified to recognise the=20
system is in this state and NOP (currently it can not be=20
deterimined if you are currently in the state otther than=20
unreliably peeking at /proc/mounts).

Not to say having the targets is a bad idea, just that it might=20
require a bit more work.

milton

>>>
>> >
>> > I was thinking about this further and was thinking about how
>> > everything is compiled into the application,
>dynamically/configurable,
>> > but compiled in.
>> >
>> > If it's going to start supporting BIOS, and then later other
>firmware,
>> > perhaps the list of Blobs and their associated actions should be
>> > configured via json.  There is a limitation to this though that
>if
>> > that's the case, then the ActionInterface used for different
>things
>> > would really just become a SystemdActionInterface and we'd use
>> > services to control everything.  In theory, the json could
>specify the
>> > ActionInterfaceType from a list and the parameters after that
>point
>> > would be per type..., but I think that's getting a bit
>easy-to-break.
>>
>> Yeah, maybe we wait to see if anybody would prefer not having to
>compile
>> the
>> tool with the available options.
>
>Yeah.  I'll play around with it a bit and submit patches next week.
>Still need to do more testing, and it's missing some tests :)
>
>>
>> >
>> > Those are just some thoughts I had today.
>> >
>> > Regards,
>> > Patrick
>
>

