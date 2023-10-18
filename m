Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7957CD56E
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 09:22:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GwL+rhi2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9MkJ4pjVz3c5k
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 18:22:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GwL+rhi2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9Mjg41q1z2yQ8
	for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2023 18:21:57 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a2536adaf3so87970977b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2023 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697613713; x=1698218513; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M57ESAJL15JbXr06oCKbm3w7vYKMokoMx3674MbJCto=;
        b=GwL+rhi2U/h1gEXbDCvcHxN7DHSuAf2BX9mgf95XMYu2SAZHqoMQM+F+Ql14YZvub0
         zFjGyA9V1US5iYTqX/o8XK7y3jrWBKQdj7Ybw6TwYpcoZFehu5XKmjwxs1BPcmUD7rPh
         U+Oi/RQlAc4pfR//WXwvgsUg4yx0ioSXgGU4gIR+q0jNVJaGDunDCs7CTecMtYpHD62o
         jwkLxjznMcrGTHichMYYJ7IwlDgnhgxaMKXweWkyyEeOhM0I5JYNdkYCukTYcXnbl0sG
         OG3KKz6YPQZ/bB1Ih1IWGqWWR06pjJoY6wFzxW7TrT4OUPlXHt62PjEWRkihT/UddUu1
         gI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697613713; x=1698218513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M57ESAJL15JbXr06oCKbm3w7vYKMokoMx3674MbJCto=;
        b=WUHhluEs5Gwyo04eS5kSGcBlGcM+ZraBFhy7nJPYXL8CM1CD/ZJnS+94d3nbdT5M3Z
         dnNbE0JkPoQbRdMNfY69kry0cLwFbvNLFFwiU/xlLmZ9VuAUMLdT4QSpRWWCR7rP3bzy
         0Hf2Not907uyQ4DpqkbNX7wMROGaBOtiRS+P6fLwuZ/CeVX63QF5UE/qOHTXeT9Z4Rmg
         A6Bu2vFGdjOYLPAUg/Xy3JRxfSuLw9AbyIa6APruXrf51e0RTJ5CxbvpjAMSYVgNnbed
         Hwj/+mkaKblG5GxJ1+7q18U7frPEylKFFyydtlSbxG797PS5/muW8i0vus5rxxSCT4om
         IkNw==
X-Gm-Message-State: AOJu0YwY52hqXg3cuRfFdV92WKPz2Tdp+zz/7Oh5NCKPWJyCLX7H4k1n
	A7jy1FHgkEBIpcJKpI1ya4E=
X-Google-Smtp-Source: AGHT+IG31wn6qWnheviZpPnHQRDkxHOQxoq3jDkN/RE+vcUoInmAUiOOfDLvY8G6BjxJ6WqrKc/zuA==
X-Received: by 2002:a25:2507:0:b0:d84:2619:56ea with SMTP id l7-20020a252507000000b00d84261956eamr4211586ybl.51.1697613713080;
        Wed, 18 Oct 2023 00:21:53 -0700 (PDT)
Received: from [192.168.0.108] ([106.51.174.182])
        by smtp.gmail.com with ESMTPSA id t66-20020a625f45000000b00672ea40b8a9sm2794588pfb.170.2023.10.18.00.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 00:21:52 -0700 (PDT)
Message-ID: <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
Date: Wed, 18 Oct 2023 12:51:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 13-10-2023 21:33, Brad Bishop wrote:
> On Fri, Oct 13, 2023 at 05:04:23PM +1030, Andrew Jeffery wrote:
>> On Fri, 2023-10-13 at 00:13 -0400, Brad Bishop wrote:
>>> On Fri, Oct 13, 2023 at 12:32:09PM +1030, Andrew Jeffery wrote:
>>>
>>> > I think for this
>>> > to go anywhere it has to be demonstrated that there's a group of 
>>> people
>>> > needing a solution
>>>
>>> Isn't this self-evident from the schema being adopted by the DMTF?
>>
>> My comment was more in the context of OpenBMC and less in the context
>> of the DMTF. Standards that the DMTF produce are more broadly
>> applicable than to OpenBMC, so not all interested parties pushing it in
>> the DMTF are going to be parties willing to do the social legwork to
>> gain acceptance for and to maintain an implementation in OpenBMC.
>
> Makes sense.
>
>>> > and some collective interest in maintaining one. If
>>> > we can't get multiple parties to collaborate on a design then I don't
>>> > see a reason for trying to maintain it upstream.
>>>
>>> How many parties collaborated on getting FSI into Linux?   How many
>>> parties are collaborating on <foocorp>-misc or <platform>-misc?  Are
>>> those different somehow?
>>
>> How do FSI, <foocorp>-misc or <platform>-misc run afoul of common open
>> source beliefs and values? 
>
> Obviously they don't.  I asked this only in response to the comment 
> about a lack of collaboration from multiple parties as rationale for 
> exluding something.  It sounds like that is a red-herring.
>
>> I'm asking for a higher bar to establish whether a license server
>> implementation that constrains user freedoms is something the OpenBMC
>> community significantly values. Satisfying that (in my mind) requires a
>> diverse set of community members come forward and demonstrate that
>> they're willing to collaborate on design and maintenance, as a proxy
>> for value.
>
> Fair enough.
>
Intention is not to implement a license server at BMC. The idea is to 
just add support for the user interfaces via BMC, which can help routing 
the licenses to the host sitting on top of the firmware. I will start a 
discord message on this - to look for more community interest.
>> However, there is an escape hatch for project social issues. For
>> example interested parties might choose to collaborate on the license
>> manager implementation outside of the OpenBMC org, and package it
>> through Yocto or OpenEmbedded.
>
> I've been thinking along similar lines lately and I like this idea.  
> For a license server and even in general I think less centralized 
> control and less tightly coupled software would be a good direction to 
> take.
I am not very clear about this. The control and processing of the 
license will not be in BMC scope. The host should manage it.
