Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65A1088F8
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 08:06:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LykV2qhCzDqN3
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 18:06:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lyhf1J2jzDqVk
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 18:04:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP6vRYS013957
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 02:04:45 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfk44pfep-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 02:04:45 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 25 Nov 2019 07:04:43 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Nov 2019 07:04:40 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAP74dXF59244738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 07:04:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9747952050;
 Mon, 25 Nov 2019 07:04:39 +0000 (GMT)
Received: from deepaks-mbp.in.ibm.com (unknown [9.193.94.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F10D052051;
 Mon, 25 Nov 2019 07:04:38 +0000 (GMT)
Subject: Re: Redfish Aggregator vs. RDE over PLDM
To: Richard Hanley <rhanley@google.com>
References: <CAH1kD+YoUr47P-rvCBd8YxKsd-WXtHuqR0pDHFAUSWT+rihmyg@mail.gmail.com>
 <2e9d22b4-714a-6b16-665a-53faa5692e8f@linux.vnet.ibm.com>
 <CAH1kD+b_HfiZZ+YdVAhAT0FtsHQhGxzp0MGGNHP9v=gDoEvJtA@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 25 Nov 2019 12:34:38 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+b_HfiZZ+YdVAhAT0FtsHQhGxzp0MGGNHP9v=gDoEvJtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112507-0008-0000-0000-00000337318A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112507-0009-0000-0000-00004A566512
Message-Id: <a7fe7170-5539-9482-befa-5c129689060e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250063
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

On 22/11/19 3:54 AM, Richard Hanley wrote:
> Hi Deepak,
> 
> Thank you very much for this feedback.  You've been very helpful while 
> I've been working to brainstorm on this subject.
> 
> There were a couple of thoughts that led me down this path.
> 
> One of the difficulties I see in creating an aggregator comes in how you 
> slice up a system and make it discoverable.  This might be a google 
> specific idiosyncrasy, but imagine a case where a Redfish service is 
> managing a chassis, expect for two sensors which are on a different 
> service.  How would an aggregator know that these two chassis should be 
> merged together.  When I read about Platform Descriptor Records (PDR) in 
> PLDM it seemed to me that it was trying to solve a similar problem.
> 
> In my reading of the RDE spec, there are two main issues that it is was 
> addressing:
>    (1) How to fit the Redfish data model into a binary protocol.
>    (2) How does a device implement only a portion of a Redfish service.
> Most of the spec is dealing with issue (1), but issue (2) is the same 
> issue that the aggregator is trying to solve.
> 
> Another thing that I'm expecting is that at some point we will have some 
> legacy hardware that will have trouble running an HTTP stack.
> 
> This all kind of leads me to a larger point.  Which is that if this 
> Redfish aggregator is designed in a certain way, it may make RDE 
> integration easier in the future.


This makes sense - a redfish aggregator may want to include devices 
implementing RDE into the aggregate model as well.

I just wanted to get an idea of
> whether that design goal is worth considering.

> Thanks,
> Richard
> 
> On Wed, Nov 20, 2019 at 7:29 AM Deepak Kodihalli 
> <dkodihal@linux.vnet.ibm.com <mailto:dkodihal@linux.vnet.ibm.com>> wrote:
> 
>     On 19/11/19 4:51 AM, Richard Hanley wrote:
>      > *Thoughts and Questions*
>      > Is RDE on the open-bmc roadmap at the moment?  Are there any other
>      > companies looking into adding support for RDE?  Does anyone have any
>      > strong feelings on this issue?
>      >
>      > I think that in the long term a solid implementation of RDE
>     offers a lot
>      > more flexibility than a http aggregator.  However, I'd also
>     expect it's
>      > significantly more effort to get up and running.  Hence why I am
>     asking
>      > how the community feels about this subject.
>      >
>      >
>      > I'm also interested in hearing what people's experience working with
>      > MCTP or PLDM have been.  Has anyone here used them in production?
>     Are
>      > there any particular highlights or lowlights with the protocols?
> 
>     IBM will use PLDM over MCTP (over an LPC binding) for Host - BMC
>     communications (system management being shared between the Host and the
>     BMC) on upcoming systems. The main motivation to switch to PLDM was
>     because it fit the bill of an industry standard communications protocol
>     with improvements compared to in-band IPMI. RDE was also motivation for
>     us to work on implementing a PLDM stack, although RDE isn't on the
>     immediate roadmap. If you're interested in looking at the existing
>     PLDM/MCTP code/design docs on OpenBMC, I have some links below.
> 
>     We're able to map our requirements for the in-band Host BMC
>     communications path to standard PLDM mostly. We did define a set of OEM
>     commands to model a file as a PLDM object (and have that transferred).
>     We still need to run this by PMCI to see if it's of interest to anyone
>     for standardization purposes.
> 
>     I'm curious why we'd use RDE for a case where the multiple management
>     controllers all do have a network stack and can parse JSON. Wouldn't
>     they just implement Redfish (instead of RDE) and hence this makes a
>     case
>     for the Redfish Aggregator? Based on my reading of the RDE spec, it
>     seemed to target IO adapters, for eg storage controllers, that would
>     want to participate in Redfish based management, but the firmware
>     running on those wouldn't implement an HTTP stack.
> 
>     https://github.com/openbmc/pldm
>     https://github.com/openbmc/libmctp
>     https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
>     https://github.com/openbmc/docs/blob/master/designs/mctp.md
> 
>     Thanks,
>     Deepak
> 

