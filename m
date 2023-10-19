Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBD7CF524
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 12:27:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GLhvTpmi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB3nG6QFyz3cST
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 21:27:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GLhvTpmi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB3mf3737z3cFh
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 21:26:58 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so4824334a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697711215; x=1698316015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNxql6MixFgNzuM0gBIB00WoVBLrShUsLjhV9eduLD4=;
        b=GLhvTpmiGcm/IdEz6EgohHqn80vbeKBgOHgWGzqsQAf6r28rhlXpc27KAHCJIBn7Cy
         ZoRnjpSPUqbYGW3PD1fACSUHf2xXhIM+rAYTC5TO3njap/EER6JOJ9RncoERTfNIxCG0
         wahamxwLRCHnJ2rTXNNtqRfeN0JQ3925OVC8tBkSpMiyKM1ouv84NrvwhUR41DdIjuNC
         eJFM2keZpIJfRUITLO8A1FpqnBKKQtyqYz8/TT8Gs0nrB70ilt4FENPzKA/VjBvquz2o
         rDfUhmY8I1EIA+Eo3ttz32zL5aXt37nRnHWbawD5PEYa4X/f5+e3YSex3MRawtHBsOeW
         FNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711215; x=1698316015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNxql6MixFgNzuM0gBIB00WoVBLrShUsLjhV9eduLD4=;
        b=rZ8/BDzDlH6fFLqL8tCgH5FmLuVxbVrNclHxFlhynxGW+lJh6vuciYrWwd+1uAI0oC
         Ovr+GeY/DyxJ78qHDPBJHdjWYMyTwFzCrC1eiqHKWqEz1iXLFVWhP5K1CMF1H55cZArr
         pK/eDf4Avea+6OKi47YwMkkAePcr6lXC6BodCuHOhA9FhJE19CMfAcYeseivNUFPzIMT
         7q4BUFfXLTWBG6HamtWOoiafPmKOoGQxe898K6J15qxAW322nY4CZM6S3TUE0ING03DX
         bgMa9ywiwI7iU6g+fT7spafUpqIixraoi5Dyf7rkczC/1ztfSTMiOeFhHdHgh0wzJC9S
         4vBw==
X-Gm-Message-State: AOJu0YyOS/1vbPvtphbLYd0XkXKHHAT1D3c7wJ01MfriWZ/ODDmlzJwm
	fBEnrFdpr3XTiRRn1Zzv0Xk=
X-Google-Smtp-Source: AGHT+IEN8flEbN6by+7vqJ8boc9AlvHEPG/HkegqzrKHNdsKLL3PGrm42KNEfBMCKxFf2b5PWHsKFw==
X-Received: by 2002:a05:6a20:9146:b0:14e:509:1d7b with SMTP id x6-20020a056a20914600b0014e05091d7bmr1958831pzc.8.1697711215406;
        Thu, 19 Oct 2023 03:26:55 -0700 (PDT)
Received: from [192.168.0.108] ([106.51.173.182])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001c9d235b3a0sm1583339pli.7.2023.10.19.03.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 03:26:54 -0700 (PDT)
Message-ID: <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
Date: Thu, 19 Oct 2023 15:56:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
 <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, gmills@linux.vnet.ibm.com, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 18-10-2023 18:48, Brad Bishop wrote:
> On Wed, Oct 18, 2023 at 12:51:47PM +0530, Sunitha Harish wrote:
>>
>> On 13-10-2023 21:33, Brad Bishop wrote:
>>> On Fri, Oct 13, 2023 at 05:04:23PM +1030, Andrew Jeffery wrote:
>>>> However, there is an escape hatch for project social issues. For
>>>> example interested parties might choose to collaborate on the license
>>>> manager implementation outside of the OpenBMC org, and package it
>>>> through Yocto or OpenEmbedded.
>>>
>>> I've been thinking along similar lines lately and I like this idea.  
>>> For a license server and even in general I think less centralized 
>>> control and less tightly coupled software would be a good direction 
>>> to take.
>> I am not very clear about this. The control and processing of the 
>> license will not be in BMC scope. The host should manage it.
>
> The suggestion here is to:
>
> 1 - write your license server application
> 2 - throw it up on Github somewhere other than openbmc
> 3 - submit a recipe to meta-oe
>
Thank you for clarifying.
> It's possible the meta-oe maintainers could reject your recipe for the 
> same reasons as you've been rejected here (or any other variety of 
> reasons).  In that case you could just make a meta layer with a single 
> recipe and throw that up on github too.
>
> The downside to this approach is you shouldn't use projects like 
> phosphor-logging, sdbusplus, or phosphor-dbus-interfaces or any other 
> recipes that are provided by OpenBMC or in meta-phosphor. Certainly 
> not if you want to get a recipe into meta-oe. 

I think this would defeat the purpose of this proposal. We want to use 
the BMC as a pass through entity for the licenses. It should be handling 
the redfish commands (bmcweb) on LicenseService schema - which is 
tightly coupled with the dbus. And the communication to the host at our 
server is via PLDM/MCTP. So we can not exclude the openbmc components. 
More over this new meta-oe work will turn out to be costly.

@Ed/@Gunnar, are you interested in supporting the LicenseService schema 
at bmcweb?

> IMO this isn't necessarily a bad thing, though.  This is what I meant 
> by tightly coupled software - if you take this approach and avoid 
> OpenBMC specific frameworks...who knows - if you make a an really 
> awesome, useful piece of software - you might even get collaborators 
> from outside OpenBMC.

If the app which is planned now is processing/validating the licenses, 
then it would turn out to be an awesome piece of software. But that is 
not the intention. Lately, as per Andrew J and Manoj's review comments - 
the design is taking a direction where the objects will be hosted at 
PLDM itself and there is no need of a new application called LicenseManager.


