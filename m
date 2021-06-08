Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCBD39EC52
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 04:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzZQl6n5fz306S
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:47:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rwozG90x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rwozG90x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzZQQ5pK0z2xtj
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 12:47:10 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1582WY8Z037310; Mon, 7 Jun 2021 22:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-type : references :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=1Fbi1wXPFqAFDBhhEP1LLwtOhkqeLz2uBkG/K3MaU2U=;
 b=rwozG90xffeWMyuHoS/up9C+p6Ce9cOtDPV7I/d+GhabJRaAo+5ns/xt1J4wjycg9FV7
 paH2c0rPPvT8TeR+tFsL6MSfFYQu1UJaOoNbLsbuWVY1mOk1p3QqLFDbQGerMFrh8P7S
 dhoLsZNpDWckQm7Oem39mzhokdMD0YdUmCnnLBLqJei21T+8W20yUzWIu0Gmg/iUVlWL
 suoLlT/83ag+sH3OUFE5ZeO9Hm7sG1KsoZEAwUKJ0kSKEwhoFn09g/sYqb81pYNXhYiH
 DQciUtMMTxgEr6qP/IUSQnfU+CXeV5HPDXG1vsipEwuWIREsO2dQ5atEQ3msN9hvFVw6 OQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391xxs1fc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 22:45:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1582h7SS020149;
 Tue, 8 Jun 2021 02:45:01 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3900w9gstk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 02:45:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1582j0ZR26345924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 02:45:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0831112062;
 Tue,  8 Jun 2021 02:45:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89752112065;
 Tue,  8 Jun 2021 02:45:00 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 02:45:00 +0000 (GMT)
In-Reply-To: <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-2022-JP?B?SmVmZjkgQ2hhbigbJEJERD4+US0bKEJfQVNSb2NrUmFjayk=?="
 <Jeff9_Chan@asrockrack.com>
Date: Tue, 8 Jun 2021 02:44:59 +0000
Message-ID: <OF7C257395.C3DF5032-ON002586EE.000EE5B8-002586EE.000F1B0F@ibm.com>
Content-Type: text/plain; charset=UTF-8
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>,
 <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>, 
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>,
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>,
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>,
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF88   April 28, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 06/08/2021 02:44:59,
 Serialize complete at 06/08/2021 02:44:59
X-Disclaimed: 60063
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3rIps1xQh3b_oOMvzU09CmBoP7usiqiu
X-Proofpoint-ORIG-GUID: 3rIps1xQh3b_oOMvzU09CmBoP7usiqiu
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: OPENBMC ASRock Rack
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_01:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=821
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106080014
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On June 6, 2021, Jeff Chan wrote:
>  Hi Bradley,
>          I got below error when I try to push meta-asrockrack layer
>to gerrit.
>          Is that means my email is not listed in the list?
>=20=20=20
>  To ssh://openbmc.gerrit/openbmc/openbmc
>  ! [remote rejected]     HEAD -> refs/for/master (commit 1d9951c:
>not Signed-off-by author/committer/uploader in message footer)
>  error: failed to push some refs to
>'ssh://openbmc.gerrit/openbmc/openbmc'
>=20=20=20
>          My procedure is:
>    1.       Git clone openbmc
>    2.       Add meta-asrockrack layer
>    3.       git remote add gerrit
>ssh://openbmc.gerrit/openbmc/openbmc
>    4.       git commit
>    5.       git push gerrit
>=20=20=20
>  My git log:
>  commit 1d9951c5518a7bdf88a5de16a41ae2f337e1b2ed (HEAD -> master)
>  Author: Jeff9Chan <jeff9_chan@asrockrack.com>

The Author name is Jeff9Chan here

>  Date:   Tue Jun 8 09:15:44 2021 +0800
>=20=20=20
>      add meta-asrockrack layer
>      Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>

The Signed-off-by is Jeff Chan here.

The email has different case, not sure if that matters.  But the=20
name format likley does.

You can control the format of the author and committer via=20
git config --global user.name  "Jeff Chan"
git config --global user.email Jeff9_Chan@asrockrack.com

You can amend the author with git commit --amend --reset-author

Hope this helps,
milton
