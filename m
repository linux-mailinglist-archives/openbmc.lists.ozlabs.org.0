Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A945819D4E3
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 12:17:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twpz3K9pzDrj2
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 21:17:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kR1lJJ12; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48twp65s3jzDqJq
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 21:16:42 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id k191so3279846pgc.13
 for <openbmc@lists.ozlabs.org>; Fri, 03 Apr 2020 03:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=UXhG+BYUkhKbpJxOpai6fXLne5p+Q6m0cbkS4RDF5II=;
 b=kR1lJJ121tSgZkEnHCjqyin9xMPgMtnzvKMPIoZ1i4JKZN96FAXDE/Ab7Me84Ff41Q
 YV+KjmMh5KWkik41Me/GhX+ffqjS5oK/NqusZ4vCRbWAk/IiQ4i24Feb4eU7eMgs/5vs
 KzYIUZ5op5ng+7U9kcUiJ6rgwXpCW+QI9Mcm3Hzp6HsX1wkb66spbvBASfqxTYKcaKLw
 2nbgzSps9sVlxELlPqNe8p6AYSSDQenC383m9q/hbTnLkNhk0g/VdmGJLPvz7dFTsRjd
 CT0u/xdSz/SDTO9+spdY4RbQuo0IImXeGACy+cim+tyTCcvvr6iLnE5NKJgqfElheg7F
 senA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UXhG+BYUkhKbpJxOpai6fXLne5p+Q6m0cbkS4RDF5II=;
 b=XhqkM6jMeiMhBpyCUBzFllqRZyt4Px3xFpSmIkQM2husqLUS41o1a4nMK+B9LHKRbz
 12h/zeJNEzjL15Ob4zt4gkthrEY0yDNe+VmEKL3vN1SxRSbahazz4I+WX+AVMdb/z85A
 g0uS5fsSbAI6mMwlZvfnh9lk0edqB9hr1xL/37PMMnyE3wV58x8geCiDGar1YjQVFZxs
 QXTjr4PubeEU13xwnuUIRsO/WYw9f4qeiVyyHzF9NBkgTlRmQf8RQ3HAJF5usU6lfgCL
 drjMLqHlIRyyoorNzmAEioRW8DvMKG0I6QV45ETzsgL1p+qffGTbcx30+E60N1ctSmsg
 SDig==
X-Gm-Message-State: AGi0Puak3ZyUXnewUrOc9upugwQYjNW8MMDhQ3AYQonnUNYsgRQ9o2yY
 GAYadRNahU25O3eJlidPmTM0YZax
X-Google-Smtp-Source: APiQypKw0BBRjhdPcxZ8wIIT2rVL+uBmHHK29Qvnd9zF5HahpExKnaUIu9PiErK0Nuqh9frhWgLhsQ==
X-Received: by 2002:aa7:97a7:: with SMTP id d7mr7731593pfq.194.1585908998759; 
 Fri, 03 Apr 2020 03:16:38 -0700 (PDT)
Received: from [192.168.1.4] ([106.200.224.31])
 by smtp.gmail.com with ESMTPSA id w15sm5520585pfj.28.2020.04.03.03.16.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 03:16:38 -0700 (PDT)
Subject: Re: Authorization of LDAP users in bmcweb
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
References: <32e56dd0-488b-2c25-4f9f-92d5f18d697e@intel.com>
 <03510b52-dbdc-5365-570e-1b2c89a20f09@linux.vnet.ibm.com>
 <d16f6fd8-dbd2-d013-37c1-157da8e8ba4d@gmail.com>
 <94be4d08-016d-4d51-1c18-b77281619db1@intel.com>
 <d72f1519-a102-3b4c-3649-bba3b94444ed@gmail.com>
 <705ff06f-2b61-f848-b0d5-b593ea60c182@yadro.com>
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
Message-ID: <236690b4-373e-ea1b-3139-c59ae6cb3c69@gmail.com>
Date: Fri, 3 Apr 2020 15:46:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <705ff06f-2b61-f848-b0d5-b593ea60c182@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

LDAP authentication commit is : 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27952 and it has 
been merged to the master.

Thanks,
T.Rajeswaran
On 01-04-2020 00:50, Alexander Amelkin wrote:
> 16.10.2019 14:13, RAJESWARAN THILLAIGOVINDAN пишет:
>>
>> On 09-10-2019 23:25, Ed Tanous wrote:
>>> I'd rather we discuss on the mailing list, so others can have input, 
>>> and
>>> we've documented our conversation for archival later.  I appreciate the
>>> offer though.
>
> That was a wise decision. Although it didn't help me here, it did 
> clarify some things.
>
> What I would like to know is: is LDAP authentication fully working in 
> master now?
>
> We're trying to configure it with Intel-BMC/openbmc/intel for wolfpass 
> target and it looks like LDAP support is somehow incomplete.
>
> I configure binding to the server and try to authenticate with an LDAP 
> user in WebUI, but I get a message in journalctl that requirement 
> "user in group redfish" is not met by the user, and an "Invalid 
> username or password" appears in the web browser. I don't see any 
> means in WebUI to include any remote users to 'redfish' group. Adding 
> the user to an LDAP group 'redfish' doesn't help (why would it?).
>
> Trying to log in to shell also fails without any diagnostics, just 
> "authentication failure".
>
> After reading the user_management.md I would expect the following 
> scenario:
>
> 1. I enter credentials for LDAP binding
> 2. I list LDAP groups with their respective OpenBMC privileges
> 3. I log in with an LDAP user without any errors and get the privilege 
> according to the LDAP/OpenBMC group mapping set up in 2)
>
> Currently it doesn't work like that for me.
>
> So the question is: is it Intel-BMC/openbmc repo that is not up to 
> date or is it LDAP support in openbmc/openbmc also incomplete? Or am I 
> doing anything wrong?
>
> Thank you for any help.
>
