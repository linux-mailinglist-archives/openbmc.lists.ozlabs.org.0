Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 401421A23CD
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 16:08:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y5jC37cfzDrP1
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 00:08:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y4nm4QNgzDqQ5
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 23:27:23 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038D3f5c065266
 for <openbmc@lists.ozlabs.org>; Wed, 8 Apr 2020 09:27:19 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920amxwa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 09:27:18 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 8 Apr 2020 14:26:51 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 14:26:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038DRDal50724912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 8 Apr 2020 13:27:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F281552052
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 13:27:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.186.218])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 831F25204E
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 13:27:12 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Proposal: Add ManagerNetworkProtocol.Oem.OpenBMC.mDNS
To: openbmc@lists.ozlabs.org
References: <a1f2974a-280b-2c5b-0fb6-0bd53e29b560@linux.ibm.com>
 <39aa6afe-2cee-74d7-71d7-1659c9550b6b@linux.vnet.ibm.com>
Date: Wed, 8 Apr 2020 18:57:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <39aa6afe-2cee-74d7-71d7-1659c9550b6b@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040813-0016-0000-0000-00000300BEAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040813-0017-0000-0000-000033649E74
Message-Id: <60041df2-44f9-7d80-4296-4d4a75a01bed@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=276 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080109
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

Hi Joseph,

I am in favor for adding this as oem for short term and also propose it 
in DMTF to get it standardized.

There should be a way to disable the multicast-feature as for some 
clients multicast is a security concern.

Regards

Ratan

On 4/6/20 8:53 PM, Gunnar Mills wrote:
>
> On 4/6/2020 9:57 AM, Joseph Reynolds wrote:
>> Proposal: Add ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
>>
>> This is a proposal to add a new Oem.OpenBMC.mDNS property to BMCWeb's 
>> implementation of the Redfish ManagerNetworkProtocol.
>> This property would be used to enable and disable OpenBMC's 
>> Avahi/mDNS discovery service and be similar to Redfish's SSDProtocol
>>
> Why OEM? Why not ask Redfish to add mDNS to ManagerNetworkProtocol so 
> it can be enabled/disabled via standard Redfish?
>
>
>> Redfish's direction is to use SSDP as the standard discovery 
>> mechanism.  See discussion here:
>> https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol
>>
>>
>>

