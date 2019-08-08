Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9C86CF5
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:12:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464Mzv51QZzDqpB
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 08:12:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrHFzmpF"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464MzF461gzDqSC
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 08:11:35 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id n9so96496415wru.0
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DUFalbPLgQ79S1HKBE8+gtAVHYDFf8kRrltg8JK5gHo=;
 b=GrHFzmpFxtOscokodsO7daDjk84Q/OJ2IZS7SomAGPleaL8JE2NSe9/H13UOWgK5Lx
 Q3trityf98SqSsd2oAE7h0zZmHWKqKLpu6/gg+x0Q7lSDSgNuTbr16deZebwQpkyItcB
 FyEOSWmY6Gl7GPnZQV5Zof3vW4wAVNvZH4+D1x3X1qYdtSv6VQAj9MCnThq4YN3XyCv5
 3PmyiFqrmy/OIS+1CbT5FUz5DzmbPjaBwzbSpqXKMJSl/1Ic3nlVE+ac42rmp5MPP8YD
 bc/1lec7KWPSFPnW54hVXpjcXe47eSsaEMZtqnGFlV+m7JVBaeRP3q4Sa0K5oTmctaq9
 DBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUFalbPLgQ79S1HKBE8+gtAVHYDFf8kRrltg8JK5gHo=;
 b=sXS/CXtKJYNanbVF8QsXVw90QsooK8uYY4Lp0Y10VbpScRYO9D6RxhKbudCW1hzsV1
 boJWZllZt6xmm062cczugDWPXJFCklp1rmR32lGuw/uE1iAwYj7FHP+wzX5j7xd5C+c6
 kcV3uftqil8Jy9s7F3Y1A1zvAYeJpbjGxLrwNDv5ifdmpLeUABOwFtL95mifyXvJ/QZ0
 r8ivFhwevKvm+tOM9kjgGKMcm+LC4PRzZurh+eSO2yI1zEzB94cTJvVgVUTu3kQ5bZfb
 +wsuxmFUByFgIs61yl6AhpnC2RKqhB5B2gHGgZm3pgpMxtrHjdglbA/hbCQWmoWRAp3x
 LyRQ==
X-Gm-Message-State: APjAAAVIiYWVyL/hD4EVIM+VQ6EMk5pbjACIa/tujqmsichrOW01kRcr
 fKn+4IQAUwKcyviVZDXo4j6kKaOM
X-Google-Smtp-Source: APXvYqwfedFez8JUUPUSTs97nv45Gikq8yuXYU80pv8ot4OF9lSma2MRIiDYVMaRG3RNKnIa9KedPg==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr19264141wrw.96.1565302286135; 
 Thu, 08 Aug 2019 15:11:26 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:6862:4959:200d:42a?
 (p200300EA8F2F320068624959200D042A.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:6862:4959:200d:42a])
 by smtp.googlemail.com with ESMTPSA id y18sm3425947wmi.23.2019.08.08.15.11.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 15:11:25 -0700 (PDT)
Subject: Re: [PATCH net-next v4 2/2] net: phy: broadcom: add 1000Base-X
 support for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20190806210931.3723590-1-taoren@fb.com>
 <fe0d39ea-91f3-0cac-f13b-3d46ea1748a3@fb.com>
 <cfd6e14e-a447-aedb-5bd6-bf65b4b6f98a@gmail.com>
 <a827c44c-3946-8f6f-e515-b476fd375cf6@fb.com>
 <14c1591b-26e1-3a2f-f6c4-beb2c8978e41@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <6d080f3e-48b9-a65d-b73e-576296e98738@gmail.com>
Date: Fri, 9 Aug 2019 00:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <14c1591b-26e1-3a2f-f6c4-beb2c8978e41@fb.com>
Content-Type: text/plain; charset=utf-8
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

On 08.08.2019 23:47, Tao Ren wrote:
> Hi Heiner,
> 
> On 8/7/19 9:24 PM, Tao Ren wrote:
>> Hi Heiner,
>>
>> On 8/7/19 12:18 PM, Heiner Kallweit wrote:
>>> On 06.08.2019 23:42, Tao Ren wrote:
>>>> Hi Andrew / Heiner / Vladimir,
>>>>
>>>> On 8/6/19 2:09 PM, Tao Ren wrote:
>>>>> The BCM54616S PHY cannot work properly in RGMII->1000Base-KX mode (for
>>>>> example, on Facebook CMM BMC platform), mainly because genphy functions
>>>>> are designed for copper links, and 1000Base-X (clause 37) auto negotiation
>>>>> needs to be handled differently.
>>>>>
>>>>> This patch enables 1000Base-X support for BCM54616S by customizing 3
>>>>> driver callbacks:
>>>>>
>>>>>   - probe: probe callback detects PHY's operation mode based on
>>>>>     INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
>>>>>     Control register.
>>>>>
>>>>>   - config_aneg: bcm54616s_config_aneg_1000bx function is added for auto
>>>>>     negotiation in 1000Base-X mode.
>>>>>
>>>>>   - read_status: BCM54616S and BCM5482 PHY share the same read_status
>>>>>     callback which manually set link speed and duplex mode in 1000Base-X
>>>>>     mode.
>>>>>
>>>>> Signed-off-by: Tao Ren <taoren@fb.com>
>>>>
>>>> I customized config_aneg function for BCM54616S 1000Base-X mode and link-down issue is also fixed: the patch is tested on Facebook CMM and Minipack BMC and everything looks normal. Please kindly review when you have bandwidth and let me know if you have further suggestions.
>>>>
>>>> BTW, I would be happy to help if we decide to add a set of genphy functions for clause 37, although that may mean I need more help/guidance from you :-)
>>>
>>> You want to have standard clause 37 aneg and this should be generic in phylib.
>>> I hacked together a first version that is compile-tested only:
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.ozlabs.org_patch_1143631_&d=DwICaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=iYElT7HC77pRZ3byVvW8ng&m=ZJArOJvHqNkqvs1x8l9HjfxjCN8e5xJpPz2YViBuKRA&s=EskpfBQtu9IBVeb96dv-sz76xIz4tJK5-lD4-qdIyWI&e= 
>>> It supports fixed mode too.
>>>
>>> It doesn't support half duplex mode because phylib doesn't know 1000BaseX HD yet.
>>> Not sure whether half duplex mode is used at all in reality.
>>>
>>> You could test the new core functions in your own config_aneg and read_status
>>> callback implementations.
>>
>> Thank you very much for the help! I'm planning to add these functions but I haven't started yet because I'm still going through clause 37 :-)
>>
>> Let me apply your patch and run some test on my platform. Will share you results tomorrow.
> 
> The patch "net: phy: add support for clause 37 auto-negotiation" works on my CMM platform, with just 1 minor change in phy.h (I guess it's typo?). Thanks again for the help!
> 
> -int genphy_c37_aneg_done(struct phy_device *phydev);
> +int genphy_c37_config_aneg(struct phy_device *phydev);
> 
Indeed, this was a typo. Thanks.

> BTW, shall I send out my patch v5 now (based on your patch)? Or I should wait till your patch is included in net-next and then send out my patch?
> 
Adding new functions to the core is typically only acceptable if in the
same patch series a user of the new functions is added. Therefore it's
best if you include my patch in your series (just remove the RFC tag and
set the From: properly).

> 
> Cheers,
> 
> Tao
> 
Heiner
