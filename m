Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C022B582
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 20:16:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCLBv4nvDzDrT5
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:16:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G1Q/Q9Uo; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCLB73SLPzDrQp
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 04:16:14 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id r8so5832578oij.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZZawBS9pGgJwL9rscGMJx9gF/BbSlyr+F08Jj9EmoU4=;
 b=G1Q/Q9UoVpUi7Q1Rf3l/v+V7I5dmmy3vDJPNhlXR249lk21/4tMC1RB9h/plOiNPlf
 N4L5yW69WOqZi4gZ1kFWHI+mPPBbYzqNg0lqg4/exySDK1Dx9smKpvLWFXkerrG0tPQH
 KFQrfoz7hdkLifQLJ4WVLF8+q+rFT5g1GB8IeWCH97QgD4dKcjykskn1gwt/mq2jHjDR
 E+hpoXlEaYc65TMAIpUbzk9Pt4ZeTC7LDZ8N8DUCqPMvyGKYVPPP3nY9pGnjaZ3IIySr
 u8U/wigRaii7ha83TnzY1YadfyWc6Qyy3DewhFNu9eSRwyoDEb8X3aqMqVXCJtRSsgzx
 GYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZawBS9pGgJwL9rscGMJx9gF/BbSlyr+F08Jj9EmoU4=;
 b=VDNoeEuFmsMJ0V3p4/qnYyJk4E0ALK8U4wXxhuUuM7qYm57do/jJPBXppvYAqEFdI6
 JhI7XNnkK4Y8kqG/ifZXRrxn1h4FOh9r5aLiQmQQdu6dHH5/YFTy6PTHkzh8BHxnbuug
 bE00RDVu5bprkxHslCzC8aFHDoBzE53Ocr+SYmUJVuNBmC/SLu7ksDdLJQWFEU/XeDOI
 bh93NOV81N7PcaVn3y5KoTmNXBOtCI7I+ZHfgYJ25J+ae4almsozd1jzlPeIkgK/d7V5
 lz904TqFq8PsPNp4b6A4Gmctq50cW13gJ/d9bxpLZQO2skuumhOWLBEF1w3qMgSPavs/
 uOig==
X-Gm-Message-State: AOAM532qKlxoeXWufMr0c9yGXZ3KhT8yDcTAIiJzGY/BDL6lWLp5x0MU
 KgFgNmMVvHKr1g3P77gnLh9aVz+rw2g=
X-Google-Smtp-Source: ABdhPJwsVQe1FW4tPAEssZkXG8WmR6m/SbkBjeMyUnX/FeXm8G22LZAd78gJkCCstLuZpImSE4nhvQ==
X-Received: by 2002:aca:af83:: with SMTP id y125mr5059076oie.162.1595528169285; 
 Thu, 23 Jul 2020 11:16:09 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id q12sm778992otm.5.2020.07.23.11.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 11:16:08 -0700 (PDT)
Subject: Re: CLA - Adam Stankiewicz
To: Adam Stankiewicz <sheerun@sher.pl>, openbmc@lists.ozlabs.org
References: <CANCidP-7NpXvcSC4kEfm5-e=eJ_7RDM_o-omGuwTdnGvkfsJKQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <9f4aa06e-5b33-6c41-6e7e-9e01b3e30bf9@gmail.com>
Date: Thu, 23 Jul 2020 13:16:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANCidP-7NpXvcSC4kEfm5-e=eJ_7RDM_o-omGuwTdnGvkfsJKQ@mail.gmail.com>
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

On 7/22/20 12:37 PM, Adam Stankiewicz wrote:
> I'm attaching CLA because I want to contribute to OpenBMC

Welcome Adam! Your ICLA has been accepted.

Kurt Taylor (krtaylor)

> Regards,
> Adam Stankiewicz

