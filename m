Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE832F2F8
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 19:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc5W5vT3z3dHs
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 05:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLExkG+r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MLExkG+r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsc5H6W71z3dCR
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 05:41:23 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125IWbwh098653
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 13:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=d6NQYvZ/LgDT9/Se2/mEMr+gGLieyz/bUOm562RVFC8=;
 b=MLExkG+riqVamzcc9pzloQ5gbva8KQaUznVLQCdKWO4tmPF7FJmxhxJ8ZXWO2RyL82N4
 GgI7HvXEMLT2AEWy3tudFNt41ZWp6GSXRRgu+3zWOpS0y0YkqvEWoD2sk6UbnpjrigVQ
 lvD2lBUDiCo9Q1Omb0KjfB9Vba8LXcH1I0SZh5W/IXOhJhon9f7gBXOiPKZqFFwHPPUy
 jl1qdwPTnJiHTq6F2gCtnyBVdE4x+t0AUbJH8m2wshgHXp8KUiZeote2qSqjf7gAS7G3
 Oe8NeavqFygun9VgN3IVIa2qqVu+rkmpWtAhp8k1E19W313YsgtCuopF76fS+hdHy4z6 Qg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 373rn82nkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 13:41:21 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 5 Mar 2021 18:41:20 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 5 Mar 2021 18:41:16 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021030518411565-690102 ;
 Fri, 5 Mar 2021 18:41:15 +0000 
In-Reply-To: <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Ed Tanous <ed@tanous.net>
Date: Fri, 5 Mar 2021 18:41:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>,
 <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 16171
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21030518-3633-0000-0000-000003B64A89
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.048380
X-IBM-SpamModules-Versions: BY=3.00014826; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515835; UDB=6.00818898; IPR=6.01298352; 
 MB=3.00036306; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-05 18:41:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-03 13:27:35 - 6.00012344
x-cbparentid: 21030518-3634-0000-0000-00002C9A4E07
Message-Id: <OF78757961.7D9FD99E-ON0025868F.0066A7C0-0025868F.0066A7C9@notes.na.collabserv.com>
Subject: RE: No option to delete SSL certificates
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_13:2021-03-03,
 2021-03-05 signatures=0
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayanth Othayoth <ojayanth@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On March 05, Ed Tanous wrote:
>On Fri, Mar 5, 2021 at 9:43 AM Gunnar Mills
><gmills@linux.vnet.ibm.com> wrote:
>>
>> On 3/4/2021 8:52 PM, Mohammed.Habeeb ISV wrote:
>> > In webui-vue , SSL certificates has only replace option. Delete
>button
>> > is greyed out.
>> >
>> > Is there any reason for not providing delete option?
>
>I can't explain why the TrustStore certificate isn't deletable, that
>seems like a bug in webui-vue.
>
>The HTTPS certificate isn't deletable because that would effectively
>disable the HTTPS interface entirely, which seems like a problem,
>given that you're currently using the HTTPS interface to communicate
>with the BMC.  Because of that, we only support replacing the
>certificate.  In a perfect world, we could regenerate a new
>self-signed certificate if the old one was deleted, but nobody has
>written that code so far as I'm aware, I suspect because it's just as
>easy to replace the certificate with your own self-signed cert.

There was also discussion (but I don't remember if it was email=20
or in a gerrit review) that deleting invalid certificates was=20
a bad idea when they are invalid for the current time because=20
sometimes the issue is the loss of the real time clock, and we=20
don't want to delete what should be a good cert and replace with=20
a self signed one just because the RTC is wrong.

Deleting the current cert can cause issues with certificate=20
pinning in the browser.

>>>
>> Looking at the code, I believe the only certificate that can be
>deleted
>> in bmcweb is the Trust Store Certificate
>>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fbmcweb=5Fblob=5Ffeaf15005555a3099c7f22a7e3d16c99ccb40e72=5Fredfish-2D=
cor
>e=5Flib=5Fcertificate-5Fservice.hpp-23L1347&d=3DDwIBaQ&c=3Djf=5FiaSHvJObTb=
x-siA
>1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DGvsftEwmNCL39tSW
>9RGR21w8wiSqAcgIUtjTN26kt-I&s=3D4FlXy5=5F5pFttulDVBgxnYBpZTTWQNlWVwxr8jkW
>aJBc&e=3D=20
>>
>> And this is reflected in the webui-vue code:
>>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fwebui-2Dvue=5Fblob=5F4da9495925d601bb4edfb8b007d5b54792b7491b=5Fsrc=
=5Fview
>s=5FAccessControl=5FSslCertificates=5FSslCertificates.vue-23L183&d=3DDwIBa=
Q&c
>=3Djf=5FiaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4
>&m=3DGvsftEwmNCL39tSW9RGR21w8wiSqAcgIUtjTN26kt-I&s=3Dpc4yE=5FOEI6ePP--E=5F=
F8p
>Shj3Ve0pOiAANBMLi8YPeHY&e=3D=20
>>
>> I am not sure if there is a reason for not supporting deleting
>other
>> certificates or just no one has done the work.
>>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fbmcweb=5Fcommit=5F07a602993f1007b0b0b764bdb3f14f302a8d2e26&d=3DDwIBaQ=
&c=3D
>jf=5FiaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&
>m=3DGvsftEwmNCL39tSW9RGR21w8wiSqAcgIUtjTN26kt-I&s=3DiAukDzsq2iqjh1UJw1y0b
>Lv7ci9m2WLqKdF634OdPs8&e=3D=20
>>
>> Thanks,
>> Gunnar

milton

