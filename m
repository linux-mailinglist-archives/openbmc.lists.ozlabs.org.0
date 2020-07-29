Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1123201D
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 16:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGwWD2F7MzDqsH
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 00:13:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dH90q5eD; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGwTz2rDDzDqkD
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 00:12:21 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id o36so4532987ooi.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZXrk1gLqLHywH2Dr28pfjvYQ6hhw1o//abvEiQDimws=;
 b=dH90q5eDVD0Xb7PM0qiv1zpD09Y/o08J8Ex4VTlC7AO9lH9GVwGWkFuLmAAApZyC2p
 BvZImI/2uAwizzleWytRXPLe/HjvcVuCo3sovQr7wwHwPVFdH/UOy6CgoHgIXbKSD9Lc
 q6oa7pfW3G2aG+iKrsGUzZLnO75GuC7OUaQGPICp7pek6TICawbf2NR4YZExG7GmMqFQ
 VAyVZ7gU9cjqmiulDVHVfwfCa8qephQFB3GBiJqc+675dHpy5ktbZoNnKW/jsU8XVEpL
 U4jlqGaPydD+ZjEePWH/2AIEQC2QTCxJ8V9UKKy/lyvUAQo8StTVWve9dgqZMYuxOcM8
 pRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXrk1gLqLHywH2Dr28pfjvYQ6hhw1o//abvEiQDimws=;
 b=FQL4Fo4RyVwbr2VkcyU6HfQ6OJ3Ko2kPK0RZVeNwBv39FgbbycdEnkIuFEc+uW/p+v
 F/jPvvg0a8Epi8cVHSA5HfKwOxT6jTqeJj/ocP8FBZdruztrCs/2xtVcEYAU7Q1aay91
 mrU4FeNv6i9uQeG78uQYfP1yC0B6QGcTOh86BGVwc02aRXC7lecVp1jay3wHtPb/AmUq
 w6wc3ThWs5cbdhG1DP6KF9Ws5NVOdUee0dA8OwdDkph4EVTLSTNe9zWQZYv1t/Tj8WMn
 XvJcUHkAFgR6ieT4ugGw2MPkL5wyLlCYfdHLUbk7O97MMHmo1z+3n/ui83xby4mss0Ui
 2Org==
X-Gm-Message-State: AOAM530me66gKp54tQ+e9vX7mSDL0+xUO7lDxYyV4dsQDnC4F1kgciBO
 Oyqv+V96mZuBGsqk//WxQsNEbvx+k1U=
X-Google-Smtp-Source: ABdhPJz/LrzgkoKATL9x0FcjoaI4mFNCgF3xTIsI5sRSSayJLfd07AsuBf/CXKoVVzB8yYdsDbr+2g==
X-Received: by 2002:a4a:8c4e:: with SMTP id v14mr29361753ooj.83.1596031938436; 
 Wed, 29 Jul 2020 07:12:18 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n81sm357944oia.56.2020.07.29.07.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 07:12:17 -0700 (PDT)
Subject: Re: Quanta's CCLA Schedule A update 2020-07-29
To: =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <104f5e5f94674df88b28fc7c062c2f12@quantatw.com>
 <87022ee8b51341d4b52b132417f87c26@quantatw.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b51076b6-377c-0ca5-de3c-fecf9c7650ac@gmail.com>
Date: Wed, 29 Jul 2020 09:12:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87022ee8b51341d4b52b132417f87c26@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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

On 7/28/20 8:20 PM, Buddy Huang (¶À¤ÑÂE) wrote:
> Hi team,
> 
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping the CCLA current. Your changes were accepted.

Kurt Taylor (krtaylor)

> 
> Sincerely,
> 
> Buddy
> 

