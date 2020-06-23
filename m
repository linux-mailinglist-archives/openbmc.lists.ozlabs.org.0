Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4D204D94
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 11:11:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rgWM2nK2zDqRn
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 19:11:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rgVb5TY9zDqP6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 19:10:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05N911nm042109; Tue, 23 Jun 2020 05:10:43 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31tyry1p1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 05:10:43 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05N90QD0004387;
 Tue, 23 Jun 2020 09:10:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31sa37vu4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 09:10:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05N9AdYI14745616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 09:10:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 972A1A405D;
 Tue, 23 Jun 2020 09:10:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAD8AA4051;
 Tue, 23 Jun 2020 09:10:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.217.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 09:10:38 +0000 (GMT)
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <6b23a265-c1dd-4c62-4c31-de4cb1cb74e7@yadro.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <f68a5e8a-2f30-fe64-f285-d06cde6bfb41@linux.vnet.ibm.com>
Date: Tue, 23 Jun 2020 14:40:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6b23a265-c1dd-4c62-4c31-de4cb1cb74e7@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_04:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 cotscore=-2147483648 suspectscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230068
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

Hi Alexender,

I am not sure how it can be achieved through some compile time option(as 
the existing dbus interface requires changes. Might be version Dbus 
Interfaces which is currently not supported.

Phosphor-networkd uses systemd-networkd as backend which supports 
multiple default gateway as fall back gateway without implementing 
policy based routing(Both gateways are on the main routing table).

Ratan

On 6/20/20 4:10 AM, Alexander Amelkin wrote:
> Please, Ratan, if you implement those per-interface gateways again, 
> could you leave an option to have a single system-wide default gateway 
> only?
>
> I honestly don't see any use for multiple gateways without policy 
> routing being implemented, and then I don't see any use for policy 
> routing in a BMC (as opposed to a router). So I would like to keep us 
> from unneeded questions from the customers, and so I would prefer to 
> have only a single gateway, as well as single sets of DNS and NTP 
> servers without having to patch across the whole OpenBMC codebase.
>
> If there was a compile-time option (distro/machine feature?) to use 
> either per-interface or system-wide gateway/DNS/NTP, that would be 
> very nice.
>
> Thank you.
> Alexander.
>
> P.S. Sorry for sending this twice, forgot to include the list the 
> first time.
>
> 24.04.2020 18:06, Ratan Gupta пишет:
>> Hi All,
>>
>> Currently, OpenBMC stack allows a single default gateway for the 
>> system. Latest kernel allows to configure multiple default gateways.
>>
>> Eg: In a system with two interfaces eth0 and eth1,
>>
>> eth0 configured with static address and having gateway(192.168.2.1)
>> eth1 configured with DHCP and gets Gateway from DHCP server (10.10.10.1)
>> ~~~~~~~~~~~~~
>> Kernel IP routing table
>> Destination     Gateway         Genmask         Flags   MSS Window  
>> irtt Iface
>> 0.0.0.0         19.168.2.1      0.0.0.0         UG        0 
>> 0          0 eth0
>> 0.0.0.0         10.10.10.1      0.0.0.0         UG        0 
>> 0          0 eth1
>> ~~~~~~~~~~~~~~
>>
>> Kernel will first try using the default gateway having higher metric 
>> value and then fall back to the lower.
>>
>> More references: 
>> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_the_default_gateway
>>
>> I'm proposing to make this change in the openBMC D-bus interfaces to 
>> tie the gateway property with the Ethernet interface schema instead 
>> of System configuration.
>>
>> Ethernet Interface Schema =>
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml 
>>
>>
>> System Configuration Schema =>
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/SystemConfiguration.interface.yaml 
>>
>>
>>
>> Please let me know your suggestions.
>>
>> Regards
>> Ratan Gupta
>>
