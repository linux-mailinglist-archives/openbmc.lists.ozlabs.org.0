Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AC9E2F36
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 23:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2wk23YbZz3c7Q
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 09:46:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733217161;
	cv=none; b=TA4ZVPePd0VbTWlS64P+QocmhPJyPl6n5Vf6+AHgre/iqAnEgx33INRsF5s5Ve5ATMLYY9u+fSBEXfaAussTEABA98boCyWxfhH662A2PkodIHuAIdq9dz0/n9Oo5Tcw0VvrFoO2hLWzLeQXyXRR/fV+0x9qFQBJahGZNEqpu6KG5oeoC0Re+5bURjqEpsIH0US24U/QDSwq8BN4IbW1Dv1wCNoNkWXPs5r7jMfTahzWYDK/XYSISC1nDEe08n21nIeuo+otJVhWGT/xKR5k6h734khOaNkpLK0kOqNX2rpqve8rzYqZCw0Bz5ViJR0pKXCzjeGECfjhj6M9OXYCag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733217161; c=relaxed/relaxed;
	bh=5UjROHqftn2vsqoSMMZyNiWVGqcRAwNJX1YG/RKp5Ps=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=h+CR5/d0H5YRbPahoeP3JqXgyoBR3k+BX4+3L100h4MXN1WyQiWUaIlOOEyHuvx8bA7y4hsTqTgpUpKDer2KM1p11/tx2jQORbzTdcXv62Ztjjbg4Pfg7fjpfbfUSWOybDSpqwBG/+u6TB9n8So7XTDE7APePHsKnWNJUm3IALbdWrpXQmxRB8an1PeegQig/EyB1q/6czG3ZPcN+zGDIcWKJPihZcL0AHXvXEXHNuZDNDxhDu2IdYJfJ0nfnfgjB2cvoop0VSqx+Jq3ewiluvgP8fj3sUipjar+YDOYiKOv3vJfsILBoqnCuMemYJ1hSrZzbjVx8E1zwdjYyjeSfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0u+SjBf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0u+SjBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2ZgB6MPmz300V
	for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2024 20:12:37 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fcc00285a9so2203808a12.2
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 01:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733217154; x=1733821954; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UjROHqftn2vsqoSMMZyNiWVGqcRAwNJX1YG/RKp5Ps=;
        b=C0u+SjBfmC3sdqdv5JAvrxiiE4eWUTnBg+hGMo7LwyY7NyIzjzQAXDG3bBd1d93vZ4
         1q346K0whwZgmbQzmFBMMBrKD1l+aal8558eVrWeKHXDpZICUANmCMIrHTf34kflg+kg
         VPhDDmxEfa5ExShB5BNJ0yx8UTsLUOPCSBhlzHn6/YYX5R5zf3Cqpx/SrqXpsZHP5N3S
         UBOiwOfSK6gAbwKs8g0h1jVJl5jsnJ+O1gZGyxYS5Fs1F1JF0OVju/+elwQzK2lp1aPn
         NyEFc5W4hwmP9t0Jq+q3i5e57mVRZ1g1G7oQqjiT+hHxJ975/4CHxeOuAB+nYH4qSLV2
         A8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217154; x=1733821954;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5UjROHqftn2vsqoSMMZyNiWVGqcRAwNJX1YG/RKp5Ps=;
        b=GRzyHVBFxw9F3ko4C5xEt3A8GCm74PQOvcqysi8D6lUB6okxviVQnRPdJFiy/IqXI2
         tj0JMeTUd/w+wIbNw1Ru6P530fDLoZHZToeWpLofwQcJmIPULQ3ndrwOJyXVJjqz1nAV
         bxp/LUpfHwPlt9l+7LY7DE8D6ZfeU4RNHUFr0T5J6NCD4Tfg79qHvcdN08kqWYjziTKq
         rqNkd1mGQ7w2gzjxWRMhWzHap/TNgS+F+GkUkv4FXDNTSFCrUYORf/87bsz5L1dfDT1n
         XbjJ9wnb+D3r+92y2aZncs5HEqiIdsY4uDFm7sdV2ND35Ruq5XKPKbeCt+LP1GK5gZFS
         ZPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVP6iCSJZ1qbOhDZ1euoHia1SndY7VbBzfiWtJQquTvN8/8wncsMwO3TAF8NHQBGiOQGGclpzc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEJqH79/PmZqeQt8pGEZETq4M0NY6zlJ2gfmG2oKpLh49wh2go
	CmcddJpQROZGdTdAaf9GFA6K6S2+xDBMstGdOeCF3v9uDFpq9H8L
