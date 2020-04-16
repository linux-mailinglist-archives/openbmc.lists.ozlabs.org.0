Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B951D1AD0BC
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 22:03:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939CV29tYzDrTM
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 06:03:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939BT3kFtzDr6B
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 06:02:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GJZSts014144; Thu, 16 Apr 2020 16:02:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30evm6abyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 16:02:53 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03GK2j1I032701;
 Thu, 16 Apr 2020 20:02:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 30b5h7fxba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 20:02:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03GK2pBS59703678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 20:02:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C7F0C6059;
 Thu, 16 Apr 2020 20:02:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 556BFC6055;
 Thu, 16 Apr 2020 20:02:49 +0000 (GMT)
Received: from [9.206.208.126] (unknown [9.206.208.126])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 20:02:48 +0000 (GMT)
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
To: Joseph Reynolds <jrey@linux.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
Date: Thu, 16 Apr 2020 15:02:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_08:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=885 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160135
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
Cc: openbmc <openbmc@lists.ozlabs.org>, ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/8/2020 3:27 PM, Joseph Reynolds wrote:
> On 4/7/20 10:46 AM, Patrick Williams wrote:
>> On Tue, Apr 07, 2020 at 09:58:15AM -0500, Joseph Reynolds wrote:
>>> Redfish specifies SSDP [1] [2] as the standard discovery service but
>>> OpenBMC uses the Avahi mDNS discovery service [3].  I asked Redfish to
>>> add mDNS to the spec [4] but they don't want to, and pointed to 
>>> their spec.
>>
>> mDNS is used more in the UNIX world, SSDP is used more in Windows.
>>
Was on the Redfish call earlier and this forum thread was discussed. The 
Redfish members on the call did not totally agree with this statement. 
They believe SSDP has a wider adaption than just Windows. A wider 
adaption than mDNS.  Since SSDP is already in the Redfish specification 
and has been adapted by Redfish implementations, adding a 2nd discovery 
service would damage interoperability in Redfish.
The members on the call really wanted to encourage OpenBMC to implement 
SSDP instead.
Posted the same to the forum thread.


>
>>> I want to allow the BMC admin to enable and disable the mDNS discovery
>>> service.  How can this be done?  Options:
>>> 1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
>>> 2. Move OpenBMC to SSDP and away from mDNS.
>>> 3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protocol.
>> I don't see a strong reason to "move away" from mDNS, but I certainly
>> think that *any* network service should be able to be disabled by an
>> administrator to reduce the security footprint if the service is unused.
>>
>> So, either #1 or #3 seems best to me.  Adding optional SSDP support 
>> would
>> be reasonable, but likely only to be added by someone who cares about
>> discovery in a Windows environment.
>
> I've appended the thread to re-ask Redfish if they would support 
> ManagerNetworkProtocol.mDNS.
> https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol
>
If think we are down to #1 or #2.

Thanks,
Gunnar

