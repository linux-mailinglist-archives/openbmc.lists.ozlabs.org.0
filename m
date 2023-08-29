Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA678C770
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 16:23:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WVHGlBqa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZqQY3TmDz3bYt
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 00:23:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WVHGlBqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZqPt3Xhmz2xr6
	for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 00:22:22 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 397AA240004;
	Tue, 29 Aug 2023 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693318933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wnpy155cIYydMW3e208J8yS/ifVt33seKo++vJG/Yb8=;
	b=WVHGlBqaQr3iM9bpFVzT7ECtuevQ4EM7/8GvfCAsDoRcc2YrnYJKiPQF+EGLXAvKG6yTqV
	eEiKsSjtKHpjvbzTn49BzcufPBi49ob1W+Nn5QbesNR0tPp5GIu3dPoav75T/3sm9YGFAJ
	P2cpooTotzTNVyZkqaL5JOYfzV4nQHp5pPM5q6Ar93vYeNBbeqJIDuIq6F3wCZOhIijktB
	+H9eRhxTy9OoeAZvn266ZtojADLBm0KdjWLzKJcflre+LNPx98hOL5VPmM6xiplUYoUWe9
	nOUQCm/jALS5JhpG01ysoBgBdLX14/YPfN/8ciHdRepkUrGmxMtQtxkco6x8+Q==
Date: Tue, 29 Aug 2023 16:22:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Minying Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v4 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <2023082914221048e46085@mail.local>
References: <20230816012540.18464-1-mimi05633@gmail.com>
 <20230816012540.18464-2-mimi05633@gmail.com>
 <2023082322124382cfd168@mail.local>
 <CAL3ZnpxEuOQtpaqA7KLBr285JvTDJrcT+ZGYyjy7Bi-sVs5yVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL3ZnpxEuOQtpaqA7KLBr285JvTDJrcT+ZGYyjy7Bi-sVs5yVA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "mylin1@nuvoton.com" <mylin1@nuvoton.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "JJLIU0@nuvoton.com" <JJLIU0@nuvoton.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "KFLIN@nuvoton.com" <KFLIN@nuvoton.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/08/2023 21:35:36+0800, Minying Lin wrote:
> > Do you really have to check the part number every time you set the time?
> > I don't expect it to change once read in probe.
> >
> [Mia] Due to the 3018Y's topology, we need to set the TWO bit first to
> obtain the write time capability, but the 3015Y does not have this problem.
> Therefore, we use part number & TWO bit to determine whether we need to set
> the TWO bit first before set time.
> 

Sure but why don't you store the info somewhere instead of reading it
from the RTC every time?

> >
> > > +     if (part_num < 0) {
> > > +             dev_dbg(&client->dev, "%s: Failed to read part info
> > reg.\n", __func__);
> > > +             return part_num;
> > > +     }
> > > +
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
