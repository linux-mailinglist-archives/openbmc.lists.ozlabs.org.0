Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59A8856A
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 00:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464zgR4B7yzDqyH
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 08:00:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QHaYgj5d"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464zfr3yv0zDq61
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 07:59:31 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id r1so399472wrl.7
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C8rcwrHAcumdiWA8PpigkBNKuYiY/rhXO+GoUfqjFqk=;
 b=QHaYgj5dLh067tINoIWjCFy70yFeFkAOVdO8NzPZci6BLZkrsLi6R1C74Q70+sBgwW
 CUFLb1DA7kqlog/YFQ9p0u5Egb4wZ+qVKFPq4Zx7GsiV1gM7LwxNSpS9R08YC34XyAN8
 XeXnkS6c6JiH8DMZDjMu25h32fjvdBQqqWdx8AV4u1JI9scMd5+vqiDgSFwj54LjBEE2
 y4/pNLSORG/s8CAkcYj4VeE2c4b1LwjuE9h+UJHEgiXzp4QpvM+sbHeXb0opF1r1j8hM
 qNZMztQryu7uMBUmxXTZTrAxyK9uqIikCA0mSFzUGIQNLlTZSFuQG3Bg3CSXdSAe6vN+
 GlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C8rcwrHAcumdiWA8PpigkBNKuYiY/rhXO+GoUfqjFqk=;
 b=AZmfYiDHapFdgo8GCcdhpbNAIXZrs76gPtJAbQJPlHpD3al5ckCmh/unoyOk3efdMw
 3xo0dU4WknbFdMiSoEjVA+mtyEeoVZ+SJboTFHQvt3xwXy5QnmW4npr/yWMT3L0WZd7x
 w+hWGpUyKD95PmmKlbJ3IM8sSDHoiDUh1bzuxfglQlmNKMd1Yg9hVn55y9TXFyOoofLF
 vD9ZmzNeKJ1MIT/rMpW7RA2Rf1p+5ZyhVZ2FWhy4R3t0HhY2vWi8uj9xGepF3Tfug/AF
 4FcsqHpcfPatj5kyFx8tqlaZ40LfLNd6Mhtm6giWeL1z4MIxEHabbC+oNqUCzJpD7hLv
 0IRQ==
X-Gm-Message-State: APjAAAXhVM3LWiTsTFUuabcPCD4XfE1NjBuz5JTqBBcl46T8BMuL6/z+
 I+CuMhjiN9mWrwmuy5TcEQ7U7iSe
X-Google-Smtp-Source: APXvYqy/PTSD4jDsZxzUrYQcl6ky488C/MqyCG0t73bf69LOBHIbiv7HAGZoeCMkdYPSSsi7RcYAUA==
X-Received: by 2002:adf:ce04:: with SMTP id p4mr21581788wrn.227.1565387967114; 
 Fri, 09 Aug 2019 14:59:27 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:e9e3:33ea:6814:ab7?
 (p200300EA8F2F3200E9E333EA68140AB7.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:e9e3:33ea:6814:ab7])
 by smtp.googlemail.com with ESMTPSA id r16sm10068368wrc.81.2019.08.09.14.59.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 14:59:26 -0700 (PDT)
Subject: Re: [Potential Spoof] Re: [PATCH net-next v6 3/3] net: phy: broadcom:
 add 1000Base-X support for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20190809054411.1015962-1-taoren@fb.com>
 <97cd059c-d98e-1392-c814-f3bd628e6366@gmail.com>
 <e556dd17-ef85-3c61-bc08-17db02d9a5dc@fb.com>
 <8f0e172b-575c-dab8-b695-c33dfc78fa8f@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d398ca57-575c-6e88-49a5-bf49cddfa2f0@gmail.com>
Date: Fri, 9 Aug 2019 23:59:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f0e172b-575c-dab8-b695-c33dfc78fa8f@fb.com>
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

