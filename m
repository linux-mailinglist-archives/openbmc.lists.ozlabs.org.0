Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A65A40A4
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 03:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGCZp1x3Xz3bjX
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 11:31:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFACvkr1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFACvkr1;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGCZG41QJz2xGH
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 11:31:01 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T09EiL014265
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 01:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4ccq1EzqXhXtjyj7oKrtCrh1CYRJ4tzsXuSQRTfnj3M=;
 b=bFACvkr15B67zaMIAvEGb71ETsIVxeQi2cpNDYyRcqghfP12KUxJVNfUzHEur5X9u1me
 lxMGJKdaPwp95FZjK6qicHihZTkMTj7194OvH2/1mTsyADaolTrETvyqFha8eR06yq/g
 J4IeLZGYO7gGqiJW3vCrL9GWsOEXgkDpxuIJvGelBnudG/Rtp7heC9kVEfv5zfZYufVq
 ImlrBNGuphz0V/678y4OPLbzo8ASt8bKVOAr29/V2mxI1e7BAkFOnpBq6ESaxZ+yKXH7
 n/F+MXSuNxazdGuz383lh26wu62kyyHS6fS+RzNUF3NLKNJBP1mknJIFZlR+PQIT2qur sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j7waqr78v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 01:30:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T0tXGa018358
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 01:30:57 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j7waqr78s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 01:30:57 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T1LCBr003578;
	Mon, 29 Aug 2022 01:30:56 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04dal.us.ibm.com with ESMTP id 3j7aw9cs56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 01:30:56 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T1UtTU30081340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 01:30:55 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4CC2124053;
	Mon, 29 Aug 2022 01:30:55 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97609124052;
	Mon, 29 Aug 2022 01:30:55 +0000 (GMT)
Received: from [9.160.40.70] (unknown [9.160.40.70])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Aug 2022 01:30:55 +0000 (GMT)
Message-ID: <328645f5-9bd7-99d0-8b1c-511175d3d94f@linux.ibm.com>
Date: Sun, 28 Aug 2022 20:30:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Read CPU memory from BMC.
Content-Language: en-US
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
References: <CAE33tLF5KTW8-gCq9bn_AsKmfaMUrV9faERzWQzL6s38F2O-DA@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAE33tLF5KTW8-gCq9bn_AsKmfaMUrV9faERzWQzL6s38F2O-DA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -v__StktX7WBghAxNc19iqsWfSuejoic
X-Proofpoint-GUID: BTMS9linyQBvb-QDybRmc1USOspmQl9c
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_16,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290004
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

On 8/26/22 11:42 AM, AKASH G J wrote:
> Hello Team, Is it possible to read CPU memory space from the BMC? If=20
> PCIe connection is available from BMC to the chipset, can we do DMA=20
> from BMC ? Thanks and Regards, Akash =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D
>=20
> Hello Team,
>
> Is it possible to read CPU memory space from the BMC?
> If PCIe connection is available from BMC to the chipset, can we do DMA=20
> from BMC ?

Akash,

I hope not.=C2=A0 I assume you are asking about how to read the host's memo=
ry=20
from the BMC.=C2=A0 I believe the ability for the BMC to read host memory i=
s=20
not a non-goal.

I understand a fundamental BMC design point is to have a security=20
boundary between the BMC and host elements (like the host processor and=20
host memory), so that:
- The BMC has strictly limited access to the host elements is need to=20
interact with, and
- The host has strictly limited access to BMC resources it needs to=20
interact with.

This separation is a goal for POWER Systems, and I think also for Intel,=20
AMD, etc.=C2=A0 But I don't see this in any OpenBMC documentation.

-Joseph

>
>
> Thanks and Regards,
>
> Akash

