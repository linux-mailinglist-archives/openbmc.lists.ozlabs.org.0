Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB219F9FC
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 18:17:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wwfd43S9zDrMK
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 02:17:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wwdt5FkYzDrDf
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 02:16:33 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036G4pL6030023
 for <openbmc@lists.ozlabs.org>; Mon, 6 Apr 2020 12:16:30 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3082hxb49f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 12:16:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 036GGS4k000344
 for <openbmc@lists.ozlabs.org>; Mon, 6 Apr 2020 16:16:29 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 306hv6nm93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 16:16:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036GGS8855705988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 16:16:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EF4CC605B;
 Mon,  6 Apr 2020 16:16:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9050CC6055;
 Mon,  6 Apr 2020 16:16:26 +0000 (GMT)
Received: from [9.206.171.11] (unknown [9.206.171.11])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 16:16:26 +0000 (GMT)
Subject: Re: Proposal: Add ManagerNetworkProtocol.Oem.OpenBMC.mDNS
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 ratagupt <ratagupt@linux.vnet.ibm.com>
References: <a1f2974a-280b-2c5b-0fb6-0bd53e29b560@linux.ibm.com>
 <39aa6afe-2cee-74d7-71d7-1659c9550b6b@linux.vnet.ibm.com>
 <c8a93ec8-98de-cd76-f516-965f7ff3165f@linux.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ad9ac874-a9db-770b-9df2-7ac5aa7a4949@linux.vnet.ibm.com>
Date: Mon, 6 Apr 2020 11:16:23 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c8a93ec8-98de-cd76-f516-965f7ff3165f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=2 mlxlogscore=623
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060128
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


On 4/6/2020 10:42 AM, Joseph Reynolds wrote:
> On 4/6/20 10:23 AM, Gunnar Mills wrote:  +cc:Ratan
>>
>> On 4/6/2020 9:57 AM, Joseph Reynolds wrote:
>>> Proposal: Add ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
>>>
>>> This is a proposal to add a new Oem.OpenBMC.mDNS property to 
>>> BMCWeb's implementation of the Redfish ManagerNetworkProtocol.
>>> This property would be used to enable and disable OpenBMC's 
>>> Avahi/mDNS discovery service and be similar to Redfish's SSDProtocol
>>>
>> Why OEM? Why not ask Redfish to add mDNS to ManagerNetworkProtocol so 
>> it can be enabled/disabled via standard Redfish?
>
> Thanks for the reply.  I asked the Redfish forum in thread 267 linked 
> below.  The reply was to use SSDP instead of Avahi mDNS. IMHO, we 
> either get them to accept mDNS as an alternative to SSDP, or we are 
> free to implement the Oem property.  There hasn't been much 
> discussion, so I am plowing ahead with what I see as the most likely 
> course.  Feel free to contribute to the forum thread.
>
>

Know why we choose Avahi/mDNS over SSDP? Jeff asked that question in the 
thread. If we have valid reasons of why Avahi/mDNS over SSDP, let's 
share that with Redfish.

