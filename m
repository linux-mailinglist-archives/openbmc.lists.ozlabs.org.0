Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CD337A43
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 18:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxFYw1g9Hz3cnZ
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 04:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9hpvGk2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I9hpvGk2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxFYf1HDGz30LN
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 04:00:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BGxnf2109283; Thu, 11 Mar 2021 11:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JSpBwiARXZ3+SXiMa/DYpMoBsawmV7OxGBX28a18jpE=;
 b=I9hpvGk2sK9lgBRK56r+v0IV9hdMqrESRwDbIguuMfZGv+4IpldMY749PheLttU7JKfS
 m33W7IfafNu2ffFW2aQuFeGg2Gjyh1+MsnHYSiHA8UvF87bC2pElPVC+pVS4vaC6wVUE
 r8phliM4OAlcRR45LbknAXMeWTLWS0076MEnpHqPpPUz5/WVJ4NIPWNduHF0yMfDV0/1
 fn68DZ43Z0N39kobZ9YmKnDOPMSS9VsvkwZynpd2e6zOS7Dvsa2XoUTK4ggWKwIEb7sl
 NhgiyvJ9ZBHQlbJFxtnwuJ05UlrfAjKfxlbhCnsMzSw6+757mwZe0ajSaXn/qGk/bWvy Ag== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3774m1cgp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 11:57:19 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12BGm4MW010611;
 Thu, 11 Mar 2021 16:51:35 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 37690adakt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 16:51:35 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12BGpYHf13500836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 16:51:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2BF3112071;
 Thu, 11 Mar 2021 16:51:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45739112069;
 Thu, 11 Mar 2021 16:51:34 +0000 (GMT)
Received: from demeter.local (unknown [9.65.192.185])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Mar 2021 16:51:34 +0000 (GMT)
Subject: Re: Adding keys to BMC production build
To: Troy Lee <troy_lee@aspeedtech.com>,
 Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>,
 Bruce.Mitchell@ibm.com
References: <1f6f6ee72b8746939289c1897de828b2@SCL-EXCHMB-13.phoenix.com>
 <HK0PR06MB2145076F4CB2696DA9E282C78A909@HK0PR06MB2145.apcprd06.prod.outlook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <eac4e6c5-d0f2-b824-91f6-b08da26c0aab@linux.ibm.com>
Date: Thu, 11 Mar 2021 10:51:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB2145076F4CB2696DA9E282C78A909@HK0PR06MB2145.apcprd06.prod.outlook.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_06:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110087
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

On 3/10/21 8:35 PM, Troy Lee wrote:
> Hi Patrick, You could assign SIGNING_KEY to your private key for=20
> signing image. If it is not set,=20
> meta-phosphor/recipes-phosphor/flash/phosphor-insecure-signing-key-native=
.bb=20
> will be applied. Thanks, =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D=20
>
> Hi Patrick,
>
> You could assign SIGNING_KEY to your private key for signing image.
>
> If it is not set,=20
> meta-phosphor/recipes-phosphor/flash/phosphor-insecure-signing-key-native=
.bb=20
> will be applied.
>
> Thanks,
>
> Troy Lee
>
> *From:* openbmc=20
> <openbmc-bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> *On Behalf=20
> Of *Patrick Voelker
> *Sent:* Thursday, March 11, 2021 10:18 AM
> *To:* OpenBMC (openbmc@lists.ozlabs.org) <openbmc@lists.ozlabs.org>
> *Subject:* Adding keys to BMC production build
>
> Is there a page or document with instructions for adding a custom key=20
> for signing the production BMC build? I haven't had any luck finding=20
> it yet.
>

Yes, sort of.=C2=A0 The OpenBMC "Configuration Guide" wiki has items like t=
his:
https://github.com/openbmc/openbmc/wiki/Configuration-guide#image-signature

Troy, I've added your info to the wiki.=C2=A0 Thank you!

The OpenBMC security working group has discussed migrating the config=20
guide into the docs repo.=C2=A0 Any volunteers?

-Joseph

