Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9334D79B
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 20:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8MDS0hDhz30DW
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 05:53:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KFagsfSU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KFagsfSU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8MDC73j0z302J
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 05:53:30 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TIWkiN153555; Mon, 29 Mar 2021 14:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=piSc+6fVOdb41m9EQxRGIh6spRbSPyyncpj1ybeuCK4=;
 b=KFagsfSUohY/74sahmP5ST+UJ+VLHaT5l9ppTFAuMwy9NoIpaOBMlx6HAIRlcHN7M35v
 XUbPOYTr0JtWtlVAZHCN6JcClbeWaOEZsmRFU7jKcuVuzHSi96kxnfMkg1Nl4teeFKXe
 Wjae1IQVSN8JHBoHQzSjrKr+ztEeVGjTo8wuR5nrhVVlGBj8dYkYNwsxJ2kaPXQxsbxf
 iDJGTbiDr2q5kwpoaa3qiZBVJ+r12A4wcq6ewzdnJkURCoSMwrJ/POEAL1Z+u2UoR8JX
 1jjGVkYJ2cMJoTNJkCu16bN1T5JM+ThgpaRtliexULCcYa44FNUhkSMLeYZTH5NdGLL8 Rg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhrugptq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 14:53:27 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TIq4Nd027816;
 Mon, 29 Mar 2021 18:53:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 37hvb90cfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 18:53:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TIrPu531719784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 18:53:25 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF346E056;
 Mon, 29 Mar 2021 18:53:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A25BD6E053;
 Mon, 29 Mar 2021 18:53:24 +0000 (GMT)
Received: from [9.160.118.64] (unknown [9.160.118.64])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 18:53:24 +0000 (GMT)
Subject: Re: [phosphor-virtual-sensor] get sensor service fail
To: =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <81b62058-1b6e-b2d2-d5c6-743fc48b77be@linux.ibm.com>
Date: Mon, 29 Mar 2021 13:53:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: olrQaHxJbxP6nQEB1A4bmLhVm8wOJUnf
X-Proofpoint-ORIG-GUID: olrQaHxJbxP6nQEB1A4bmLhVm8wOJUnf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_11:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=934 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290136
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
Cc: =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/29/2021 4:13 AM, Harvey Wu (吳崇維) wrote:
> Hi All, In current phosphor-virtual-sensor, the function getService 
> will return empty string only when catch error name = 
> “xyz.openbmc_project.Common.Error.ResourceNotFound” 
> (https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37 
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Hi All,
>
>         In current phosphor-virtual-sensor, the function getService 
> will return empty string only when catch error name = 
> “xyz.openbmc_project.Common.Error.ResourceNotFound” 
> (https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37 
> <https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37>).
>
>         But in my system, when bus call didn’t get sensor service, the 
> exception name will be “org.freedesktop.DBus.Error.FileNotFound”, and 
> then service will be get failed.
>
>         It seems need to modified the origin condition or add another 
> elseif condition. Do I misunderstand something?
>

You seem to just be missing the mapper commit 
https://github.com/openbmc/phosphor-objmgr/commit/3735ea2ee546b2436895cf956daf0090a6d2d406 
which will return ResourceNotFound.

> Thanks.
>
> Harvey Wu
>
> Email: Harvey.Wu@quantatw.com <mailto:Harvey.Wu@quantatw.com>
>
> Ext: 17408
>

