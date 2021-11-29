Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB55461ECD
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 19:37:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2vGG0MC2z2yw1
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 05:37:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=OTwQzh1Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=OTwQzh1Z; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2vFs4Ckmz2yng
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 05:36:49 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DB93142890
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638211004; x=1640025405; bh=btq2mjKYIk9E4dI47Y3Du4z8d
 jSAhota/Ionehd6c/4=; b=OTwQzh1ZSz5mGz61xR+/c2R6WCUoD2IZVG+/A+c+X
 ZvBK7Np8//Tlfr4NE95tme5MhxwfkA31s83REBIA4UNMBv9RdrAzjmGLpqMBcBwh
 LUTdtzOmjQuXoB8diAShYr6JLz1D0Yfaee30/QQQCILKk6oBurDItyJGY4Ppd9iW
 lk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8ewy4PpLJv7 for <openbmc@lists.ozlabs.org>;
 Mon, 29 Nov 2021 21:36:44 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 53B6D42894
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 21:36:43 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 29
 Nov 2021 21:36:42 +0300
Message-ID: <c38c58809e2ab0327e303779fe154444d44b654a.camel@yadro.com>
Subject: Re: FRU Device type one byte or Two byte Validation
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Mon, 29 Nov 2021 21:36:41 +0300
In-Reply-To: <CAH2-KxD5G-+7F8d9xpCtE-ajdKyMiAUWy0zXvfk3=a+TFtrztw@mail.gmail.com>
References: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
 <CAH2-KxDNqXZ3uWeeUyP=uE=e6FAvzYKZYJoJLaeG0wGZzXBwzw@mail.gmail.com>
 <CAA7Tbcuy-FE19ygYOivGxoSRZAoPu+r-B1uoSXNJ=R7CYXhh3A@mail.gmail.com>
 <CAH2-KxD5G-+7F8d9xpCtE-ajdKyMiAUWy0zXvfk3=a+TFtrztw@mail.gmail.com>
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

> 
> > 
> > > > 
> > > >        We wanted to interlink this logic with entity-manager code
> > > > to get the device type.
> > > > 
> > > >        Could you please provide the suggestions on get the device
> > > > type in entity-manager.
> > > 
> > > Entity-manager provides the exposes records on dbus, for which
> > > reactors can pick them up and use them.
> > 
> > 
> > Is there any way to get the dynamic values (device type - 8bit/16bit
> > ) from the machine layer
> > to the entity-manager ?
> 

Just an idea came to mind:
This likely would not help in this case, but for situations when we
know in advance that on particular I2C bus/address there can be only
8bit or 16bit FRU EEPROM, we can avoid autodetection by having
configuration json file for the FruDevice.
There already was an attempt to introduce config file for FruDevice
here:
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/40039
And FruDevice already has blacklist json, so we can make more generic
config to have all this configurations.

-- 
Best regards,
Andrei Kartashev


