Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8281346226
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 16:00:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4ZLJ4qZ1z30GH
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 02:00:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRYkf0Y+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pRYkf0Y+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4ZL26lsGz2yh8
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 02:00:25 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NEWqgR126597
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 11:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=q0WLBnPjglQDSpiztwFs0jA3ITBrhm0IDwmcPhXmMrM=;
 b=pRYkf0Y+jK9n3Xh5Bax7khNTfJXe82CJye9B+Aeqg2+JqfwGGOvUw4fRNcyLf8y+RYVm
 3nCMN44NQrPp2SOeQI17ngUCVflI6OzIZNZIOXsvxfobrm/6ZRA4Fd+yGnOojz78+g8m
 aSe/UdQEmegrT5vbKN8oLiIx3kKKq6oAFyq+9w6kSKoS47i6MnD5rgE3ypZyZC5yAVTh
 8YtXUHP1DAETOsLgMWMAZsuz6m4ot8iBb3f4IbmlyOxEq7NI6TZnmmRftmtIOroc//pj
 If6K8sNTrsQ/KArqUAkvUIofvdh9qk/3Lg+FJI9tItxtlLeos7mkpX9YLEfEDZtZnF78 tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4b4rcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 11:00:23 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NEX516127464
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 11:00:22 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4b4rc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:00:22 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NEvGWB009083;
 Tue, 23 Mar 2021 15:00:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 37equdc8x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 15:00:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NF0JIO33227256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 15:00:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D94BAE060;
 Tue, 23 Mar 2021 15:00:19 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84E8AE05F;
 Tue, 23 Mar 2021 15:00:18 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 15:00:18 +0000 (GMT)
Subject: Re: Thoughts on performance profiling and tools for OpenBMC
To: Sui Chen <suichen@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3bf01473-33f0-59c9-9c76-b190bbb59573@linux.ibm.com>
Date: Tue, 23 Mar 2021 10:00:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230107
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

On 3/22/21 5:05 PM, Sui Chen wrote:
> Hello OpenBMC Mailing List,
>
> This email is to discuss some thoughts and work in progress regarding
> the performance of BMC. We are aware performance has been brought up a
> few times in the past, so this document covers and keeps track of some
> recent work. The following is written according to the design doc
> format, but might still have some way to go before becoming a more
> concrete "set of benchmarks for OpenBMC". As such, any feedback is
> appreciated. Thanks for reading this!

Sui,

I believe there are tie-ins between performance and security.  For 
example, if a BMC user can cause very bad performance or cause the BMC 
to crash, the BMC will not be able to perform its primary function.  
That constitutes a [denial of service][], a security issue.  So I am 
interested in the outcome of BMC performance profiling (but don't have 
resources to contribute).

More specifically, I believe there are tie-ins between the performance 
profiling work and the threat modeling work.  Threat modeling needs an 
architectural model of the interfaces within the BMC, for example, the 
D-Bus and daemon layers.  The [security working group][] has started 
modeling these interfaces, but making progress is hard (search for 
"model" or "threat model").  I understand performance work also needs 
similar models.  I am interested to see any architectural work you have 
in this area.

Thank you!

Joseph

[denial of service]: https://en.wikipedia.org/wiki/Denial-of-service_attack
[security working group]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group


> [ Problem Description ]
>
> Writing benchmarks and studying profiling results is not only good for
> learning the basic APIs and constructs, but also sometimes useful for
> debugging complicated interactions between multiple moving parts of
> the system.
>
> When developers worked on devices with similar specs as BMCs, such as
> smartphones from a few years back, they got performance profiling
> support from developer tools.
>
> BMCs have many interesting aspects involving kernel drivers, hardware
> interfaces, multi-threading, modern programming language features,
> open-source development all packed together into very tight hardware
> and software constraints and a build workflow that compiles code from
> scratch. During debugging, many steps may be needed to recreate the
> scene where performance-related problems arise. Having benchmarks in
> this scenario makes the process easier.
>
> As BMC becomes more versatile and runs more workloads, performance
> issues may become more imminent.
>
> [ Background and References]
>
> 1. BMC performance problems are asked and encountered, and they may be
> helped by benchmarks and tools. Related posts
>     - “ObjectMapper - quantity limitations?” [1]
>     - “dbus-broker caused the system OOM issue” [2]
>     - “Issue about (polling every second) makes Entity Manager get stuck” [3]
>     - “Performance implication of Sensor Value PropertiesChanged Events” [4]
>
> 2. People have started to find solutions for existing and potential
> problems. Examples are:
>     - io_uring vs epoll [5]
>     - shmapper [6]
>
> 3. BMC workloads have their own characteristics, namely, the extensive
> use of DBus, and the numerous I/O buses, among many others. Some of
> these may not have been captured by existing benchmarks on Linux.
> These reasons might justify spending efforts on making a BMC-specific
> set of benchmarks.
>
> 4. There have been proposals for adding performance testing to the CI
> [9]. A baseline, a way to measure performance are needed. This
> document tries to partially discuss the measurement question.
>
> [ Requirements ]
>
> The benchmarks and tools should report basic metrics such as latency
> and throughput. The performance profiling overhead should not distort
> performance results.
>
> The contents of the benchmark can evolve quickly to keep itself
> up-to-date with the rest of the BMC ecosystem, which also evolves
> quickly. This may be comparable to unit tests that are aimed at
> getting code coverage for incremental additions to the code base. This
> may also be comparable to hardware manufacturers updating their
> drivers with performance tuning parameters for newly released
> software.
>
> Benchmarks and results should be easy to learn and use, help newcomers
> learn the basics, and aid seasoned developers where needed.
>
>
> [ Proposed Design ]
>
> 1. Continue the previous effort [7] on a sensor-reading performance
> benchmark for the BMC. This will naturally lead to investigation into
> the lower levels such as I2C and async processing.
>
> 2. Try the community’s ideas on performance optimization in benchmarks
> and measure performance difference. If an optimization generates
> performance gain, attempt to land it in OpenBMC code.
>
> 3. Distill ideas and observations into performance tools. For example,
> enhance or expand the existing DBus visualizer tool [8].
>
> 4. Repeat the process in other areas of BMC performance, such as web
> request processing.
>
> [ Alternatives Considered ]
>
> Rather than benchmarking real hardware, it might be possible to
> directly measure a cycle-accurate full-system timing simulator (such
> as GEM5). This approach might be subject to relatively slow simulation
> speed compared to running on real hardware. Also, device support may
> also affect the feasibility of certain experiments. As such, writing
> benchmarks and running them on real hardware might be more feasible in
> the short term.
>
> [ References ]
>
> [1] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024978.html
> [2] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024895.html
> [3] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024914.html
> [4] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024889.html
> [5] https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.6-IO-uring-Tests
> [6] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024908.html
> [7] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387
> [8] https://github.com/openbmc/webui-vue/issues/41
> [9] https://github.com/ibm-openbmc/dev/issues/73

