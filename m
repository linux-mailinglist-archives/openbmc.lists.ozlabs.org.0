Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C314E4A5E
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 02:12:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNVhj56hxz2xXw
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 12:12:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=nSCSXJ1O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=nSCSXJ1O; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNKvh5LB5z2yN1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 05:36:47 +1100 (AEDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 914763F6F1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647974197;
 bh=5jtpXxEom/a/jiH/sFwvBmFkIoAoceZfaQ8rDmnOzv8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=nSCSXJ1Org77dv/A9cffkocpcgggQstGpHStZaxVMZSS4x6SDkbp7hs4owzuJ52yX
 ur3puZUq/bDir6LhvQg/RD48PRu4zYpEa/DyO83RhCudTP2Oar1SdcEL50wUHdKaFm
 8e6Dz6SJn4WJxOU1TKiDQCUG4GQcPHcOFNH5uUB1Ak6zF4Fw4hzobovSbLm3lyKBOe
 wAxr3Sem9cvrDKgPt7XLX85xzakY9zOmXqxcqsK9RazpX9I+wewFuWS9cnb3FzoSNC
 P+x+xYGTEoeS2dRal5IWkPE7SBSCd1eJ5O/rbEosazbL/OD7g9RzuSb9yZcMiZ1nD1
 g1nY6xhIj5xtQ==
Received: by mail-lf1-f69.google.com with SMTP id
 z39-20020a0565120c2700b0044a219505a4so1971538lfu.11
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 11:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5jtpXxEom/a/jiH/sFwvBmFkIoAoceZfaQ8rDmnOzv8=;
 b=B/1TcGYjP/o8AKE3kSJLSqpSLvf/nThe2nUE9HeDGlcgm8XrdWMSVcXMa8FwzTIEij
 ipiMwoYl9NmDCZ438Q4tazf3yDVM8dHtwgIAYMjpkoXeuOJ0ziXvfBZgJLS96a/KIZqV
 1CGA8A5e7WJ0oBaLTp4F7IHlKUC5x/Sq4TtZ2I5pthwHnPYiE04h9D3kTMOKPb4lR1Vd
 TpJViyKdAaizd6MDfEpy43RPnNvwJbN4LhPIoSVen/1gD5GXTVZ2roeEhd7iYiPCq6nL
 ssNgqrPS48celVMIqjPLpBALAn468JI3aXxSUuRO4Hio5yvXXk+9bSJE5vvIfoxRxX7P
 LsQw==
X-Gm-Message-State: AOAM532i6c4Jdso0YeU11jk0+CtXYnip5gAd/YJkbrumcpH8TKGJrXie
 ZhIXqocGU2XmKGjLVOXMOYx0tlwzGE0bSjTrKPo/bN5m4ZqImEaxACdunisegNmhJfUU20j2KAX
 21d4q5o+YMOY8uKy+WCilEKj346ylzci50aUL
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr30164484edz.164.1647974184162; 
 Tue, 22 Mar 2022 11:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjJuzBLH9hbRDSjsXFrbLCVkaIICKYGv+IQ5EfXGkXfhv1U2vMFYP/O//lEDRT2Fv/Gfc1w==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr30164440edz.164.1647974183906; 
 Tue, 22 Mar 2022 11:36:23 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d4-20020a1709067a0400b006d6e3ca9f71sm8816466ejo.198.2022.03.22.11.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:36:23 -0700 (PDT)
Message-ID: <ff8da126-8eac-7b72-c992-3b4223f2b077@canonical.com>
Date: Tue, 22 Mar 2022 19:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YjjJpxLWJ/YOe0OX@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 23 Mar 2022 12:12:09 +1100
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
Cc: Nishanth Menon <nm@ti.com>, Bert Vermeulen <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 Suman Anna <s-anna@ti.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Burton <paulburton@kernel.org>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, John Crispin <john@phrozen.org>,
 Birger Koblitz <mail@birger-koblitz.de>, linux-oxnas@groups.io,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Krzysztof Halasa <khalasa@piap.pl>, Santosh Shilimkar <ssantosh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21/03/2022 19:53, Rob Herring wrote:
> On Thu, Mar 17, 2022 at 12:55:24PM +0100, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> The DTS patches can be picked up independently.
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (18):
>>   ARM: dts: nspire: use lower case hex addresses in node unit addresses
>>   ARM: dts: ox820: align interrupt controller node name with dtschema
>>   ARM: dts: socfpga: align interrupt controller node name with dtschema
>>   dt-bindings: irqchip: actions,owl-sirq: include generic schema
>>   dt-bindings: irqchip: fsl: include generic schema
>>   dt-bindings: irqchip: ingenic: include generic schema
>>   dt-bindings: irqchip: intel,ixp4xx: include generic schema
>>   dt-bindings: irqchip: kontron,sl28cpld: include generic schema
>>   dt-bindings: irqchip: loongson: include generic schema
>>   dt-bindings: irqchip: microchip,eic: include generic schema
>>   dt-bindings: irqchip: mrvl,intc: include generic schema
>>   dt-bindings: irqchip: mstar,mst-intc: include generic schema
>>   dt-bindings: irqchip: mti,gic: include generic schema
>>   dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
>>   dt-bindings: irqchip: realtek,rtl-intc: include generic schema
>>   dt-bindings: irqchip: renesas: include generic schema
>>   dt-bindings: irqchip: sifive: include generic schema
>>   dt-bindings: irqchip: ti: include generic schema
> 
> I'm somewhat on the fence about these. Originally only devices with a 
> bus or child nodes included a common schema. For 'simple' providers 
> with mainly a '#<provider>-cells' property, we had to set the 
> constraints on the number of cells anyways, so referencing another 
> schema doesn't save anything. It is nice to declare the 'class' of the 
> device though.
> 
> It makes the schema be applied twice (if the node name matches). That's 
> not all bad because it finds cases of wrong node name. However, 
> sometimes we have devices which are multiple providers and can't set the 
> node name. So those can't reference interrupt-controller.yaml.

Indeed there were cases of MSI and interrupt controller.

> 
> It also means that 'interrupt-map' for example is now valid. That could 
> be fixed by splitting 'interrupt-map' related properties to its own 
> schema. 

Yes, that's a side effect. Maybe my series should be abandoned.

Best regards,
Krzysztof
