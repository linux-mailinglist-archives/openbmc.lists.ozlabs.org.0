Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A02730E4
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:33:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBPF19rHzDqWb
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:33:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZphSn7CJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBJ446cKzDqjM
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:29:07 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LH2wlF086347
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 13:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=n5KSZPPwqMa/ow2NizFUG/wQ8PTqqkuc6jx6nTZxbOA=;
 b=ZphSn7CJqPUx8w5Syt25HnlC6GAlju4jBju7SVY29x17rurOwFWjVFW1041Y54jqk2/v
 f472Rph2LIt37PBOccCv4SwT+WiNpBWzDAWE1m/4OsOE1k3j3Zzs5Set7+GWEmFZL8lJ
 CLeTDop9pvTxU+xd/hneaFVLH36vDW7UEbnmi4yHX9GQbFel9VaZde78AeWxCrsuSBHm
 xQiWy4PkZH0Ts6yrxvo3tRskV2pwQPOvt33IxtxtOc9Kka3549Pk4v7NAksDwSvsBacv
 oaoZOXlhzFGpnLP6s8WLKFnm/fV/KsCI7mCU9xGyUtxloRyBwSi42krcg3JmHNZD5WRr 3A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pyyth4a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 13:29:03 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Mon, 21 Sep 2020 17:29:02 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 21 Sep 2020 17:29:00 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020092117290001-575712 ;
 Mon, 21 Sep 2020 17:29:00 +0000 
In-Reply-To: <CACWQX83ayt4eBcfH9wi87hz4-YMGqTC1=c=WdOzLcv_0wQ6mDg@mail.gmail.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: ed@tanous.net
Date: Mon, 21 Sep 2020 17:28:59 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACWQX83ayt4eBcfH9wi87hz4-YMGqTC1=c=WdOzLcv_0wQ6mDg@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 57507
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20092117-3975-0000-0000-000003094B63
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.009304
X-IBM-SpamModules-Versions: BY=3.00013869; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01438132; UDB=6.00772611; IPR=6.01220818; 
 MB=3.00034169; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-21 17:29:01
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-21 15:51:38 - 6.00011866
x-cbparentid: 20092117-3976-0000-0000-000076675067
Message-Id: <OF91B43372.8E81A7D9-ON002585EA.0056113C-002585EA.0060099C@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: Proposal to make webui-vue the standard
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_06:2020-09-21,
 2020-09-21 signatures=0
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
Cc: openbmc@lists.ozlabs.org, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> resulting in a decrease of development activity on phosphor-webui over t=
he past six months.
=20
 > Ironically, you sent this out on the same day Vue 3.0 was announced;
 > It looks like the next 2.X Vue release goes to 18 month support.
 > Hopefully Vue 2.0->3.0 porting isn't the same thing as Angular 1.X ->
 > 2.X.

It will not require a complete rewrite. Google abandoned AngularJS and Angl=
uar was a complete rewrite,
which is one reason they renamed the framework from Angular to AngularJS. W=
e can start planning for it
now, but many of the supporting libraries are still in beta with a plan of =
being released by the end of
2020.

>> Loading webui-vue from the BMC causes content-security-policy errors (#3=
2)
=20
 > This is important, and having the UI load without errors or warnings
 > speaks to the quality of the UI as a whole, and also allows finding
 > regressions much easier.  Looking forward to when this lands.

Agreed. I am researching this now.

>> The last 2 identified issues, we are looking for community help but migh=
t take these up ourselves one day:
>>
>> Mutual TLS (#30)
=20
 > This is used, and I think important overall for the security posture
 > of OpenBMC.  I would like to avoid regressing the default security of
 > OpenBMC in this regard.

Agreed, we will be adding the IsAuthenticated cookie check.

>> CSRF allow list (#29)
=20
 > Do you think the person that checked in the code around the security
 > bug could take a look at it?  It looks like Derick wrote the commit
 > that needs fixed.
 > https://github.com/openbmc/webui-vue/commit/e080a1a7593e83a49d623ffdd452=
fd0e1c617889#diff-d33bbe646af7d8d45caaeb27b20b4813=20

Yes, we are looking into this. I am still not quite clear what the CSRF "al=
lowlist"
is can you point me in the right direction in phosphor-webui?

=20=20=20
=20=20=20

