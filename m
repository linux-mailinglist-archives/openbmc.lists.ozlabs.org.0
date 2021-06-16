Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD93A9BB2
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 15:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4lqy4y37z3bVD
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 23:08:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HFaPoVh1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HFaPoVh1; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4lqf6FtLz2xvZ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 23:08:29 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id x196so2443546oif.10
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZCPj98NtI3w2bfLA/1Ln5oPu3F5F4rh6+J6E1GBHNVk=;
 b=HFaPoVh1icbOhCFUkEhqyA94z6Buh8xKMvZDHcW6LkYnTTIUbGIhgZjQFh0F0oR/fd
 IRipCWNX/+g1Yse1GFGR22IS/6B8Uxb6NezE3ypHy/SohMWrSMvmNpHh0cIZh0xXTmsl
 OThTt+lvVxPinS4iBiD9Js0HCMo1qRKTI9br0+gVK6zKMdF9+XesNdTJQft8qp6gjqmB
 E5M1y5B2/472EqkFFbuRWvsP7/qZoTbt5WJrY0bB2k3HI3U/NHndBDqmk/4cawfOoku+
 ABKPbDvYt1yOZsoj6Mk/DUS5YplzQalyHml6NH8TW1SDoTuIfXRZF546oGYa85Qqa4+C
 0CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCPj98NtI3w2bfLA/1Ln5oPu3F5F4rh6+J6E1GBHNVk=;
 b=csGT/3hbnMRtzlsGB4VO4FZDvfZ/9zYh8guc9f3YVzRsPEzo3X5n7/vB1OgRyzUehl
 QYvLsJziR7VwW0EITv79oNB2qyx1EbHdFVfAhD38AXhQEeBYdcaf42RVa+86xTcYIcN9
 1r3/3fGmclpQsXgdafVcL4wVoaTmKvb7BtciIh6+2r3AL2YT4Ig32OPfUt5ePvg+WRLL
 MW1Sxth8P7+aXf7AbJc7BW3BO/bvV5FoBuXTeZ6aLZ60ruYB2jNNndvDlPIz/1HvJ4AP
 ofwcezLml52gxccoxLjsArPzii8WAV+rEmcYVi9ubJx77NdOlJZl0vEgVlpnjN4YAd4c
 DozA==
X-Gm-Message-State: AOAM532dcjLsEorUIrgVoSkAr3FXjw6nAoyJo4YivX2QznxdVXiWY8to
 vnCuzDiYRHgYAZp4JgocbTuVMmaFN2npyg==
X-Google-Smtp-Source: ABdhPJyFK9NhChRCInHXtVBab+vqQ5yv7Si8wjj1ruI1kevhC7/pxapaQcKM2Uv64EcoFhgX9z30Iw==
X-Received: by 2002:a54:4802:: with SMTP id j2mr7144857oij.125.1623848900512; 
 Wed, 16 Jun 2021 06:08:20 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id l8sm456525ooo.13.2021.06.16.06.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:08:19 -0700 (PDT)
Subject: Re: [SecurityworkGroup] Security response team - bug database needed
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <982fc651-53ca-f5b8-825b-881579433569@gmail.com>
Date: Wed, 16 Jun 2021 08:08:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/9/21 7:15 PM, Joseph Reynolds wrote:
> This is a followup to a discussion in the security working group meeting 
> held 2021-06-09 agenda item 11.
> 
> 
> The security response team has difficulty tracking reported security 
> vulnerabilities to closure and writing CVEs in a timely manner.  Having 
> a confidential bug tracker would help.
> Per Dick, the UEFI team uses bugzilla and has a restructured corner for 
> the security response team: anyone can write a bug, but only security 
> response team members can see it.
> What are the best practices? How do we get a bug tracker which only 
> OpenBMC security response team members can read?

If I read this correctly, you are requesting a Bugzilla instance be 
stood up to track security issues? Since we have no community project 
budget to fund any type of hosting, nor any community interest to fund a 
trust/budget, this would have to be a donated service. Maybe a 
participating company would be willing to host and care for this service?

Alternatively, can the response team use a service that we already have? 
Just thinking, I have no details, but maybe a new Github group/repo?

Kurt Taylor (krtaylor)

> 
> Joseph
> 

