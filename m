Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B89FCBB2
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 18:20:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DSt737KHzF85M
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 04:20:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LqdTURpI"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DSsC6cClzF84q;
 Fri, 15 Nov 2019 04:19:43 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 21B3A42E7D;
 Thu, 14 Nov 2019 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1573751977; x=1575566378; bh=P3FU1d3ro99r7uRl5lGjcNRn5
 WqlYzCAmN7MBkdbr3Y=; b=LqdTURpIXk1RD39o6BfgxURK8wwxrfauvNYFNb6YL
 7tPSe2Xiua69ovHuZqN0lAj4Nq/33qjR3XOOvOVhCAfY3lw4FZRcTKhQqUvsObMt
 itpqEASW82dQU5Vjy44qmb/ffpzTwtOHoS8AW26CUAM6t8P0aAESBbrur6WVnb73
 tM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k52oKM3PmY_C; Thu, 14 Nov 2019 20:19:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D050A411D9;
 Thu, 14 Nov 2019 20:19:35 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 14 Nov 2019 20:19:35 +0300
Message-ID: <b443738f5e2a3c7ba96b329a8347374f7f934483.camel@yadro.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-aspeed: add inversion
 sighttps://elixir.bootlin.com/linux/v4.6/ident/sdhci_opsnal presence
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 14 Nov 2019 20:19:31 +0300
In-Reply-To: <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
References: <20191114125435.27756-1-i.mikhaylov@yadro.com>
 <20191114125435.27756-3-i.mikhaylov@yadro.com>
 <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
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

On Thu, 2019-11-14 at 15:10 +0200, Adrian Hunter wrote:
> On 14/11/19 2:54 PM, Ivan Mikhaylov wrote:
> > Change the default .get_cd callback. Add inverted signal card detection
> > check.
> > 
> > Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-
> > aspeed.c
> > index 8962f6664381..186559ee8fcc 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -143,6 +143,19 @@ static inline int aspeed_sdhci_calculate_slot(struct
> > aspeed_sdhci *dev,
> >  	return (delta / 0x100) - 1;
> >  }
> >  
> > +static int aspeed_get_cd(struct mmc_host *mmc)
> > +{
> > +	struct sdhci_host *host = mmc_priv(mmc);
> > +
> > +	int present = !!(sdhci_readl(host, SDHCI_PRESENT_STATE)
> > +			 & SDHCI_CARD_PRESENT);
> > +
> > +	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
> > +		present = !present;
> 
> Perhaps safer to flip the bit using CONFIG_MMC_SDHCI_IO_ACCESSORS and
> ->readl() callback
> 

Sorry, don't quite understand what you're saying. You want to instantiate
'.read_l' callback instead of '.get_cd' in sdhci_ops and substitute the real
value?

res = readl(base, reg);
if (reg == SDHCI_PRESENT_STATE)
	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
		return !res;
return res;

Something like this?

>  
> > +	host->mmc_host_ops.get_cd = aspeed_get_cd;
> > +	if (of_property_read_bool(pdev->dev.of_node, "cd-inverted"))
> > +		dev_info(&pdev->dev, "aspeed: sdhci: presence signal inversion
> > enabled\n");
> 
> Is this print really needed?
> 
I can remove it if you think it's redundant.

Thanks.

