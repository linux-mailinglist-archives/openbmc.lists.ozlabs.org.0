Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 609171B6095
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:19:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Mvn2BKDzDqcR
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:19:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497MPc6nc6zDr2j
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 01:57:08 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NFWQbJ134268; Thu, 23 Apr 2020 11:57:06 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30k7rc5e0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 11:57:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03NFqRes008234;
 Thu, 23 Apr 2020 15:57:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 30fs66tpy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 15:57:05 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NFv45p50528682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:57:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90D65B2064;
 Thu, 23 Apr 2020 15:57:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 590C7B2065;
 Thu, 23 Apr 2020 15:57:04 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.137.230])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Apr 2020 15:57:04 +0000 (GMT)
Subject: Re: Proposal: how to make incompatible changes - versioning
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <9354f120-6e19-98bd-6e67-db22f61fc094@linux.ibm.com>
Date: Thu, 23 Apr 2020 10:57:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230118
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

On 4/23/20 7:11 AM, Alexander Amelkin wrote:
> 15.04.2020 02:00, Joseph Reynolds пишет:
>> Proposal: how to make incompatible changes
>>
>> This is a proposal to add guidelines for making incompatible changes 
>> to OpenBMC interfaces.  Is it okay to make incompatible changes? Yes, 
>> IMHO: the project will continuously break compatibility in various 
>> ways, and its users will adapt.  The main idea is to minimize churn 
>> and make it easier for users to adapt.
>>
>> As the OpenBMC project moves forward with new releases, it will make 
>> changes that necessarily break existing use cases.  My 
>> recommendations are:
>> - Try hard to maintain forward compatibility.  For example, maintain 
>> all of the BMC's intended user interfaces.
>> - Identify changes that break compatibility.  Briefly describe the 
>> use case, what breaks, how a user can adapt, and cross-link technical 
>> discussions (Gerrit reviews, issues, emails).
>> - Work with maintainers to determine which incompatible changes get 
>> merged and what documentation is needed.
>> - Give users time to adapt to incompatible changes.  For example, 
>> deprecate interfaces in a previous release.
>> - List incompatible changes in the [release notes][] so community 
>> members will know they have to adapt, and link to how to adapt.
>>
>>
> I'd say that any incompatible change must be reflected in the 
> interface version.
>
> As far as I understand, RedFish has all the interfaces strictly 
> specified and those specifications are bound to a specific RedFish 
> version that is then encoded in the URL (e.g. /redfish/v1/).
>
> Any other interface should have a similar approach. A more relaxed 
> one, if we keep our own flavor of REST, could be that each interface 
> could have a Version property (probably also encoded in the REST URL).
>
> That way, any user trying to access an old interface (thus via a 
> non-existant URL) would get a 404.
>
> Internally, for inter-process dbus communication the interface version 
> could be checked during compile time to prevent problems that couldn't 
> be detected by compiler/linker automatically. Those problems are, for 
> instance, incompatible change in the meaning of the values of a property.

Agreed.  The question to ponder: What is our REST API versioning 
strategy?  What  best practices do we follow?
- Joseph

> Alexander.
>

