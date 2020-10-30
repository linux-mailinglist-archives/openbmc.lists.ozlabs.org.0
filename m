Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58E2A0549
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 13:25:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN1jq1XX2zDqdc
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 23:25:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P4a4b1m+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN1hk1SPbzDqNw
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 23:24:37 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UC3BQv138035; Fri, 30 Oct 2020 08:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OYWZbvxYv4bBH+sYr8XIwSvcKgrQMayOxZSP715RF3Q=;
 b=P4a4b1m++QUDh/cAlAsxydsKjED9Jo+RIDlVTvFfHTlcQXHsfqNSDElN+obDgh3srUYd
 0eGlslaAyNeItIfpAzKvnR08TX3nD3rmLrEQwOpbB6SBxxhyxr/2qPN/hdbRO4wuy0Pk
 XEHz42ScgYT2VGqljDdmDMtVJ0ByMzv/3kpg+leZHQ+AJTC0uQIr1RT/lSxFBxkdGSPp
 uuvcCfC14/04eD0XJUve+DixUl0U7n4Fz2jlN3+92aJMVL5KQaLFIoqZZLQu8vYi+83F
 MDzjgNyMzVKQBteZ0n7grZsp9xlLGzmKmqXlYP2zrFououEjm5s5Iqfk2Q4gHolXiix3 gQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fydj1d8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 08:24:35 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09UCEN2H023861;
 Fri, 30 Oct 2020 12:24:33 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 34fvc48ka3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 12:24:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09UCOUbg32637270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 12:24:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C82DBAE053;
 Fri, 30 Oct 2020 12:24:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09EDDAE04D;
 Fri, 30 Oct 2020 12:24:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.102.137])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 12:24:28 +0000 (GMT)
Subject: Re: bmcweb logging
To: Ed Tanous <ed@tanous.net>
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
 <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <36c2d0c1-b1a1-3ea9-01b4-34611dff4426@linux.vnet.ibm.com>
Date: Fri, 30 Oct 2020 17:54:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_04:2020-10-30,
 2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300093
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/29/20 9:52 PM, Ed Tanous wrote:
> On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>> Hi Ed,
>>
>> I was having issues in getting the logs from bmcweb repo, If I don't
>> define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get me
>> any logs in journal(not even error log) and if I define the compiler
>> flag then it gets too much debug info.
> What's your limit for "too much"?

around 30+ traces for each Redfish request.If we enable the bmcweb 
logging, with that  journal is full of bmcweb traces.

>
>> Seems it happens because we have hardcoded the logelevel  and there is
>> no way through which we can change except making the change manually in
>> the following place.
>>
>> https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
>>
>> Suggestion is we can define another compile time flag for log level and
>> use that log level at the above line for type of logging , by default
>> logging should be enabled with error log level.
> Thusfar, we don't really have a definition of what kind of detail
> should be included at each log level, nor are we consistent about
> setting the log levels.  If it's important to you, and you want to put
> together some patches, we certainly could define the log verbosity,
> but we'd also have to come up with better definitions for what level
> each log needs to take, and be more consistent about it.

We have different log levels in bmcweb like error, critical, info, 
debug, but what is missing is we don't have some compile time variable 
to control it( currently it is either full or none.)

>
> IMO, that level of log granularity was never that valuable to debug,
> my thought being that if I'm enabling logging I don't care about
> performance, so the more logs the better.  When reproducing a failure,
> there doesn't tend to be a lot of logging present, and it's easy
> enough to find what you want, but maybe you had a different
> experience?

Yes, I had a different experience in the recent bug where the failure 
was intermittent and it was happening only after running the regression, 
when I look into the log, not a single trace was there.Hence I thought 
that atleast the logs which is being marked as error(BMCWEB_LOG_ERROR) 
should have been written to the journal.

Say In production if we find some issue and we ask for the journal then 
journal will not be useful as it will not be having any traces to debug.

>
> Long term, my intent was to just get rid of the various verbosities,
> and make logging ON or OFF in the code, and downgrade to a single
> macro, but if you see a need, we could certainly go the other
> direction.
>
>> If there is a need user can play with new compiler flag for more verbose
>> logging.
> I don't personally see the need, but if it would help you, I don't
> think it adds much complexity to do it, and I'd be happy to review
> your patches.
Sure, I would be pushing the patch for the same.
>
>> Am I missing something in usage of logging infra?
>>
>> Ratan
>>
>>
>
> Just to be clear, you're using logging in a debug context, correct?
> If we're trying to use this to define an access log, that's a very
> different problem space, and the existing logging infrastructure would
> be poorly suited for it.
