Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA44B2A7C
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 17:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwK4C6JVfz3cDn
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 03:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqU7zLNs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dqU7zLNs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwK3j4WKPz3bV7
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 03:35:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BEx1So000900
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5gqq41N1B48kOl3cGrnKYlC2CKqTYqONvH7CHFo8fDc=;
 b=dqU7zLNs0iW7cvnxRX8FwhI5/JBS/UkKo+g1jYG137eFu8acfPP7aFhXgMb5Tg2HMo16
 0qCq2UM3ugxiRB/uqOLsG+180ckgizPN4zc0Nz3i885FE9yodhqu8YDEbEDl8WPH756c
 DUfvO/6eouoQumEIfXucCKReWM0OE3Vi80UsA4yuhRkzbDPGWw/j9jRx4mfpz7H29V/W
 yMxeL7WLa81q+XzAFuB8xp4Mhyxp/tujhn4GYUkmv34y83cB4l6QazHhgjCax0n27pVx
 C+J22i0CpQY1VFvvl6ORLk87PTALjLMURKRVJCV3JB7VEtQ/YcBk0fxG9d65SpaEzWIm AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5qgv5qej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:35:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BFCa93005649
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:35:26 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5qgv5qe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 16:35:26 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BGXuf4018987;
 Fri, 11 Feb 2022 16:35:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3e1gvd1fpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 16:35:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BGYNos17498440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 16:34:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 661547806E;
 Fri, 11 Feb 2022 16:34:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F8F378067;
 Fri, 11 Feb 2022 16:34:23 +0000 (GMT)
Received: from [9.211.142.23] (unknown [9.211.142.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 16:34:23 +0000 (GMT)
Message-ID: <9fb7b7a3-e391-5be3-67ca-c989ddd10159@linux.ibm.com>
Date: Fri, 11 Feb 2022 10:34:22 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: meta-phosphor/sensors and phosphor-power/phosphor-regulators
 compatibility
Content-Language: en-US
To: Mike Jones <proclivis@gmail.com>
References: <CEA51A0E-5ADB-41AC-BD2A-80319CD0E6D8@gmail.com>
 <d6a47057-b5a5-e448-001c-d278101f28d6@linux.ibm.com>
 <1ADBEA6A-0578-4B27-8268-DD1EAC5592FC@gmail.com>
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <1ADBEA6A-0578-4B27-8268-DD1EAC5592FC@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jnZ60oKMnrpI03fBpMQ4odUSfuUwyT63
X-Proofpoint-GUID: fMpUUXiXQt_82hJTRr6kj8NVi7ANYW10
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_05,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110090
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> So I was looking for a way to pull a block of data for the fault log, 
> but I was hoping hwmon would still work in parallel, because it is 
> used a lot.
>
There may be support in phosphor-regulators you could use, although it 
may be intended for a different use case.

Regulators may have redundant phases.  For example, an N+1 regulator has 
one redundant phase.  If a phase stops working, the regulator will still 
work but the customer has lost redundancy. So an error can be logged to 
warn the customer.

As part of logging the phase fault error, you have the option of 
capturing an arbitrary set of debug data.  This is stored in the 
resulting error log as additional data.

You could possibly use this support for your use case.  The logic to 
determine if a 'phase fault' occurred is completely defined in the JSON 
file, so it could do whatever I2C registers compares you want.  
However,  the error message would include 'phase fault' which might be 
misleading in your case.

See the following for more info:
* 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/phase_fault_detection.md

* 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/log_phase_fault.md

* 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/i2c_capture_bytes.md 
for more info.

> Also, min/max values are not directly supported, clearing those 
> values, etc.
>
the *_peak and *_valley sensor types are intended for max/min sensor 
values that are calculated by the regulator device itself. The regulator 
usually samples values very frequently and is more accurate than a 
firmware calculated min/max.  Currently the _peak and _valley sensors 
are cleared on each boot.  You are correct that there is not currently 
support to clear it manually.

> But, if phosphor-regulators could consume hwmon values, or some other 
> driver interface, that would have value. Currently, I have ADI 
> customers that want to switch from a PMBus Hot Swap to a I2C Hotswap 
> to get some features, and they are in pain because their software uses 
> PMBus directly via i2c. If they had used hwmon, I could have written 
> them an emulation hwmon driver and all their software would have just 
> worked. The lack of driver abstraction is making their product 
> evolution difficult. This makes me hesitate wrt using 
> phosphor-regulators.
>
I understand your concern here.  I would not claim the 
phosphor-regulators application solves all use cases or is an ideal 
design.  It provides some functionality that was mandatory on the 
systems I work on.  I was hopeful it would be useful to others, but 
there are definitely caveats.

> I will invest more time in understanding phosphor-regulators. Mainly I 
> need to know how telemetry here would get connected to Redfish and 
> WebUI, etc. Does all the telemetry you mentioned below automatically 
> get connected to these?
>
I answered this in another response.

Thanks,

Shawn

