Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A61161C2D
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 21:13:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LwCm59w4zDqCK
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 07:13:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OJUdNzbO; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Lw9P6XDwzDqlr
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 07:11:21 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id z12so9811376pgl.4
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 12:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=vvr6YLjwNdNh/g43VDuRNFAzW7A2aDa2iqr/3tUIuLA=;
 b=OJUdNzbOg2h2sBJfrQ/ooU30bDzZbO+LZ+UtL9fpyLSi/TnQ7eplQFK3YYuJSpH+t8
 f2Mg3sBSfO67jqUcz98/N0//tALRnBYIkBFb35NbXjRBR2iP0JemjY9FXveW/WTFZcj3
 lgnD2E0u6bNihHPg1b5bfJtD4nM4BubU5UZ7vEdIN3RTz3KhN9jMRqKu8XAky4EK2GeS
 Yf7thOhEWqEXxSpS+uTbkL54DZhxtaQll4nYe/dYE8eSUjq0wrnlsyfkVnCxQEuivSfO
 KcSUVY1SPC230OI/6lfdyXQz6ZeI5i1MYx7WfDJL5m4ppiR1vvSA+D3CsBcMtgcEwTJ/
 E+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=vvr6YLjwNdNh/g43VDuRNFAzW7A2aDa2iqr/3tUIuLA=;
 b=CDMdkY8lwfmRhkSyODEiEKxhlwRz8VrC6JKuW7R1DaaLK4s8sTU8kmBQJHTOrMgg3z
 QvAc8OBHYt5zVHl4JgyfQ+iXNV3DkD0izWm1QcWnoAUu5abjusNKVzh9p7hY/DFABjzh
 oPMqW9PzUeoZPmSCST6fSPPeZ19E91gdvWnGxelGjtn2/ZBJajc/oZV4rf1OHfn49yOz
 AeI8rWWHqzmF3e82h7x1YyoQCsKuWunWm2SmAP8k1my+cwnCld0aJuqma7jWIEzQ/Zq3
 NoMGh4JYZI6e8n87PwswKJ3gxO5fFOHiBfq7mOLqFJUHQd0le5JiSRs3D/6F5sw6cmYi
 +8qw==
X-Gm-Message-State: APjAAAWESdl86Vddsh1YkovkFMnxVAU9g+WleSnDrByaYFjIzVuBKQSC
 MPORAoBpoIv1vx56/C+T5kzR7VKi
X-Google-Smtp-Source: APXvYqxj9GJkokfYob22IO/Ca7LnLOfEklDuTo/cdEvSlckPP2h/02l6ye/iE/IqVIb+/N4uvdR7Bw==
X-Received: by 2002:a62:1456:: with SMTP id 83mr18302910pfu.186.1581970275031; 
 Mon, 17 Feb 2020 12:11:15 -0800 (PST)
Received: from [192.168.1.4] ([122.167.101.64])
 by smtp.gmail.com with ESMTPSA id fh24sm273374pjb.24.2020.02.17.12.11.13
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 12:11:14 -0800 (PST)
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Redfish EventService Implementation
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
Message-ID: <4ac6e8ae-ff9c-fa0a-18b4-1d7e4783b712@gmail.com>
Date: Tue, 18 Feb 2020 01:41:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

I have implemented the skeleton code and uploaded it for review. Kindly 
review and let me know your comments.  For prototyping, based on the 
Redfish Event Logging design, I have modified phosphosr-user-manager 
application to log resource creation event when an account is created. 
For reading the redfish event logs from the journal and writing to BMC 
filesystem(/var/log/redfish), I have pulled the rsyslog configuration 
from the OEM (Intel) and made minor changes.

These patches are work in progress and needs lot more changes. Any 
suggestions regarding the approach is appreciated.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/29464
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/29463
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29462

Thanks,
Rajes
On 10-02-2020 01:52, RAJESWARAN THILLAIGOVINDAN wrote:
> ApparaRao.
>
> As you have shown interest in this feature and submitted the design 
> document, do you have any opinion on this? Do you see any merit in 
> using D-Bus match in bmcweb to create event logs for life cycle 
> events?  Please feel free to weigh in.
>
> Thanks,
> Rajes
>
> On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
>> Hi,
>>
>> I am going through the bmcweb code for implementing Redfish 
>> EventService based on the design document 
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This 
>> design is hooked to the journal based Redfish Event Logging. For life 
>> cycle events(ResourceAdded, ResourceRemoved, ResourceUpdated),  using 
>> D-Bus match, bmcweb can create an event log. This requires a JSON 
>> dictionary, comprising an array of Redfish Resource Name and the 
>> D-Bus path. This approach works only in case of one to one mapping of 
>> Redfish Resource Name and the D-Bus path. For propertiesChanged 
>> events, if the Redfish Resource property is not on the same D-Bus 
>> path or the Redfish Resource property name is different from the 
>> D-Bus property name, then an additional JSON dictionary to maintain 
>> this information is required. With D-Bus match alone in the bmcweb, 
>> Redfish EventService can't be fully supported. For the Message 
>> Registers and the Resource Types that are supported, the relevant 
>> OpenBMC application must create an event log in the journal using 
>> either the phosphor::logging::entry or sd_journal_send() command.
>>
>> After realizing that with D-Bus match in the bmcweb alone can't help 
>> to fully implement EventService, I prefer to avoid using D-Bus match 
>> in bmcweb. Instead, I prefer to modify the OpenBMC application that 
>> generated the event to create an event log in the journal. Do you see 
>> any advantage of using combination of D-Bus match in the bmcweb 
>> wherever it is possible and changes to OpenBMC application in other 
>> cases to create an event log ?
>>
>> Your views are highly appreciated.
>>
>> Thanks,
>> Rajes
>
