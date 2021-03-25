Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BE8349C26
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 23:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5zx21kpMz30Gc
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 09:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ieIyZ1K0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ieIyZ1K0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5zwn2WlCz304Z
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 09:16:56 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PM2oxp080455
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ga0bNK94B/byxkFQcp+cUY44JUTNGEOHvS1WShGG26o=;
 b=ieIyZ1K0pEYpp1ZXeveq10KBQp64fJfo3y5djnAUI8GUJ4XyslcScKv64RU3FdgGccjt
 lPbv/CjSfh92UdjKLIu5ao1QSgU9XpMuLiPyMa6hnkvlS1GcrFqlYw4cOmv7svYb2C+s
 xJ9i4iKywzOys4lM9+Ykf08NjmFMOvEXryv+rgbg88tWP4fE1tlULWyBDH8f+wEsL4GY
 70TCLRycrsluBzF/Wlmc2UoE8d+A1NBg7CRyQqOw/nC62tVaN5j0Avkapz+99Hlf3h0m
 touauBZaIam7HncLXHCLU6VqmAFuidYA1cVNfoFgqmJ6L0WIMO7MPpNDVpZzUwJN1IHb Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h1j92fbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:16:52 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PM3m5D083749
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:16:52 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h1j92fbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 18:16:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PM7UTa009118;
 Thu, 25 Mar 2021 22:16:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 37h1508vwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 22:16:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PMGpS021758304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 22:16:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C4AC2805E;
 Thu, 25 Mar 2021 22:16:51 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7AEB2805C;
 Thu, 25 Mar 2021 22:16:50 +0000 (GMT)
Received: from [9.160.75.159] (unknown [9.160.75.159])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 22:16:50 +0000 (GMT)
Subject: Re: IPMI SEL Parsing
To: rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
Date: Thu, 25 Mar 2021 17:16:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KKLoKZC9WeOCh42k_u3GHcEdJl_ra2RX
X-Proofpoint-ORIG-GUID: m4s8zc27eItRwL2yy0hiwN8c1F38omfw
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_08:2021-03-25,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103250161
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



On 3/25/2021 7:49 AM, rgrs wrote:
> Hi All, "ipmitool sel list" always shows the records as "Undetermined=20
> system hardware failure". Logging/entry doesn't have the proper=20
> association. How do I add association for log entries and respective=20
> FRUs? Which package creates Logging/entry=20
> Hi All,
>
> "ipmitool sel list" always shows the records as "Undetermined system=20
> hardware failure".
> Logging/entry doesn't have the proper association. How do I add=20
> association for log entries and respective FRUs?
>
> Which package creates Logging/entry object on sensor events? I don't=20
> see any call to SelAdd in phosphor-hwmon.

What are the SELs for - threshold alarms, or some other sort of failures?

>
> Thanks,
> Raj

