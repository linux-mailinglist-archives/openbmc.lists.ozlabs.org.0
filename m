Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE08D94ED
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 17:06:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tbGJ62lfzDqDX
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:06:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bh29DViq"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tbFC6yHkzDqXY
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 02:05:03 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id 89so20410400oth.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ssrBqUt6N+x/1FuHdnl5HbTtUi2FBgvi3CVqeVsvHQI=;
 b=bh29DViq4cEH4dWZyEAMstyTt71aPo1tYhkH0qb52MMiae2Foo3YaV+6nun8pyI8d3
 QfUvc73rUGh6URMtUMYN4la1C9MGflC5LVsZPR22VtA3J81a/yQfvAju5sE3QcwX+FLl
 EpsVr1NOvyCDG52ZLBsdFfWHhf19UNWqtyVGEYuxLCfQ3Pz3Io6cB8kS5zsu81yI/ok1
 MlH2FHPrO+RDAjEte/PkUYmQrt6LWK7fvbc4mhmgovM3K+psjgM0n1DBkC8oXlDb4/Al
 ooL+rNqHufoy7NowNFS56G3rTdZpLu7bKP4vthg11ysaYvUxK1nebFUPKWohxYFCNVv9
 OblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ssrBqUt6N+x/1FuHdnl5HbTtUi2FBgvi3CVqeVsvHQI=;
 b=Yfc2MY+SredkPMNPxa+2fzaLP7NDlKnqnPZZ2dDYb4j3Lomn+84x1ys2paNr3WhXXc
 jDrzDCAwXxggQsSPeCsmZ0aJix3disWOVtZz9XDv1pWHDHLjz3TRvQUxL2KtNe4asEEA
 LKZsJqbMxqyklkM5jV3Y5MkBvffkZTsDFniM0/8O5YAtjxh717BfqJMUVhbjg5DxZd1O
 JxhuHNMMv1g6ziiiI0Ajphy+uH904TnixTLpr2v5u8I9QBwx442mfh9leRh6ZLk7nTGv
 U8brq9TevDdl4xW3dlGmgZeG2mUIrqLK1MY9P8BHIBNlJsiti695vantfOpUXsEGJxWT
 gVIQ==
X-Gm-Message-State: APjAAAWxaoy98ibozQLOROFPmhCbWpd7knb8TtN+xuYHAtIWhUsHWhCk
 4UvzcUaa64Y9To87O3yHrHwk51XR
X-Google-Smtp-Source: APXvYqzqRHd0yG8xO/Gvm/Hw6yFUYIU3xFVkbs9iBA/rl/5mD2St2/nzQRt50N/+/Sygjf03dIESYA==
X-Received: by 2002:a9d:2a8:: with SMTP id 37mr32913470otl.163.1571238299509; 
 Wed, 16 Oct 2019 08:04:59 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id k19sm6865113oiw.31.2019.10.16.08.04.58
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 08:04:58 -0700 (PDT)
Subject: Re: Recommendations for development platforms for the ASPEED AST2500
 & AST2600?
To: openbmc@lists.ozlabs.org
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <020c6396-e311-8db1-f497-cfc209386010@gmail.com>
Date: Wed, 16 Oct 2019 10:04:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
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

On 10/15/19 1:44 PM, Bruce Mitchell wrote:
> Hello,
> 
> I am Bruce Mitchell and I work for Phoenix Technologies Ltd. as a BMC 
> firmware Engineer.
> 
> Phoenix Technologies Ltd. is developing an OpenBMC 
> (https://www.openbmc.org/ , not the Facebook flavor) product.
> 
> Our intent is also to be a valuable contributing member to the OpenBMC 
> project.

Welcome Bruce! Please make sure you get added to your company CCLA, and 
shoot me a new version so I can keep it current.

Thanks!

Kurt Taylor (krtaylor)

> We will be initially developing for the ASPEED Technology Inc. AST2500 
> followed by the AST2600 BMC SoC.
> 
> Do you have any suggestion of available hardware development platforms 
> for the ASPEED AST2500 & AST2600?
> 
> Thank you very much for your time and support.
> 
> --
> 
> Bruce Mitchell
> 
> BMC Engineer
> 
> 503-567-3032 direct
> 
> bruce_mitchell@phoenix.com
> 
> Phoenix Technologies Ltd.
> 
> 15266 NW Greenbrier Pkwy
> 
> Beaverton, OR 97006 USA
> 
> 503-567-3000 main
> 
> www.phoenix.com
> 

