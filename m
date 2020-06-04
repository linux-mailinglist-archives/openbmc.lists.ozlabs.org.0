Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 436CA1EDF94
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 10:15:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cz9L1T0YzDqkx
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 18:15:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cz8d2ptnzDqcy
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 18:14:41 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05481oU6027364; Thu, 4 Jun 2020 04:14:31 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ek5r7ryq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 04:14:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0548AMU2017832;
 Thu, 4 Jun 2020 08:14:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf481kkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 08:14:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0548EQLb64749614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 08:14:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12C9EAE051;
 Thu,  4 Jun 2020 08:14:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31144AE045;
 Thu,  4 Jun 2020 08:14:23 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.250.6])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 08:14:22 +0000 (GMT)
Subject: Re: add Node<x> as /redfish/v1/Systems/Node<x>/ for multi-node system
To: "yugang.chen" <yugang.chen@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Leung, John" <john.leung@intel.com>, jason.m.bills@linux.intel.com,
 chunhui.jia@linux.intel.com, gmills@us.ibm.com
References: <b6aab1d7-3437-c402-7574-c2dcbd5567b3@linux.intel.com>
 <ac5dd8bc-fc11-02ec-9701-193f2d68e284@linux.intel.com>
 <c611b757-ecea-0f40-df32-39e4fd88fee7@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <f0a98532-b26a-5730-b7ed-5d4cd9c250d2@linux.vnet.ibm.com>
Date: Thu, 4 Jun 2020 13:44:21 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <c611b757-ecea-0f40-df32-39e4fd88fee7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_04:2020-06-02,
 2020-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1011 cotscore=-2147483648 phishscore=0 mlxlogscore=794
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040052
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04/06/20 1:08 pm, yugang.chen wrote:
> Dear Deepak,
> 
> I'm openbmc engineer working for redfish' slave log in multiple systems, 
> we want to add slave node's log to redfish,  is there some design or 
> documentation for systems schema based on associations to different 
> systems interface? if so, we can work based on that common interface for 
> slave logs on redfish, thanks.

This is something I'm still working on (and should be able to post 
something on Gerrit in a few days). Just so that we're on the same page 
- the problem I am trying to solve is a D-Bus model based approach to 
depict multiple systems and the parts contained within (the parts could 
be physical containment as well as logical things like logs). This would 
prevent writing code that assumes specific names in the D-Bus path 
hierarchy. Daniel/James - does this help the problem you are trying to 
solve?

> Best Regards
> 
> Yugang(Daniel) Chen
> 
> 
> On 6/3/2020 12:40 AM, James Feist wrote:
>> On 6/1/2020 11:39 PM, yugang.chen wrote:
>>> Dear All,
>>>
>>> May I have your attention? For a multi-node system,  there is an 
>>> option for master to use name "Node<x>" as ​{ComputerSystemId} to 
>>> stand for slave node, to show slave node's event log in master redfish,
>>>
>>> Could you please share your comment/idea for naming ("Node<x>")? thanks.
>>
>> Has there been any design docs for multiple systems in Redfish? This 
>> is much bigger than just adding support for multiple logs, this is 
>> adding support for multiple Systems interfaces, and many things need 
>> to be considered such as the mapping of multiple CPUs, Memory, logs, 
>> and how this fits into the inventory picture. On IRC a while back we 
>> had discussed making the systems schema based on associations to 
>> different systems interfaces, and I believe a design was going to be 
>> written on this topic by Deepak. The name should probably come from 
>> the Systems interfaces that are provided. I'm not sure why we would 
>> need to hardcode these. How these interfaces get created, and what 
>> they map to, needs to be discussed.
>>
>>
>>>
>>> here is the patch for code review:
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32971 ;
>>>
>>> for example, Node1:
>>>
>>> /​redfish/​v1/​Systems/​{ComputerSystemId}/​LogServices/​ 
>>> {LogServiceId}/ ​Entries/​{LogEntryId} -->
>>> /​redfish/​v1/​Systems/​Node1/​LogServices/​{LogServiceId}/​Entries/​ 
>>> {LogEntryId}
>>>
>>> Best Regards
>>>
>>> Daniel(Yugang)
>>>

