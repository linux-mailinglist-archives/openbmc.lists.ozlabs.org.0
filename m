Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777C482567
	for <lists+openbmc@lfdr.de>; Fri, 31 Dec 2021 18:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQXH220V0z304w
	for <lists+openbmc@lfdr.de>; Sat,  1 Jan 2022 04:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZvCpLu4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gZvCpLu4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQXGY0YJCz2xF1
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jan 2022 04:30:28 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BVFhQvh003611; 
 Fri, 31 Dec 2021 17:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UjVKSPk6WFdy7iTxlYTdSMZwit1dbhsXIGEYOGay+IQ=;
 b=gZvCpLu43C5jgu1KMz8D2hzTvuHhBb9tcXI6/Adqwy3EFDX4+tR7IXf7FanxCJDQvEf7
 5t/G/tzbZivQiG39NPB/UuFFqElq9OSAVF1K+sNY5XMCAh3BaW36F1qoTLd49gY7pbW0
 E+EG/FjAObeZlfjinZoC/8a4RAgQj5x54wZkLQeHJNgOoLpyvR8AEo2ZRRjZL9zU9lL1
 wIO2eEkp0fpyy+a3eML9fb7byZazcKgtCi52erQjTyKtHr6VNPGbC56qCKH/kC51ZWI1
 TU7IrtDvraCmczpLEFOm2XPFrS37VGktm6kMhmDxZyU3IE240ov9J15R3rEpLOW4Leyn Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3da4rphnvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 17:30:22 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BVHG1QX016330;
 Fri, 31 Dec 2021 17:30:22 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3da4rphnve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 17:30:21 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BVHMrR1030175;
 Fri, 31 Dec 2021 17:30:20 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3d5txbh7vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 17:30:20 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BVHUKos28312022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Dec 2021 17:30:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 252AB124055;
 Fri, 31 Dec 2021 17:30:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75AB7124058;
 Fri, 31 Dec 2021 17:30:19 +0000 (GMT)
Received: from [9.211.146.101] (unknown [9.211.146.101])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 31 Dec 2021 17:30:19 +0000 (GMT)
Message-ID: <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
Date: Fri, 31 Dec 2021 09:30:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: hwmontempsensor issue in dbus-sensor
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
 <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
 <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
In-Reply-To: <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XNht77uwgflk1qyZ79LdRx64dxjBaQ-H
X-Proofpoint-ORIG-GUID: Zc-T9zly7gULsG8Vs-JNgvg-XHKA8PfJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_07,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310072
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

On 12/20/2021 10:29, Ed Tanous wrote:
> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> <kumarthangavel.hcl@gmail.com> wrote:
>>
>> Hi All,
>>
>> Gentle Reminder on this.
>>
>> Thanks,
>> Kumar.
>>
>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <kumarthangavel.hcl@gmail.com> wrote:
>>>
>>> Hi All,
>>>
>>>
>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab
> 
> Bruce, this is your patch.  Could you take a look at the below and
> provide your input?
> 
>>>
>>>
>>> While testing those changes in my platform, I found that each sensor in hwmon temp has been creating twice.
>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is created twice.
>>>
>>>
>>> /sys/class/hwmon/hwmon2/temp2_input
>>> /sys/class/hwmon/hwmon2/temp1_input
>>>
>>>
>>> Before your change, hwmon temp sensor will check whether the path is already exists or not.
>>> If it exists, it will skip and proceed with next path.
>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
>>>
>>>
>>> Could you please explain why it is creating twice in hwmon temp ?
>>>
>>>
>>> Journalctl log before your changes applied :
>>>
>>>
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : xyz.openbmc_project.Configuration.TMP421
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
>>>
>>>
>>>
>>> Journalctl log after your changes applied :
>>>
>>>
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>
>>>
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>
>>>
>>>
>>> Thanks,
>>>
>>> Kumar.

I will give it quick look today.  Also today is my last day at IBM.

