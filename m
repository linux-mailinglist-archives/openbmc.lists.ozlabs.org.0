Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32138698B64
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 05:18:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHMBD0jMNz3cGr
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 15:18:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qblMqRUk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qblMqRUk;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHM9V2L1wz3bgn;
	Thu, 16 Feb 2023 15:17:34 +1100 (AEDT)
Received: from [192.168.87.25] (unknown [50.35.78.176])
	by linux.microsoft.com (Postfix) with ESMTPSA id 240CA20B9C3D;
	Wed, 15 Feb 2023 20:17:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 240CA20B9C3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1676521021;
	bh=VmsDF5gDLO0hK+EBXyDyJfasU051a0MIEUc0wQei5PA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qblMqRUk/t0G8EmLsEeHJRQ3EbsYm/2M9u9QOGyyhpNRJFj0S+UgH5sth+0NIEiWH
	 s/GHuGPYnCe2/EiI2SnvXgkQjadEPJcywRIcTqHchiR2v7YSG7DgVw4a/xlSrjqd36
	 3bsg1CWzAZAQxHGsUps1VyDKTONOB+9NpLC9NEhA=
Message-ID: <a62fb259-3ad3-b75e-c59e-2ce937bf799a@linux.microsoft.com>
Date: Wed, 15 Feb 2023 20:17:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Ryan,

On 2/14/2023 9:43 PM, Ryan Chen wrote:
> It is not duplicated, as my description in cover " This series add AST2600 i2c new register set driver"
> So, this will be different driver compatible.
> The original compatible is
>        - aspeed,ast2400-i2c-bus
>        - aspeed,ast2500-i2c-bus
>        - aspeed,ast2600-i2c-bus
> So the new register set compatible is "- aspeed,ast2600-i2c", remove "bus".

Is it possible to keep existing driver drivers/i2c/busses/i2c-aspeed.c
for ast2400/ast2500, while move ast2600 support to new driver
altogether, say i2c-ast2600.c along with new register mode? By default
new driver can support legacy mode with same compatible "aspeed,ast2600-
i2c-bus", additionally driven by dt props, switch to new mode.

Regards,
Dhananjay
