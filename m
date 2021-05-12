Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A949037C406
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 17:30:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgJdM5C3Hz302m
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 01:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eN44fyxv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eN44fyxv; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgJd44Sxtz2y07
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 01:29:58 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so16911387oto.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/8wSCTYm0nyCVlcpdz2DiQOiilAb+bQ9bxiSwdnTrJI=;
 b=eN44fyxvv2+nBwRChttsJlFCDznlBtSGVRatDPd9Cypb6LT0rq8K5nmCoMz4f7iZwU
 lTntRm9vhlUBrAarhdofYGE5sKtt90rWZp8Hq3Dum63wa9t3n+24tFnc6OhbF3CmRv7G
 x1PJyE/zpa3YxzKVYcWknPe5zRmsBGzkRqzQira9GEBBHZIm/WFEJdkxkBIOhXVdGN3T
 lGozpl7E8fuux/jGcFfaDLvBcF6sHbxZMdRqw82OzRedktJk/Xc6jgTS/FnZwPYnQs3N
 J/shOciUvL5wbC2qw9hI8xEp6J7CA3R0yTy3CC2nzqzBHVKApRqhS+gMRuvlrR7KELsr
 THOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8wSCTYm0nyCVlcpdz2DiQOiilAb+bQ9bxiSwdnTrJI=;
 b=WbpKINm8cy1lwpj2dJ8tR19LLd3LSEKfa3pDpHjUIFJO0lSQ2t88vGO5vggIOKpXDj
 kfQ8ECdGbizcSqic0o842zooc6NaBPfw62t5T2FPKuOBK8mAom7yTd9SL9Lw1dt/6iYh
 beAlNimxBRxejEIrDryBJ/yC3wsIjwDwNbZbD9x1jHdnVzkwCZoG3dtF8ypleip6f5OJ
 rNH8TPEGPMfC98vyT+F4XfZ1aMctcVMvr15ehYw+UUBIypdWC1ly/r3LkhzkYNT/B4OI
 AOsSK6sh1t7jKmdCdIElWd++mp34o58YRlKluItDyQ1VZ74tdnVgNbMwlln5bj23xAyI
 HFnA==
X-Gm-Message-State: AOAM533ApwccRvESLT3+ZVhSyK8SvPdEyiiGdh6YdVCUINvGUATDweXV
 Y/UiO442tptQytQg+Soug8o=
X-Google-Smtp-Source: ABdhPJxiPxZjW7kUy1VeD5MytWZth98qmJKtM+oy4DJ58buGsLCuq1192hHoCff7VdKpL3bHiNrO8Q==
X-Received: by 2002:a05:6830:2117:: with SMTP id
 i23mr30246914otc.331.1620833396786; 
 Wed, 12 May 2021 08:29:56 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id 65sm17676otj.17.2021.05.12.08.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:29:56 -0700 (PDT)
Subject: Re: Inspur's CCLA Schedule A update 2021-05-12
To: George Liu <liuxiwei1013@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CANFuQ7CFv-ZZtzy7jvwra+xewzkzr1mjbFmDpA1yutDSuWM4ig@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <cf32498b-06bc-bed7-345d-9b68d7601f43@gmail.com>
Date: Wed, 12 May 2021 10:27:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CANFuQ7CFv-ZZtzy7jvwra+xewzkzr1mjbFmDpA1yutDSuWM4ig@mail.gmail.com>
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
Cc: banht@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/12/21 5:11 AM, George Liu wrote:
> Hey Kurt:
> 
>           Attached is the updated Schedule A of CCLA from Inspur.

Looks fine. Thanks for keeping it up to date.

Kurt Taylor (krtaylor)

>           Please help review.
> 
>          Thanks a lot
> 
> George Liu
> 

