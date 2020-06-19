Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A067B201E23
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 00:41:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pYh02qvTzDrSp
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 08:41:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Squ0YR1O; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pYgD6fZzzDrSp
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 08:40:56 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1C2A04C8DA;
 Fri, 19 Jun 2020 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1592606448; x=1594420849; bh=9XV
 FbGLX//2QbdJsi1wY5z8RNi/D7ib8y8K10vklE6A=; b=Squ0YR1OgXYx/PbMOrD
 l7EMaXVGOnHS0RNq6Z35IcB1IuLXffh0zx/+7Ex98u2PTvKqARmE903kKIw5XAoa
 Ztnv3orr+2PfaeomGPxzoU8jJWSOizjIXP8fyXCbv3x0oA+0+JfPtGZwy4ejzexh
 bF7nqQM8kmD2tF3dAMnomTbc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOo6WkR5IQtq; Sat, 20 Jun 2020 01:40:48 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9D4F14C85A;
 Sat, 20 Jun 2020 01:40:48 +0300 (MSK)
Received: from [10.199.1.42] (10.199.1.42) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 20
 Jun 2020 01:40:48 +0300
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: <openbmc@lists.ozlabs.org>
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <6b23a265-c1dd-4c62-4c31-de4cb1cb74e7@yadro.com>
Date: Sat, 20 Jun 2020 01:40:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.1.42]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please, Ratan, if you implement those per-interface gateways again, 
could you leave an option to have a single system-wide default gateway 
only?

I honestly don't see any use for multiple gateways without policy 
routing being implemented, and then I don't see any use for policy 
routing in a BMC (as opposed to a router). So I would like to keep us 
from unneeded questions from the customers, and so I would prefer to 
have only a single gateway, as well as single sets of DNS and NTP 
servers without having to patch across the whole OpenBMC codebase.

If there was a compile-time option (distro/machine feature?) to use 
either per-interface or system-wide gateway/DNS/NTP, that would be very 
nice.

Thank you.
Alexander.

P.S. Sorry for sending this twice, forgot to include the list the first 
time.

24.04.2020 18:06, Ratan Gupta пишет:
> Hi All,
>
> Currently, OpenBMC stack allows a single default gateway for the 
> system. Latest kernel allows to configure multiple default gateways.
>
> Eg: In a system with two interfaces eth0 and eth1,
>
> eth0 configured with static address and having gateway(192.168.2.1)
> eth1 configured with DHCP and gets Gateway from DHCP server (10.10.10.1)
> ~~~~~~~~~~~~~
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags   MSS Window  
> irtt Iface
> 0.0.0.0         19.168.2.1      0.0.0.0         UG        0 0          
> 0 eth0
> 0.0.0.0         10.10.10.1      0.0.0.0         UG        0 0          
> 0 eth1
> ~~~~~~~~~~~~~~
>
> Kernel will first try using the default gateway having higher metric 
> value and then fall back to the lower.
>
> More references: 
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_the_default_gateway
>
> I'm proposing to make this change in the openBMC D-bus interfaces to 
> tie the gateway property with the Ethernet interface schema instead of 
> System configuration.
>
> Ethernet Interface Schema =>
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml 
>
>
> System Configuration Schema =>
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/SystemConfiguration.interface.yaml 
>
>
>
> Please let me know your suggestions.
>
> Regards
> Ratan Gupta
>
