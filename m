Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2D20FD11
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 21:52:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xFPZ1JXzzDqfJ
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 05:52:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xFNn45myzDqlR
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 05:51:37 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UJWFF6195300
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 15:51:34 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3203vpgwh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 15:51:33 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 30 Jun 2020 19:51:32 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 30 Jun 2020 19:51:27 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020063019512622-511305 ;
 Tue, 30 Jun 2020 19:51:26 +0000 
In-Reply-To: <02d91b6a-c2ba-0239-a62e-a680f97bb009@linux.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Date: Tue, 30 Jun 2020 19:51:26 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <02d91b6a-c2ba-0239-a62e-a680f97bb009@linux.ibm.com>,
 <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
 <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 2719
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20063019-7691-0000-0000-00000D436A4B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000023
X-IBM-SpamModules-Versions: BY=3.00013383; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01399165; UDB=6.00749196; IPR=6.01181453; 
 MB=3.00032795; MTD=3.00000008; XFM=3.00000015; UTC=2020-06-30 19:51:30
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-06-30 16:27:04 - 6.00011546
x-cbparentid: 20063019-7692-0000-0000-000024F96F44
Message-Id: <OF5EABA8F0.4EA96F13-ON00258597.006CE4F4-00258597.006D1458@notes.na.collabserv.com>
Subject: RE: OpenBMC health statistics
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_06:2020-06-30,
 2020-06-30 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Khetan,
 Sharad" <sharad.khetan@intel.com>, "Matuszczak, 
 Piotr" <piotr.matuszczak@intel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06/30/2020 around 01:54PM in some timezone, Joseph Reynolds wrote:
>On 6/29/20 3:20 PM, Vijay Khemka wrote:
>> We can have a folder "how to" under guidelines and this document
>should fit there.
>
>That makes sense to me.  I want document stuff for both system=20
>integrators (who put together firmware images) and system
>administrators=20
>(who perform BMC initial configurations, oversee BMC operation,
>etc.). =20
>We also need a place for documentation for things like how to use=20
>BMCWeb's mTLS feature which cuts across system integration and=20
>administration.=20

Speaking of which, we added the document but didn't link to it in
either the top level or the user guide section so you have to=20
stumble across it.

https://github.com/openbmc/docs/blob/master/security/TLS-configuration.md

Maybe here? https://github.com/openbmc/docs/#openbmc-usage

> Details:
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fib=
m-2
>Dopenbmc=5Fdev=5Fissues=5F1531&d=3DDwIDaQ&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=
=3Dbvv7AJEE
>CoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DXCL8eI954f4equF5mjno80k9RtQpNBr
>kFoWrttLHUF8&s=3DfzPBC2=5FzSgHFF0Ku=5F87QXPBll5CYqC9LTDO9BDVCvLQ&e=3D=20
>
>- Joseph

milton

