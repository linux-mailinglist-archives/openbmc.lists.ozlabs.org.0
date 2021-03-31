Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBC35082E
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 22:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9dFM5CgCz3bcW
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 07:28:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h1K+P6si;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h1K+P6si; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9dF72s9jz2xfV
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 07:28:42 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so93676otn.1
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 13:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fURVKOVi12nZMjgOMDsv31/Mxea6qscKLsSINh/1ADw=;
 b=h1K+P6siusL8erOUNyPoDmrpKyvqDJ4LX6BQJuKKYXFk8P0Jud6EoLo++TySC75xmx
 HfZDeFqyDBOu2I9zJY2IsdaFVbslNiHub/6ARviv8sZoEKE5y6uU+3fg2+7ipIV+nRbG
 8ym1Y6+BNI83PUhFZmAHZyU01GygeR5aLoJpapILfIOavejB8tDGXEWN/G7IagLmMKFs
 PV60YJGaEVbM09Q7kp6717RCDO4FhtA5adYUAMByH6GKyK1Usy7jNrvUlmHLhRZh6HBD
 KrX56so5F/00+4/YZAHNURwY9K6L/0FhBhzc1zhRX52wIWzh+A3nLmMcDrMWWXHugv9W
 otIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fURVKOVi12nZMjgOMDsv31/Mxea6qscKLsSINh/1ADw=;
 b=p/ozf2HZVbJW5zPWy0GU0NlFL1hu+G2CtBeKBNCV2j2EhsIbFQ6CwWHAWVAdj/bcPA
 WE0fBdrcRvPMmZn+F7H5COEFvet4OC3HlyuyiA/vYavD4NgbSu6Vx7wuSVEoufmkolH/
 glpp0VwljVzzcL31+RLqv7weSYVSazsPdXBZe2MMPsmJfqiuaA9ZlyjfbEw2hGm+W73g
 laQgEBAuJOCAlVZ4rY72SabUMVVoztr4/xMYf5GUsNvlur7lv7BsVPi5UhyrOqeaNN3q
 XT3KpIXUHO7YJesII+gd8hk0p2tRZbQZEcgVQpbK4juRJn45BLn7odmoqEwe8OsIUL2h
 9Adw==
X-Gm-Message-State: AOAM531PoVtHI3t/VKnFx9VBI3wJFVJpmaKWVAF43LhyY6cv/YGPNKCw
 s2Q+v9+vGfxgBAzFLJwph9M=
X-Google-Smtp-Source: ABdhPJwjmkRLt1Gh1o2uM+OoOgo3/6YBkLry5YFEUlzdHsGmXCdqid7iMM/MFFAcViI8r4tAKZiynA==
X-Received: by 2002:a05:6830:4001:: with SMTP id
 h1mr3863804ots.159.1617222517959; 
 Wed, 31 Mar 2021 13:28:37 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id y11sm740237ots.80.2021.03.31.13.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 13:28:37 -0700 (PDT)
Subject: Re: group for foxconn CI / fii oem repo
To: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Neil Chen <Neil.Chen@fii-usa.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <39a634e5-744a-4a9c-2221-3a1d39dedec4@gmail.com>
Date: Wed, 31 Mar 2021 15:28:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/29/21 1:40 PM, Lancelot Kao wrote:
>     Hi, Brad
> 	Here is an update, thanks
>     mohaimen.alsamarai@fii-na.com
>      lancelot.kao@fii-usa.com
>      Xiao-Peng.Chen@fii-na.com
>      Mustafa.Shehabi@fii-na.com
>      Neil.Chen@fii-usa.com
>      avery.zl.yang@fii-na.com

Hi Lancelot, I don't see avery.zl.yang on the CLA - do you need to 
refresh your company's CCLA?

Kurt Taylor (krtaylor)

> 
> --
> Best Regards.
>   
> Lancelot Kao
> 
> ﻿    Hi Brad,	
> 
>      You can add people below as maintainer for the Foxconn-ipmi-oem
>      mohaimen.alsamarai@fii-na.com
>      lancelot.cy.kao@fii-na.com
>      Xiao-Peng.Chen@fii-na.com
>      Mustafa.Shehabi@fii-na.com
> 
>      Thanks,
>      Mohaimen
> 
>      -----Original Message-----
>      From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>      Sent: Monday, March 15, 2021 3:52 PM
>      To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
>      Cc: openbmc@lists.ozlabs.org; vveerach@google.com; Lancelot Kao <lancelot.cy.kao@fii-na.com>
>      Subject: Re: group for foxconn CI / fii oem repo
> 
>      On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>      >Hi Brad,
>      >                How can we create Ci group on gerrit and add people to
>      >it
> 
>      Created fii/ci-authorized and fii/ci-authorized-owners.  Please add people to fii/ci-authorized to automatically approve patch authors for CI.
> 
>      >And we need to create new repo for the Foxconn ipmi oem
> 
>      Created openbmc/foxconn-ipmi-oem.  This repository needs a maintainer - can I get a github account handle to invite to the OpenBMC organization and assign the maintainer role?
> 
>      thx -brad
> 

