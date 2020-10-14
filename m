Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4EF28E2BA
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 17:01:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBFxD1mRhzDqth
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 02:01:36 +1100 (AEDT)
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
 header.s=pp1 header.b=ePmZRDFw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBFvk4CtczDqlZ
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 02:00:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EEZAS5052534; Wed, 14 Oct 2020 11:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/11SjfUeiuWT+NcVYaBoLYyVy7oCKcNX6Tc2e9RV9VA=;
 b=ePmZRDFw532L8CKflvJ6yzDW2bYHcOJ1vVgtFSlNpFz5ZE0183rUGGtpue0Q5QbNuv2p
 8AWmjKeF0SEOhBy7ncnZa2jBjOa90b0gkBOibhgpnDNlU/3q028FDbfXxlYGQMTQwf87
 dJ8Bl+fk1qvqUoK2tmOWHL4ajAAtHrvqs5JB36XZ8ycPlRFCeXEVt0mUns4lp6h1h1a1
 djBFvDG3dG5TvNkFF1wlR/1TnqnH9KP5kQ/++0138CoKTPCQLRV4fO9pcbGZcMxfSFv2
 WyUS0Z3CYhEGc2MbouJTNm4IoxSBjCQU/vSFD3lHlOMMTn3N4N67b3ddLSjMgbB7kDyh hw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34633grujq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:00:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09EEvtE0013267;
 Wed, 14 Oct 2020 15:00:07 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3434k9jhj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 15:00:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09EF06p828049848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 15:00:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FCA4112065;
 Wed, 14 Oct 2020 15:00:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E850D112066;
 Wed, 14 Oct 2020 15:00:05 +0000 (GMT)
Received: from [9.80.201.12] (unknown [9.80.201.12])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Oct 2020 15:00:05 +0000 (GMT)
Subject: Re: OpenBMC Learning Series - security
To: Patrick Williams <patrick@stwcx.xyz>
References: <DDAFCC55-7CF7-469F-B3AA-F61459CCCCF3@fb.com>
 <4d47eaf7-286e-b31e-acbc-d26f850b48f1@linux.ibm.com>
 <20201009195121.GO6152@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <5a3d62b1-3e8a-a4b1-8f68-d2efe2338d55@linux.ibm.com>
Date: Wed, 14 Oct 2020 10:00:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201009195121.GO6152@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_08:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 clxscore=1015 mlxlogscore=843 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140101
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
Cc: Openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/9/20 2:51 PM, Patrick Williams wrote:
> On Fri, Oct 09, 2020 at 12:33:17PM -0500, Joseph Reynolds wrote:
>> On 7/24/20 7:13 PM, Sai Dasari wrote:
...snip...
>>> Sai and the OpenBMC community,
>>>
>>> Here is my big-picture idea to organize OpenBMC's security effort. I
>>> hope this material will guide the project's overall security effort,
>>> including the learning series.
>>>
>>> I want to take this process one step at a time to help build consensus
>>> for my approach.
>>>
>>> My big idea is to apply the world's best publicly available security
>>> schemes to the OpenBMC project.  Schemes like Microsoft Security
>>> Engineering, IBM Secure Engineering, and the Common Criteria evaluation
>>> have been developed over decades of experience and give us the most
>>> complete guidance for the OpenBMC project and its users.  We should use
>>> them.
>>>
>>> Does this seem like the right approach?  See discussion in footnote 1.
> Hi Joseph,
>
> What I can't tell is if you're describing the current state of affairs
> or where you'd like to go.  My impression is that these education
> sessions should be more current state of affairs with only a taste of
> the future.  The education sessions are for people who have little-to-no
> experience with OpenBMC already in order to make them more productive
> quickly.

My email recommends a way to organize the security work.  Once we agree 
[1], I think we should organize project documentation, presentations, 
and working group activity in the same way.  The presentation would give 
a simplified overview of project security and link to the project's 
security documentation.  Does that make sense?

- Joseph

[1]: We are discussing this in today's security working group meeting:
https://github.com/openbmc/openbmc/wiki/Security-working-group

