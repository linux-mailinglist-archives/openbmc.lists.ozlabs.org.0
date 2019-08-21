Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984B971F3
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 08:12:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cy4b3VyfzDrDY
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 16:12:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=santosh.puranik.ibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e43lX8/p"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cy3k230vzDqgB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 16:11:45 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id w2so719816pfi.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DiLx9pkUaOjYweTgmo/6vN6IKlQOFUe2OwabKOaTbmc=;
 b=e43lX8/puwoW6OXF/QSJF1BT8fITsLKtejtCUeFQUlgzaU/bNBgj+gxRbvqwx3Tnsy
 F99g4g8oNWMXX8f01EnJXGkG3zaKg/Va6M2I6fjWE2W4pmhgaXCoGxuiN8wtx75R81LQ
 15LDvL5oVvSSaHaLZ8YMvL7Qa6MU6phUaGG6TiM6eagwwBh/GFAgZN2fi991oBR1JAYt
 D14iXpWhMyvnGRxrfcA9jNtkcBdiklbSZetzSvjN+9IrlrA+cM5jVUXdnrT4/iOzc3fr
 0w/8g9ShIRGUGewkrYCowsKVHaWc9Za1uHY+xPRM8ddAQtAE34Xkos+bYNgz+awoCQ7M
 NdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DiLx9pkUaOjYweTgmo/6vN6IKlQOFUe2OwabKOaTbmc=;
 b=kJ/JICsVpvDBtSfwKem/HdfldNDQYjUVZDU90R2cfQxjyY/cEq/r5dJppF41NMpOa4
 F36f3v3FtB5CxKHtM+jgLc0zDFjKhw1Ek8HsLZh8sEn83LTHB0gZQ9cOHZ8OW58GZUlw
 RMIkLQoEG1O+Iy7YqZ+gLWX0LZGssFMtAK8q2RreS8Fki2Ba4l/YliEBbfT4VI295Cks
 81hEw761jrGVhyYcoCycfoLIrdKunAa4WOSWR6Kv8nZfFZXtQfBdRX1V9sAJd58TPIYg
 0QkbfuppDn2JooafBtvJUGHWkNehXxnV5m+J0CAdAvYTt+zaIYRNdR3dJtxbIFeU1PU8
 1Nuw==
X-Gm-Message-State: APjAAAWs//hrQFM37bQWs2w+BY5AEvm38JLEnMm/5JCp2BF395/O2pgU
 9zuqQQqlr9uCVp9KerGvHiQf/u+P
X-Google-Smtp-Source: APXvYqwGFvfe328CTiQ72rmY19/dWJ6lvsJJmCXp3X1HfX83JoXhOhKV3R6sp1iNHnqYo7zYOlDF+w==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id
 d20mr3854561pjw.28.1566367902179; 
 Tue, 20 Aug 2019 23:11:42 -0700 (PDT)
Received: from [9.199.76.54] ([129.41.84.90])
 by smtp.gmail.com with ESMTPSA id r6sm3533818pjb.22.2019.08.20.23.11.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 23:11:41 -0700 (PDT)
Subject: Re: New Repo Creation Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
References: <8b047191-7648-587a-2b14-8cbb94aaf1c7@gmail.com>
 <B8F669FB-9B7C-466B-A736-27EE8FFEAEB7@fuzziesquirrel.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <29b134c9-b18d-62cb-fd87-15417a2a13d7@gmail.com>
Date: Wed, 21 Aug 2019 11:41:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <B8F669FB-9B7C-466B-A736-27EE8FFEAEB7@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

On 12/08/19 10:42 PM, Brad Bishop wrote:
> at 8:51 AM, Santosh Puranik <santosh.puranik.ibm@gmail.com> wrote:
>
>> Hi Brad,
>>
>> Could you create two new repositories:
>>
>> ipz-vpd-parser : Parser application for IPZ format VPD.
>>
>> keyword-vpd-parser : Parser application for keyword format VPD.
>>
>> The design document that details these applications is here:
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22491
>>
>> Thanks,
>>
>> Santosh
>
> Hi Santosh
>
> The design calls for additional systemd services and applications (not 
> necessarily additional git repositories).  Can the new applications 
> and systemd services be hosted in the existing openpower-vpd-parser 
> repository?  We have an awful lot of repos as it is and these new 
> applications seem like a good fit to go with the existing ones in 
> openpower-vpd-parser.
I agree, we can reuse the openpower-vpd-parser repo. for these new 
applications.
>
>
> I’m envisioning a repository that supports parsing a number of 
> different fru data formats.  Support for the different formats can be 
> turned on or off with meson options or autoconf options.   The 
> specifics of how the code would be organized within the build process 
> for openpower-vpd-parser I’d leave to you and the current 
> openpower-vpd-parser maintainer (Deepak).

Deepak and I spoke about this, we'll just use compile time options wherever

possible.

>
> We could rename the repository and/or recipe to something more general 
> if it is just the name that is off-putting.  Open to suggestions there 
> - how about phosphor-fru-parser or just fru-parser or vpd-parser?
I think I am fine with the name as it is. Don't have a particular 
preference.
>
> thx - brad
