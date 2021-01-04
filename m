Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B652EA03A
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 23:58:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8rdt15z7zDqSx
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 09:58:42 +1100 (AEDT)
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
 header.s=pp1 header.b=oHpbFi5T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8rd16DSXzDqRR
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 09:57:57 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104MWc78047166
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 17:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=03ZwzSCKKLGc1SS3xi5o4zDGcNV6q64Ocngys7HZm4Q=;
 b=oHpbFi5Tj8Ytv3StYs1uJZYG6sUDh2xAVgpZFOB/jmqtQI7zeWjPhgHEYOqqAf3HLT/c
 dohSJeqSzbnnttAP5uZOIZLWm1ljLXQViW2Q2tHGYWqD578Uy6ANEP/QSHKxT8i9EuCQ
 +rwkSSolMQDWwGAaHBcE8/m8Bc68rCV4lXrZHT9bG0YWEbEYgLFtjKJ1sb3AqhQIZ+gf
 an6PDjfzZfo6Yr5O15oyuJhRsGIMwgFd/n9S7CMV8I3F2M/sJBLgbDCCx17QWNG+iM4i
 g+cH0zBeN9MDoJGoC7gOVM1rCpsklJqvzX6CWSv8CJdQnyscHcB8k1uPZevkOU/2z3FI Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vavs9q2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 17:57:54 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 104MWhGg047737
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 17:57:54 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vavs9q29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 17:57:54 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104MunYi005892;
 Mon, 4 Jan 2021 22:57:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 35tgf8sgt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 22:57:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104Mvqtq37224758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 22:57:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30012AC05E;
 Mon,  4 Jan 2021 22:57:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8F1CAC05F;
 Mon,  4 Jan 2021 22:57:51 +0000 (GMT)
Received: from [9.160.44.189] (unknown [9.160.44.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jan 2021 22:57:51 +0000 (GMT)
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
Date: Mon, 4 Jan 2021 16:57:51 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_14:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040134
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/4/2021 2:54 PM, Vijay Khemka wrote:
> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler ...
> This Message Is From an External Sender
> This message came from outside your organization.
>
>
>
> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com 
> <mailto:mspinler@linux.ibm.com>> wrote:
>
>     Hi,
>
>     Just putting on the list what was decided after some lengthy
>     discussions
>     on discord.
>
>     I need a median of some sensor values, where this median sensor has
>     threshold interfaces
>     whose values must be defined in entity-manager.  Since exprtk
>     expressions are not allowed in
>     entity-manager, I cannot just port the PVS's JSON config into an
>     entity-manager config.
>
> I missed this discussion but why can't we simply use virtual sensor as
> expertk provides median function and we have threshold support for
> each virtual sensor. Please help, if I am missing anything.

If you're asking why can't we just have PVS get its exprtk expression to
use from entity-manager, and encode the median there, it's because Ed
doesn't want exprtk in entity-manager config files (I'll defer to him on 
the reasons).

If you're asking now that the median function is hardcoded, why write it in
C++ instead of exprtk, it's because the exprtk code would be so similar to
C++ code (skip the bad values, put the sensors in a vector,  call 
nth_element)
that writing it in exprtk doesn't really buy us anything, and using C++ lets
me skip making the symbol table.

>     Instead, I will make a new entity-manager config that will have the
>     component sensors
>     along  with the thresholds to use, with a subtype of median, vaguely
>     something like:
>
>     {
>
>     Type: "VirtualSensor"
>
>     Name: "MySensorName"
>
>     Subtype: "Median"
>
>     Sensors: [ "Sensor1", "Sensor2", .... ]
>
>     ThresholdsWithHysteresis [ ]
>
>     minInput: 0
>
>     maxInput: 100
>
>     }
>
>
>     The minInput/maxInput are needed so we don't use garbage sensor
>     readings
>     in the median
>     algorithm.  PVS will look for this config to be provided on D-Bus by
>     entity-manager, and if
>     it's there it will calculate the median (in C++, not exprtk) and
>     use it
>     as the virtual sensor value.
>
>     Thanks,
>     Matt
>

