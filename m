Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B625B2D1
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 19:17:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhVxL4N8wzDqpG
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 03:17:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mhom/4rA; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhVwT5lQ4zDqpf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 03:16:41 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id m5so2861997pgj.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1Jq4/9RlKjNm0p3wZ+WmoiPcd5QXa16dPtzdJJFVEbc=;
 b=mhom/4rAQb2tlPHb4Wx2VaJ59NyuxjHMCM1QKXf3KtDVqegePu8BSnkrY5jyPdmJK6
 IzZqmcnWm0qaQyXvBxSHs07qeCXCa0GrE6HcL+rArfSUGprRe+yyZZUliVjWWW99deHZ
 eQB8CLJrBthmrfrzh9A+5Dp17kTE/npqZx/4TMZhVtIr50Flxw55jtLKZ+nohGJMkC6g
 LgUtCxUv5dxkXlI8ouLXI6Sxv/7mn41+H7rVoy34uO/NrJW7Gt/sNJQULZViIN25ry56
 4kCPGdDqBaqdHUAMmonAm/ggmp5Hvov0YkUnW4JjfXzOpGcRXLB5LsMEy1Kj11c6UekN
 Bo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1Jq4/9RlKjNm0p3wZ+WmoiPcd5QXa16dPtzdJJFVEbc=;
 b=nOe0qa77zQk/nOzU0qRA4fwiy+sSIZn5iibPhZ4Wmg6+zHv6ggkH5z7NgmzWjI8HTB
 WR9W5XvoDs+aHy6zJ05tYZV84IJByFhhj23xKzvXcy/SJaZQ8f/+glzjbJsLmpKgMbCw
 Jh+/grTo8HYDAkA5TLsjplcRtjkWltmETNg+raLlwLbF6aGg/INhRYJyPnSvrsw3yXNK
 bzFaGnCeOb081cWBfWwcjeBdxgViRdiq313U0Y4HZNgG9lVG0fC/PwGEP/fv7XBBonNe
 hC90L3buZZw44K5KGLlZWh24ZKih4ilrIBTMfV+pXqVGDPxpJKB+w8t1sOAGK3cvZKej
 TzAQ==
X-Gm-Message-State: AOAM532FpYUGGYYW3KB6CPnHTT9lYe2GsrjjZlGjBWcDqWTC+y6qEd+w
 mnV0GmQiia2NGPUYcALs/USn6PseVuntbw==
X-Google-Smtp-Source: ABdhPJwm20ATr3ud31nHXZy7C93Lhljdu7yHLCuJQ62r+Td7Sgt8uhSBT9ELAXHbMdOeTCUxBDa5Nw==
X-Received: by 2002:a05:6a00:89:: with SMTP id
 c9mr4102598pfj.159.1599066998080; 
 Wed, 02 Sep 2020 10:16:38 -0700 (PDT)
Received: from [192.168.1.6] ([49.207.206.140])
 by smtp.gmail.com with ESMTPSA id n67sm5870133pgn.14.2020.09.02.10.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 10:16:37 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.8 v2] ARM: dts: aspeed: rainier: Add I2C buses
 for NVMe use
To: Jet Li <Jet.Le@ibm.com>
References: <20200901061731.12694-1-Jet.Le@ibm.com>
 <CACPK8XfPHNns35z9Jx9jw7jgB=AeD29mMyfyupaN3x99GxdeRw@mail.gmail.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <c4a250cb-f81d-21a3-5a27-fccf265afa7a@gmail.com>
Date: Wed, 2 Sep 2020 22:46:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfPHNns35z9Jx9jw7jgB=AeD29mMyfyupaN3x99GxdeRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jet Li <Jet.Li@ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On 9/1/20 11:53 AM, Joel Stanley wrote:
> Hello,
>
> On Tue, 1 Sep 2020 at 06:19, Jet Li <Jet.Le@ibm.com> wrote:
>> From: Jet Li <Jet.Li@ibm.com>
>>
>> Adding pca9552 exposes the presence detect lines for the cards and
>> tca9554 exposes the presence details for the cards.

This change looks incorrect. Per the Rainier workbook,

there is no TCA chip at 0x40 on i2c0. The chip is at 0x20

and only has presence GPIOs (inputs).

Why is this using a gpio-hog to set this as an output?

--

Santosh

> This patch is already in dev-5.8 as a3ce4e380958571814bbf3e237e6496d5b35153b.
>
> Cheers,
>
> Joel
>
>> Signed-off-by: Jet Li <Jet.Li@ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index d20cdf3c..e803133 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -300,6 +300,21 @@
>>                  compatible = "atmel,24c64";
>>                  reg = <0x51>;
>>          };
>> +
>> +       tca9554@40 {
>> +               compatible = "ti,tca9554";
>> +               reg = <0x40>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +
>> +               smbus0 {
>> +                       gpio-hog;
>> +                       gpios = <4 GPIO_ACTIVE_HIGH>;
>> +                       output-high;
>> +                       line-name = "smbus0";
>> +               };
>> +       };
>> +
>>   };
>>
>>   &i2c1 {
>> @@ -614,6 +629,96 @@
>>                  compatible = "atmel,24c64";
>>                  reg = <0x51>;
>>          };
>> +
>> +       pca1: pca9552@61 {
>> +               compatible = "nxp,pca9552";
>> +               reg = <0x61>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +
>> +               gpio@0 {
>> +                       reg = <0>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg = <1>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg = <2>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg = <3>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg = <4>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg = <5>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg = <6>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg = <7>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@8 {
>> +                       reg = <8>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@9 {
>> +                       reg = <9>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@10 {
>> +                       reg = <10>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@11 {
>> +                       reg = <11>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@12 {
>> +                       reg = <12>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@13 {
>> +                       reg = <13>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@14 {
>> +                       reg = <14>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@15 {
>> +                       reg = <15>;
>> +                       type = <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> +
>>   };
>>
>>   &i2c9 {
>> --
>> 2.7.4
>>
