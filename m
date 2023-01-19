Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8B673543
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 11:16:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyJSX1P5Tz3fDB
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 21:16:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=mlrqXQqL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=g.semenov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=mlrqXQqL;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJRx4lJHz3fCL
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2023 21:15:55 +1100 (AEDT)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id DFFCF3418A1;
	Thu, 19 Jan 2023 13:15:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=uFWmseaDaVsV2onWtV
	/fwQkvGSw7HCftCg5nQcYsfhs=; b=mlrqXQqLODIHhIZjjTIgyg5K3bXH7R6sfq
	HcnXfAlkhvcrZkDA1De8QEaw+e0KrRlVK+CIY/0P5kGiYSTCo2feKKuSb600+rK/
	lfYrbiKaDEvhlibkj/6mjDOkVoaJgMS0g95mNcfSbS5VjTTHt3blMs+iHlzeXLnm
	5HA4pd9Gs=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id D5F9E341884;
	Thu, 19 Jan 2023 13:15:52 +0300 (MSK)
Received: from [10.199.28.51] (10.199.28.51) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 19 Jan
 2023 13:15:52 +0300
Message-ID: <c3a699b2-c259-fd5b-36fd-6538b295e4ce@yadro.com>
Date: Thu, 19 Jan 2023 13:15:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Add UDP transport for rsyslog
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
 <Y8fk224rJX2lqKhp@heinlein.taila677.ts.net>
From: Gleb Semenov <g.semenov@yadro.com>
In-Reply-To: <Y8fk224rJX2lqKhp@heinlein.taila677.ts.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.28.51]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 18.01.2023 15:23, Patrick Williams wrote:
> On Wed, Jan 18, 2023 at 02:36:15PM +0300, Gleb Semenov wrote:
>
>>   1. Modification of the
>>      xyz/openbmc_project/Network/Client.interface.yaml interface to add
>>      the protocol attribute.
> You may want either a separate interface or a separate path to identify
> TCP vs UDP (Network.Transport?).  There are enough users of Network.Client that
> you probably don't also want to modify all of them to have "TCP".  Maybe we
> could set TCP as the default on a new property, but I think most protocols only
> have only a single implied protocol, so you're now forcing error paths
> onto all of them if "Transport != TCP".
>
> Make sure this is done as an enumeration.

Seems You are right, The semantics of the "protocol" field may be differ 
for different services. For SNMP, for example, the "protocol" 
specification means a pair (transport, SNMP version), rather than just 
TCP or UDP. So distinct interface and path will be better.

>
>>   2. Handling for the  interface changes in the code of the dbusplus library.
> Not sure what you mean by this.  The phosphor-dbus-interfaces is where
> the YAML is and the result is generated.  I don't think there should be
> any changes to the sdbusplus repository for this proposal.

Yep. If we conclude to implement a distinct interface/path for the 
protocol specification for rsyslog, than to add a proper handler to 
phosphor-logging is enough.

>
>>   3. Corresponding changes to the phosphor-rsyslog-config service.
> (This is phosphor-logging)
>
>>   4. Proper changes to the REST/redfish API.
> Do you have a Redfish schema already to handle this?

It is "under construction".

>
>>   5. Modification of the web interface and command line tools.
> Which CLIs?  I'm not aware of any that are relevant here.
>
>> Also, current DBUS interface to the object implies two independent
>> messages to change network parameters, one to set the IP-address, and
>> the other to set the port number. They are not atomic and configuring
>> just one parameter yields in undesirable state transitions of the
>> service to configure. It is good to send all the parameters in one
>> "atomic" message. But, I'm understand that this may require to persist
>> current network parameters on both sides of transmission (or, at least,
>> to have all of them on sending side upfront).
>>
>> So, it needs to add  DBUS getters/setters for just protocol type, and
>> all parameters at once.
> The "getters/setters" are defined by the dbus specification.  We should
> not add new methods that set the properties.  See
> org.freedesktop.DBus.Properties.Set[1].
>
> If you need to be able to atomically construct a new configuration, you
> should look to the 'Create' pattern found in the rest of the
> phosphor-dbus-interface repository.
>
> ```
> $ find -name Create.interface.yaml
> ./yaml/com/ibm/Dump/Create.interface.yaml
> ./yaml/xyz/openbmc_project/Certs/CSR/Create.interface.yaml
> ./yaml/xyz/openbmc_project/Dump/Create.interface.yaml
> ./yaml/xyz/openbmc_project/HardwareIsolation/Create.interface.yaml
> ./yaml/xyz/openbmc_project/Logging/Syslog/Destination/Mail/Create.interface.yaml
> ./yaml/xyz/openbmc_project/Logging/Create.interface.yaml
> ./yaml/xyz/openbmc_project/Network/Client/Create.interface.yaml
> ./yaml/xyz/openbmc_project/User/Ldap/Create.interface.yaml
> ```
>
> You'll note that Network.Client.Create already exists, which is probably
> what you're looking for.

May be, thanks.

>
>> Regards!
>>
>> Gleb
> 1. https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties
>

