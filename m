Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CC398F73
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 17:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwDGj4vVQz304N
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 01:58:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ofxbKIpr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ofxbKIpr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwDGS2ZQJz2ydJ
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 01:58:39 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152FYLls187813; Wed, 2 Jun 2021 11:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nDsCUY7dkIRQvPXmtIY5a4I9n3X5z8WLpjhbhkF13a0=;
 b=ofxbKIprbXJQZrRHzfCt0KwZwb7uUSp18uufTzoHi8KJMjpH2aYQHF+lTAExBgL9C9V8
 cQ3CEt3zzm6/znnTEhfjHBtj9ngwNWqAEDi0rtonEbEvcOLU6XNlw0s0BdjFzml9Odaj
 HLKrWmpx1aggjtIUmKhKJJkLRr33qR9SnpNEFfLi6QG/6iLLFWMwhf46ZrYMChhMYK/T
 DoGRWhAFxi5eaAn8kOE3LpGR4g6MkIbKc+p6Lji17jtUNwf1nSz1GRVoho4w51YQgJlN
 +JC/NQaMt/BR1H7rfgQ9Cxd11EKqoNPkk/EQIiDriYQa1QzcaRnB0U790mXEYsSfr0aV IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xb3u43ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 11:58:36 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152FYW85188762;
 Wed, 2 Jun 2021 11:58:35 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xb3u43sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 11:58:35 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152FqPRv014059;
 Wed, 2 Jun 2021 15:58:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 38ud898quv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:58:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152FwXaV29950408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 15:58:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0329AC059;
 Wed,  2 Jun 2021 15:58:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 755E0AC05B;
 Wed,  2 Jun 2021 15:58:33 +0000 (GMT)
Received: from [9.211.138.111] (unknown [9.211.138.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 15:58:33 +0000 (GMT)
Subject: Re: Seeking your opinion on ways to report both Altitude and Pressure
 sensors for the DPS310 as well as Temperature from dbus-sensors.
To: Ed Tanous <edtanous@google.com>
References: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
 <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <1bdf8842-2b53-0d51-40b6-6bf64f2bf315@linux.vnet.ibm.com>
Date: Wed, 2 Jun 2021 08:58:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3bgvuqCXf0lQ6usLULEqVZhGr2B9900i
X-Proofpoint-ORIG-GUID: 0yu-_kiExE-mfzwvxxEyupvQ8B1dZZZk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_08:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020099
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
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/2/2021 08:39, Ed Tanous wrote:
> On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>
>> Hello Ed,
>>
>> It has been suggest I seeking your opinion on ways to report both
>> Altitude and Pressure sensors for the DPS310 as well as Temperature from
>> dbus-sensors before going to far down the road.  Thus that is what I am
>> attempting to do in the email, others on the mailing list input is
>> desirable as well.
> 
> Thanks for discussing this before getting too far along.  I haven't
> worked on any systems with physical pressure sensors, but I'm excited
> to see new things get added.
> 
>>
>> As I see it, Altitude and Pressure are different in that
>>       1) Altitude is computed base off of essentially a policy
> 
> I have no idea what this means.....   In what way is altitude a
> "policy"?  Can you elaborate a little?
> 

I view a mechanism is something like update a FLASH part with
an image provided.

I view a policy is what decides if the the update of the FLASH part
with the specific image is allowed.

I the case if Pressure and Temperature I view them as mechanism,
merely a simple reading and possibly some well defined computations
that are universal.

With Altitude computed from Pressure there are several ways to
compute the Altitude and they are not universal.  So I see it as
a policy of which Pressure to Altitude model is chosen and why.

>>       2) Pressures is a read measurement which is a mechanism
>>       3) Temperature is a read measurement which is also a mechanism
> 
> I'm really struggling with the above to understand what you're getting
> after, so if I go down the wrong path, please forgive me.
> 
> I think what you're saying is that altitude is calculated based on
> pressure + some transfer function to determine an altitude?  And that
> transfer function might be fungible depending on the platform?
> 
> If I got the above right (big if) I would probably expect a new
> pressure sensor type to be added that reports a pressure sensor, then
> we'd put the transform code in something that looks a lot like CFM
> sensor (which oddly enough has a hardcoded 0 for altitude in its
> algorithm for systems without pressure sensors).  Considering how
> related a pressure sensor is to altitude, I could see putting them in
> the same application if you wanted;  It might simplify the code some.
> 
> 
> I think overall a better picture of what you're wanting to accomplish
> would be a good place to start, then we can iterate from there on what
> pieces we need that are new.

I have Temperature, Pressure, possibly Humidity sensors all which are 
variables to different models to compute Altitude from.  I do not have a 
true Altitude sensor.

I am being asked to provide Altitude.

Personally I believe the desired feature is how much cooling a parcel of 
air per unit of time.  Thus I would think air Temperature, Humidity, and
Density (probably compute-able from Pressure, but I have not checked on 
the specifics) would be the important factors.
