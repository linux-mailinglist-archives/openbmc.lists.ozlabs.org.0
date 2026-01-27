Return-Path: <openbmc+bounces-1281-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK5nL+MeeGkKoQEAu9opvQ
	(envelope-from <openbmc+bounces-1281-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 03:11:47 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0F8EEA3
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 03:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0TRh0bC4z2xcB;
	Tue, 27 Jan 2026 13:11:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769479233;
	cv=none; b=TWT8Bf7SAOB0kc+OC+y7ttz+FRrQsJub15eya79nR3nPsu/3uDRw9TyIkmj6KlkpwbPfN3QP48VFj/E57p6YXnAVM83NO+ez/A1r5K8qXCaLfV+NwtWmoSCWe5kB+7Pv0g+irQU8+0wlR4dzDZ2dsanqaNsNG+m2HJce3Lc1Gw6YW72kwdS0UHcOE4NPDWgPs+cWiyutN5gdUSIJOSKt+e1JrWR4WdGA0KeBog4quL0bTMGq6LBktOCptuNm7zBgZyFCot4U4k4J6bKnGNTXH50slhiV0Kf0aV9G+vqzl4ElGKI3zzyk4kjX62exkiiExWGqb+4Ba0V/ZyLsRpYz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769479233; c=relaxed/relaxed;
	bh=Hyo+erR00h9458p7uQWXt34pYACkPr3IjWEnwDWvgac=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=gIjchNQcw0IlyfYrzNK6Z8KweU4TXo6ZPiL1hKtbnS2V7dCEfMdJcbmnS/mA2ni8OEsHJ3asMYIg8KSjsW0jA0i16zqwi/sX+J6I+nf1ZbkIR0yuzRYhMKlbgoMj96GJtq6ru+vngdheXaQjPV7hI9/qsLiS+p3442zb8JpfVL6hbnIE0uuSLu9jYCqW5S5W2ivzrgTJX9B0Irau5c/UPTCvNQw/eQDDYKTjnspEklehDmCtDpwXS31YcQ+KYmPbxC4+K9AHoBmPEFCTCke02Dre9kVHCjc4MWXKmU+ji/Q0SKk/40NBGVqT9EWYQRGqcuaL26HCtxb/waqGfFqrKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NZc91GYP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NZc91GYP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0TBl63zwz2xJF
	for <openbmc@lists.ozlabs.org>; Tue, 27 Jan 2026 13:00:30 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0c09bb78cso35875605ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 18:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769479227; x=1770084027; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyo+erR00h9458p7uQWXt34pYACkPr3IjWEnwDWvgac=;
        b=NZc91GYP2cd85OoUc/F0LTg1m9TSVYp+puFSCktN9FMnMN0BAqUXY//pxq/8eatrZq
         DCeNf4qMuLksE9fdIEmnzIFI3cDsTHFZIx4qmmcuh117PI5sLEUYopRJH18WOC85xZ86
         985x38tvyicCdYqV0rHqJ234T/T3xIWHPX5QFRjO+RgkPHkRLjfR2P6Fou6CsAl8HY6/
         xPQQk46+SIx6glyuEdoZ9ti3wrKRKvIpXazVl/k72K5wpzLJUU3SV7zYxrpwrpCBAIOb
         62ZGnEImBvcI7dA8uZ3u+jvPoh658lij5KGkUMfN+Zy1C3twdOtSlQ1MxUsu8Nk+OOTO
         nLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769479227; x=1770084027;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hyo+erR00h9458p7uQWXt34pYACkPr3IjWEnwDWvgac=;
        b=FnCQvSBz7KDGB6uwLZnXxL+1VBoRiA5Nd+BZyh230N9p2w/DxxwsEaoyhuzMA9PgiB
         8SJuMp04FQ/i/Dre1SJMpXEP7QCxlGUxds061OLukDqRrwg/Om28Tvugd9ce7W5RSmYn
         cZo7m/OivRyjTbiVPxzLd053zyK3LJBdrCHaLDieZXSYtDhHxQqotwXxkFZd8QRiVBAj
         VpbB+m+zaTgmoNOfmuaA44akRLOc6/iHI80v/mFfeJ2nhAPWZC7/7b7MWc6lHVd7nvul
         WR7xiNi1ZJN7c/jxIz5mTLxEaBOfSrUBNx8S94aopMGbBvSeV+POtfIR+f7HozY/mix6
         UOIw==
X-Forwarded-Encrypted: i=1; AJvYcCVTlPiaKTDuIEPXhW074mGFkQKhrVfTcDzqCZSN3X0hQ5nG06quyuOWimId9fEugvHtiFFv0iC/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMPhHnVCEmYpU+9zvcDw9AOFhBqSKIDnx1RVkAB6/zWM3V3QMD
	e56/0eTCSNajXVJVxgeHFH9ijo9dwONHFNERqJBc9SQOUu5lxbSK+2Y7
X-Gm-Gg: AZuq6aJMt95M8WjTgCjqwB2lC8afQtQMrBmpKhtgJF9BIaqKhN96cufvHj9iF+ZFNF0
	FHqHd2440NQC3wlvqQ/y03BbvO8L0q7oFqM9a+Rd+hFjn5WH5S/ojiuWFzFh/Sfgld3Q8jeYL8k
	vuaec4oYsk4+Dy0nk6J7YKokmXbUGjBX/jJvLhJsCq0VMsuapAPIDJgf6/ykGrvW9LprzDRkxXc
	A30Cl7htn/igsEP/pdRIgIr6NblaykUUD2iG00jfl58NZVTsNR1oOFdXRFcITMRrFbcGjsaXE4E
	sE9QXV0Zpp1J8nfQIVfjcRNsjjNQDabKCROYLU2kKduMsVQ/1Hp0sDi5H9Gijttvtu/6759GSoC
	PMG9uIE5V5B9Ts2oY8ngg49FQl81OtBTeYHiBU/QRkCxNVnB72oi5IWvNigH/D0FJleIHM5/pDI
	tjdM6ak3ZciLffURwMEYWSTe+B03Kt/tPXaigBaMQaydDK9m21TWY9GCPqhxiQ795d5N7rgF8jd
	YQ=
X-Received: by 2002:a17:903:2f91:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a87134d275mr388575ad.28.1769479226354;
        Mon, 26 Jan 2026 18:00:26 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb0262sm99857235ad.70.2026.01.26.18.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:00:25 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------WtKhOJP16ntJfHx0PNQbJ409"
Message-ID: <52a6417f-66bc-46cb-b9b8-66d58da95a34@gmail.com>
Date: Tue, 27 Jan 2026 10:00:14 +0800
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260126102257.2619862-1-a0987203069@gmail.com>
 <20260126102257.2619862-3-a0987203069@gmail.com>
 <ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1281-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.111.199.128:email,0.0.0.1:email,0.0.0.0:email,2.100.46.192:email]
