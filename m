Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B651F688B
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 15:05:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jPH55vCZzDqs6
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 23:05:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GK39zhug; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jPFl3XxRzDqSH
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 23:04:26 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id b8so5344726oic.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QVoo/pSfpnMQuzXpVKg+EKb41pzF6Pp/PClhp0dH51g=;
 b=GK39zhugvsJlwozBBlEbQnd7/R8mkXbyqZIBDFxqESLqPhJfOtW8yf97v/UEjJr1e9
 Z9C5Fr7xqK4xXfZBT3+Xo+VKl5rWxaea1I7p6EeQA9f/6AGp0TvG71ELLnRK63TY5/Md
 1+4a3P8WjX1Nan9lOV7PYnDRlW3RvSq3EoaRpeOwaEVwZVZ9V2uzJtd48lbWe4vonzCB
 qD1RI5ZRE+wKem63nA/jG4PsoLz1Y22la/JFHN1akzBSlv4nm2+Dqb8KFjyTkImCIzpl
 3e1FpQl3PyFXvw5HMBGTL+FxgBmjFiFOKiVuMOXnM0VTS9ZFs79YaaTUHrd/5N3T9XIL
 gdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QVoo/pSfpnMQuzXpVKg+EKb41pzF6Pp/PClhp0dH51g=;
 b=ghr5f1mV546Ds5Xu6rA7YB1LjbXH+r39fbUi37Ek6Yhrsw3ulto5a80LwtypzDxExh
 3uNPOI9PtnNB1Oz6pvbqitJ0QcpjmAvGCqge182/aeUgrse0aOhPswqu37KitrznnP27
 /B/14iFFm3bSM0NV3I7frx9HQkDNlvv03crCHHQNF1PpLflstxL+0HI/MeXUOy5AN0Q/
 mo2XjkIgXjl/ICyeYq7SSS4b6nH1bcFOY/7VBrGCZVJ6nFTtX/5LpziOg4KSbCT/5l7L
 xy6WABsT2KV9o8tq7EmeYSg00YHUZerCBlwuRHnrgfyn22Jr2qsc0FXA8ymNbVWhp9kz
 mP4w==
X-Gm-Message-State: AOAM531wgAgTwNraikT3c2d2wr+u4GGiRDaRl/xxO4fRSuIHjDu1Q0Ob
 sMD2xm6bl9uK4FHfhVPXojmzE1SIUKc=
X-Google-Smtp-Source: ABdhPJxOJAr6Hd68rHVyO6ET44dRqhryIdzJ8MhyIyelU/RsZkZjigvRTHLiDCGjHyLRFVSqWvLH9g==
X-Received: by 2002:a54:4e08:: with SMTP id a8mr6193045oiy.68.1591880662208;
 Thu, 11 Jun 2020 06:04:22 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id d3sm714274otb.18.2020.06.11.06.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 06:04:21 -0700 (PDT)
Subject: Re: OpenBMC Learning Series
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <14ED9A00-19D1-43BF-ACFE-5B9937188DD4@fb.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e1dc043d-9250-7c81-9af6-30dc60fdc4bb@gmail.com>
Date: Thu, 11 Jun 2020 08:04:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <14ED9A00-19D1-43BF-ACFE-5B9937188DD4@fb.com>
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

On 6/3/20 1:10 PM, Sai Dasari wrote:
> Team,
> 
> Our OpenBMC community continues to grow at rapid pace as can be observed 
> by various metrics like number of CCLAs, industry adoption rate, 
> design/code contributions, numerous technical conversations over Mailing 
> List/IRC/Gerritt, and more. Because of this rapid growth the project 
> might appear to be a bit complex for a new contributor evaluating our 
> stack. I believe there are multiple ongoing efforts of reducing this 
> barrier for a potential contributor to ramp them up quickly on this 
> stack that includes documentation, wiki pages, tutorials in our github repo.
> 
> In addition to these ongoing efforts, I propose to start a video based 
> learning series that aims to introduce OpenBMC stack for a potential 
> contributor.  I hope such video series will help disseminate tribal 
> knowledge that we built in this community over a period of time and ramp 
> up the new contributors quickly. To make this series useful, I seek

Thanks Sai!

I think this is a great idea. Feel free to reference the Community Best 
Practices video series I recorded - available here:

https://github.com/openbmc/openbmc/wiki/Presentations

Kurt Taylor (krtaylor)

> volunteer speakers who are interesting in sharing their expertise and 
> help plan this series to be more effective. For those of you who are 
> interested, please add yourself as speaker with title/description before 
> 6/17 @ 
> https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0FivEZJe_EyWs/edit?usp=sharing
> 
> Some topics for consideration include OpenBMC project overview, Software 
> stack architecture, community developer guidelines, Repo structure and 
> guidelines, Usage of Yocto in OpenBMC,  Usage of D-Bus in OpenBMC, C++ 
> coding standards in OpenBMC,  IPMI sub-system, Redfish sub-system, Using 
> QEMU effectively, Sensor sub-system, Best practices in debugging, 
> Logging, metrics/telemetry etc. And this is not an exhaustive list and 
> feel free to add any topic that you plan to share with community.
> 
> I will reach out to volunteer speakers and facilitate logistics and 
> update the ML with next steps. Please let me know for any info regarding 
> this effort.
> 
> Thanks,
> Sai.
> 

