Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2203BE8E8
	for <lists+openbmc@lfdr.de>; Wed,  7 Jul 2021 15:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKgW56prfz3bXw
	for <lists+openbmc@lfdr.de>; Wed,  7 Jul 2021 23:38:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apx7PD/W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=apx7PD/W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKgVn3Cjnz2yQF
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jul 2021 23:38:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167DX9GI016840
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jul 2021 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : in-reply-to :
 from : to : date : message-id : content-transfer-encoding : content-type :
 mime-version : references; s=pp1;
 bh=BSWDyO+Djm343iJBb7JaEW6lNuea8W4WBSfpX8fyBHY=;
 b=apx7PD/WtervK+Xk7yyws1VXAMyJtVU6BPHt2SqG4YgXr92kdrubmdRrVTdRk9Dq+xlw
 BrdVFfdNqV2nXJzWXHUbEuV4leF4cCmyYlnveM/FGCE4kYHEhJ/DIJHlZrLfJntrj8xq
 B8Wcg1yE3Va7pE1ar0cEEM9FSAmTVNqI3azyuJTTjeS7FCzE44qJlhFrUNdFhfA9ED0r
 wDNi0UZCtuYq+wZaiuxsFurgMUUcOvNDcx/7mpY01djZleQmnxlNYjRxxYUrjyqmtNCG
 OfHDc/5aWnZZFFs0bM6k63+GKl60LdQEFS/x3Z5IRudlV9CKGw3cU60BAmCYrphL+xUP Mg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nc7xa2e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jul 2021 09:38:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 167DXwLC012931
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jul 2021 13:38:35 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 39jfhd22v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jul 2021 13:38:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 167DcYBc38011354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jul 2021 13:38:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2717328059
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jul 2021 13:38:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0861D28064
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jul 2021 13:38:34 +0000 (GMT)
Received: from mww0151.wdc07m.mail.ibm.com (unknown [9.208.70.162])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jul 2021 13:38:33 +0000 (GMT)
Subject: Cancelled: GUI Design Work Group - Wednesday,
 7/7/21 at 10:00 AM Central
In-Reply-To: <OF7717BEC1.0F210BFD-ON002586A8.007A0BC0-002586A8.007A0BC5@notes.na.collabserv.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 7 Jul 2021 13:38:32 +0000
Message-ID: <OFC6DD5317.D6705021-ON0025870B.004AC608-0025870B.004AF060@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: <OF7717BEC1.0F210BFD-ON002586A8.007A0BC0-002586A8.007A0BC5@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0151/01/M/IBM at 07/07/2021 13:38:32,
 Serialize complete at 07/07/2021 13:38:32
X-Disclaimed: 29643
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CoH6Y_xgd7JsyH74bw6SVyqxy3OLPKpU
X-Proofpoint-ORIG-GUID: CoH6Y_xgd7JsyH74bw6SVyqxy3OLPKpU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_06:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=660
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070081
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Tahoma, =
Geneva, sans-serif;font-size:10pt" ><div dir=3D"ltr" >I apologize for the l=
ate notice, but the GUI Design Work Group will be cancelled today. See you =
all on the 21st.</div>
<div dir=3D"ltr" ><div>&nbsp;</div>
<div><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr"=
 ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><=
div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div=
 dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div di=
r=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div><div dir=3D"ltr" ><div>Thank you!</div>
<div>&nbsp;</div>
<div>Derick Montague</div>
<div>Design Lead<br>IBM Cognitive Systems User Experience</div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div><BR>
<BR>
