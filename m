Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738A174E3C
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 17:11:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VpDk2DLXzDr6W
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 03:11:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s/LjHIap; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VpCt2mqHzDr0k
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 03:10:49 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id y8so3178120pll.13
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 08:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bMLGGlLxbtGLfHweAPeUm/il22po9rJeFTwsg4VAzRg=;
 b=s/LjHIapw57aPnFnAe+O8GoGOw3PvJqyTnCUAWDr6n4eiB8u5/tO1zMOHiGVyXjRZi
 SpKaftcG8IjIFLs7Q3wOuQhPWHKsfbZRkmBkGhcd/U9C/QLABXJrUpUMstctOwqUqdvH
 DB4UN1FLU2iTpKnKlqDvaHZ48r1Kyo/P3jvHz/gPkCaK/a1U288h6X0qdKw/XrBgDOk4
 KUDtuBdpSr24ZuDdSWcN3ur1OxCs7PD6X2MLcpe21MCLCNv606osi6O698uqOmTX8p2b
 ZG18TypSvljNczSofsmyDaVy1EYI4Lv7HetoUvzVEwzb9K6vK5CNZBUf+g0SiXgWsqBx
 Y+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bMLGGlLxbtGLfHweAPeUm/il22po9rJeFTwsg4VAzRg=;
 b=HkIezaIAFM2M7q+vCRuc3IpXDjqIovW3gAvkOvd0NSb/tl4oRfRfkj4n75bndwz/cf
 75wDFwCZmAkwVqrByEIaiEDycEyiMX2E0YYh819l6OXpw+wxj4FDosIWriUk4HGIlPBY
 zNegxIyK2wvT2uh+IkWqIX0JqJsug7qD5vsp72Id6Re9WqbzqSwhA4LjiiKM30uIEHyE
 JHzU0SMNyhs+arTWg9NGBSsMM8gnOa4egiDIbAHpR0lm/SuKhpd3V3KqUmmlk1NfpOc/
 pQ/xekaGsGiA2uM1P+ICjwL5q1wIP+iz7tVZkd3R4KEX8mTfNDwtybaRPtPp8wWXTLKV
 bVcw==
X-Gm-Message-State: APjAAAUbw/rA3CR7X1Q+2dqio7FxDOW0ZJ1fYVeV5F/in3dl13yLDMEd
 uSG6DI+L8qgYk8sciA48rMDbny0a
X-Google-Smtp-Source: APXvYqwAxMFAZB8IXTlP8S5DN+I7djzpBt11DytFo2LxcqFCce6k2vQrPeE8OJ3zN8RsB0osoeqmIQ==
X-Received: by 2002:a17:90a:cb11:: with SMTP id
 z17mr16234153pjt.122.1583079047338; 
 Sun, 01 Mar 2020 08:10:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h132sm13752512pfe.118.2020.03.01.08.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 08:10:46 -0800 (PST)
Subject: Re: [PATCH v1 4/4] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-5-tmaimon77@gmail.com>
 <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
 <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <998cedf4-82cb-be1b-699f-608ea7a21064@roeck-us.net>
Date: Sun, 1 Mar 2020 08:10:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/20 8:08 AM, Tomer Maimon wrote:
> Sorry Guenter probebly I didnt explain it well.
> 
> 
> On Sun, 1 Mar 2020 at 12:48, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 3/1/20 1:40 AM, Tomer Maimon wrote:
>     > During probe NPCM watchdog sets the following bootstatus flags:
>     >       - WDIOF_CARDRESET represent power and core reset.
>     >       - WDIOF_EXTERN1 represent watchdog 0-2 reset.
>     >       - WDIOF_EXTERN2 represent software 1-4 reset.
>     >
>     > Each flag is representing a group of bootstatus.
>     > The user can configure through the device treethe exact reset
>     > to each flag group.
>     >
> 
>     Sorry, this doesn't make sense to me. I could understand reporting
>     the above, but it looks to me like devicetree is used to associate
>     a reset bit from the controller with one of the above.
>     Devicetree only seems to be used to associate reset status bits
>     from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or
>     WDIOF_EXTERN2. That adds a lot of complexity for little if any
>     gain. 
> 
>      
> 
>     It would make sense to set the bootstatus bits as suggested above,
>     but that doesn't require devicetree properties.
> 
>     More comments inline.
> 
>     Guenter 
> 
>  
> 
> In the NPCM750 we have the following reset types:
> 
>  1. board reset (Power on reset, Core reset)
>  2. WD reset (0-2 WD reset).
>  3. SW reset (1-4 SW reset).
> 
> 
> Each board can use different reset types, because in the WD status bit there is not enough bits to represent the entire NPCM750 resets.
> 
> The NPCM750 reset groups are represent as follow:
> 
>  - WDIOF_CARDRESET represent power and core reset.
>  - WDIOF_EXTERN1 represent watchdog 0-2 reset.
>  - WDIOF_EXTERN2 represent software 1-4 reset.
> 
Exactly, and I don't see a need to be more specific than that.
This can be implemented without all the DT complexity.

Guenter
