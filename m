Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC51A2A54
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 22:27:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yG6y04QWzDqX6
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 06:27:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yG6F26snzDqQq
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 06:27:16 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038K5ihk129172; Wed, 8 Apr 2020 16:27:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309mdt9ueu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 16:27:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038KH4wu001672;
 Wed, 8 Apr 2020 20:27:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3091mdqss9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 20:27:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038KR9W857541082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 20:27:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56323C6057;
 Wed,  8 Apr 2020 20:27:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7470C605B;
 Wed,  8 Apr 2020 20:27:08 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.171.253])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Apr 2020 20:27:08 +0000 (GMT)
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
To: Patrick Williams <patrick@stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
Date: Wed, 8 Apr 2020 15:27:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080136
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/7/20 10:46 AM, Patrick Williams wrote:
> On Tue, Apr 07, 2020 at 09:58:15AM -0500, Joseph Reynolds wrote:
>> Redfish specifies SSDP [1] [2] as the standard discovery service but
>> OpenBMC uses the Avahi mDNS discovery service [3].  I asked Redfish to
>> add mDNS to the spec [4] but they don't want to, and pointed to their spec.
> Avahi is a particular implementation of mDNS.  We implement mDNS using
> Avahi.  MacOS also uses mDNS with an entirely different implementation.
>
> mDNS is used more in the UNIX world, SSDP is used more in Windows.
>
> I don't see any reason why we couldn't support both.  We initially
> supported mDNS because OpenBMC is Linux and OpenPOWER machines were
> likely running Linux, which more likely had the mDNS software installed.

Thanks for explaining that.

>> I want to allow the BMC admin to enable and disable the mDNS discovery
>> service.  How can this be done?  Options:
>> 1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
>> 2. Move OpenBMC to SSDP and away from mDNS.
>> 3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protocol.
> I don't see a strong reason to "move away" from mDNS, but I certainly
> think that *any* network service should be able to be disabled by an
> administrator to reduce the security footprint if the service is unused.
>
> So, either #1 or #3 seems best to me.  Adding optional SSDP support would
> be reasonable, but likely only to be added by someone who cares about
> discovery in a Windows environment.

I've appended the thread to re-ask Redfish if they would support 
ManagerNetworkProtocol.mDNS.
https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol

I don't need this function right away and can wait for a spec change.  
(That is, help make it happen.)
So I am backing off my request for 
ManagerNetworkProtocol.Oem.OpenBMC.mDNS art this time.

- Joseph

