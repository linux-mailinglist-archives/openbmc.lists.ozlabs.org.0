Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B653354326
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 17:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDYs7244gz30G3
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 01:06:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LqYTyrqg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LqYTyrqg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDYrs55Qqz2xgJ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 01:06:21 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 135F3chn142643; Mon, 5 Apr 2021 11:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f8txZC83p0e0DRmKMZ5utXk/8212CANRObl5d8xAvA0=;
 b=LqYTyrqgtXX1BHY2FLaxm8qoMHeNGhgOoome3ipUpR9xDTCancm8NUX/jHRIDEtWnxHd
 euo6vC1Q5xBouxgdbWm9GBBsDygpCipA/42kxl0iJsDDZ0ve0OEgJ5gPCLok5xmKOKuP
 LbrFqZpgdvvWt1MYxVbdPK1SqOjv6a3W/YEXQy2GiZzw7L1cM8peY5Mnh9NgblPiU4q/
 aLZI6GGSU/VW2zF40cBn8bWixOy7mUjZ7lwkCHvg+8ncl//3ow7kL9K/Tioz2NRKoSKc
 AtgO/y7//nYSzOv5pf5pz4yF8XKB627gpwhy+hcSwme16PJHAg4WmT5y54ObQb8US0Q3 sA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5pa4qfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Apr 2021 11:06:17 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 135F3d2p018335;
 Mon, 5 Apr 2021 15:06:17 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 37q2yhhavc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Apr 2021 15:06:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 135F6Fn622675746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Apr 2021 15:06:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B196A051;
 Mon,  5 Apr 2021 15:06:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6582D6A04D;
 Mon,  5 Apr 2021 15:06:15 +0000 (GMT)
Received: from [9.160.64.243] (unknown [9.160.64.243])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  5 Apr 2021 15:06:15 +0000 (GMT)
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
To: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
 <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
 <7843F2AF-30DE-4F78-B7C1-2BBDC99689B5@amperemail.onmicrosoft.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <a988408c-64ad-35e6-eb12-2c2babf802c0@linux.ibm.com>
Date: Mon, 5 Apr 2021 10:06:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7843F2AF-30DE-4F78-B7C1-2BBDC99689B5@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FHuGX3ZgLyevCeScehnNH_H9nLo20LlD
X-Proofpoint-GUID: FHuGX3ZgLyevCeScehnNH_H9nLo20LlD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-05_13:2021-04-01,
 2021-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104050104
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



On 4/2/2021 2:52 AM, Thu Nguyen OS wrote:
> I thought that OpenBmc community have to have the solution for this.
> I can propose my solution but I don't think it is common enough.

I haven't seen any code that does a bind/unbind on power on, so I would 
welcome your solution being upstreamed.  We put similar functionality 
into phosphor-gpio-presence that can bind/unbind around presence 
detection where the drivers are also listed in a config file.


>
> Regards,
> Thu Nguyen.
>
> ﻿On 31/03/2021, 23:14, "Joseph Reynolds" <jrey@linux.ibm.com> wrote:
>
>      On 3/30/21 9:14 PM, Thu Nguyen OS wrote:
>      > Hi All, Currently, In Mtjade platform of Ampere, we have SMPro mdf
>      > drivers (SMPro hwmon, SMPro errmon, SMPro misc driver). The drivers
>      > will be loaded by kernel when the BMC boot up. But they are only
>      > binded when the host is already On. ‍ ‍ ‍ ‍
>      >
>      > Hi All,
>      >
>      > Currently, In Mtjade platform of Ampere, we have SMPro mdf drivers
>      > (SMPro hwmon, SMPro errmon, SMPro misc driver).
>      >
>      > The drivers will be loaded by kernel when the BMC boot up. But they
>      > are only binded when the host is already On.
>      >
>      > They are also unbinded when the host is Off.
>      >
>      > To support binding/unbinding the SMPro drivesr, we have one service
>      > name driver-binder.
>      >
>      >  1. When the Dbus property CurrentHostState of service
>      >     xyz.openbmc_project.State.Host changes to “not Off”, we will bind
>      >     the drivers.
>      >  2. When the Dbus property RequestedHostTransition of service
>      >     xyz.openbmc_project.State.Host OR Dbus property
>      >     RequestedPowerTransition of xyz.openbmc_project.State.Chassis
>      >
>      > change to Off, we will unbind the drivers.
>      >
>      > The driver-binder is working as expected, it have the configuration
>      > file to configure which drivers will be binded/unbinded.
>      >
>      > But that is our solution.
>      >
>      > Do we have any common solution to do that job?
>      >
>
>      Thu,
>
>      I don't have a solution.  But I do want to be able to bind and unbind
>      drivers for the BMC-attached USB ports (as the underlying mechanism when
>      the BMC admin disables the ports), so I think it would be good to have a
>      common solution or understand the best practices.
>
>      Joseph
>
>      > Regards.
>      >
>      > Thu Nguyen.
>      >
>
>