On 09.08.2019 23:13, Tao Ren wrote:
> On 8/9/19 1:54 PM, Tao Ren wrote:
>> Hi Heiner,
>>
>> On 8/9/19 1:21 PM, Heiner Kallweit wrote:
>>> On 09.08.2019 07:44, Tao Ren wrote:
>>>> The BCM54616S PHY cannot work properly in RGMII->1000Base-KX mode (for
>>>> example, on Facebook CMM BMC platform), mainly because genphy functions
>>>> are designed for copper links, and 1000Base-X (clause 37) auto negotiation
>>>> needs to be handled differently.
>>>>
>>>> This patch enables 1000Base-X support for BCM54616S by customizing 3
>>>> driver callbacks:
>>>>
>>>>   - probe: probe callback detects PHY's operation mode based on
>>>>     INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
>>>>     Control register.
>>>>
>>>>   - config_aneg: calls genphy_c37_config_aneg when the PHY is running in
>>>>     1000Base-X mode; otherwise, genphy_config_aneg will be called.
>>>>
>>>>   - read_status: calls genphy_c37_read_status when the PHY is running in
>>>>     1000Base-X mode; otherwise, genphy_read_status will be called.
>>>>
>>>> Signed-off-by: Tao Ren <taoren@fb.com>
>>>> ---
>>>>  Changes in v6:
>>>>   - nothing changed.
>>>>  Changes in v5:
>>>>   - include Heiner's patch "net: phy: add support for clause 37
>>>>     auto-negotiation" into the series.
>>>>   - use genphy_c37_config_aneg and genphy_c37_read_status in BCM54616S
>>>>     PHY driver's callback when the PHY is running in 1000Base-X mode.
>>>>  Changes in v4:
>>>>   - add bcm54616s_config_aneg_1000bx() to deal with auto negotiation in
>>>>     1000Base-X mode.
>>>>  Changes in v3:
>>>>   - rename bcm5482_read_status to bcm54xx_read_status so the callback can
>>>>     be shared by BCM5482 and BCM54616S.
>>>>  Changes in v2:
>>>>   - Auto-detect PHY operation mode instead of passing DT node.
>>>>   - move PHY mode auto-detect logic from config_init to probe callback.
>>>>   - only set speed (not including duplex) in read_status callback.
>>>>   - update patch description with more background to avoid confusion.
>>>>   - patch #1 in the series ("net: phy: broadcom: set features explicitly
>>>>     for BCM54616") is dropped: the fix should go to get_features callback
>>>>     which may potentially depend on this patch.
>>>>
>>>>  drivers/net/phy/broadcom.c | 54 +++++++++++++++++++++++++++++++++++---
>>>>  include/linux/brcmphy.h    | 10 +++++--
>>>>  2 files changed, 58 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
>>>> index 937d0059e8ac..fbd76a31c142 100644
>>>> --- a/drivers/net/phy/broadcom.c
>>>> +++ b/drivers/net/phy/broadcom.c
>>>> @@ -383,9 +383,9 @@ static int bcm5482_config_init(struct phy_device *phydev)
>>>>  		/*
>>>>  		 * Select 1000BASE-X register set (primary SerDes)
>>>>  		 */
>>>> -		reg = bcm_phy_read_shadow(phydev, BCM5482_SHD_MODE);
>>>> -		bcm_phy_write_shadow(phydev, BCM5482_SHD_MODE,
>>>> -				     reg | BCM5482_SHD_MODE_1000BX);
>>>> +		reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
>>>> +		bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
>>>> +				     reg | BCM54XX_SHD_MODE_1000BX);
>>>>  
>>>>  		/*
>>>>  		 * LED1=ACTIVITYLED, LED3=LINKSPD[2]
>>>> @@ -451,12 +451,44 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static int bcm54616s_probe(struct phy_device *phydev)
>>>> +{
>>>> +	int val, intf_sel;
>>>> +
>>>> +	val = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
>>>> +	if (val < 0)
>>>> +		return val;
>>>> +
>>>> +	/* The PHY is strapped in RGMII to fiber mode when INTERF_SEL[1:0]
>>>> +	 * is 01b.
>>>> +	 */
>>>> +	intf_sel = (val & BCM54XX_SHD_INTF_SEL_MASK) >> 1;
>>>> +	if (intf_sel == 1) {
>>>> +		val = bcm_phy_read_shadow(phydev, BCM54616S_SHD_100FX_CTRL);
>>>> +		if (val < 0)
>>>> +			return val;
>>>> +
>>>> +		/* Bit 0 of the SerDes 100-FX Control register, when set
>>>> +		 * to 1, sets the MII/RGMII -> 100BASE-FX configuration.
>>>> +		 * When this bit is set to 0, it sets the GMII/RGMII ->
>>>> +		 * 1000BASE-X configuration.
>>>> +		 */
>>>> +		if (!(val & BCM54616S_100FX_MODE))
>>>> +			phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int bcm54616s_config_aneg(struct phy_device *phydev)
>>>>  {
>>>>  	int ret;
>>>>  
>>>>  	/* Aneg firsly. */
>>>> -	ret = genphy_config_aneg(phydev);
>>>> +	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX)
>>>> +		ret = genphy_c37_config_aneg(phydev);
>>>> +	else
>>>> +		ret = genphy_config_aneg(phydev);
>>>>  
>>>
>>> I'm just wondering whether it needs to be considered that 100base-FX
>>> doesn't support auto-negotiation. I suppose BMSR reports aneg as
>>> supported, therefore phylib will use aneg per default.
>>> Not sure who could set 100Base-FX mode when, but maybe at that place
>>> also phydev->autoneg needs to be cleared. Did you test 100Base-FX mode?
>>
>> I'm doubting if 100Base-FX works. Besides auto-negotiation, 100Base-FX Control/Status registers are defined in shadow register instead of MII_BMCR and MII_BMSR.
>>
>> Unfortunately I don't have environment to test 100Base-FX and that's why I only make changes when the PHY is working in 1000X mode.
> 
> I can prepare a patch for 100Base-FX based on my understanding of bcm54616s datasheet, but the patch would be just compile-tested 
> 
Support for 1000Base-X should be sufficient. Best mention the missing support for
100Base-FX in the commit message and at a suited place in the driver code.

> 
> Thanks,
> 
> Tao
> 
Heiner
