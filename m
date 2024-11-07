Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5199C120B
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:52:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky4F6yRBz3w1B
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730975795;
	cv=none; b=YjsBmPQV9H5JTzdMy2X2blRw0n6kYey8y3kCllN1CNsxLzu+tKFl9AJl2PYLR29poXbPMcCPmGr8JVoBi9lYAFdQb7Zo2k8e1UNjhj4EZuRsWoSEne08YsgkFfhgHLsFijEZFoM/s02OF+eJj6xm0E4uNX7qDXM1w4W8/GbLHFcsak3iGM8NQ52w7lxd/3Q6Nmu+Nscg8w6LNu4vyNiqReceVrPDZoD+5oj1jeHJSCO77+Zx3mhpIzm2T0TLx1D0qwJWkit5VZDfYWVATKvFn2fEawFaB3C+33rMcy4or3It2Znb/dtgmuMFds033t9SPr0Iaj8pkzOvZ0SfU3NCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730975795; c=relaxed/relaxed;
	bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8KhtoQuW5EyPzBz7eYjRa4/T/N/8TO8nxqht4FKTFwM0Kf/OznkpooN98rMVATK2jDthEAJRXkAle2r52JrFhDQ8oCCOkLYqqqXIQKt4mtna/kj0Q2pn75MmWBG8OxpKJp0TGy/KSvYwXyEa+KmKcsa17qnrAOVZ0eapBtAq77bDDe2f8ajnkmPhJNqaTpr/BDjIHgyaOfu0mPfibOYOaD++mjlSZiYyJV/Fsx8OiHhnxTna5YvXZD6VEiFiEbqM+F+1LmBMtGBjw/8TC+bbx1+HpVeopkAaexBvVs2yMNYFGhOilmbrRdeyJAfxTRidf1lQ9lH1/TMtz3zV96bsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WV+5fQEp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WV+5fQEp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkdm22f8Gz3bkg
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 21:36:34 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so612242b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2024 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975790; x=1731580590; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
        b=WV+5fQEpPGlLZsz/iU2n5EtK1G4elVI6dCzLoGyGZBJ04CTH+0VUZjc3+bOab0yF7V
         9wfPfW7171JETkKLA9EvdSsyttRcNbq2PLX1mnjcvwoC2Yc7nQE3P3qhnAsEBaoQdoUh
         S5+QRbQr/yyDRHj7Miyzf7crs4sn3BbHSYH+bg4EOSRA/bQtRo3ukZgpB+Meu9I9ZGd6
         fmYZ9Nx51v+1w8tWsi37EKDIOSEQAHu++DipsgRWObZg/22j8XlMZc58SlLXU5htPraR
         LU/6Fo/lZvdLeqnjbxJkAJEGt4i3ArBZIX056+1NqbO29A29mKfkrXzkxtFiZPyWfKMG
         zFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975790; x=1731580590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
        b=AYCtO9VnPl1KAbEnYkcyxrHXqBWVauS9NtJdvuaZKM4hMb93kB1Ebbrqz7xHzgRKLc
         GpQUdXhMr6beFGQCTfZHrTWrTpvGJDpg97OrEb9pAg4iWjUBGxufK8FZGhnELMMZADUY
         E+mn+NdHnJDr3eSDLZ8dJ5rZx5JHtP5vnVwXc3m1U59VaiTQmdgtNwCUW/OVmLIFuKDI
         JxsjzbksmoGhsaKHEwwi8KS4XYqOMdyY67snca6mmoNuGmHoyab16z+ysDf/9fcIxTJD
         lQ2uH8D6cciOFh3MqPJr6sgBHleXkjBhq94Mxfbp2vo80EpuRPegXzhWyQJVPUrVt2dh
         vokQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBoMm2zK5o0a93uhSMtjJbZUKXInrX8Gou0E00ItzzIo60t8FiKYwis4l3joGdIxpUkap+OQK/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjdolD/YY3IEiAtHyj42QtHiX9uUGII7vUbr7AGrLx8G+tidBq
	n3r5WwB17MMi2y78gHs8C/AlsILO+LUTjgIjpuzSevZ8pLNs+5bA
X-Google-Smtp-Source: AGHT+IFEcmPOqn+X7HeywXdO6/sEgP5tjET/8PEbokkUZb1iOlKZDIKxcXvkvkXx3PWm7y2eChH7tQ==
X-Received: by 2002:a05:6a00:2284:b0:71e:4786:98ee with SMTP id d2e1a72fcca58-720c99b7befmr31801669b3a.21.1730975790564;
        Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7d9esm1209196b3a.66.2024.11.07.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Message-ID: <99fa8255-12b5-4a54-acfe-cc0fbbba9c0e@gmail.com>
Date: Thu, 7 Nov 2024 18:36:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-4-a0987203069@gmail.com>
 <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Andrew,

Thank you for your reply.

Andrew Lunn 於 11/7/2024 2:23 AM 寫道:
>> +struct nvt_priv_data {
>> +	struct platform_device *pdev;
>> +	int id;
>> +	struct regmap *regmap;
>> +	phy_interface_t phy_mode;
> phy_mode does not seem to be used outside of nuvoton_gmac_setup(). In
> fact nothing in nvt_priv_data is used outside of
> nuvoton_gmac_setup. So it looks like you can remove it.
I will remove it.
>> +	if (of_property_read_u32(dev->of_node, "tx_delay", &tx_delay)) {
>> +		dev_info(dev, "Set TX delay(0x0).\n");
>> +		tx_delay = 0x0;
>> +	} else {
>> +		dev_info(dev, "Set TX delay(0x%x).\n", tx_delay);
> Please don't spam the logs. dev_dbg(), or no message at all.
>
> 	Andrew
I will fix it.

Thanks!

BR,

Joey

