Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C12BC146D1
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 10:51:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yGgc2jVdzDqHn
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 18:51:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yGf36GyHzDqGm
 for <openbmc@lists.ozlabs.org>; Mon,  6 May 2019 18:50:19 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x468kofO044559
 for <openbmc@lists.ozlabs.org>; Mon, 6 May 2019 04:50:16 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2saggdu446-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 04:50:15 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 6 May 2019 09:50:14 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 09:50:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x468oBfG59572378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 08:50:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBFEFA4065;
 Mon,  6 May 2019 08:50:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC7FDA405B;
 Mon,  6 May 2019 08:50:10 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.20])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 08:50:10 +0000 (GMT)
Subject: Re: Redfish OEM commands in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Tanous, Ed" <ed.tanous@intel.com>, vernon.mauery@linux.intel.com
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
 <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
 <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 6 May 2019 14:20:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050608-0016-0000-0000-00000278C164
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050608-0017-0000-0000-000032D564AD
Message-Id: <06e8cf91-5a80-a6ad-fa93-11e4e2e37b7c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060077
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

On 01/05/19 11:35 PM, Brad Bishop wrote:
> On Mon, Apr 29, 2019 at 10:32:36AM -0700, Ed Tanous wrote:
> 
>> On the nose, it sounds ok, but it would be good to see a proposal
>> that's a little more detailed. 
> I put a proposal here:
> https://lists.ozlabs.org/pipermail/openbmc/2019-April/016126.html
> 
>>> Agreed on option #2.  However I still think you should consider
>>> runtime pluggable dynamic resolution.
>>
>> None of the features I've heard so far necessitates the use of runtime
>> discovery, or even fall outside what configurability is available in
>> bmcweb today.  "runtime pluggable" on an embedded system is a strange
>> concept, given that all uses I know of today are really just an
>> extension of compile time plugability, using the rootfs as the medium
>> for "discovery".  With that said, I'm imagining you're thinking
>> something like what IPMI has today, which I might be misinterpreting
>> based on our discussion this morning?
> Yes, this is what I was thinking.  I agree with you that we don't have
> features that require the use of runtime discovery.  My reasoning is
> rooted in concerns around code maintanence and adoption.
> 
> maintanence:  I don't think code with a bunch of #ifdefs is desired or
> readable.  It might not be too bad starting out.
> 
> adoption:  Do you recall how one of Michael Brown's issues with bmcweb
> was that there wasn't "any way to extend or replace functions without
> forking the codebase?"  I believe this is exactly what he was talking
> about.  I suspect he didn't even consider compile time plugins because
> in my experience maintaining codebases structured that way is painful.
> 
>> It should be noted, we also have DBus "plugin" capability with the dbus
>> interface already: anyone can host logs on dbus, and redfish will
>> populate them.  That option doesn't really get to the core of the OEM
>> issue though, but is certainly an option in the PEL log case that I
>> didn't think of right away.
> This is an interesting thought.  We could put OEM things on DBus and
> maybe bmcweb looks at those to fill out OEM properties?
> 
>>> It sounds like you want everyone to put their implementations of OEM
>>> properties right next to each other in bmcweb and surround them with
>>> ifdefs.  Do I have that right
>> Yes, I believe you have that right.
> 
>>> Shouldn't we allow the OEM to maintain their own implementation?
>>> Also, when you (the bmcweb maintainer) look at the core bmcweb/redfish
>>> code, do you want to be distracted by the twenty implementations of an
>>> OEM property?
>>
>> If my goal is to make my changes without breaking any of the other
>> twenty implementations at the same time, absolutely, I want to be
>> "distracted" by them. 
> Right.  This is the fallout of choosing to not have a framework/have an
> unstable API.  This is also what makes this approach not scale very well
> from a maintanence POV, IMO.
> 
>>> Does it make sense for you to be the maintainer of code you have
>>> zero investment in?
>> We can definitely both agree that me personally maintaining all Redfish
>> code is unmaintainable in the long term.  I don't want to be the
>> maintainer of code that I have no investment in, but I'm not sure how
>> you came to the "Ed is the only maintainer of bmcweb for all time"
>> conclusion.  The current maintainer files have provisions for layering
>> just like the Kernel does.  Long-term, we can split maintainership on
>> whatever lines are appropriate.
> Sounds good!
> 
>>> This is just the reality of the world we live in...  It is precisely
>>> why we need robust (yes, sometimes complicated, sometimes performance
>>> impacting, sometimes harder to read) frameworks and abstractions that
>>> allow us to share and collaborate where it makes sense and to move
>>> quickly where it does not.
>> I would argue that the kernel driver interface is a great example of
>> how this should be done, and handles scales that we could only hope to
>> get to get to.  The kernel doesn't publish a "stable" driver interface
>> internally, but does publish a concrete user-facing API. 
> It may not be a stable interface but there _is_ an interface to which
> out of tree modules for instance can plug into.  And those modules could
> implement a custom, OEM ABI via sysfs or ioctls.
> 
>> somewhat what bmcweb has attempted to model in its design;  User facing
>> code should be able to be concrete, while keeping the internals
>> flexible enough to make changes as better patterns emerge.
> 
> This thread raises an important design point or "community norm" being
> established for OpenBMC.  IMO it has the potential to impact
> participation rates and cost of maintanence in the future.  It would be
> nice to get some opinions from more than just two people.  Anyone care
> to chime in?

We have a similar problem to solve with PLDM OEM commands. I was 
initially considering dynamically loaded libraries implementing OEM, but 
I am interested to know the pitfalls of the same from Vernon or others, 
as opposed to compile-time plugging-in of these libraries (not sure if 
this was already discussed in the last community call, which I couldn't 
attend).

Do we want to disallow someone who uses OpenBMC from writing proprietary 
PLDM OEM implementations - libraries which can be dynamically loaded at 
runtime as opposed to compile time linking in of those implementations 
to the main PLDM code base, thereby requiring the OEM implementations to 
exist in the main PLDM code base?

Thanks,
Deepak



