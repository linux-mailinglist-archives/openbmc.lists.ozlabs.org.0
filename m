Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61BA4E646A
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 14:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPRS75rt4z30GN
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 00:50:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=dIPrf4M0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=dIPrf4M0; dkim-atps=neutral
X-Greylist: delayed 451 seconds by postgrey-1.36 at boromir;
 Fri, 25 Mar 2022 00:49:57 AEDT
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPRRn6wBPz2x9S
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 00:49:57 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2AE1C41B56;
 Thu, 24 Mar 2022 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1648129339;
 x=1649943740; bh=BAjTdwLn08Veb99uQ8Tt5B4/gjCu+U/+nLMEyjTmvgk=; b=
 dIPrf4M0PlH5ujsYz7zo7MHCEKY+b/XyLzd98qt0sdK9r7IhzBdY3bfsC9SkeOED
 0Xb0uv4JlLRlhXVcAcrh2Q9oWsgmX14hlSUUw4xaSgb+Q//W+Khgr2ADnZG2+5CC
 LaU0mZPA9XflanBscgu2kNWajMGnVnksDDIzWOYoHcg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAFj4W5DwJUo; Thu, 24 Mar 2022 16:42:19 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4F0A441B10;
 Thu, 24 Mar 2022 16:42:18 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Mar 2022 16:42:18 +0300
Date: Thu, 24 Mar 2022 16:42:17 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: sri d <srid.11486@gmail.com>
Subject: Re: Multi-led configuration in dts
Message-ID: <Yjx1OQt7YRgD0OHt@nbwork.lan>
References: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
X-Originating-IP: [172.17.1.114]
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
Cc: spinler@us.ibm.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 24, 2022 at 06:26:07PM +0530, sri d wrote:
> 
> Hi Team,
> 
> I am working on implementing Power and system identification LEDs, in which LEDs are connected to GPIO pins directly. I need to handle two colors (blue & yellow) for LEDs in *.dts file.
> In phosphor-led-sysfs repo, whether multi-led configuration is handled ? https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 

You could define them as two standalone LED and manage them separately.
It works fine even for a paired LED until you want to synchronized switching
(for example: the blinking of mixed color).


> As far as I analyzed, multi-led seems to work for dedicated LED controllers and not for GPIO pins directly. Is there a way we can make it work for directly connected GPIOs ?
> https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.9-Multi-Color-LEDs
> 

The multi-color LEDs are not supported by the gpio-led driver yet.

We have a desire to implement multi-color LED support in gpio-led driver, but
it's a low priority task and I can't tell when it will be done. :)

> Thanks,
> Jayashree

--
Cheers,
Alexander
