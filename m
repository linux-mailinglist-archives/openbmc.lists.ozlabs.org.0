Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B151AE670
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 22:03:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493n931YD5zDrh5
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 06:03:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 493n8B3tD8zDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 06:03:05 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HJXcbP049074; Fri, 17 Apr 2020 16:03:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30fjk58wnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:03:02 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03HJZWLg055020;
 Fri, 17 Apr 2020 16:03:01 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30fjk58wn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:03:01 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03HK0kWH020047;
 Fri, 17 Apr 2020 20:03:01 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 30b5h7t1xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 20:03:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03HK30dc14484040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 20:03:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45BD7AE063;
 Fri, 17 Apr 2020 20:03:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6BC4AE05C;
 Fri, 17 Apr 2020 20:02:59 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 17 Apr 2020 20:02:59 +0000 (GMT)
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP - proposal
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Richard Hanley <rhanley@google.com>, Patrick Williams <patrick@stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
 <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
 <20200416204010.GD443018@heinlein.lan.stwcx.xyz>
 <CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com>
 <13f119b4-56fa-c6dd-2e1b-9718e4e41fc3@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a8c08cff-3a77-4b89-fb49-3bd8a9b71173@linux.ibm.com>
Date: Fri, 17 Apr 2020 15:02:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <13f119b4-56fa-c6dd-2e1b-9718e4e41fc3@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_09:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004170145
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

On 4/17/20 11:44 AM, Gunnar Mills wrote:
> On 4/16/2020 7:42 PM, Richard Hanley wrote:
>>
>>     > The members on the call really wanted to encourage OpenBMC to
>>     implement
>>     > SSDP instead.
>>

Thanks for helping to move this forward.  IMHO, Redfish has given us 
enough direction to move forward with OpenBMC.  I understand the debate, 
but don't have any insight or energy to contribute.  So on a purely 
practical level...

I hereby propose implementing ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
Its schema would either be "Protocol" or a new "mDNSProtocol" modeled 
after SSDProtocol.
The only property I need to be readwrite is ProtocolEnabled.
This allows the BMC admin to enable and disable OpenBMC's Avahi-based 
mDNS discovery service.

- Joseph

>>
>>     It probably isn't a bad thing to be able to support SSDP, don't
>>     get me
>>     wrong, but "instead"?  Why would we want to take away service
>>     advertisement functionality, unless someone wants to explicitly
>>     disable it?
>>
>>     I can understand if they don't want to document, in the standard,
>>     a way to
>>     advertise the Redfish service over mDNS, but isn't that a different
>>     problem from what we're asking for?  Aren't we asking for a method to
>>     manage the enablement of services on the BMC, specifically our mDNS
>>     service?  So, if we still have mDNS, don't we need a way to
>>     configure it
>>     through Redfish?
>>
>> I see your point here.  I guess there might be some implicit 
>> assumption that adding it to a schema implies endorsement elsewhere.
>
> Yeah, from Jeff's reply on the thread, "The concern is if we add this 
> to ManagerNetworkProtocol, it would seem to indicate that Redfish 
> supports mDNS/DNS-SD for discovery of Redfish services, which it does 
> not (SSDP is the standard discovery mechanism). "
>
>> Discovery is probably an area where supporting a diversity of 
>> protocols is better than making a single choice.
>
> A bit over my head here, but I believe Redfish's interoperability 
> concern about supporting a second discovery protocol comes from then 
> all Redfish implementations need to implement both otherwise different 
> Redfish implementations aren't discoverable. This can be expanded to 
> OpenBMC's use of mDNS vs Redfish's SSDP and hence the ask for OpenBMC 
> to implement SSDP. A concern of compatibility of OpenBMC-based Redfish 
> implementations vs other Redfish implementations.
>
> These are all good questions. Anyone can sign up for an account and 
> post to the Redfish forum if you are interested in pursuing.
> https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol
>
> Forum posts, along with new issues and proposals, are discussed on the 
> main Redfish calls, Tuesday at 1:00 PM CT and Thursday at 2:00 PM CT 
> if your company is a supporting member of Redfish.
>
> Thanks,
> Gunnar
>

