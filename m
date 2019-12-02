Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07210EC53
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 16:31:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RTbk3Xx4zDqNV
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 02:31:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RTZy71CbzDqNS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 02:30:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB2FKS7l052464; Mon, 2 Dec 2019 10:30:27 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6tjyx9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 10:30:26 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB2FUMZc006147;
 Mon, 2 Dec 2019 15:30:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2wkg26gnh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 15:30:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB2FUOvG49479966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2019 15:30:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25556AC064;
 Mon,  2 Dec 2019 15:30:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A9F1AC05B;
 Mon,  2 Dec 2019 15:30:24 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Dec 2019 15:30:23 +0000 (GMT)
Subject: Re: [External] Power-on monitor for phosphor-hwmon question
To: Ivan Li11 <rli11@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
 <e1d67f474f6b4be2b28a583a9c848741@lenovo.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <85f47c2a-26d8-acc9-a58f-e430204e3acd@linux.ibm.com>
Date: Mon, 2 Dec 2019 09:30:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e1d67f474f6b4be2b28a583a9c848741@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_03:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912020137
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



On 12/2/2019 9:15 AM, Ivan Li11 wrote:
>> -----Original Message-----
>> From: Ivan Li11
>> Sent: Wednesday, November 27, 2019 10:26 PM
>> To: 'Matt Spinler' <mspinler@linux.ibm.com>; openbmc@lists.ozlabs.org
>> Subject: RE: [External] Power-on monitor for phosphor-hwmon question
>>
>>> -----Original Message-----
>>> From: Matt Spinler <mspinler@linux.ibm.com>
>>> Sent: Tuesday, October 22, 2019 9:24 PM
>>> To: Ivan Li11 <rli11@lenovo.com>; openbmc@lists.ozlabs.org
>>> Subject: Re: [External] Power-on monitor for phosphor-hwmon question
>>>
>>>
>>>
>>> On 10/21/2019 6:02 AM, Ivan Li11 wrote:
>>>> Hi Team,
>>>>
>>>> Does anyone have suggestion for this ?
>>>>
>>> Hi, you're right, it doesn't support that yet.  We've had a few
>>> internal discussions about how to handle that gracefully, though our
>>> platforms don't use sel-logger, but nothing solid came out of them and
>>> we don't have anything scheduled yet.
>>>
>>> It would be easy enough to have a watch on the PGOOD property, and
>>> then do you what you want, like maybe turning off the thresholds.
>>>
>>> I heard that the d-bus sensors repository has some sort of support for
>>> this, but since we don't use it I'm not sure what all that entails. I
>>> think it may also force you to replace phosphor-inventor-manager with
>> entity-manager.
>> Hi Matt,
>> We can use dbus-match mechanism in phosphor-hwmon to turn on/off the
>> thresholds just like what dbus-sensors repository does in the following link:
>> https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f69558273307
>> a59e4b1cf86b8a6/src/Utils.cpp#L141
>>
>> If it's ok for you, I'll work on it and send patch for you review.
>> Please help to comment on it.
>>
> Hi Matt,
> Could you help to comment on this proposal.
> Thanks your great support in advance.

That sounds good to me.  Thanks!


>
>>>> Thanks your great support in advance.
>>>>
>>>> *From:*openbmc <openbmc-bounces+rli11=lenovo.com@lists.ozlabs.org>
>>> *On
>>>> Behalf Of *Ivan Li11
>>>> *Sent:* Friday, October 18, 2019 5:59 PM
>>>> *To:* openbmc@lists.ozlabs.org
>>>> *Subject:* [External] Power-on monitor for phosphor-hwmon question
>>>>
>>>> Hi Team,
>>>>
>>>> We found that there's no power-on monitor mechanism in
>>> phosphor-hwmon.
>>>> https://github.com/openbmc/phosphor-hwmon
>>>>
>>>> And it will cause incorrect threshold logs to be added to journal
>>>> log by 'sel-logger' when system is in power off(S5) state.
>>>>
>>>> Is there any plan to implement it? Or other repository we can refer to ?
>>>>
>>>> Thanks,
>>>>
>>>> Ivan
>>>>

