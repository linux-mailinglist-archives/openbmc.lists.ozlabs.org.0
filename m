Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37C1B4A36
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 18:20:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496lyw0cQDzDqgD
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 02:20:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496lxR30WjzDqBL
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 02:19:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MG3BbU112033; Wed, 22 Apr 2020 12:19:03 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2ygyua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 12:19:02 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03MGI2rc015585;
 Wed, 22 Apr 2020 16:19:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 30fs66tqda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 16:19:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03MGJ1AH16777650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 16:19:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E157C12405A;
 Wed, 22 Apr 2020 16:19:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA43C124052;
 Wed, 22 Apr 2020 16:19:01 +0000 (GMT)
Received: from [9.85.155.31] (unknown [9.85.155.31])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Apr 2020 16:19:01 +0000 (GMT)
Subject: Re: dbus-sensors
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
Date: Wed, 22 Apr 2020 11:19:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_06:2020-04-22,
 2020-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220122
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

Great!  Sounds like we should be able to make thing work.
A few comments below.

On 4/21/2020 4:54 PM, James Feist wrote:
> On 4/21/2020 12:35 PM, Matt Spinler wrote:
>> Hi James,
>>
>> We're looking into using dbus-sensors(HwmonTemp and PSU) in the future,
>> but would need to make a few changes to fit our requirements. Was 
>> wondering
>> what you'd think of the following:
>>
>> 1. Check if a sensor has a _fault sysfs file, and if it does and it
>>    is nonzero, set the Functional property on the OperationalStatus
>>    interface to false (and/or maybe 6 below)
> Sounds ok.
>
>>
>> 2. After the 10 failed reads, instead of just setting the sensor to 0
>>    also make a D-Bus call to create a phosphor-logging event log and set
>>    the OperationalStatus sensor to false.
>
> Sounds ok.
>
>>
>> 3. After creating this event log, make sure not to do it again until
>>    main power is cycled.
>
> I'd rather this be until the status goes OK again.

As suggested by Patrick, I agree the throttling can be done elsewhere, so we
would just create the logs as you state here.

>
>>
>> 4. If not already supported (was unsure), be able to find an
>>    _input file based on a value it has in the corresponding _label file.
>
> PSU sensor does this, hwmontemp does it by index.

Would you be OK with us also adding this to PSUSensor?

>>
>> 5. We have a case where a driver isn't loaded with power off, so somehow
>>    we still need the sensors to stay on D-Bus when off (and show them
>>    as not available).
>
> All sensors are on d-bus all the time, its based on the EM config.

Perfect!

>
>>
>> 6. Maybe add a new property to Sensor.Value on the validity
>>    of the value property, for when driver is unloaded or there is an
>>    error or the sensor reading is otherwise not valid.  We could add
>>   this to phosphor-hwmon at the same time.
>>   (I think this was mentioned on the list before).
>
> Yes, this is where we've used std::nan, I'm not sure if that made it 
> to all sensors as it's not tested very much. I know the fans do this.
>
>>
>> We would definitely of course work with you on the best way to
>> accomplish these, and I know #6 needs more discussion on if
>> this is something we want to do in OpenBMC, though I thought
>> I remembered an earlier discussion where it was popular.
>>
>> Thanks,
>> Matt

