Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705C46B631
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Ybc1pR6z2ypL
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 19:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=uhVKWXS1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=uhVKWXS1; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7YbC47B3z2yJv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 19:37:59 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 990C74149B;
 Tue,  7 Dec 2021 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638866275; x=1640680676; bh=Pqpj2gVHp9/jU+iExGIG2nhIf
 8+sv12YFhDXrnwgC/Y=; b=uhVKWXS1TKiBnoyTQ1bcvJrTe5K80Unk6IZqUZUUy
 GCNjd36b1Pk09wTVZfLxmQa+0rbpdcxWuVhQ0HoduWUgCbQYYWSxoDONkVjFP8i7
 xrveY/joYGGMUIOUFyWTCsedsHqGOc8YKu/luBXwy3b2ucgMiXrbP+4SwgHHqFNv
 Lg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7CqOSGJOpP8; Tue,  7 Dec 2021 11:37:55 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EB13343834;
 Tue,  7 Dec 2021 11:37:53 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 7 Dec
 2021 11:37:53 +0300
Message-ID: <706caeeb14703abbc1399348ec4f11898b701c09.camel@yadro.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO
 VEGMAN BMC
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 11:37:49 +0300
In-Reply-To: <OF32EA8A79.571186E8-ON002587A4.002D0A6E-002587A4.002D0A73@ibm.com>
References: <CACPK8Xcpg+V7BB6vq8oqqu=g7FRoTLLmz7-4G5Cp=hn0ziEuyw@mail.gmail.com>
 ,<20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-3-a.kartashev@yadro.com>
 <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
 <368313b889cbadc267b053cd808b080e9f6470a0.camel@yadro.com>
 <OF32EA8A79.571186E8-ON002587A4.002D0A6E-002587A4.002D0A73@ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-12-07 at 08:11 +0000, Milton Miller II wrote:
> On Monday, December 6, 2021, Joel Stanley wrote:
> 
> > On Sat, 20 Nov 2021 at 15:51, Andrei Kartashev
> > <a.kartashev@yadro.com> wrote:
> > > 
> > > > 
> > > > Can we utilize
> > > > 
> [ gpio naming ]
> > > > to get some consistent naming across the GPIO’s on OpenBMC
> > machines?
> > > > 
> > > 
> > > Some names here are standard for Intel daemons like
> > x86-power-control,
> > > host-error-monitor, pfr-manager, IntrusionSensor and so on. Other
> > lines
> > > just called same as in schematics to make it easy for our
> > > engineers
> > to
> > > understand what does it refer to. BTW, most of the lines there
> > > not
> > used
> > > by software and appeared just because dts files are supposed to
> > > be
> > > hardware description and thus we describe all we have in
> > schematics.
> > > 
> > > We can rename all this according to guide you mention, but are
> > > you
> > > sure, there is any sense to do so?
> > > Keep in mind, currently there are lot of dts files which also
> > > don't
> > > follow convention, so I believe, it is unnecessary work.
> > 
> > I have a strong preference for using the naming document. It
> > provides
> > consistency, which makes it easier to review. I'm encouraging that
> > for
> > any new dts.
> > 
> > If you think it makes the descriptions less useful for your
> > platform
> > then that's a reasonable reason to not follow the convention.
> > 
> 
> Actually, what I would prefer is that these well established signal
> names that appear in the x86 industry servers be enumerated in the
> gpio naming document and be accepted like the original OpenPOWER
> legacy names were.   This will clearly show the names that appear 
> on other systems and will help reviewing things like power control 
> applications.
> 
> Andrei does this sound reasonable?

Actually, as TOF member I can't decline this input, it really sounds
reasonable and important for OBMC in common. I will take this action,
but this will require some time since now I'm working on other tasks.

-- 
Best regards,
Andrei Kartashev


