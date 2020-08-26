Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCB25338F
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 17:25:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc8mm3BP3zDqXT
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 01:24:56 +1000 (AEST)
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
 header.s=20161025 header.b=DydIlJp+; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc8X62qc0zDqM5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 01:13:57 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id b9so1826452oiy.3
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5jmAJtQrGPpL5BwX+OIwDkn9+Y577Y43xuXUxK6Uddo=;
 b=DydIlJp+fCAlp5gZE0BkxU8IR8fxhEo7jY4gSMwOdpP+EelBeVvNEigRTJHBFLJwNp
 FoUqlWn/PEgQPrSufEdKaDMg0d7dRxedSBatituCowuQ3t8N9CVvyk0bzMNqNEwrR4yp
 0Jy4zsNYOhPu02Q5mWMwSDWWjPaHc0TzRWmE53kPvyhlQ8luQpSDuuiNDYbuq/rQT+hp
 hMLaqmWnS08wp1SXxq6+m2PyfCMsi66vcCEKynIgO64+0P2Zi6kiQ/nZlLBSldq3PqrC
 fkK6Fr/EIjYweUloCPVkPLgH0SO1KkcDDwStDSnGMuBU3jB91WQ1c6FqgVsWav3oLWHT
 3FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5jmAJtQrGPpL5BwX+OIwDkn9+Y577Y43xuXUxK6Uddo=;
 b=fAa0ZvdMXeJqxXwEAWTWHnwU/xLjy1l7wbpJLouIdxHT08E59yA2RD7C7cvwGinuPr
 t8aU1naJsswxcw2HOlYxK9rR8hgJUKMPwZsh9iCYz4UpX3WM/zBDjenTahH28uqmJhwh
 qH7AkTT/9matCv/5kIAOeovxPfXsur7ufi8RiPCQeOO53t3AI97lys61FZyauC+3LUF7
 hYm9stpYs3MqSSZPiNZjvVFg/BXC4x21HgOrVzgcdVoDomEaXEuU9Xwe4V1CpuBB3Lkz
 zTsmf2Dlof26qvC1+IVQSyQsxfvvFmEzvNaBG0+0cu0inYy+2PDHmC32W97pYE7Mi7mi
 YG/A==
X-Gm-Message-State: AOAM533xbVLhLZ0Z5hrqw5+rCX6nHOdWhzUWrbGhvbCDMZnH5AA78m6Q
 0BoO6o2OSxi4kbKro7uso0GVx7ft9YBSGA==
X-Google-Smtp-Source: ABdhPJwbsVG9GxUIcwftNGOwaQlF9UBmdOXnKqj1BiEsOwIi7WQSQbQjgyObOlIw/X+LmMPHrtZvCA==
X-Received: by 2002:aca:acd5:: with SMTP id v204mr4132145oie.35.1598454829488; 
 Wed, 26 Aug 2020 08:13:49 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id w62sm554028otb.52.2020.08.26.08.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 08:13:48 -0700 (PDT)
Subject: Re: Inspur's CCLA Schedule A update 2020-08-26
To: George Liu <liuxiwei1013@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CANFuQ7DZf73XRfXDHxqERbsLaFN3tcRM5WCjvodAN-xn0y5QNQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <bf7c5cd8-080a-e29a-e21f-6de929cca2f7@gmail.com>
Date: Wed, 26 Aug 2020 10:13:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CANFuQ7DZf73XRfXDHxqERbsLaFN3tcRM5WCjvodAN-xn0y5QNQ@mail.gmail.com>
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

On 8/26/20 3:04 AM, George Liu wrote:
> Hi,
> 
> Please find the updated Schedule A of CCLA from Inspur.

Accepted. Thanks for keeping it up to date!

In the future, please have the CLA manager listed on your schedule A 
send the update, else have yourself added in that role.

Kurt Taylor (krtaylor)

> 
> Please help review.
> 
> Thanks
> 

