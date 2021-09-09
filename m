Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B5405807
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 15:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H50kD5QhNz2yKN
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 23:49:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n7w+t2kF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n7w+t2kF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H50jg4YdMz2xrX
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 23:49:27 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 189DWhkx065648; Thu, 9 Sep 2021 09:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YOADUv/wRxpcFSdNFbl1N5SS8ZlACAZ0KlTyLm4aDps=;
 b=n7w+t2kFOfaLxKEtctq/oQ0c5vHnWtUd6fnRpZFPXof/hmmR40e4vYuqVI0/lszcUhps
 axcCzpIy1Xu3vGvKK4d+bSEaNg/crwlxshGKVOl2ylvqazd5DM+aBtmIKMcUtjWmFTyX
 s4ZslOJxA4Ob2bLlya6TMKGX4ymIDgF1Ml/XBRsF8cFCYs2CgFqt+pTZgQdVRu/CWMrk
 65FF90PTvwyQdQVOXPMRZRQnzDCYf4OyjY++unGdKbbp4Lz/YsFBJ3JWtpUwUDcfD9Zt
 2Pn1p/oKyGJ+dJPK63EWdOQMJfAzGGj0NQaTy73NREtlO8FJV/h7DzE8jJiVrd5TDNR/ Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aygjvd0rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 09:49:21 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 189DXCZ6067716;
 Thu, 9 Sep 2021 09:49:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aygjvd0r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 09:49:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 189DhQZD003673;
 Thu, 9 Sep 2021 13:49:20 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3axcnr5as3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 13:49:20 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 189DnKje43909514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 13:49:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC73AAE0A4;
 Thu,  9 Sep 2021 13:49:19 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69537AE097;
 Thu,  9 Sep 2021 13:49:19 +0000 (GMT)
Received: from [9.163.8.88] (unknown [9.163.8.88])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Sep 2021 13:49:19 +0000 (GMT)
Subject: Re: Looking for clarification on sysfs IIO devices, do _raw devices
 require both _offset and _scale?
To: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <cc74f30f-9ab8-45ce-1f44-8e55c3f9c5ce@linux.vnet.ibm.com>
 <5c79425f-6e88-36b6-cdfe-4080738d039f@metafoo.de>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <b9f78f37-fbb6-ea68-48c1-917cf42ca57f@linux.vnet.ibm.com>
Date: Thu, 9 Sep 2021 06:49:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5c79425f-6e88-36b6-cdfe-4080738d039f@metafoo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lr1GrOcjFNSdsgCM1r13fjtaz44hDdli
X-Proofpoint-ORIG-GUID: boH-cdt_nHT8P33EbzGCirfKyTQ5Vcfg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_04:2021-09-09,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090083
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/9/2021 00:12, Lars-Peter Clausen wrote:
> On 9/9/21 12:10 AM, Bruce Mitchell wrote:
>> In reference to:
>> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-iio
>>
>> I have Temperature, Pressure, and Humidity IIO sensors.
>> IIO _raw devices look like this on sysfs:
>>   this happens to be a SI7020 type device with 2 sensors
>>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_offset
>>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_raw
>>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_scale
>>     /sys/bus/iio/devices/iio:device0/in_temp_offset
>>     /sys/bus/iio/devices/iio:device0/in_temp_raw
>>     /sys/bus/iio/devices/iio:device0/in_temp_scale
>>
>> Other IIO _input devices look like this on sysfs:
>>   this happens to be a DPS310 device with 2 sensors
>>      /sys/bus/iio/devices/iio:device1/in_temp_input
>>      /sys/bus/iio/devices/iio:device1/in_pressure_input
>>
>> As I read it if the IIO device was an _input type on sysfs,
>> just read it (and possibly scale it for units).
>>
>> But if the IIO device was a _raw type on sysfs my understanding
>> is that it must be accompanied by a _offset and a _scale for
>> at least temperature, pressure, humidity, voltage, and current
>> sensors.
>> Is that correct?
>>
>> Further for any IIO device that is a _raw type on sysfs is it
>> required to be accompanied by a _offset and a _scale as well?
> 
> Hi,
> 
> That sounds about right.
> 
> The _input name is historically and comes from hwmon framework. It means 
> that the data has been processed by the kernel driver and converted to 
> the right SI units for the channel type. This is usually used for sensor 
> that have a non-linear transfer function. `raw` on the other hand means 
> the data is just as it is reported by the hardware. The reason for this 
> is that conversion to SI units is often not lossless, since we have 
> finite precision. So it is up to the application to decide whether it 
> wants to work on the raw data or how it wants to round the converted data.
> 
> `input` attributes never have scale and offset since they are already in 
> the right unit. For raw scale and offset are optional. If scale does not 
> exist assume it is 1, if offset does not exist assume it is 0. You'll 
> rarely see a device with raw attributes without scale, but there are 
> quite a few without offset.
> 
> - Lars
> 
> 

Thank you Lars!

-- 
Bruce

