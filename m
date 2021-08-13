Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DA3EAED6
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 05:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm84p4LzTz3bWc
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 13:22:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RWvm2ZYf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RWvm2ZYf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm84K3WGGz302W
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 13:22:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17D3KESM013006; Thu, 12 Aug 2021 23:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : from
 : to : content-type : mime-version : subject; s=pp1;
 bh=QeUtU9NfwMGP9pu++vCJAFss9Bt3BOV4tiTYQywpDrc=;
 b=RWvm2ZYf2n3dwewN5o+4PxXE9PsR76M2+8Msod1jsr6iPSF6IDY0lRIG81tRAHVCB4/7
 fx14aBtZb9TRi2BGsbrIE8G6CNXvDc5Knq4I01ctfDxPRgIROSDwxO9xLvrej1/3xYuI
 Mx7IhIWB/mAx/7npF+2WMAD9ggP83Hq02bUFNZFc4QXHiV5VJGh+yTeZetzHvYBWoRcE
 opZbKRgUZrebTe5HVF2sQyHb5TGXQ2sf/dkv7caI08gu8yXDG+ki00DPth9+4pxMo1WZ
 3zZSixSb3tiZFDA4IYOouxaZar81qwGb3W0lBmdUINA0Ehoc3RFiSxYdknWbsxlyY0Is HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ad1kxrm28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 23:22:01 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17D3KJcs013393;
 Thu, 12 Aug 2021 23:22:01 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ad1kxrm1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 23:22:00 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17D3HDdt030473;
 Fri, 13 Aug 2021 03:21:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3a9htf9hta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 03:21:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17D3LxJK11272698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 03:21:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E693C78064;
 Fri, 13 Aug 2021 03:21:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D08757805E;
 Fri, 13 Aug 2021 03:21:58 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Aug 2021 03:21:58 +0000 (GMT)
Message-ID: <OFA5154048.C3010138-ON00258730.00127D40-1628824917257@ibm.com>
Date: Fri, 13 Aug 2021 03:21:57 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "George Liu" <liuxiwei1013@gmail.com>, "OpenBMC Maillist"
 <openbmc@lists.ozlabs.org>, "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_117045249993360"
X-MIMETrack: Itemize by traveler on TWW2041/03/G/IBM(Release 11.0.1FP2HF97 |
 July 2, 2021) at 08/13/2021 03:21:56
X-Mailer: Traveler 11.0.1.1 Build 202005211639_30 on server tww2041/03/G/IBM on
 behalf of device with id mdm...eb5, type 1300 (maas360android) and
 description MaaS360-MaaS360 Mail-Android:MaaS360-MaaS360 Mail-Android/7.50
 at 20210813032157425 by DS-7ff9b08bc700[SendMail]
X-KeepSent: A5154048:C3010138-00258730:00127D40; name=$KeepSent; type=4
X-Disclaimed: 44515
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _tscxI53T5ErKH_pyjipvR_BlXQQYl7V
X-Proofpoint-ORIG-GUID: OEyAu8slntRhwQ6IOR_FqWQvKj0PBnT7
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
Subject: Re:  Request new repo for Audit function
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_06:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130017
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


----_com.fiberlink.maas360.email_117045249993360
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_117045250791801"



----_com.fiberlink.maas360.email_117045250791801
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Reply below

-------- Original Message --------
From: George Liu=20
Date: Thu, August 12, 2021 7:52 PM -0500


Hi Brad:

We have a requirement to implement an Audit function, I found that
there is a design doc[1], but there is no code to implement it.

Could you create a new repo for Audit function?
eg: phosphor-audit

[1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md

thx - George Liu

-------- End of Original Message --------

Hi George.


Please update the design with consideration for inclusive naming[2] before =
submitting code for it, as it uses depreciated terminology in it's external=
 control interface.

I see this design was merged almost 2 years ago before this policy was in p=
lace but as you said it hasn't been exposed by the community yet so we won'=
t need to maintain compatibility with prior implementations.


[2] https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-n=
aming

Thanks,
Milton


----_com.fiberlink.maas360.email_117045250791801
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<br>Reply below<br><br>-------- Original Message --------<br>From: George L=
iu <liuxiwei1013@gmail.com><br>Date: Thu, August 12, 2021 7:52 PM -0500<br>=
<br><br>Hi Brad:<br><br>We have a requirement to implement an Audit functio=
n, I found that<br>there is a design doc[1], but there is no code to implem=
ent it.<br><br>Could you create a new repo for Audit function?<br>eg: phosp=
hor-audit<br><br>[1]: <a href=3D"https://github.com/openbmc/docs/blob/maste=
r/designs/phosphor-audit.md" target=3D"_blank">https://github.com/openbmc/d=
ocs/blob/master/designs/phosphor-audit.md</a><br><br>thx - George Liu<br><b=
r>-------- End of Original Message --------<br><br>Hi George.<br><br><br>Pl=
ease update the design with consideration for inclusive naming[2] before su=
bmitting code for it, as it uses depreciated terminology in it's external c=
ontrol interface.<br><br>I see this design was merged almost 2 years ago be=
fore this policy was in place but as you said it hasn't been exposed by the=
 community yet so we won't need to maintain compatibility with prior implem=
entations.<br><br><br> [2] <a href=3D"https://github.com/openbmc/docs/blob/=
master/CONTRIBUTING.md#inclusive-naming" target=3D"_blank">https://github.c=
om/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming</a><br><br>Tha=
nks,<br>Milton<br><BR>
<BR>

----_com.fiberlink.maas360.email_117045250791801--

----_com.fiberlink.maas360.email_117045249993360--

