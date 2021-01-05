Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77722EAF85
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 16:59:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9HHb3LSczDqgx
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 02:59:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jxDu16IU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9HGl0n4mzDqYV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 02:58:38 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 105FnQOH057116; Tue, 5 Jan 2021 10:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Mj5popuHq7bpKgRxnBD18atCcM4DTMKoo9gYWGEhQXM=;
 b=jxDu16IU8SKUCfLzVIafZDjtwev6+K1PcE0cEBmFtDR8ybgc07wqnQuEURxSwxiXh6aA
 oHiE0g0H/Ma/hPR24ApjuRTvE09ePfGEwz4LZsYT/me6qwwmATxJ8ibbufET8yWylHhc
 jPqRFOCEaWtzuSdGPAshLjZQJ1lR0rsZdsEivOk6NOGb0hwEQGM4u77hIZiy9eduQZji
 DoawuZa6W+M3NYXByJFBpgEX5hVmxjZ7W475+DT2SkepzMGT8j8CGuOw6i70YzMaEzlV
 pa0G7jsMVK3H18wOOy/llpn0IFT96L6cfaPOfSYNVbErwGbv1dWI4A7QY4ONmLHucnMT hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vt3r2mme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:58:34 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 105FoQh1063387;
 Tue, 5 Jan 2021 10:58:15 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vt3r2m3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:58:15 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 105FqvsR025658;
 Tue, 5 Jan 2021 15:56:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 35tgf9pp16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 15:56:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 105FuYqm24248674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jan 2021 15:56:35 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D804E6E04E;
 Tue,  5 Jan 2021 15:56:34 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C6916E050;
 Tue,  5 Jan 2021 15:56:34 +0000 (GMT)
Received: from [9.160.22.70] (unknown [9.160.22.70])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jan 2021 15:56:34 +0000 (GMT)
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Patrick Williams <patrick@stwcx.xyz>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
Date: Tue, 5 Jan 2021 09:56:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/R3XZNHmYpz74mu@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_03:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1011 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050096
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/5/2021 8:27 AM, Patrick Williams wrote:
> On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
>> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
>>> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com
>>> <mailto:mspinler@linux.ibm.com>> wrote:
>>>
>>>      I need a median of some sensor values, where this median sensor has
>>>      threshold interfaces
>>>      whose values must be defined in entity-manager.  Since exprtk
>>>      expressions are not allowed in
>>>      entity-manager, I cannot just port the PVS's JSON config into an
>>>      entity-manager config.
>>>
>>> I missed this discussion but why can't we simply use virtual sensor as
>>> expertk provides median function and we have threshold support for
>>> each virtual sensor. Please help, if I am missing anything.
>> If you're asking why can't we just have PVS get its exprtk expression to
>> use from entity-manager, and encode the median there, it's because Ed
>> doesn't want exprtk in entity-manager config files (I'll defer to him on
>> the reasons).
> As part of offline discussions on this I said that having a one-off EM
> config for median to allow you to make progress is reasonable, but I
> don't think having a bunch of one-offs is a viable long-term solution
> for phosphor-virtual-sensors.  Basically we're kicking the can down the
> road until we have a better understanding of what kinds of EM/PVS
> configs we're going to need.
>
>> If you're asking now that the median function is hardcoded, why write it in
>> C++ instead of exprtk, it's because the exprtk code would be so similar to
>> C++ code (skip the bad values, put the sensors in a vector,  call
>> nth_element)
>> that writing it in exprtk doesn't really buy us anything, and using C++ lets
>> me skip making the symbol table.
> I would certainly prefer we use the exprtk code here.  You should be
> able to generate (at runtime) a exprtk expression from the EM config you
> specified below.
>
> My rationale is:
>      * Ed suggested that a long-term answer might be a few lookup tables
>        / transformations from the EM configs to the PVS expressions.  I'm
>        not fully bought into this yet but it seems like a reasonable
>        direction to explore.
>
>      * You wrote "because the exprtk code would be so similar to the C++
>        code", which is why you *should* do it in exprtk.  The rest of the
>        PVS code is already this way so why something different and
>        require dual maintanence?  If the exprtk-based support code is
>        missing some of these features, lets add them because others will
>        likely need them as well.

See below.

>>>      Instead, I will make a new entity-manager config that will have the
>>>      component sensors
>>>      along  with the thresholds to use, with a subtype of median, vaguely
>>>      something like:
>>>
>>>      {
>>>      Type: "VirtualSensor"
>>>      Name: "MySensorName"
>>>      Subtype: "Median"
>>>      Sensors: [ "Sensor1", "Sensor2", .... ]
>>>      ThresholdsWithHysteresis [ ]
>>>      minInput: 0
>>>      maxInput: 100
>>>      }
>>>
> I would expect the 'exprtk' expression from your EM config to be
> something like "median(Sensor1, Sensor2...)".  You should be able to
> feed this into the existing virtual-sensor constructors and not have to
> make the symbol table yourself.

Every variable used by exprtk needs to be added to the symbol table 
first by the C++.

Also, we need a slightly tweaked median of our 3 ambient temp sensors:
1) throw out values outside of minInput/maxInput
2) if there is an even number, because we threw out one, choose the 
higher value, and
     don't do the average of the 2  that I believe an actual median 
would use.
3) if we threw out all 3 (very unlikely), use NaN as the sensor value.

This is easy to do in C++ using std::nth_element, and basically looks 
the same in
exprtk which is why I suggested just using C++ though I don't really 
care that much either way,
but I don't see how we could upstream this as a true median().  In fact, 
since
the underlying code would just use  nth_element anyway, I'm not even 
sure it would
be accepted and is probably why there isn't already a median().

Since I guess it could be argued this isn't a true median, maybe we 
shouldn't call it
a median, which is fine, but we still need it.

> Exprtk doesn't currently support a 'median' operator but it does support
> 'avg'.  We should contribute this upstream and add as a patch in the
> meantime.
>

