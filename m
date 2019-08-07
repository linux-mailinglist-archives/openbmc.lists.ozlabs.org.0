Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E31658537D
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 21:19:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463hC02JGvzDqNK
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 05:19:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PtVNRjJ4"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463hBF0Y9qzDqvY
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 05:18:42 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id g67so3869wme.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dq3DdDTvPFuZUDp0cjn4nr/nlDjCZ+WE+PuSO4ucy3M=;
 b=PtVNRjJ46TYNpqSF+eVH0bsJRIiG+x3mHhTN66EWRy5IKlUEZlK124J12FKEcBes71
 GBOfHNBoJFxWCwDaet7h3tckXA1VVY7ImUdlavzGZxizbMSKaqdWAyVRAt6Vwc/0sIcm
 i7dWHmQpv3liF69Mscq2lrVWMmxUQxmu3mIPdqa213iQX4MVvlsjGiuut7x1z4FBoO+f
 V9eQ88ddyoCXRSw2oI0CtH5r22w1M0eNBxzR2cG4lZ7UkyY30a5g5dw4jsEXANniiSp0
 yWPfjKpuvMVVNv/H7+Q7mhECIBIwvV3EgdR4Z1YUbTN8yVQDHxq8iVWHHACpeBPF/9rI
 kGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dq3DdDTvPFuZUDp0cjn4nr/nlDjCZ+WE+PuSO4ucy3M=;
 b=lixkaoc/ZdnvjL6rJeM1DSqpeht9wTxPEsaj3VqLsnzULWcWql/cAP9Gj46pmK+0Rd
 qahYnytyVIA2LpRn5cKFL9RnMsCyMvo+VuADBISdYd4DTz1DbD5UY5sKqf5glM/BD68i
 cJ0/ebufcFQX1cy3LfjGRdtlfs9Tl7q3Oe0NvC7iZvf/BfveJNbEZotsKooaeH+ZQYDR
 8dgozoNx/s0kYZX6TfEkktBHwXGM9f5jvhtZzkitrG6ViyU/GiFX8iQ2qdMVJLtbIc6k
 97jUZ1CJBVovl2nyHmKq5DshcibTVXE0UACyRdpZJvbatUF+80+3vMb5zfE5EQRJkYrj
 JUMg==
X-Gm-Message-State: APjAAAVQJnUyyfCiBNqEzSSbdC6Qn6pZQJQeOYH2ocNEK5O4rFN4mKg4
 Wmi0BExucYwc5OVCkSCNZ9E0nklt
X-Google-Smtp-Source: APXvYqxT79/zZlyJ7m/7OQRHIi2Ga4eTnMIdlRq2ogHvMMmVvyxmm6qJqNgK/lITl1w0bLa5rBTqSg==
X-Received: by 2002:a05:600c:1007:: with SMTP id
 c7mr1187277wmc.161.1565205516123; 
 Wed, 07 Aug 2019 12:18:36 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:c422:a07f:e697:f900?
 (p200300EA8F2F3200C422A07FE697F900.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:c422:a07f:e697:f900])
 by smtp.googlemail.com with ESMTPSA id w24sm548141wmc.30.2019.08.07.12.18.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 12:18:35 -0700 (PDT)
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <cfd6e14e-a447-aedb-5bd6-bf65b4b6f98a@gmail.com>
Date: Wed, 7 Aug 2019 21:18:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe0d39ea-91f3-0cac-f13b-3d46ea1748a3@fb.com>
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

On 06.08.2019 23:42, Tao Ren wrote:
> Hi Andrew / Heiner / Vladimir,
> 
> On 8/6/19 2:09 PM, Tao Ren wrote:
>> The BCM54616S PHY cannot work properly in RGMII->1000Base-KX mode (for
>> example, on Facebook CMM BMC platform), mainly because genphy functions
>> are designed for copper links, and 1000Base-X (clause 37) auto negotiation
>> needs to be handled differently.
>>
>> This patch enables 1000Base-X support for BCM54616S by customizing 3
>> driver callbacks:
>>
>>   - probe: probe callback detects PHY's operation mode based on
>>     INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
>>     Control register.
>>
>>   - config_aneg: bcm54616s_config_aneg_1000bx function is added for auto
>>     negotiation in 1000Base-X mode.
>>
>>   - read_status: BCM54616S and BCM5482 PHY share the same read_status
>>     callback which manually set link speed and duplex mode in 1000Base-X
>>     mode.
>>
>> Signed-off-by: Tao Ren <taoren@fb.com>
> 
> I customized config_aneg function for BCM54616S 1000Base-X mode and link-down issue is also fixed: the patch is tested on Facebook CMM and Minipack BMC and everything looks normal. Please kindly review when you have bandwidth and let me know if you have further suggestions.
> 
> BTW, I would be happy to help if we decide to add a set of genphy functions for clause 37, although that may mean I need more help/guidance from you :-)

You want to have standard clause 37 aneg and this should be generic in phylib.
I hacked together a first version that is compile-tested only:
https://patchwork.ozlabs.org/patch/1143631/
It supports fixed mode too.

It doesn't support half duplex mode because phylib doesn't know 1000BaseX HD yet.
Not sure whether half duplex mode is used at all in reality.

You could test the new core functions in your own config_aneg and read_status
callback implementations.

> 
> 
> Cheers,
> 
> Tao
> 
Heiner
