Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1CA341793
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 09:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1y224hcmz3bwW
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 19:37:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NisksEpu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NisksEpu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1y1n5VZRz30DT
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 19:37:16 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12J8Wi35153285; Fri, 19 Mar 2021 04:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h0wf2lfcb0L2wbbPIXFFhbb90BKoulkU0ewBar2RU2A=;
 b=NisksEpuoqyPOfboQu1LWpKcphV7jAt1MnTu3rnrdFMuob3SwMQyS0MAZAhdpEtwt68g
 LIIdm/c2jtHXfmC30h82Pocu6TDfUNAojqATYrfBY+FUWODDkvlzOffZNomqWkXCpjKA
 WNtgK+Y2kycHiqHKFgixdnaJAd5n28adlT7k1xVStiJDLG1Xl5TzKPZAzWMP8GN2kWH6
 onvlalAnHd/xll0e85RK4Myd7d7Xh+7Iwpk20xR89iD++6vT3T0UVHWGvtKOz1/lF4Cx
 aeUlNMw0yy53nfBTf7Lwifp8jQs2t064PjuVKJaGsZc9vjqwPLSdXQDkeIXyCljxG1Uo vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37cr2h8u3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 04:37:09 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12J8W99W015836;
 Fri, 19 Mar 2021 08:37:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 37crcrg0by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 08:37:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12J8amoa31588700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 08:36:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B6AFA4040;
 Fri, 19 Mar 2021 08:37:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 685FFA4057;
 Fri, 19 Mar 2021 08:37:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.127.126])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Mar 2021 08:37:04 +0000 (GMT)
Subject: Re: Emit interface added signal
To: Patrick Williams <patrick@stwcx.xyz>
References: <580c5e6c-5946-eedc-25b0-53315a0831cd@linux.vnet.ibm.com>
 <YFNqT47YVXprhEsM@heinlein>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <6a83328d-c9d8-e387-6647-0595b9e73e88@linux.vnet.ibm.com>
Date: Fri, 19 Mar 2021 14:07:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFNqT47YVXprhEsM@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_02:2021-03-17,
 2021-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103190060
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Patrick for your response.

On 3/18/21 8:27 PM, Patrick Williams wrote:
> On Thu, Mar 18, 2021 at 04:03:21PM +0530, Ratan Gupta wrote:
>
>> Proposal: Don't emit the interface added signal by the D-bus service if
>> we are restoring the D-Bus objects from file system.
>>
>> Do we see any concern here? or any other way to fix the above issue?
> Yes, this is pretty dangerous.  If you do this, mapper will not know
> about your objects and they will not show up in queries.  This is
> certainly not what you want.  (Mapper will delete your objects from its
> cache when the service exits, and not know that you have new ones
> because it did not get the signal.)
>
> This isn't just about mapper though.  Anytime you do not emit the
> signals, you then require applications to poll your service for
> knowledge of your objects.
>
> In general, you should not work around an issue in one application
> (bmcweb in this case) by changing your dbus behavior.  This isn't the
> first time that I've seen a similar request.

My plan was not to modify anything in bmcweb, My plan was exactly as you 
described below

The dbus applications which is restoring the Dbus objects from the file 
system needs to be modified if they are restoring the Dbus objects from 
the file system and that was the intent to send this mail as the changes 
lies in other repo.

e.g. 
https://github.com/openbmc/phosphor-debug-collector/blob/master/dump_manager_main.cpp#L60


>
> Having said this, there is one option for you.  This is completely valid,
> and done by other dbus services we have, and arguably more correct than
> what it sounds like you're currently doing.
>
>     - Defer the service name registration until just before entering your
>       dbus processing loop.
>
>     - Create your restored dbus objects before this service name
>       registration and use the `emitSignal=false` argument to prevent
>       the signal from being emitted.
>
> This pattern is your way of indicating "these aren't new dynamic
> objects, but objects I'm creating at the beginning of my service."
> When mapper sees the NameOwnerChanged signal, it will query your service
> for objects and add them to its cache.  `bmcweb` won't see the
> ObjectManager.InterfacesAdded signals for these static / restored
> objects, but it will see them for new / dynamic objects.
>
