Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B53647F1
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 18:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPBYs0ThWz2yx3
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 02:08:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rLQ50/HO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rLQ50/HO; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPBYc4yFmz2xYd
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 02:08:01 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so27942355otf.12
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1NAFN7moYX8e0vqq5cOE/caRtE2y8WSkF1DWMr4kNc8=;
 b=rLQ50/HOtV6Afxwsg2HPoQsr7ZjJZR9zmcyVMn49Ta4IZTgfHM0tsU4DDlOjzlQuPe
 AARVWYeDQ46IINaRAo2sWlz2B6cTXriAsMrIpD37DsqMyZmCTWwKtzUScUtLldeRJP9y
 Gx9IWwv4W26+OMFGshgmF9JjdUmSKQBO9VrQQs1bpO5NFqu+3yELkNBpN8ypkjMOMinJ
 1GqDiyQLGp6z9SLxKn42Z3unkVPSK+kBylQUE589AkJQ+n3Rj7eDseMGn/1xD8Ct/f+3
 cjL7KAXlHe+JAdRUk/5K4V9ok7RT3pQT8laaCzZy3+dj/Th5nLuPbq/e/BcvjBQZJ1Qp
 YBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NAFN7moYX8e0vqq5cOE/caRtE2y8WSkF1DWMr4kNc8=;
 b=lxNY8p37g6OuBfgPbv932CzUrW/djsy8pkT8pppqPplmyxPtmLf7QSTVouK+8Ij0L7
 k8b61ayDctJxuasFuM4s4DSSzumvUmuuBjKAfkxXKrkCEYQI/7sULCAPoff0aKXcsArj
 aQVHlnfwg40rCK3gpGMYqBXHjrMQH8UCYKI7SsAiea5xnRNDmkUbA0+7eTSNjq0Zw43R
 ZWl9ix2gtjull9miPt0mFZZRcft0NvdYS0VSuMqvIXmnGVOniVrvHryI0CLDsLOri7/7
 pB2HeKxKUQdmNaBuxfzvj91Ljx5BXW1z7xtw1aFAdXKtDOaFGy1vXhqeSF2WosO1JS/x
 JW1A==
X-Gm-Message-State: AOAM532C9C3mAbshcoPISnnLk0llURApOwDdSfw//Vmh2gvTdejftNIA
 tNXq6g/sFeCghBC0LlQF1XU=
X-Google-Smtp-Source: ABdhPJyVAQDJm+OfqqPkZ8CyjKp7Q6hPQ2KquR3iTu+86o1UClnjhozE9BQ7ZY76hJ+9FovSGSH8hA==
X-Received: by 2002:a9d:7148:: with SMTP id y8mr6853670otj.261.1618848478449; 
 Mon, 19 Apr 2021 09:07:58 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id k44sm2907380ool.33.2021.04.19.09.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 09:07:57 -0700 (PDT)
Subject: Re: group for foxconn CI / fii oem repo
To: Lancelot Kao <Lancelot.Kao@fii-usa.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Neil Chen <Neil.Chen@fii-usa.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
 <39a634e5-744a-4a9c-2221-3a1d39dedec4@gmail.com>
 <8107A042-4934-4B23-A53D-B84E397FAB8E@fii-usa.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <60489aa0-8af0-779c-ccc5-5b07654c7127@gmail.com>
Date: Mon, 19 Apr 2021 11:07:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8107A042-4934-4B23-A53D-B84E397FAB8E@fii-usa.com>
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

On 4/3/21 10:43 PM, Lancelot Kao wrote:
> Hi, Kurt
> Here is the update for the CCLA,

Not sure how I didn't get this, but anyway, your update has been 
accepted. Thanks for keeping it current.

Kurt Taylor (krtaylor)

> 
> --
> Best Regards.
>   
> Lancelot Kao
> 
> ﻿    On 3/29/21 1:40 PM, Lancelot Kao wrote:
>      >     Hi, Brad
>      > 	Here is an update, thanks
>      >     mohaimen.alsamarai@fii-na.com
>      >      lancelot.kao@fii-usa.com
>      >      Xiao-Peng.Chen@fii-na.com
>      >      Mustafa.Shehabi@fii-na.com
>      >      Neil.Chen@fii-usa.com
>      >      avery.zl.yang@fii-na.com
> 
>      Hi Lancelot, I don't see avery.zl.yang on the CLA - do you need to
>      refresh your company's CCLA?
> 
>      Kurt Taylor (krtaylor)
> 
>      >
>      > --
>      > Best Regards.
>      >
>      > Lancelot Kao
>      >
>      >     Hi Brad,	
>      >
>      >      You can add people below as maintainer for the Foxconn-ipmi-oem
>      >      mohaimen.alsamarai@fii-na.com
>      >      lancelot.cy.kao@fii-na.com
>      >      Xiao-Peng.Chen@fii-na.com
>      >      Mustafa.Shehabi@fii-na.com
>      >
>      >      Thanks,
>      >      Mohaimen
>      >
>      >      -----Original Message-----
>      >      From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>      >      Sent: Monday, March 15, 2021 3:52 PM
>      >      To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
>      >      Cc: openbmc@lists.ozlabs.org; vveerach@google.com; Lancelot Kao <lancelot.cy.kao@fii-na.com>
>      >      Subject: Re: group for foxconn CI / fii oem repo
>      >
>      >      On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>      >      >Hi Brad,
>      >      >                How can we create Ci group on gerrit and add people to
>      >      >it
>      >
>      >      Created fii/ci-authorized and fii/ci-authorized-owners.  Please add people to fii/ci-authorized to automatically approve patch authors for CI.
>      >
>      >      >And we need to create new repo for the Foxconn ipmi oem
>      >
>      >      Created openbmc/foxconn-ipmi-oem.  This repository needs a maintainer - can I get a github account handle to invite to the OpenBMC organization and assign the maintainer role?
>      >
>      >      thx -brad
>      >
> 
> 

