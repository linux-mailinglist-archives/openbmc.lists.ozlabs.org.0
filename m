Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34475294488
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 23:27:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG6Cc4Dz2zDqhC
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 08:27:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ICD6ay8P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG6Bm5qPKzDqfP
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 08:26:40 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KL2Yux099518; Tue, 20 Oct 2020 17:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZQNpuNy3H9M1+J5trvTxoDsh5frzKzDtGZFtBTKYw3k=;
 b=ICD6ay8Pxfdzs6zxVbZ4C39PZ9vnJ/AQSrRUC1GAcfHwc0I/AU9qQFGbFwcQPavIrrgZ
 t06Ot2MGRX7Fg6bA6O2nzeGmfcs6yNfXWMkHwbpToNhFpF5ItlRX9JfxfZzrEVCHdE54
 ycNPmxjS9D4EZV4m2NtKD+fnPJAo2s0sh0B4EIHY64EW2fsotm9FmgMJavBzcXYdbo9b
 nisipCOuPdjrYx3QSc5uGVNb3TivdfvXQHr/MOxfkjLbS1o08J/NUc1blc4/D0gXObBX
 6jTBHnDn6rwIDpAQX050Bw3JjoSUkissumuHaK5OsTa5ysKzzh2do2zy7miqnwdtgavG UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34a7enrj9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:26:36 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09KL3QJP101385;
 Tue, 20 Oct 2020 17:26:36 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34a7enrj9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:26:36 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09KLCqvX005657;
 Tue, 20 Oct 2020 21:26:35 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 347r8933r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 21:26:35 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09KLQZmw13042508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 21:26:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F21F4124052;
 Tue, 20 Oct 2020 21:26:34 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95844124054;
 Tue, 20 Oct 2020 21:26:34 +0000 (GMT)
Received: from [9.160.87.233] (unknown [9.160.87.233])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Oct 2020 21:26:34 +0000 (GMT)
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Patrick Williams <patrick@stwcx.xyz>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
 <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
 <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <6c8df4cb-2b22-97bb-9ba6-f9dece0e14e5@linux.ibm.com>
Date: Tue, 20 Oct 2020 16:26:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_12:2020-10-20,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=989 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010200143
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
Cc: openbmc@lists.ozlabs.org, Thu Ba Nguyen <tbnguyen1985@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/20/2020 9:18 AM, Patrick Williams wrote:
> On Tue, Oct 20, 2020 at 08:46:30AM -0500, Matt Spinler wrote:
>>
>> On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:
>>> I also thought about the solution for that features:
>>> In the current hwmon we support GPIOCHIP + GPIO option which used to
>>> enable sensors to read. In the hwmon code, we just set that pin and wait
>>> before reading.
>>> I think we can support a similar option named GPIOENABLE + GPIOV. When
>>> the status of Gpio pin defind in GPIOEANBLE match with GPIOV.
>>> That sensors will be read and update to Dbus.
>>> If not it will be removed from DBus until the GPIO pin math GPIOV.
>>> Maybe we can have many different solutions.
> ...
>>> If you don't mind, can you tell me how IBM supports that features?
>> We lucked out out in that the driver was only loaded when power was on.
>>
> Hi Thu,
>
> Is this something you could do similarly?  Rather than have the driver
> understand the GPIO directly you can trigger a phosphor-gpio-monitor
> service that does a 'bind' / 'unbind' to dynamically enable and disable
> the hwmon driver?
>
> Matt, is that how you have the driver configured to load / unload (I
> assume your case is for the OCC).

We use a slightly different mechanism since we need to wait for the host
to tell us the device is running (yea it's the OCC), but same general idea.

>