X-Rspamd-Queue-Id: ADF0F8EEA3
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------WtKhOJP16ntJfHx0PNQbJ409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> On Mon, Jan 26, 2026 at 06:22:56PM +0800, Joey Lu wrote:
>> Add GMAC nodes for our MA35D1 development boards:
>> two RGMII interfaces for SOM board, and one RGMII
>> and one RMII interface for IoT board.
>>
>> Signed-off-by: Joey Lu<a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
> Did you answer my question about what these represent?
>
> I _think_ your .dts{i} files are all messed up and need
> re-architecturing.
>
> arch/arm64/boot/dts/nuvoton/ma35d1.dtsi should represent the SoC.
>
> There should be a .dtsi file which represents everything on the SOM.
> This includes the SoC .dtsi file.
>
> There should be a .dts file for the carrier board. It should include
> the SOM .dtsi file.
>
> You said one of the boards does not use the SOM, so it can directly
> import the SoC .dtsi file.
>
>>   3 files changed, 97 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> index 9482bec1aa57..ee32cedf3d9b 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> @@ -18,6 +18,8 @@ aliases {
>>   		serial12 = &uart12;
>>   		serial13 = &uart13;
>>   		serial14 = &uart14;
>> +		ethernet0 = &gmac0;
>> +		ethernet1 = &gmac1;
>>   	};
>>   
>>   	chosen {
>> @@ -126,3 +128,34 @@ &uart14 {
>>   	pinctrl-0 = <&pinctrl_uart14>;
>>   	status = "okay";
>>   };
>> +
>> +&gmac0 {
>> +	phy-handle = <&eth_phy0>;
> This is a .dts file, so represents a board. You said the PHYs are on
> the board, not the SOM. So this is correct.
>
>
>> +	status = "okay";
>> +
>> +	mdio0: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> The MDIO bus is a property of the SoC. It always exists, even if it is
> not used. So the mdio node should be in the SoC .dtsi file.
>
>> +		eth_phy0: ethernet-phy@0 {
>> +			reg = <0>;
>> +		};
> The PHY is a property of the board, so should be in the board .dts
> file.
>
>> +	};
>> +};
>> +
>> +&gmac1 {
>> +	phy-mode = "rmii";
>> +	phy-handle = <&eth_phy1>;
>> +	status = "okay";
> Correct.
>
>> +
>> +	mdio1: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> Wrong.
>
>> +
>> +		eth_phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +		};
> Correct.
>
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> index f6f20a17e501..b1b3e45280d5 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> @@ -18,6 +18,8 @@ aliases {
>>   		serial12 = &uart12;
>>   		serial14 = &uart14;
>>   		serial16 = &uart16;
>> +		ethernet0 = &gmac0;
>> +		ethernet1 = &gmac1;
>>   	};
>>   
>>   	chosen {
>> @@ -129,3 +131,33 @@ &uart16 {
>>   	pinctrl-0 = <&pinctrl_uart16>;
>>   	status = "okay";
>>   };
>> +
>> +&gmac0 {
>> +	phy-handle = <&eth_phy0>;
>> +	status = "okay";
>> +
>> +	mdio0: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		eth_phy0: ethernet-phy@0 {
>> +			reg = <0>;
>> +		};
>> +	};
>> +};
>> +
>> +&gmac1 {
>> +	phy-handle = <&eth_phy1>;
>> +	status = "okay";
>> +
>> +	mdio1: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		eth_phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +		};
>> +	};
>> +};
> Same problem as above.
>
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> This represents the SoC.
>
>> @@ -379,5 +379,37 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		gmac0: ethernet@40120000 {
>> +			compatible = "nuvoton,ma35d1-dwmac";
>> +			reg = <0x0 0x40120000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq";
>> +			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +			clock-names = "stmmaceth", "ptp_ref";
>> +
>> +			nuvoton,sys = <&sys 0>;
>> +			resets = <&sys MA35D1_RESET_GMAC0>;
>> +			reset-names = "stmmaceth";
>> +
>> +			phy-mode = "rgmii-id";
> PHY mode is a property of the board. The board might have extra long
> clock lines, so needs 'rgmii'. The board might use MII?
>
> Please think about the hierarchy.  SoC -> SoM -> board. Put the
> properties at the correct level.
>
>      Andrew
>
> ---
> pw-bot: cr

Thanks for the clear explanation. I understand now.

I’ll move the MDIO bus nodes to the SoC |.dtsi| and keep PHYs in the 
board |.dts| in the next revision.

Best regards,

Joey

--------------WtKhOJP16ntJfHx0PNQbJ409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
      cite="mid:ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch">
      <pre wrap="" class="moz-quote-pre">On Mon, Jan 26, 2026 at 06:22:56PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Did you answer my question about what these represent?

I _think_ your .dts{i} files are all messed up and need
re-architecturing.

arch/arm64/boot/dts/nuvoton/ma35d1.dtsi should represent the SoC.

There should be a .dtsi file which represents everything on the SOM.
This includes the SoC .dtsi file.

There should be a .dts file for the carrier board. It should include
the SOM .dtsi file.

You said one of the boards does not use the SOM, so it can directly
import the SoC .dtsi file.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 3 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..ee32cedf3d9b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &amp;uart12;
 		serial13 = &amp;uart13;
 		serial14 = &amp;uart14;
+		ethernet0 = &amp;gmac0;
+		ethernet1 = &amp;gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,34 @@ &amp;uart14 {
 	pinctrl-0 = &lt;&amp;pinctrl_uart14&gt;;
 	status = "okay";
 };
+
+&amp;gmac0 {
+	phy-handle = &lt;&amp;eth_phy0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is a .dts file, so represents a board. You said the PHYs are on
the board, not the SOM. So this is correct.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The MDIO bus is a property of the SoC. It always exists, even if it is
not used. So the mdio node should be in the SoC .dtsi file.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		eth_phy0: ethernet-phy@0 {
+			reg = &lt;0&gt;;
+		};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The PHY is a property of the board, so should be in the board .dts
file. 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	};
+};
+
+&amp;gmac1 {
+	phy-mode = "rmii";
+	phy-handle = &lt;&amp;eth_phy1&gt;;
+	status = "okay";
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Correct.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wrong.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		eth_phy1: ethernet-phy@1 {
+			reg = &lt;1&gt;;
+		};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Correct.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..b1b3e45280d5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &amp;uart12;
 		serial14 = &amp;uart14;
 		serial16 = &amp;uart16;
+		ethernet0 = &amp;gmac0;
+		ethernet1 = &amp;gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,33 @@ &amp;uart16 {
 	pinctrl-0 = &lt;&amp;pinctrl_uart16&gt;;
 	status = "okay";
 };
+
+&amp;gmac0 {
+	phy-handle = &lt;&amp;eth_phy0&gt;;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = &lt;0&gt;;
+		};
+	};
+};
+
+&amp;gmac1 {
+	phy-handle = &lt;&amp;eth_phy1&gt;;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = &lt;1&gt;;
+		};
+	};
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same problem as above.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This represents the SoC.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -379,5 +379,37 @@ uart16: serial@40880000 {
 			clocks = &lt;&amp;clk UART16_GATE&gt;;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = &lt;0x0 0x40120000 0x0 0x10000&gt;;
+			interrupts = &lt;GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH&gt;;
+			interrupt-names = "macirq";
+			clocks = &lt;&amp;clk EMAC0_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = &lt;&amp;sys 0&gt;;
+			resets = &lt;&amp;sys MA35D1_RESET_GMAC0&gt;;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
PHY mode is a property of the board. The board might have extra long
clock lines, so needs 'rgmii'. The board might use MII?

Please think about the hierarchy.  SoC -&gt; SoM -&gt; board. Put the
properties at the correct level.

    Andrew

---
pw-bot: cr</pre>
    </blockquote>
    <p data-start="206" data-end="258">Thanks for the clear explanation.
      I understand now.</p>
    <p></p>
    <p>I’ll move the MDIO bus nodes to the SoC <code data-start="766"
        data-end="773">.dtsi</code> and keep PHYs in the board <code
        data-start="801" data-end="807">.dts</code> in the next
      revision.</p>
    <p>Best regards,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------WtKhOJP16ntJfHx0PNQbJ409--

