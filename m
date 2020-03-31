Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A210E199ED7
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 21:22:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sK2Z6R7GzDqxq
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 06:21:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=dHBIfjSB; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sK1W4FTszDqvP
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 06:21:02 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EA93C41286
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1585682454; x=1587496855; bh=Xyt
 cI88pnAjyROtt3P7Xi60r1HyJIobH7au/s1L/ecQ=; b=dHBIfjSBw2nafKnSZHs
 61oM7VaBbJpaL7MqYqmISPAiLSbZJA3+I2Fs3aal6e7VGUMOscs4emFb0hcCTKMs
 OnhWf+lUHguqZm3QVtISqh7tk4VbecK5uEtOeyZgNQ6wwbNvHCCcS6CNi0Dyiirt
 zHYER1lLcrPGAOxFaWicoBw0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtuTn21psakb for <openbmc@lists.ozlabs.org>;
 Tue, 31 Mar 2020 22:20:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9E3B64126D
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 22:20:54 +0300 (MSK)
Received: from [10.199.0.98] (10.199.0.98) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 31
 Mar 2020 22:20:54 +0300
Subject: Re: Authorization of LDAP users in bmcweb
To: <openbmc@lists.ozlabs.org>
References: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
 <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
 <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
 <94be4d08-016d-4d51-1c18-b77281619db1@intel.com>
 <d72f1519-a102-3b4c-3649-bba3b94444ed@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <705ff06f-2b61-f848-b0d5-b593ea60c182@yadro.com>
Date: Tue, 31 Mar 2020 22:20:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d72f1519-a102-3b4c-3649-bba3b94444ed@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.98]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

16.10.2019 14:13, RAJESWARAN THILLAIGOVINDAN пишет:
>
> On 09-10-2019 23:25, Ed Tanous wrote:
>> I'd rather we discuss on the mailing list, so others can have input, and
>> we've documented our conversation for archival later.  I appreciate the
>> offer though.

That was a wise decision. Although it didn't help me here, it did 
clarify some things.

What I would like to know is: is LDAP authentication fully working in 
master now?

We're trying to configure it with Intel-BMC/openbmc/intel for wolfpass 
target and it looks like LDAP support is somehow incomplete.

I configure binding to the server and try to authenticate with an LDAP 
user in WebUI, but I get a message in journalctl that requirement "user 
in group redfish" is not met by the user, and an "Invalid username or 
password" appears in the web browser. I don't see any means in WebUI to 
include any remote users to 'redfish' group. Adding the user to an LDAP 
group 'redfish' doesn't help (why would it?).

Trying to log in to shell also fails without any diagnostics, just 
"authentication failure".

After reading the user_management.md I would expect the following scenario:

1. I enter credentials for LDAP binding
2. I list LDAP groups with their respective OpenBMC privileges
3. I log in with an LDAP user without any errors and get the privilege 
according to the LDAP/OpenBMC group mapping set up in 2)

Currently it doesn't work like that for me.

So the question is: is it Intel-BMC/openbmc repo that is not up to date 
or is it LDAP support in openbmc/openbmc also incomplete? Or am I doing 
anything wrong?

Thank you for any help.

