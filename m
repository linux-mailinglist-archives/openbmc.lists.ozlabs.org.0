Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6994B96
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:28:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C19W1SRwzDqd3
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 03:28:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOOJsgA3"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C18v4qttzDqc8
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 03:27:59 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id k18so2406577otr.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WhprxQlawuSr34owsIlACUYtu0PPy+qEkthgvkP039I=;
 b=SOOJsgA3px0otquzqhBeAHxlKAW+anUoHcbzZMH8MtE/UV7rHC2pCtIidWLAZqKA5Q
 1b7k+85H6xWyjBaUXYKxgE+Qlf/2vH1rBMY4OseYND0dWZkVYh1QIQzM94sXswG4/nUz
 FIEjrQVjq1DmVRzSvvhGYNOLMpRzQJ+SC4WI+pZ9OT/AYYsjunRMd4RDZ2uG1vn818d6
 5IryuGauedDVaJ61cEZBsK256L62AdPCuS9kmyj0eRAnsmeTQucRvP/OL4qEQ3P9Fvn0
 m/rp1zDdNyQqZU6Axhv3I1Qs7pPahicjiibuSStr99YzVIAPd8v8qOydzFmspuTpF0J4
 TajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WhprxQlawuSr34owsIlACUYtu0PPy+qEkthgvkP039I=;
 b=J+UEhDwcJLTHehuPk0Qrpe+kWK9QdRpRMQ/qA83M/f4/yNzeKl5eU/N98xltuHVYJI
 1g7n1HTyLamY4Trh/c/LAZPesxihbXPiCHz+hXxu+yY9YR/rFsmNOpi/HaG4bb4h2kN3
 qzdZvwhpQ1JrsFgKw5i6pZD9Bg9LOUAMtEPPmfuXKIZY85FIyveHGBYyQDvzP+s1gnRv
 cBc4kK8xmYr5D0gD1rUbg7rkWJSANlXoxUtoltVACIUGI3HmMn47I+Y4Foaa3ZAAo6OC
 ziOrUpf8PasAcoCI2LxaQFbLsKfQAk42/zvUNk+8f7aXWtcD/HfUGXAhrO/wZFc4gwu3
 Q8ug==
X-Gm-Message-State: APjAAAW1B/1YTKFKoMwaoNON/LpC79ls0kFkOIzq68fbQVPxd0kN1SdL
 uOlI97VxGefg8BroXX0DW0xc8Uky
X-Google-Smtp-Source: APXvYqwl4d7hI4J2VeqY5Q/R4lS7c2TeoYaKvFRh+yfifI9PN+kU0S+sVr7ryMnLunyCriAlTeEJQA==
X-Received: by 2002:a05:6830:1199:: with SMTP id
 u25mr18301649otq.213.1566235676453; 
 Mon, 19 Aug 2019 10:27:56 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 23sm1302416oiz.8.2019.08.19.10.27.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 10:27:55 -0700 (PDT)
Subject: Re: OpenBMC version 2.7 run in target S2600WF shows BMC not
 ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
To: James Mihm <james.mihm@gmail.com>
References: <e336595b3dbf4162a4bfb8a8880077d2@nokia-sbell.com>
 <38c0bc79-4ffe-c9c5-423c-b6a98f0dcd58@elsoft.ch>
 <03edb9afa89345ec90f2b711ef0c3d73@nokia-sbell.com>
 <CADy_Pt0Jv+uAZNnxZBy72+U5Szs0D8SojXUuiu3H73VF3mvr8A@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <2a2b17a8-7a6a-8e58-5276-88c782cc2d4b@gmail.com>
Date: Mon, 19 Aug 2019 12:27:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CADy_Pt0Jv+uAZNnxZBy72+U5Szs0D8SojXUuiu3H73VF3mvr8A@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/16/19 11:45 PM, James Mihm wrote:
> Check out the Intel development repo at https://github.com/intel-bmc. 
> You should be able to find what you need there.
> This is the Intel repository that we're working on getting upstreamed 
> which takes a little longer.

Prioritizing upstream collaboratively developed code will fix the 
problem, and result in higher quality to boot. The slight increase in 
design/review time (in a healthy community) pays for itself in not 
having to maintain two versions of the source.

Kurt Taylor (krtaylor)

> James.
> 
> On Fri, Aug 16, 2019 at 1:24 AM Jiang, Hongjiang (NSB - CN/Hangzhou) 
> <hongjiang.jiang@nokia-sbell.com 
> <mailto:hongjiang.jiang@nokia-sbell.com>> wrote:
> 
>     Hi,
> 
>     Thanks for your info. I will check this package and see if I can do
>     some hacking😊
> 
> 
>     Best Regards,
>     Jiang Hongjiang
> 
>     Nokia
> 
> 
>     Jiang Hongjiang
> 
> 
> 
>     +86 13666669403
> 
> 
> 
> 
>     -----Original Message-----
>     From: David Müller (ELSOFT AG) <d.mueller@elsoft.ch
>     <mailto:d.mueller@elsoft.ch>>
>     Sent: Friday, August 16, 2019 3:05 PM
>     To: Jiang, Hongjiang (NSB - CN/Hangzhou)
>     <hongjiang.jiang@nokia-sbell.com
>     <mailto:hongjiang.jiang@nokia-sbell.com>>
>     Cc: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>     Subject: Re: OpenBMC version 2.7 run in target S2600WF shows BMC not
>     ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
> 
>     Hello
> 
>     Jiang, Hongjiang (NSB - CN/Hangzhou) wrote:
> 
>      > Currently I compiled OpenBMC tag 2.7-0 with machine target
>     S2600WF( as
>      > I have only wolfpass server in hand), and flash it to a real
>     S2600WF server.
> 
>     As far as I can see support for the Intel s2600wf board is currently
>     broken as it uses the (no longer working) x86-power-control package.
> 
>     Please see https://github.com/openbmc/x86-power-control/issues/1 for
>     more details.
> 
>     Dave
> 

