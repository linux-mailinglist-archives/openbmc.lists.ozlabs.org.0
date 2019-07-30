Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F2A7BC7F
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:03:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z6sp4pYnzDqcJ
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 19:03:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BpaIp+Jt"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yQs969pTzDqSh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 16:00:39 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id p74so55817236wme.4
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ztu+pimjN743C29mSszt2yGsEtnV4+Z/3nUKYXGTtQ=;
 b=BpaIp+JtF+6eIAsvbjmiYoxlcsvAkOCrc9w/8PmLFI9t0AG1lJZi97ohUGWU83jbgk
 +d5eXUe/+hP3FPPXjdXA/0n8vaqKc219X36ep5VwU0mNkXwimm5sDVtkFf70E29JrxN2
 xShcoQ7ZlUXDJpd4Xe1y5g1Sv4czJ8ULB7BK5+lq3H4AIX+RqYuaWxBnvxmMkfpn645y
 xBQIfbEaJAM/+uSYUcMu+2ZucCsBplZXcu6SchLe6bu1xqFDgBoPzqf2243Y7tZ3X8AS
 9vCOaxtYIo/f+PABV2OO2NlqmBgv8uZWji/st8JlSWI/PZk4t34PDDkngiYcMX6w7v/a
 GPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ztu+pimjN743C29mSszt2yGsEtnV4+Z/3nUKYXGTtQ=;
 b=NjDWunVr9cIIokNt79k1pojhJsaDUakF9sitXPOMq6C3GdnXtasT2qDgTeAMsLQKdS
 RKp4OVEokQkichbTJgAD9eETTM6lMEREVLDOzuAG2gkdOSJC7qSunz9PfTesIGWivnhe
 RPagE1C9luDgriTozCy41BGDiGl5PqlYF4JgMqypRi/QOJ33/s935HmaX2WDIA6QoxBM
 OsZLzDj7Ro4kuBsm4+bWoT00rTazHi+hPhygaGGMLxxPwNAFTAHl2abpf2zZKNHWPlLc
 85CxgFx/4UCCIXXoMPr+zenhbzFXipN4DwEU3oHtk3FQaNoFXnGVjRgl+F/JA0Sw9HDd
 bkKw==
X-Gm-Message-State: APjAAAU9aDsviXvolr/pTGaxf5wjkIByXCkDKyEtLUWNuZs6Snp204P+
 M8tgZcdnKpzbis/X4AQrdbVGVySs
X-Google-Smtp-Source: APXvYqxjONCiW2vReiQWjQagiM+52KMDKfC+HZONk+g+xcwNev5z7RbBF96DpBc9Kfdp3o0g08LgXA==
X-Received: by 2002:a1c:35c2:: with SMTP id
 c185mr101364338wma.58.1564466435081; 
 Mon, 29 Jul 2019 23:00:35 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f43:4200:6c98:6a00:6f0a:eb31?
 (p200300EA8F4342006C986A006F0AEB31.dip0.t-ipconnect.de.
 [2003:ea:8f43:4200:6c98:6a00:6f0a:eb31])
 by smtp.googlemail.com with ESMTPSA id h16sm68205312wrv.88.2019.07.29.23.00.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 23:00:34 -0700 (PDT)
Subject: Re: [PATCH net-next 1/2] net: phy: broadcom: set features explicitly
 for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>
References: <20190730002532.85509-1-taoren@fb.com>
 <20190730033558.GB20628@lunn.ch>
 <aff2728d-5db1-50fd-767c-29b355890323@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <bdfe07d3-66b4-061a-a149-aa2aef94b9b7@gmail.com>
Date: Tue, 30 Jul 2019 08:00:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <aff2728d-5db1-50fd-767c-29b355890323@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 31 Jul 2019 19:03:00 +1000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 30.07.2019 07:05, Tao Ren wrote:
> On 7/29/19 8:35 PM, Andrew Lunn wrote:
>> On Mon, Jul 29, 2019 at 05:25:32PM -0700, Tao Ren wrote:
>>> BCM54616S feature "PHY_GBIT_FEATURES" was removed by commit dcdecdcfe1fc
>>> ("net: phy: switch drivers to use dynamic feature detection"). As dynamic
>>> feature detection doesn't work when BCM54616S is working in RGMII-Fiber
>>> mode (different sets of MII Control/Status registers being used), let's
>>> set "PHY_GBIT_FEATURES" for BCM54616S explicitly.
>>
>> Hi Tao
>>
>> What exactly does it get wrong?
>>
>>      Thanks
>> 	Andrew
> 
> Hi Andrew,
> 
> BCM54616S is set to RGMII-Fiber (1000Base-X) mode on my platform, and none of the features (1000BaseT/100BaseT/10BaseT) can be detected by genphy_read_abilities(), because the PHY only reports 1000BaseX_Full|Half ability in this mode.
> 
Are you going to use the PHY in copper or fibre mode?
In case you use fibre mode, why do you need the copper modes set as supported?
Or does the PHY just start in fibre mode and you want to switch it to copper mode?

> 
> Thanks,
> 
> Tao
> 
Heiner