X-Gm-Gg: ASbGncs9hMYyFRSJo1eXgUuPdgDZkisFHkAPcpXo7EE6ewM5E4/omYTmateosaAT6nw
	Dvupups0SUU1BSHEya8SyzTGKZJEkywDgQ4y13E+kyhVPaCyrLAlkAIMLX3v9THPjBFv0xW+8HD
	iHvEodBG6mUujJ4vwLWE5ttfv6jWPniMz4l8vIU4alpUuFWJzyvTvre9K/CZjoWEDEwl8S8tFot
	Mc51asgUfI1OufmFOPQ7oOqBxLNeIQte4u6nkEr1NoB5bSXNIEmMEhx6V+CzD5yDQ+ggaQTlXfJ
	UdQHkOEG/t1Iv+LfNlkZ2hywc0RK
X-Google-Smtp-Source: AGHT+IGpVPLJoUHhxn29+2edrat9f3AeLujRdiCcmD98MTLjHojlgwV8qjmmdkbbTsO7m+lEuIUpYg==
X-Received: by 2002:a05:6a20:a104:b0:1e0:c89c:1deb with SMTP id adf61e73a8af0-1e1653d01aemr2664742637.20.1733217153608;
        Tue, 03 Dec 2024 01:12:33 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156422d2b0sm53180335ad.218.2024.12.03.01.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:12:33 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------y1WwBj32yHWQaSB0LYdCb0t6"
Message-ID: <75eb13d7-b582-4056-b707-706865611706@gmail.com>
Date: Tue, 3 Dec 2024 17:12:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:46:15 +1100
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
--------------y1WwBj32yHWQaSB0LYdCb0t6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Andrew,

You're correct. In the |stmmac_hw_init| function within |stmmac_main.c|, 
whether |pmt| is |true| is determined by checking the 
|pmt_remote_wake_up| bit in the hardware feature register. However, our 
hardware configuration only supports magic packet and not remote wakeup, 
so it must be overwritten in the glue driver. I'm not sure why the 
original code doesn't include magic packet as part of |pmt|.

source code:

         stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c

*        priv->plat->enh_desc = priv->dma_cap.enh_desc;
         priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
         priv->hw->pmt = priv->plat->pmt;*

Or modify the condition as follows:

*        priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up|| 
priv->dma_cap.pmt_magic_frame) &&
                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);*

Thanks!

BR,

Joey*
*

Andrew Lunn 於 12/3/2024 9:43 AM 寫道:
>> +	/* We support WoL by magic packet, override pmt to make it work! */
>> +	plat_dat->pmt = 1;
>> +	device_set_wakeup_capable(&pdev->dev, 1);
> It seems odd to me that there is no WoL support in this glue
> driver. So i assume the core driver is doing it? So why does the core
> driver not set pmt and wakeup_capable ?
>
> 	Andrew
--------------y1WwBj32yHWQaSB0LYdCb0t6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Andrew,</p>
    <p>You're correct. In the <code>stmmac_hw_init</code> function
      within <code>stmmac_main.c</code>, whether <code>pmt</code> is <code>true</code>
      is determined by checking the <code>pmt_remote_wake_up</code> bit
      in the hardware feature register. However, our hardware
      configuration only supports magic packet and not remote wakeup, so
      it must be overwritten in the glue driver. I'm not sure why the
      original code doesn't include magic packet as part of <code>pmt</code>.</p>
    <p>source code:<br>
    </p>
    <p>        stmmac_hw_init()
      @net/ethernet/stmicro/stmmac/stmmac_main.c</p>
    <p><b>        priv-&gt;plat-&gt;enh_desc =
        priv-&gt;dma_cap.enh_desc;<br>
                priv-&gt;plat-&gt;pmt =
        priv-&gt;dma_cap.pmt_remote_wake_up &amp;&amp;<br>
                        !(priv-&gt;plat-&gt;flags &amp;
        STMMAC_FLAG_USE_PHY_WOL);<br>
                priv-&gt;hw-&gt;pmt = priv-&gt;plat-&gt;pmt;</b></p>
    <p>Or modify the condition as follows:<br>
    </p>
    <p><b>        priv-&gt;plat-&gt;pmt =
        (priv-&gt;dma_cap.pmt_remote_wake_up<font color="#ff0000"> ||
          priv-&gt;dma_cap.pmt_magic_frame</font>) &amp;&amp;<br>
                        !(priv-&gt;plat-&gt;flags &amp;
        STMMAC_FLAG_USE_PHY_WOL);</b></p>
    <p>Thanks!</p>
    <p>BR,</p>
    <p>Joey<b><br>
      </b></p>
    <div class="moz-cite-prefix">Andrew Lunn 於 12/3/2024 9:43 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	/* We support WoL by magic packet, override pmt to make it work! */
+	plat_dat-&gt;pmt = 1;
+	device_set_wakeup_capable(&amp;pdev-&gt;dev, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It seems odd to me that there is no WoL support in this glue
driver. So i assume the core driver is doing it? So why does the core
driver not set pmt and wakeup_capable ?

	Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------y1WwBj32yHWQaSB0LYdCb0t6--
