Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0F332D51
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw2Mz5gdqz3cNd
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:32:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HWmH5xLR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HWmH5xLR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2Ml43Nkz30Jy
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 04:32:19 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129H4Ihk180500
 for <openbmc@lists.ozlabs.org>; Tue, 9 Mar 2021 12:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=mJrA+pfKdbvG1bsMdFN19dyYePnzPAy19jZ1hJiiYjQ=;
 b=HWmH5xLRR934h9A9Og+rokntBUap9TTGSvs2FxKbMiOVnxcxNp7EiSKaJXsNbPv0TC+a
 NHbuhlUUS5QQXTaJbJoV5maWjzHpbPbLFKuzNA6GakxGFE7XmVgi+dW2vDqWL8hKOnY+
 vJRQ96NuCbdHAkgvPijPIkD5yhz/Um/kfkjGIWrUemYufyArG/V4278xExgOUwI12oJx
 T5+tF57vclR4BHxXjAHuHraLSDRrJMeIV5zv+AiSwYYtoekQuUsWYO2YgFB5d8LnqiGp
 jGxMFuKQJ3ajw4PzcENFCzhwxgE1DczkPi6nJiHRwgxLSBAR84FzxhEtb2OCdgC+xqvI pw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37640jagca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 12:32:17 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 9 Mar 2021 17:32:17 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 9 Mar 2021 17:32:15 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021030917321478-612506 ;
 Tue, 9 Mar 2021 17:32:14 +0000 
In-Reply-To: <CACWQX81UROJhBGX4qAdu6J5xy9AHpVRLXKxR5TcXeKonj2o4Ng@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 17:32:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACWQX81UROJhBGX4qAdu6J5xy9AHpVRLXKxR5TcXeKonj2o4Ng@mail.gmail.com>,
 <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
 <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 55643
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21030917-1059-0000-0000-0000038F45B7
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.154811
X-IBM-SpamModules-Versions: BY=3.00014826; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515835; UDB=6.00818898; IPR=6.01298352; 
 MB=3.00036306; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-09 17:32:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-03 13:05:52 - 6.00012344
x-cbparentid: 21030917-1060-0000-0000-00008A02480A
Message-Id: <OF3047D3C3.44F407F4-ON00258693.005E67D0-00258693.006055F7@notes.na.collabserv.com>
Subject: RE: Making the "new repo" requests go faster
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_13:2021-03-08,
 2021-03-09 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On March 9, Brad Bishop wrote:
>On Tue, Mar 9, 2021 at 5:57 AM Brad Bishop
><bradleyb@fuzziesquirrel.com> wrote:
>> On Fri, Mar 05, 2021 at 11:02:24AM -0800, Ed Tanous wrote:
>> >On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net> wrote:
>> >>
>> >> In an effort to fix these issues and more, I'd like to propose
>> >> creating a new repository for a "new daemon" template.
>> >
>> >If anyone is following this thread still, patches have been pushed
>> >to
>> >https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41099   for the
>> >moment.  As they get closer to approval, I'd like to get a new
>> >template repo created to house the code contained in that patch,
>> >and
>> >CI setup on said repo if I could.
>>
>> Thanks Ed!
>>
>> The only reason I haven't created this already was I wasn't sure
>> what to
>> call it.  Any ideas on a name out there?
>
>No worries.  I don't really have a strong opinion on what it's called
>either.  The ideas I've had so far were "Sample app" or "example
>app".


One thing I wanted to point out when we are adopting this.

Git has a feature that it purposely checks the oldest ancestor of
the target repository against the source repository.  This is a
check that helps prevent pushing an unrelated tree.

From the git push man page:

       -f, --force
           Usually, the command refuses to update a remote ref that is not =
an
           ancestor of the local ref used to overwrite it. This flag disabl=
es
           the check. This can cause the remote repository to lose commits;
           use it with care.


If we give instructions to rebase the commits when creating a new=20
repository the new commit time and/or committer will cause a unique=20
hash and we will not defeat this check.

milton

