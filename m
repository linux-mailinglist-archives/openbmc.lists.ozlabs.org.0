Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BA275BF3
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 17:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxMdt4MDtzDqXb
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 01:33:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DdTnygyZ; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxMcM0BDfzDqYt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 01:32:17 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id g96so70599otb.12
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1gT/usYDCHoK31QBvreP4RTuN/w/zj2M2tUKlBugn/s=;
 b=DdTnygyZOBRHqFPodMI2otM7o9RNhiDFzyQaulUHZuoJOx2+7ILvKw5Z9OSfF78J3j
 fhi/VoERMgZhdE69eL7XI/bIrH+yzde8Z8LSkB54g2WXCOCweAnI9BE8SspByUuIsJvi
 gJxugtSexp2bbsVg0EfAyzbdVaC4HQ/M5+CvU2eGejrm50iTQj6iR/A/R84ENsNDateI
 IfJxGAUMPNygmqeEjA8+fvpFy0FGCQjr5dh68zc9llolDsmwn+04YZzUz71bm3K3+MOd
 ZlS4VtnzjS4gHty3FFvD/OWVqHRKhnfgDecIrtnq0nuQZMFGDZivdVBKTGjalmKyz+Uq
 e9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1gT/usYDCHoK31QBvreP4RTuN/w/zj2M2tUKlBugn/s=;
 b=IVy2fH42j54/CWsPwf4aePQZD8IYrGekuoto+tdSPW/yrySzGOJKKpw4bdFeC83QTi
 geuzOReWO784pVh5+NJ5xdcGTA86nbDLzmj/moZUQii15lcsPqdUz1emUS5vPli0uoRH
 QKcRgSL4IWZKNkkwLqUi9EEYfB1GtZv2eTtivVOxAv+Ymktk/LWG38SXJIm73RFmN58t
 6smSJ2DSTFcLzzI4Ryt/Okk5V/H60LFV7JwGObnaCp2kZzSDXPEUwmuO1I8zcLiu7SFN
 E98KAjIjHQNRg+8ZvGfNkWZS4nLABrrxGJalXDun4s8auKVzVipmaEr4+ah1U0gRje3Q
 Vj2g==
X-Gm-Message-State: AOAM533UmygUpwd4u/+m1fLoFtrRNN1QTDFt9tqQAafAtrV3NbprvhO4
 5D8GLNXlr16LUkEyUvOzQHNcB4pxM4D3gw==
X-Google-Smtp-Source: ABdhPJwTdC3HcPOz4tjeQyz109aRRtGGgr4GJthiR3PUJ4039fIyoXGl+LzusNeRoA1Rkqh5Cou+bg==
X-Received: by 2002:a9d:6d0b:: with SMTP id o11mr180086otp.114.1600875132634; 
 Wed, 23 Sep 2020 08:32:12 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c25sm18049oot.42.2020.09.23.08.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 08:32:12 -0700 (PDT)
Subject: Re: OpenBMC Office Hours
To: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CADfYTpFQoiQ6BcoVeT1Mi2oF+tORtjvbkmSkvyFB4FA_nR3p3Q@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <bb31004c-7f6a-e71e-c336-f75272e48913@gmail.com>
Date: Wed, 23 Sep 2020 10:32:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADfYTpFQoiQ6BcoVeT1Mi2oF+tORtjvbkmSkvyFB4FA_nR3p3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 9/22/20 12:17 PM, Nancy Yuen wrote:
> Hi Team OpenBMC,
> 
> As Sai stated in his learning series post, OpenBMC can appear complex
> to people learning or evaluating OpenBMC.
> 
> I propose office hours, staffed by experienced volunteers where
> newcomers can dial in and ask questions.  The reasoning is newcomers
> aren't always sure what questions to ask and/or are intimidated by
> IRC.  Office hours would be a more direct, 1:1 forum for newcomers to
> get answers.  And of course volunteers would encourage the use of the
> mailing list and IRC for follow up discussions.

Thank you Nancy, this is great!

Kurt Taylor (krtaylor)

> I would like this to be low overhead for volunteers and I'm hoping to
> have enough volunteers to do monthly office hours, in the volunteer's
> local timezone.  Please sign up here if you're willing to volunteer.
> Ideally we would have 6-12 volunteers so it would just be one hour
> once or twice a year for everyone.  Please sign up by 10/16 @
> https://docs.google.com/spreadsheets/d/1hOzYDq6kRl8RCj9Kk_kzpiUjt5bABxVRH87StK2oKnY/edit?usp=sharing
> if you're interested in volunteering!
> 
> I'd also like each office hour to have signups, to make efficient use
> of everyone's time.  If there are no signups within 24hrs, the office
> hour would be canceled.
> 
> Thanks,
> Nancy
> 

