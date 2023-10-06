Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5B7BF145
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:17:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H071Do3K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4LgT59H0z3bwX
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:17:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H071Do3K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2H675KSPz3ccQ
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 05:30:07 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396IHw6J032167;
	Fri, 6 Oct 2023 18:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eA1tYeASY+r8nLKpGoqj/qvSzU9cX53WUdS+0yEa6II=;
 b=H071Do3Kt9wabtryApirQuFlsOI67duBysaPw1zXkJWL4YHl1q+rvJ6yyXWxRfoMEqCo
 Q3nrN9tF+OmYlymCTIYHx9VvQZxPLTxmdKcdhsj3OZY3ZQ/ZjO5uy0GOc3Lx7sZRUnZF
 2S6URlX7KR6fDhjPCl2iKKbLAClPt5Q/Dhb8WjgMMX7u4/o99AvVnyp02vefBJvi45ua
 Y8LPcWSYWJoO3QXwfFRM1/oNyVg0AjH78VJV/XHUmP91NCBfK+3AJG2TE2o3hDZJ4vky
 ukbo8dxPRmRI/6704yPP1t2z4tRdx76oYYFrYcdxTDeZS12IQZwbY8MY0HHs7hcXQRS+ SA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjqd0075q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:29:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396IFI3N005859;
	Fri, 6 Oct 2023 18:25:55 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0uc5qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:25:55 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396IOGaJ61080052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 18:24:16 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52CA858066;
	Fri,  6 Oct 2023 18:24:16 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D73F58059;
	Fri,  6 Oct 2023 18:24:16 +0000 (GMT)
Received: from [9.61.27.175] (unknown [9.61.27.175])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 18:24:16 +0000 (GMT)
Message-ID: <17edabd1-7e71-445a-8cbb-83fd9bf02c5e@linux.ibm.com>
Date: Fri, 6 Oct 2023 13:24:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.5 0/4] ARM: dts: aspeed: p10bmc: Add fan
 controller properties
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20231006172735.420566-1-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231006172735.420566-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n53XyolqTBWCf9uEZbEmhZKTyq3u16Ju
X-Proofpoint-ORIG-GUID: n53XyolqTBWCf9uEZbEmhZKTyq3u16Ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=848 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310060139
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:18 +1100
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/6/23 12:27, Eddie James wrote:
> Now that the max31785 driver can parse the relevant properties, update
> the device trees with the necessary properties.
>
> Eddie James (4):
>    ARM: dts: aspeed: Rainier: Add fan controller properties
>    ARM: dts: aspeed: Everest: Add fan controller properties
>    ARM: dts: aspeed: Bonnell: Add fan controller properties
>    ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
>
>   .../dts/aspeed/aspeed-bmc-ibm-bonnell.dts     | 14 +++++++
>   .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 28 +++++++++++++
>   .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++
>   .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
>   4 files changed, 108 insertions(+)
>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
