Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D4B9E885A
	for <lists+openbmc@lfdr.de>; Sun,  8 Dec 2024 23:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60Zc3vXRz3bTj
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 09:50:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733455080;
	cv=none; b=C1hi+IL+4oKJCvCdZORD++jn5IxOYaNezbkvh7UTOyuz8O+Xg32fC4zdzvrg8L7LerNav25EZZCqMI75u9jaCErDuwb+rPiSHTDkPF+5sEmfq19yTlsJ2ZkQWrteDwFQCI/EOVNSqaN/TZlGsoACUX8nhhc7Z2iyvlxm6JY1BRnAnaQBZxslvNVHrftzyyq+8Exr4S/QB5z3mqkkIcxD/aqQ651QqTYab4Q9b9YsS5chJAxXyMAu2v5qgE09qDPee3Pxtgi/MSOEJd6Fcvb8ng67LdzSFTDSEVAlQgf/EDpKTc6b307xPSFyEgCckLEHl1SG7bC8LLMPLIXAZ7wCng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733455080; c=relaxed/relaxed;
	bh=+2PCozrlzgkk4F9S6TYNgGPd0ZRNLkVWbIj1PK8TFjk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=eeMi62TaRcuj96o0D8aeXLJ/DevcMxTH/K+H916WvueH6B2avm+w+Lg74xYrvkxhJI/nXnrAsRbspWJR27qWmPqu/lM6wxIuVd+1LumIv0cyDOgv36hpAxNckiIJdBSWP4R+KIRKvlOt/0C5VKeKIGLWcVHvFaIcUBe4I8/uHc7nlSQBk5uiUxqyNKLFSHtBhqe3blR5NiojnwuFciYTvyZ4rSktSgC/NIxxFoc1YYqRhbIvjFMTQ8v5jnda79l888XM56mzER2fRKe4LOTtS6idqhus99ds2mUtCLqJ2ofZC85+zwAHCNWkNXVIx+ynt1PNMrgyKSXqVyHeVWECBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Us6xAKZ6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Us6xAKZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4Gfb5cDMz2xvh
	for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2024 14:17:57 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2155157c58cso10156125ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2024 19:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733455075; x=1734059875; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2PCozrlzgkk4F9S6TYNgGPd0ZRNLkVWbIj1PK8TFjk=;
        b=Us6xAKZ6HbIY0Td++WNrEvleRppsS2wunN3VDidcK3Zx0nK2vGPQ68h9y+3MluGNQf
         qjWdQbcukmG+kaEncE59Zd+jXCqfKSd4TQmlT2dWJi4uBVJDq2+BJlCfocsu5V99O4ls
         RqVHPuROyrrjMZxTBcWs8HvCll2j9i15Br0gYwMMKMms5EjP8mj1MsN3QAoicUQCEN6C
         lVweC95n+TNGYwC5NmBga0WeSb4vj3h0qeDn9zfR/KRIv1hBKAc3Dth0zvfREG82Ndmy
         b+xH/9EFS0WfqkbbGjawKTYzEsD98E5PSrX/Ay8iOWgkN+Vf6Q/2/63zt/WZDstcStTy
         b3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733455075; x=1734059875;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2PCozrlzgkk4F9S6TYNgGPd0ZRNLkVWbIj1PK8TFjk=;
        b=QJVoeCpS+MVzNTD2mftKS4fgQj5xbVjD0T8r0BdT9IEimpaqqFju9njWiR3N5ENKhy
         MKc72yJxeM3WSF/RWWuy2TJetxVpkCshQJgWsA/613+ahj/4QWjk85FAGMCA6fKqcmnn
         M9/rPZKj4i2lFqO08Tojjeovqa7769XdH2uZCpOPER5/1ksBhmbyOvGMS28VdA/UQulP
         Pf8kESadR8zG2hyCQrB3fk6SgaKizXd+/Rs9sVYQJeH+GAJGMc8N+ybwSyuBB4qjBgcQ
         8MXT0jPAhxy84vSOU818Uy7NCyjbs1NDFTqHX1khFf+5b0NzVQckqrWjk2SH8Eke9xIO
         wygQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA9R414pV4exP3s0R6wf7NuH1JJ+wTi0cG449btyVrWbXEb27OsXWL8beU1qOmgPDp0vJpKTu0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx26NsWMSM5tplU4EneB6h8l7KYbJ9uJv4N9TfDJEd2vQAknW1N
	Wxt5RxiJrag9DULGgnvu7InT7aC/RR3JTxfWxOY/Uh0c3y/6bfHf
X-Gm-Gg: ASbGncs2V8fLDPFkiSWsy3Sf3vppXAKmaU329+ttPMkqsF0uoRTwJpBMRAPm+eddQW8
	6An/H6ItAuNkXdbfh0z8St4lXZ1XLIRUjlPf5ndDVJUYF8nNRzrgJmzFhEOGp5p7dsdEagQrC3p
	t7F7FXH6ifb2rPeB/f48U2kRO+m13yCPFPW2soYt4e0ZhqHKD2w5+ktopph93PBWerWIpvSij/r
	EufzqBxx2ybZckfPn6bOEaUSE7wts603Kw2oaOIv0JTi6J2Hyd45tNPA1qaFIL8KeCVabAGLhI0
	OaZnpYPhNKK+ZJ6q5XcrUBHvQVS4
