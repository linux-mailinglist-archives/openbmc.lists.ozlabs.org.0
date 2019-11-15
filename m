Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6AFDE77
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 13:58:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dz1d2YqfzF6t5
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 23:58:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="EKU8Yavv"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dz0X1XPpzF6Sw;
 Fri, 15 Nov 2019 23:57:48 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 26AEA411F8;
 Fri, 15 Nov 2019 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1573822664; x=1575637065; bh=QeijnkT3SOw/daHURBDhLCLSR
 5tzZMfBzaBd9ltBxX8=; b=EKU8YavvosEYSvUbEDPS9hiu7i23N/cqdGiI8hNWf
 zrE8b0EX5r50SWlPf9gj2FhnnQMGPCPsIoUgUoRFbLTScEcMZSM4itcjnbjvEZAU
 qwbAkyOEig6onc8OipQDA7DoLEFqtpB7BS4wLVKg4uks5df1/pY8ItdQXU2EN4n7
 As=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDyr-ZM6IAI0; Fri, 15 Nov 2019 15:57:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 532F6411D9;
 Fri, 15 Nov 2019 15:57:41 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 15 Nov 2019 15:57:41 +0300
Message-ID: <221381ebad0236625775bda5655fcd7c78455e6f.camel@yadro.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-aspeed: add inversion signal presence
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Fri, 15 Nov 2019 15:56:54 +0300
In-Reply-To: <d177ef37-643e-442d-d536-750e0bb5e86d@intel.com>
References: <20191114125435.27756-1-i.mikhaylov@yadro.com>
 <20191114125435.27756-3-i.mikhaylov@yadro.com>
 <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
 <b443738f5e2a3c7ba96b329a8347374f7f934483.camel@yadro.com>
 <d177ef37-643e-442d-d536-750e0bb5e86d@intel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-15 at 09:20 +0200, Adrian Hunter wrote:
> On 14/11/19 7:19 PM, Ivan Mikhaylov wrote:
> > On Thu, 2019-11-14 at 15:10 +0200, Adrian Hunter wrote:
> > On 14/11/19 2:54 PM, Ivan Mikhaylov wrote:
> > > > Change the default .get_cd callback. Add inverted signal card detection
> > > > check.
> > > > 
> > > > Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> > > > 
> > > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > > > b/drivers/mmc/host/sdhci-of-
> > > > aspeed.c
> > > > index 8962f6664381..186559ee8fcc 100644
> > > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > > @@ -143,6 +143,19 @@ static inline int
> > > > aspeed_sdhci_calculate_slot(struct
> > > > aspeed_sdhci *dev,
> > > >  	return (delta / 0x100) - 1;
> > > >  }
> > > >  
> > > > +static int aspeed_get_cd(struct mmc_host *mmc)
> > > > +{
> > > > +	struct sdhci_host *host = mmc_priv(mmc);
> > > > +
> > > > +	int present = !!(sdhci_readl(host, SDHCI_PRESENT_STATE)
> > > > +			 & SDHCI_CARD_PRESENT);
> > > > +
> > > > +	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
> > > > +		present = !present;
> > > 
> > > Perhaps safer to flip the bit using CONFIG_MMC_SDHCI_IO_ACCESSORS and
> > > ->readl() callback
> 
> 
> > Sorry, don't quite understand what you're saying. You want to instantiate
> > '.read_l' callback instead of '.get_cd' in sdhci_ops and substitute the real
> > value?
> > 
> > res = readl(base, reg);
> > if (reg == SDHCI_PRESENT_STATE)
> > 	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
> > 		return !res;
> 
> Presumably just flip the SDHCI_CARD_PRESENT bit i.e.
> 
> 		return res ^ SDHCI_CARD_PRESENT;
> 
> > return res;
> > 
> > Something like this?
> 
> Yes
> 

Don't you think it will bring a little overhead on any sdhci_readl plus
sdhci_readl will not get the real value in case of inverted signal which seems
is not right from communication fairness between hw and sw? I took that approach
with .get_cd from variety of drivers in host/mmc but if you think it will be
better and safer with .read_l - I'll do that way. 

Sorry for the link in subject, didn't notice that I put it in previous message
somehow.

Thanks.

