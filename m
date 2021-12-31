Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF04825BB
	for <lists+openbmc@lfdr.de>; Fri, 31 Dec 2021 21:12:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQbsl6CRqz302G
	for <lists+openbmc@lfdr.de>; Sat,  1 Jan 2022 07:12:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zye9yjsL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zye9yjsL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQbsB4sFXz2yjS
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jan 2022 07:12:13 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BVJIV5d019710; 
 Fri, 31 Dec 2021 20:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VcNgTCgs5N/f2Jtd7H7FNl9av8xg/+dPz+o17KdnAwM=;
 b=Zye9yjsLn2IXMeNEt6FGkk2hWzSmwbnZh5xQMMRsF0RO9hsQHt02dPafG9AXgH/skmkh
 eeppNdkx7jE2UUl10TluaTEyfRkKDBF2larL6E0VASJDLpFovKiQ1H8JXsKL4B7ovLr2
 cN0Apkgp0MSF/6geLGe+fTXKDpTI2yjtsOfVAam8CnIXp4A53T8fqL1OUcUfqy/PMqnZ
 InfU3HuEilGcd3ySw5/6+hFQtAPdD790JWP2Jpx7UJOiXtc986N5DVOsHKijSHFCIDu+
 US4NxDy6GrmRiht3cWuaAN2ynb6KjhsxDncgA3lUhLR6VEpBIkK9s5wDhck09O0+oEZF jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3da7wh8ptr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 20:12:04 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BVKC4Iu008327;
 Fri, 31 Dec 2021 20:12:04 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3da7wh8ptk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 20:12:04 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BVK4cae023165;
 Fri, 31 Dec 2021 20:12:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3d5txc2p4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 20:12:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BVKC3dI29229498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Dec 2021 20:12:03 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBCB6124054;
 Fri, 31 Dec 2021 20:12:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B875124052;
 Fri, 31 Dec 2021 20:12:02 +0000 (GMT)
Received: from [9.211.146.101] (unknown [9.211.146.101])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 31 Dec 2021 20:12:02 +0000 (GMT)
Message-ID: <5e028060-b1c8-c76d-6093-2560c66822ee@linux.vnet.ibm.com>
Date: Fri, 31 Dec 2021 12:12:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: hwmontempsensor issue in dbus-sensor
Content-Language: en-US
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
To: Ed Tanous <edtanous@google.com>,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
 <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
 <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
 <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
In-Reply-To: <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0kLXUPa0shatnfJWs1KNxRdHE9hEXH_i
X-Proofpoint-ORIG-GUID: uX2YmBlp3K2D-4AMpg2MNSXZKYXHoqgL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_09,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310084
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
Cc: velumanit@hcl.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jayashree D <jayashree-d@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/31/2021 09:30, Bruce Mitchell wrote:
> On 12/20/2021 10:29, Ed Tanous wrote:
>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
>> <kumarthangavel.hcl@gmail.com> wrote:
>>>
>>> Hi All,
>>>
>>> Gentle Reminder on this.
>>>
>>> Thanks,
>>> Kumar.
>>>
>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel 
>>> <kumarthangavel.hcl@gmail.com> wrote:
>>>>
>>>> Hi All,
>>>>
>>>>
>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab 
>>>>
>>
>> Bruce, this is your patch.  Could you take a look at the below and
>> provide your input?
>>
>>>>
>>>>
>>>> While testing those changes in my platform, I found that each sensor 
>>>> in hwmon temp has been creating twice.
>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is 
>>>> created twice.
>>>>
>>>>
>>>> /sys/class/hwmon/hwmon2/temp2_input
>>>> /sys/class/hwmon/hwmon2/temp1_input
>>>>
>>>>
>>>> Before your change, hwmon temp sensor will check whether the path is 
>>>> already exists or not.
>>>> If it exists, it will skip and proceed with next path.
>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96 
>>>>
>>>>
>>>>
>>>> Could you please explain why it is creating twice in hwmon temp ?
>>>>
>>>>
>>>> Journalctl log before your changes applied :
>>>>
>>>>
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : 
>>>> "/sys/class/hwmon/hwmon2/temp2_input"
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : 
>>>> xyz.openbmc_project.Configuration.TMP421
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : 
>>>> "/sys/class/hwmon/hwmon2/temp1_input"
>>>>
>>>>
>>>>
>>>> Journalctl log after your changes applied :
>>>>
>>>>
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> "/sys/class/hwmon/hwmon2/temp2_input"
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : 
>>>> xyz.openbmc_project.Configuration.TMP421
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>>
>>>>
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> "/sys/class/hwmon/hwmon2/temp1_input"
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : 
>>>> xyz.openbmc_project.Configuration.TMP421
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : 
>>>> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Kumar.
> 
> I will give it quick look today.  Also today is my last day at IBM.
> 

The problem I had to solve was that I was adding devices
(DPS310 and Si7020 type) that has more than one sensor type
per device, in this case under /sys/bus/iio/devices .
So the loop cannot continue after finding the first sensor of
the device.  I have not seen p10bmc /sys/class/hwmon temperature
sensors being created twice, in this case the TMP75.

What is the entity-manager configuration for your system?
I suspect that the dbus-sensors Hwmon does not take into account
some detail that is needs to related to entity-manager.