X-Google-Smtp-Source: AGHT+IGDlgK5ekXU1dDHXYTMek3JFEwGnrBNY4Rq6mtyCRiHABLK12AyQB+it31T7CPCmp44KWDIkw==
X-Received: by 2002:a17:902:cad1:b0:215:7cde:7fa3 with SMTP id d9443c01a7336-21614d607d7mr15764585ad.25.1733455074908;
        Thu, 05 Dec 2024 19:17:54 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09487sm19543975ad.181.2024.12.05.19.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 19:17:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------n00hxg0U6LlaFrj0mkXlgU8G"
Message-ID: <b571fcd4-fb76-4538-8e73-4fc98e455b14@gmail.com>
Date: Fri, 6 Dec 2024 11:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
 <75eb13d7-b582-4056-b707-706865611706@gmail.com>
 <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 09 Dec 2024 09:50:29 +1100
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------n00hxg0U6LlaFrj0mkXlgU8G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Andrew Lunn 於 12/3/2024 10:58 PM 寫道:
> On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
>> Dear Andrew,
>>
>> You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
>> pmt is true is determined by checking the pmt_remote_wake_up bit in the
>> hardware feature register. However, our hardware configuration only supports
>> magic packet and not remote wakeup, so it must be overwritten in the glue
>> driver.
> Please add a comment explaining this.
>
>
> I'm not sure why the original code doesn't include magic packet as part
>> of pmt.
>>
>> source code:
>>
>>          stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c
>>
>>          priv->plat->enh_desc = priv->dma_cap.enh_desc;
>>          priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
>>                  !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
>>          priv->hw->pmt = priv->plat->pmt;
>>
>> Or modify the condition as follows:
>>
>>          priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up || priv->
>> dma_cap.pmt_magic_frame) &&
>>                  !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
> Are there other glue drivers which would benefit from this? It is hard
> for me to say if you hardware is odd, or if this should be a generic
> feature which other glue drivers would use.
>
> 	Andrew

After reviewing the Synopsys DWMAC databook, it turns out that RWK is 
actually optional.

I reviewed the usage of the PMT flag in the core driver. In 
|/stmmac_ethtool.c/|, within the |/stmmac_set_wol/| function, the driver 
supports two wake-up methods corresponding to |/pmt_remote_wake_up/| 
and/|pmt_magic_frame|/. When the hardware is configured for magic packet 
only, |device_can_wakeup()| returns not supported. However, magic packet 
is the more widely used option.

In |/stmmac_hw_init()/|, adding a condition to check |pmt_magic_frame| 
for PMT flag will not affect the existing glue layer drivers, regardless 
of whether they config only RWK or both RWK and MGK.

However, it is hard for me to decide whether to modify stmmac driver. 
Overwriting the PMT flag and leaving a comment is fine for me.

BR,

Joey

--------------n00hxg0U6LlaFrj0mkXlgU8G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Andrew Lunn 於 12/3/2024 10:58 PM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch">
      <pre wrap="" class="moz-quote-pre">On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Dear Andrew,

You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
pmt is true is determined by checking the pmt_remote_wake_up bit in the
hardware feature register. However, our hardware configuration only supports
magic packet and not remote wakeup, so it must be overwritten in the glue
driver.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please add a comment explaining this. 


I'm not sure why the original code doesn't include magic packet as part
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">of pmt.

source code:

        stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c

        priv-&gt;plat-&gt;enh_desc = priv-&gt;dma_cap.enh_desc;
        priv-&gt;plat-&gt;pmt = priv-&gt;dma_cap.pmt_remote_wake_up &amp;&amp;
                !(priv-&gt;plat-&gt;flags &amp; STMMAC_FLAG_USE_PHY_WOL);
        priv-&gt;hw-&gt;pmt = priv-&gt;plat-&gt;pmt;

Or modify the condition as follows:

        priv-&gt;plat-&gt;pmt = (priv-&gt;dma_cap.pmt_remote_wake_up || priv-&gt;
dma_cap.pmt_magic_frame) &amp;&amp;
                !(priv-&gt;plat-&gt;flags &amp; STMMAC_FLAG_USE_PHY_WOL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are there other glue drivers which would benefit from this? It is hard
for me to say if you hardware is odd, or if this should be a generic
feature which other glue drivers would use.

	Andrew</pre>
    </blockquote>
    <p>After reviewing the Synopsys DWMAC databook, it turns out that
      RWK is actually optional.</p>
    <p>I reviewed the usage of the PMT flag in the core driver. In <code><i>stmmac_ethtool.c</i></code>,
      within the <code><i>stmmac_set_wol</i></code> function, the
      driver supports two wake-up methods corresponding to <code><i>pmt_remote_wake_up</i></code>
      and<i> <code>pmt_magic_frame</code></i>. When the hardware is
      configured for magic packet only, <code>device_can_wakeup()</code>
      returns not supported. However, magic packet is the more widely
      used option.</p>
    <p>In <code><i>stmmac_hw_init()</i></code>, adding a condition to
      check <code>pmt_magic_frame</code> for PMT flag will not affect
      the existing glue layer drivers, regardless of whether they config
      only RWK or both RWK and MGK.</p>
    <p>However, it is hard for me to decide whether to modify stmmac
      driver. Overwriting the PMT flag and leaving a comment is fine for
      me.</p>
    <p>BR,</p>
    <p>Joey</p>
  </body>
</html>

--------------n00hxg0U6LlaFrj0mkXlgU8G--
