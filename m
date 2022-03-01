Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC84C95A2
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 21:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7T4m5xbLz3bnZ
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 07:15:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TedwYxeq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TedwYxeq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7T2J3Rdxz3bVZ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 07:12:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Hd0EJ005560; 
 Tue, 1 Mar 2022 20:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wIVSX7Ytm+ZdGKKDXUIn8GtS7XgWV3qWY3EHhWO8Ewg=;
 b=TedwYxeqW71cCPj9xcDYHdbRGBJAnDPmTlP2/OilAUzoBFeaPelJC+vs2YTUncHS9l8+
 /OYvolTOXoCHw5pi0fvPmQpq/I8B/0B+HkIiK/HlnZS0qK9BbJqPBt8wKQsctPlKtRnW
 3IdQf4NAE/J8UtV/q7pNv8JjXVn+7gglACOI2SdLwhL59bUyq85OBLebSQYgSDOSEyiI
 kfeY4QRp2Zl7ktblcr/PkTE6TQzr1KnjNrVegKU3gt5WCnuulCPwnrPZlYKmJQq1HF4Y
 27MvY45k1a7WNr3gPW3AlxlhMOfxd63SdRWOqdFBsd9FcckDVU7T2CxwB0cXLYbnXKf2 Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehpd4xafd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:12:53 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221JohSI029230;
 Tue, 1 Mar 2022 20:12:53 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehpd4xafa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:12:53 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221K7TSp025139;
 Tue, 1 Mar 2022 20:12:52 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3efbuaew8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:12:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221KCpEY12125118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 20:12:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65498AC05F;
 Tue,  1 Mar 2022 20:12:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F295EAC05B;
 Tue,  1 Mar 2022 20:12:50 +0000 (GMT)
Received: from [9.160.39.227] (unknown [9.160.39.227])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Mar 2022 20:12:50 +0000 (GMT)
Message-ID: <a81d2232-e0bf-e9f8-893a-833a7e29f6a3@linux.ibm.com>
Date: Tue, 1 Mar 2022 14:12:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: openBmc Code Structure
Content-Language: en-US
To: Mike Jones <proclivis@gmail.com>, Sandeep Kumar <sandeep.pkumar@tcs.com>
References: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <CE613404-79EA-4D39-816D-B16E757CB64A@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CE613404-79EA-4D39-816D-B16E757CB64A@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VeSMqHW8gnPYAjXLJ6LYQwgswHpXWjF4
X-Proofpoint-GUID: Uc_mZLp-VwHUiv1nA1qWTsvaYhi4qSkk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010101
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/25/22 7:31 AM, Mike Jones wrote:
> Sandeep, I think that is like asking what the source code structure of 
> a linux distribution is. Obmc is built from a linux kernel and many 
> application, each with it’s own structure. I’m still learning OBMC 
> myself, but I would look at the obmc ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> Sandeep,
>
> I think that is like asking what the source code structure of a linux 
> distribution is. Obmc is built from a linux kernel and many 
> application, each with it’s own structure.
>
> I’m still learning OBMC myself, but I would look at the obmc design 
> docs and learn its architecture, which is basically a dbus system with 
> services, and to the outside world, Redfish. Yocto is the glue that 
> makes a complete image.
>
> Mike
>
>> On Feb 24, 2022, at 11:42 PM, Sandeep Kumar <sandeep.pkumar@tcs.com> 
>> wrote:
>>
>> Hi,
>> I have just started looking into the openBmc source code. Could 
>> anyone explain the source code structure for openBMC?

Here is how I explain its most basic structure:
OpenBMC has a complex source code structure.  It uses the bitbake build 
system which runs on your build host and processes recipes to produce 
the firmware image.  In this sense, the OpenBMC source code consists of 
a set of recipes.  A typical recipe tells bitbake to fetch a package, 
unpack, patch, and configure it, and build it into the firmware image.  
In this sense, the OpenBMC source code consists of the recipes actually 
used together with the packages they fetch.  Naturally, the exact source 
code used in any given build depends on which version you are building 
from (as daily changes are made to the master branch) and which platform 
you are building for.
* The downstream flow for the recipes is: OpenEmbedded --> Yocto/Poky 
--> OpenBMC --> IBM product forks.  (Details for IBM product forks are 
below.)  Each project along the stream customizes the recipes and adds 
new recipes.
* The OpenEmbedded (OE) project is seminal.  It provides the bitbake 
tool and recipes for many thousands of open source projects.
* The Yocto/Poky project is downstream from OE.  It organizes the 
recipes into a Linux distribution suitable for embedded systems.
* The OpenBMC project (https://github.com/openbmc/) is downstream from 
Poky.  It adds BMC's specialized functions in bitbake layers:
     - meta-phosphor (and other layers) - provide common/core BMC function
     - meta-openpower - adds support for OpenPOWER
     - meta-ibm - adds support common to IBM systems
     - meta-witherspoon (as an example) - adds support for specific host 
machines

Are you more interested in the Yocto/bitbake structure, or interested in 
the OpenBMC customization layers?

Joseph

>> Thanks,
>> Sandeep.
>>
>> =====-----=====-----=====
>> Notice: The information contained in this e-mail
>> message and/or attachments to it may contain
>> confidential or privileged information. If you are
>> not the intended recipient, any dissemination, use,
>> review, distribution, printing or copying of the
>> information contained in this e-mail message
>> and/or attachments to it are strictly prohibited. If
>> you have received this communication in error,
>> please notify us by reply e-mail or telephone and
>> immediately and permanently delete the message
>> and any attachments. Thank you
>>
>

