Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD389B2D7
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 16:59:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FPgd5RxqzDrM1
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 00:59:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="lu7OKXSt"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FPfm0hPSzDrKV;
 Sat, 24 Aug 2019 00:58:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B7CB442ECA;
 Fri, 23 Aug 2019 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1566572314; x=1568386715; bh=2ywvpDww2A1i+kbuWuDHnXybr
 Ba2cGJLERdeg5sc8R0=; b=lu7OKXSthWV58HC/Hipuf12hDFrQuAuUUj8iMMjHD
 7Ii0aiwZktZCFPATQUBWUKTamtPTy2BlUt7iM+vArJ1PsQUEdCiCZKJzGaXx42/U
 wLOkg63mPxT7odCfSJ7IWL9p1AiVI1/LtFMaNZIBHdNNvfW9WvxDCTSj+fh2G4kn
 n4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 614TsZo-FET2; Fri, 23 Aug 2019 17:58:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 29DF34120B;
 Fri, 23 Aug 2019 17:58:33 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 23 Aug 2019 17:58:32 +0300
Message-ID: <8690cbb3e7759f3d8ab2a93db53186bf02fd525a.camel@yadro.com>
Subject: Re: [PATCH v1 3/3] watchdog/aspeed: add support for dual boot
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 23 Aug 2019 17:58:32 +0300
In-Reply-To: <20190823141930.GA11610@roeck-us.net>
References: <fafd757238e204b2566f216f1d6a4bef4b4906c5.camel@yadro.com>
 <20190823141930.GA11610@roeck-us.net>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-23 at 07:19 -0700, Guenter Roeck wrote:
> >  
> > +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> > +static ssize_t access_cs0_show(struct device *dev,
> > +		struct device_attribute *attr, char *buf)
> > +{
> > +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> > +
> 
> Unnecessary empty line.
> 

Ok, will cut.

> > +static ssize_t access_cs0_store(struct device *dev,
> > +			      struct device_attribute *attr,
> > +			      const char *buf, size_t size)
> > +{
> > +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> > +	unsigned long val = 0;
> 
> Unnecessary initialization.

So, you're saying 'unsigned long val;' is enough? Will do then.

> 
> So the attribute would only exist if the boot was from the secondary
> flash, and it would exist even if it wasn't needed (ie on ast2500 /
> ast2600)?
Yes, only at secondary flash it will be available.
Also, found out that is for 2600 aspeed completely changed the process of
switch. For 2500 it just swaps chipselects back to make it accordingly as at
first side, on idea it may be helpful.

May be some approach like this will suffice?
if ((of_device_is_compatible(np, "aspeed,ast2400-wdt") or
(of_device_is_compatible(np, "aspeed,ast2500-wdt"))
	wdt->wdd.groups = bswitch_groups;


>  Well, if that is what you want, who am I to argue, but
> you'll have to document it accordingly. When you do so, please also
> document what happens on ast2500 / ast2600 when the attribute exists
> and is written.
> 

Ok, I'll put it in Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
for next patch set.

