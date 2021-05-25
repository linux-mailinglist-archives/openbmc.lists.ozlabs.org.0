Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C6390417
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 16:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqGqQ1fD8z3063
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 00:36:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n0xLMMc4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n0xLMMc4; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqGq52t7mz2y8Q
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 00:36:15 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id c3so30465610oic.8
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=u1vrXOlf9iUtbRApMJboMagblVR6P4QXi5vs3joiAXE=;
 b=n0xLMMc4VrPJx8J5zAKi3FjZXGY3/+/e2VChCF0xUwp5/aiHIWqxabvlsT/4qA5PUo
 dIjtSmoQ2IRTRmt+iGgOj9M+cIF0uX8IWZsaZGF8PXGBDSJjDsG8uWCxrGl6f+tgS4MT
 W/Qo4tK5/9vHxLbutICgTrLpDFRNUsSbiSV+1JGBU9I6wLGO/S5OyWRU7PYAoIueOpNh
 QC5Rqex52Smu+bYYRwUzd079D7nMGKZpjqpyI5txkPOFXKbuNuSF0/hv74BgWKuVKfaT
 Cn/82iIBmNQpGDfDoT1NUVk23mHNVcJB+SxDx22yzIYMcVeuTGJMVZ6EhY7IJTdbOmnn
 IRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u1vrXOlf9iUtbRApMJboMagblVR6P4QXi5vs3joiAXE=;
 b=ND30+3rUW2LRzTtGrWFMjUeS587K7iDfV+ZfE2JWOIYb1PHiAp6VWUzhG9EMOj6AXm
 A/SHONLxdHLBj7uWMA3mfygqU+na1njL5pm8MeNboXT+FFp03shGBZjpaBkQ27qmhfAH
 13iPz5UNq7GlC+ntK+RUdH2SWftrm3xCSe+DJN/H5CPk4sV3fjZFkBcsLKmM6KqT+HLI
 MbMTwY/EaxN+1nluR9CXnftiTKC+raONinidxug2nlfP1BrYjN19udREWinK7Jfa+Vuf
 h+hHqX0o4FIpnSP7ZuI118OpdN8zRvMORlUqMn8OMNnTWlHqsIVNYQK3wJsCPEd3IKAQ
 AKqQ==
X-Gm-Message-State: AOAM530/E9UXrZkHrw8CfVJ6UuJIRAb7ayJsVKJnymnZydQFFH09MEYa
 R08X6w1DQ1xHYEoaL797TZ5j6yddOvCqOg==
X-Google-Smtp-Source: ABdhPJxfen99ChuEJtFdjGBu3xmLvrbESJMjkoTnNkOWjkM8sWp0sNzKOB3uHbGft2UK2+kApdJ9EA==
X-Received: by 2002:a05:6808:1402:: with SMTP id
 w2mr14398365oiv.72.1621953371071; 
 Tue, 25 May 2021 07:36:11 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id y44sm3511372ooi.0.2021.05.25.07.36.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:36:10 -0700 (PDT)
Subject: Re: push code to gatesgarth branch
To: openbmc@lists.ozlabs.org
References: <PS2PR02MB3541E7D11C2149187922E3F3902A9@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <PS2PR02MB3541DA8BEB50E318B5FFB24490269@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <4afd04b5-535c-6434-f168-44ee6be052ac@gmail.com>
Date: Tue, 25 May 2021 09:36:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <PS2PR02MB3541DA8BEB50E318B5FFB24490269@PS2PR02MB3541.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 5/24/21 12:01 PM, Mohammed.Habeeb ISV wrote:
> Do we need to push the new code only on master branch? Any inputs?

As Patrick said, yes. New code, meaning a new feature I'm assuming, can 
only be committed to the master branch. A critical fix *can* be 
backported to a previously branched release, but it is very rare. It 
must be a serious issue.

If instead you are trying to add a feature to a older release in some 
way to support a product, that is handled differently - you are 
encouraged to figure out how to make it work in the master branch, 
failing that (and only as a last resort) you will need to fork a product 
support branch for your product. Often this is done behind a company 
firewall in order for a company to add "special" features that 
differentiate their platform to a particular customer.

More info on why you need to do what you are asking may help the 
community get you the info you need.

Kurt Taylor (krtaylor)

> 
> Thanks
> 
> *From:* Mohammed.Habeeb ISV
> *Sent:* Thursday, May 20, 2021 12:46 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* push code to gatesgarth branch
> 
> Hi
> 
> We have added a new platform in openbmc 2.9 version. I tried to push the 
> code for review however below error
> 
> Occur. Can we still push the code to non-master old branches?
> 
> Please let me know.
> 

