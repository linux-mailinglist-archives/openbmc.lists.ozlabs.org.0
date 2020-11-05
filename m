Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 610232A8A57
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 00:01:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRzYC0JW7zDr9K
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 10:01:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O5c+bet/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRzX92vfSzDqs3
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 10:00:56 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5MX1jo037604; Thu, 5 Nov 2020 18:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZhPsU+aTyXMiYzvMNC/+NSPt7zKPinNiC6m1uum28zI=;
 b=O5c+bet/2hl5XABqBS9GpH9q8fS5RF2KFhGDLB5L981BucOTzKLVgtC3Yaz5WaJy4PDA
 Ts4xSjUmUdRl/LY0ytD2lwNRapRiVSYr3RPOlyVBcINxGY8do0vwV/NcJw6K2omZPbQq
 IAegBjSSouZVQY3fXgeE+JgdBa7HReMjOS7Gj18yGxHPh9ySFCJf9WDh1jtWVnP+cyF6
 na5HfBXjBIIKL6OsAFsKKl8xPcYp/97jzSk1HpAWCyfxL2DVoQ8Euikz0CLjulFg5RqI
 pswkK4Eowm+BcDHbx9s4+BWpO6X9iFTSAOJzzN/cTVAfrlOOuP1qSd4t+8wC2vA1m3eV Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mhxjuj50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 18:00:53 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A5Mxsub129291;
 Thu, 5 Nov 2020 18:00:53 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mhxjuj47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 18:00:52 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5Msnc4013595;
 Thu, 5 Nov 2020 23:00:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 34h0253sff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 23:00:51 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5N0o5u10355192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 23:00:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CF6C6E04E;
 Thu,  5 Nov 2020 23:00:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A44E86E054;
 Thu,  5 Nov 2020 23:00:49 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.128.80])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Nov 2020 23:00:49 +0000 (GMT)
Subject: Re: How to integrate new libraray in openbmc
To: Ed Tanous <ed@tanous.net>,
 khader basha shaik <shaikkhaderbasha601@gmail.com>
References: <CAD+gp9B3q6A4Hp4N7f_T8CJuw0n1sk=vkCHWebx0seyuxJjx_w@mail.gmail.com>
 <CACWQX83iRY7g10aS2p6ioO0S9ubH+91e8tc+GhuWbFjo+NDCvQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <6a84f82c-d1b5-0f57-dae1-7cb6370c8f7b@linux.ibm.com>
Date: Thu, 5 Nov 2020 17:00:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACWQX83iRY7g10aS2p6ioO0S9ubH+91e8tc+GhuWbFjo+NDCvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_16:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=759
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050145
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

On 11/5/20 10:45 AM, Ed Tanous wrote:
> On Thu, Nov 5, 2020 at 2:49 AM khader basha shaik ...
> This Message Is From an External Sender
> This message came from outside your organization.
>
>
>
> On Thu, Nov 5, 2020 at 2:49 AM khader basha shaik 
> <shaikkhaderbasha601@gmail.com <mailto:shaikkhaderbasha601@gmail.com>> 
> wrote:
>
>     Hi Team,
>
>     I have a custom library and need to integrate it with openbmc.The
>     library provides various output related to system information.
>     I need this information to show up in phosphor-webUI.
>
>     In my understanding we need to register it with dbus interface.
>     So I need to integrate my custom library with dbus.
>
>     But I do not have much information about where to start?
>
>
>     Any help or information on this would be really helpful.
>
>
>
> If you point us to the code for the library you're wanting to 
> integrate, as well as what you're hoping to see as a result we can 
> probably give you better advice.  As is, your request is quite vague, 
> and I'm personally finding it very hard to answer with non-generic 
> advice.  The openbmc documentation is a pretty good place to start in 
> your case. Once you have some handle on it, put the code up somewhere 
> that we can see it, and we'll be able to give you more specific advice 
> on where to go from there.
>
> -Ed

Welcome!

I assume you saw the [contributing][] guide.  Have you seen the 
[development tutorials][]?

Are you asking about OpenBMC's internal architecture?  The layers are:
   Web user <--> Web application <--> Web Server (BMCWeb) <--> D-Bus 
interfaces <--> your new service

The way I understand your new function, some of the basic technical 
steps to create your interface include:
1. Create your new service.  Create new [D-Bus interfaces][] to model 
your service.  Expose all of your "library functions" as D-Bus 
interfaces.  See the [hello world tutorial][] as an example of the 
development process.
2. Enhance [BMCWeb][].  Create new REST APIs and map them to your new 
D-Bus interfaces.
3. Enhance the web application to allow web users to use your new 
functions.  Invoke your new REST APIs as needed.  Have you seen the new 
[webui-vue][]?

For example, you should be trace the functions in the tutorial through 
D-Bus interfaces to BMCWeb to REST APIs to the web application.

But before you do any of this: please consider the project's advice for 
[planning changes][].

- Joseph

[contributing]: https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md
[development tutorials]: 
https://github.com/openbmc/docs/blob/master/development
[D-Bus interfaces]: https://github.com/openbmc/phosphor-dbus-interfaces
[hello world tutorial]: 
https://github.com/openbmc/docs/blob/master/development/sdk-hello-world.md
[OpenBMC interfaces]: 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
[BMCWeb]: https://github.com/openbmc/bmcweb
[webui-vue]: https://github.com/openbmc/webui-vue
[planning changes]: 
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-changes
