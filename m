Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11218A9EB
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 01:44:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jSpd3m75zDr4Q
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 11:44:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jSnt5PKKzDqmJ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 11:43:45 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J0WAKn132141
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 20:43:42 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu71ag0hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 20:43:42 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 19 Mar 2020 00:43:41 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 19 Mar 2020 00:43:39 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020031900433842-949763 ;
 Thu, 19 Mar 2020 00:43:38 +0000 
In-Reply-To: <64CAA2C9-5628-414C-BC95-D4E6970CA285@linux.vnet.ibm.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: vishwa@linux.vnet.ibm.com
Date: Thu, 19 Mar 2020 00:43:38 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <64CAA2C9-5628-414C-BC95-D4E6970CA285@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 6479
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20031900-3975-0000-0000-000001ECF89F
X-IBM-SpamModules-Scores: BY=0.000002; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.101207
X-IBM-SpamModules-Versions: BY=3.00012774; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01349682; UDB=6.00719876; IPR=6.01132092; 
 MB=3.00031289; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-19 00:43:41
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-18 21:52:14 - 6.00011134
x-cbparentid: 20031900-3976-0000-0000-0000359E1430
Message-Id: <OF1ACC918B.335C6EA9-ON00258530.0003DCF3-00258530.0003FEBF@notes.na.collabserv.com>
Subject: RE: OpenBMC GUI: Date and time settings
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
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
Cc: openbmc@lists.ozlabs.org, ryanarnellibm@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vishwa,

> On the NTP, I see it makes =E2=80=9Ctime.google.com=E2=80=9D as mandatory=
 ( since I could not edit ) and lets only the secondary to be editable. Is =
that intentional or just that I could not edit =E2=80=9Ctime.google=E2=80=
=9D ?.
>
> If it=E2=80=99s mandatory, then I would suggest we don=E2=80=99t make it =
so unless there is a reason.

=20
That is just a static image prototype with hotspots, it is not coded. The u=
sers will be able to enter any NTP server they want.
=20
=20
=20

