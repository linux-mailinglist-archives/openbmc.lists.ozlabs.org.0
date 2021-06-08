Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AF039EE46
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 07:44:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzfMW54cyz307F
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 15:44:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dFHI9kRr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dFHI9kRr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzfMD08D4z2xZp
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 15:44:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1585iRK2121647
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jun 2021 01:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : cc : to :
 mime-version : content-type : message-id : subject; s=pp1;
 bh=1EXH8Btq4jFXPQclKGz45foLybM6fvhy1agC16Jabe4=;
 b=dFHI9kRrR6HE3aZMGKBwNYlnI/6LHsgF/U9alTfcHnL3RIgKW07Vi+EFoqWyRoJqygKp
 NhlLDlZIHYCMFnx8fiXKRBbiatXo+CLly/xt7Xg7LFkNlcuvH5UfYPAK3JEm4Zupm221
 e8wS/sCFnxYoeohL4P1bXYP3JZJhW1KfoDMLCHu5f55xcXwLjin9kyn2zhru3sEER1rZ
 k4RUQjA0huirakn6J+bJFhIvY/Axu9o2HLXfmV970F/YjkGQcI6uCFh87xiHTXEy8NG4
 B7GsMqCqgArXKe796948pFy+9c8L+fpimALuHg7GiHiAtsyeEa0JOF/krqvNlYLfbgBH HQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3922nk803u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jun 2021 01:44:37 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 8 Jun 2021 05:44:36 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 8 Jun 2021 05:44:33 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2021060805443253-52530 ;
 Tue, 8 Jun 2021 05:44:32 +0000 
Date: Tue, 8 Jun 2021 05:44:33 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-2022-JP?B?SmVmZjkgQ2hhbigbJEJERD4+US0bKEJfQVNSb2NrUmFjayk=?="
 <Jeff9_Chan@asrockrack.com>
MIME-Version: 1.0
X-Mailer: IBM Traveler 10.0.1.2 Build 202002141540_20 on behalf of device with
 id
 mdm...eb5, type 1300 (maas360android) and description MaaS360-MaaS360
 Mail-Android:MaaS360-MaaS360 Mail-Android/7.41 at 20210608054433326 by
 DS-7f37afc32700[SendMail]
X-KeepSent: 3FF6FE3F:65D9CCA5-002586EE:001F8B23;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 48871
X-TNEFEvaluated: 1
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_2233702794038480"
x-cbid: 21060805-9463-0000-0000-000005D6B239
X-IBM-SpamModules-Scores: BY=0.291538; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.018606
X-IBM-SpamModules-Versions: BY=3.00015334; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01557696; UDB=6.00838381; IPR=6.01330253; 
 MB=3.00037203; MTD=3.00000008; XFM=3.00000015; UTC=2021-06-08 05:44:34
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-25 10:44:38 - 6.00012377
x-cbparentid: 21060805-9464-0000-0000-00006192B43B
Message-Id: <OF3FF6FE3F.65D9CCA5-ON002586EE.001F8B23-1623131073226@notes.na.collabserv.com>
X-Proofpoint-ORIG-GUID: Pzc5We1esN-HXlji4DdNOZQ3PriwxR2T
X-Proofpoint-GUID: Pzc5We1esN-HXlji4DdNOZQ3PriwxR2T
Subject: RE: OPENBMC ASRock Rack
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
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
Cc: manager@lfprojects.org,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


----_com.fiberlink.maas360.email_2233702794038480
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_2233702794802541"



----_com.fiberlink.maas360.email_2233702794802541
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

=0AJeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89=5FASRockRack)" wrote:=0A=0A> Hi M=
ilton,=0A	My user account in Github/Gerrit is Jeff9Chan, but registered CLA=
 account is 'Jeff Chan < Jeff9=5FChan@asrockrack.com>'=0A	Should I re-regis=
ter CLA info?=0A=0A=0AMilton> you should not need to reregister.=0A=0A=0ATh=
ere are three items here:=0A=0AYour name, which some projects like the Linu=
x kernel require to be your legal name. This would be how you are addressed=
 in person.=C2=A0=C2=A0=C2=A0=0A=0AYour email address, where we can send em=
ail and you will receive it=0A=0AYour GitHub account name, which we also us=
e in the OpenBMC gerrit gerrit.openbmc-project.xyz=0A=0A=0AYour git client =
needs your name and email but not your GitHub account name.=C2=A0=C2=A0=C2=
=A0That's only needed to setup GitHub and to login to gerrit.=C2=A0=C2=A0=
=C2=A0=0A=0AFor instance I sign with Milton Miller but don't need my GitHub=
 account=C2=A0=C2=A0mdmillerii=0A=0AMilton

----_com.fiberlink.maas360.email_2233702794802541
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<br>Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89=5FASRockRack)" wrote:<br><br>> H=
i Milton,<br>        My user account in Github/Gerrit is Jeff9Chan, but reg=
istered CLA account is 'Jeff Chan < Jeff9=5FChan@asrockrack.com>'<br>      =
  Should I re-register CLA info?<br><br><br>Milton> you should not need to =
reregister.<br><br><br>There are three items here:<br><br>Your name, which =
some projects like the Linux kernel require to be your legal name. This wou=
ld be how you are addressed in person.&nbsp;&nbsp;&nbsp;<br><br>Your email =
address, where we can send email and you will receive it<br><br>Your GitHub=
 account name, which we also use in the OpenBMC gerrit gerrit.openbmc-proje=
ct.xyz<br><br><br>Your git client needs your name and email but not your Gi=
tHub account name.&nbsp;&nbsp;&nbsp;That's only needed to setup GitHub and =
to login to gerrit.&nbsp;&nbsp;&nbsp;<br><br>For instance I sign with Milto=
n Miller <miltonm@us.ibm.com> but don't need my GitHub account&nbsp;&nbsp;m=
dmillerii<br><br>Milton
<BR>

----_com.fiberlink.maas360.email_2233702794802541--

----_com.fiberlink.maas360.email_2233702794038480--

