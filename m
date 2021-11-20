Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D9457F1A
	for <lists+openbmc@lfdr.de>; Sat, 20 Nov 2021 16:52:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxJ1r5w5hz3bXc
	for <lists+openbmc@lfdr.de>; Sun, 21 Nov 2021 02:52:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=FUtRlNN/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=FUtRlNN/; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxJ1S68FQz2xXd
 for <openbmc@lists.ozlabs.org>; Sun, 21 Nov 2021 02:51:40 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A740144953;
 Sat, 20 Nov 2021 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1637423494; x=1639237895; bh=1wKxDDgGWsRFRHXp71LDHk+mG
 8Xfb9h3L9/g9D3lC9U=; b=FUtRlNN/Q8Idh8jYCiyiXLHlFB9mv8Zz3ZDJbcrVb
 wDKrqF2qvKS3N8UTLm057w7rGlQIKCEFY2EYW9wS11Z0rSkwCD0Nx0mUTYhB/diP
 1V+gFqUujgPtWwg5JxUKkg4r6Ts/z046ZTxyARhm+IaTNLtjouJhlMctkEDHfhp+
 M0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTekAli5ztyk; Sat, 20 Nov 2021 18:51:34 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 25DCC41FAA;
 Sat, 20 Nov 2021 18:51:33 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 20
 Nov 2021 18:51:32 +0300
Message-ID: <368313b889cbadc267b053cd808b080e9f6470a0.camel@yadro.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO
 VEGMAN BMC
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Andrew Geissler <geissonator@gmail.com>
Date: Sat, 20 Nov 2021 18:51:31 +0300
In-Reply-To: <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-3-a.kartashev@yadro.com>
 <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> 
> Can we utilize
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>  to get some consistent naming across the GPIO’s on OpenBMC machines?
> 

Some names here are standard for Intel daemons like x86-power-control,
host-error-monitor, pfr-manager, IntrusionSensor and so on. Other lines
just called same as in schematics to make it easy for our engineers to
understand what does it refer to. BTW, most of the lines there not used
by software and appeared just because dts files are supposed to be
hardware description and thus we describe all we have in schematics.

We can rename all this according to guide you mention, but are you
sure, there is any sense to do so?
Keep in mind, currently there are lot of dts files which also don't
follow convention, so I believe, it is unnecessary work. 

-- 
Best regards,
Andrei Kartashev


