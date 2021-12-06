Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161C4696A1
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 14:16:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J73pW275Nz2ymv
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 00:16:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oRRHhbqT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=oRRHhbqT; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J73p656LTz2yN4
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 00:15:42 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4038A43853;
 Mon,  6 Dec 2021 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638796537; x=1640610938; bh=WYnhsStQPKwBhv3yqIJvJ0ar/
 93JiGJNAwumc8N/HXM=; b=oRRHhbqTG9Hwmf8J/3NMw+b8y+ffhQ3Lby4UetdpT
 uVYv345rJPS422NRX56ui5PJs51B4uWnXdD6oCCDKq5pY/EXZQtikRpA2s5fr77G
 ZwX0snd4wFuCZybxdZiPySigCMWSCozmol8KzEpH7q0zBKdD15ltZ23aKvjig++j
 2s=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1ryOn8CB0sz; Mon,  6 Dec 2021 16:15:37 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2E2D44384B;
 Mon,  6 Dec 2021 16:15:35 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 6 Dec
 2021 16:15:35 +0300
Message-ID: <e698c84c424d698eb54a595c0df265a7de613946.camel@yadro.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: device tree for YADRO VEGMAN BMC
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>
Date: Mon, 6 Dec 2021 16:15:29 +0300
In-Reply-To: <20211119120057.12118-1-a.kartashev@yadro.com>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Gently ping.

Is there any other comments for dts files?

On Fri, 2021-11-19 at 15:00 +0300, Andrei Kartashev wrote:
> This brings initial DTS files for VEGMAN BMC machines
> 
> ---
>   v2:
>   - Cleanup I2C definitions
>   - Use OpenBMC flash layout
> 
> Andrei Kartashev (2):
>   dt-bindings: vendor-prefixes: add YADRO
>   ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC
> 
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/Makefile                    |   5 +-
>  arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts  | 149 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts  | 255 ++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts  | 154 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-vegman.dtsi      | 311
> ++++++++++++++++++
>  6 files changed, 875 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
> 

-- 
Best regards,
Andrei Kartashev


