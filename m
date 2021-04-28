Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0E036E0E5
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 23:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVs9Z3zm3z301v
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 07:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dbu56o80;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Dbu56o80; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVs9H51gMz2yhd
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 07:25:07 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SL4ZI2072368; Wed, 28 Apr 2021 17:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=K3ZJa4Mxh1oZIGbkUKDrGzsnmOPd0JKUmtvGHdOuIn0=;
 b=Dbu56o80WO9dsNL9XH9sp3LO8Ndjlomt53dcaGHG1TVpYTaqA3YAZMHMYDVxYkjeXtuf
 mFb8MbyPjy3Ho3NXrHYReIB2W6nHBnWZjGr/InhfjWSr7/JhtXXsNPox5/jL5Nv/Qo8w
 MOjaH91iEWbv6zi2fMS3B66aVdJM4/3VSArBumn+4tXgTLt9Dw8k6BNxUomUS16kX/Aw
 5quwCk1ecuIJPI3P4UpnGDOIg7HNa8AvvWUMjTTAC3AaSGc6FIfTrlunn749PRG3Wb/N
 ea5/OO+r6a6aRI/H2sLT6wSfUTGUuz6Rp155jCxLl/TT1NnUETHoHuKcq720xl+LcD+i Mg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3879s6a3nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 17:25:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SLBc7G032411;
 Wed, 28 Apr 2021 21:25:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 384ay9ywsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 21:25:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SLP1Un35848636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 21:25:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63830BE056;
 Wed, 28 Apr 2021 21:25:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6EC2BE068;
 Wed, 28 Apr 2021 21:25:00 +0000 (GMT)
Received: from demeter.local (unknown [9.160.77.122])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Apr 2021 21:25:00 +0000 (GMT)
Subject: Re: OpenBMC on RCS platforms - remote media
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Milton Miller II <miltonm@us.ibm.com>
References: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
 <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
 <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <4f9a94a5-bafb-aec8-f229-95a2fdf480c2@linux.ibm.com>
Date: Wed, 28 Apr 2021 16:24:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7G_5DFPVyeTjSi23bI259dApeEU97Ffd
X-Proofpoint-ORIG-GUID: 7G_5DFPVyeTjSi23bI259dApeEU97Ffd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_16:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280136
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/28/21 3:21 PM, Timothy Pearson wrote:
>
> ----- Original Message -----
>> From: "Milton Miller II" <miltonm@us.ibm.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "Patrick Williams" <patrick@stwcx.xyz>, "openbmc" <openbmc@lists.ozlabs.org>
>> Sent: Monday, April 26, 2021 4:42:16 PM
>> Subject: RE: OpenBMC on RCS platforms
> [snip]
>
>

...snip...

>>> I just need to launch a GUI tool with host administrative privileges,
>>> select the upgrade file, and queue an upgrade to happen when I reboot
>>> the machine.  I queue the update, start the reboot, and stick around
>>> to see the upgrade progress on the screen while it's booting back up.
>>> Because I can see the status on the screen, I know what is happening
>>> and don't pull the power plug due to only seeing a black screen and
>>> power LED for 10 minutes.  Finally, the machine loads the OS and I
>>> verify the new control widget is working properly.
>> If the gui is on the host, with todays stock phosphor-initfs, you need
>> 1) a connection from the host to the bmc
>>    ethernet, serial, usb ethernet etc
>>    (to copy files from host to BMC RAM and to monitor command output)
> Precisely.  USB would be an interesting control channel, but I don't think OpenBMC currently supports this kind of access?

If (if) I am following correctly, you want the OpenBMC virtual media 
(aka remote media) implementation?
https://github.com/openbmc/docs/blob/master/designs/virtual-media.md

Is there an implementation?  I didn't find one listed here:
https://github.com/openbmc/docs/blob/master/features.md

- Joseph

