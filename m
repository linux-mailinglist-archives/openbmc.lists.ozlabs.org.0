Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5C2C1D49
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 06:19:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgC4342MczDqLl
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 16:18:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=enymUa6h; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgC3F0ctkzDqKM
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 16:18:16 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 48C9441276;
 Tue, 24 Nov 2020 05:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1606195085; x=1608009486; bh=YeOcUedhePVYdJrQT0Ym1Ut29
 UPOUa4GzrwBkN8kvj0=; b=enymUa6h7s3KFh+jpGnd7ip4z0qzWBr9Xd20DbN6/
 YZ7cejeTC4u9im2Fb9H0iMELNl7Gi3BOTzlh0UpT56N58nGpkcOIYNZowCPllRC0
 9JGE6LsF1h6X7Sfwv/11SuYxfeMS3no1XRsbRSS+SynWnBV/JGAgab0pVXjPq4lc
 ns=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ir2Ax7miCql9; Tue, 24 Nov 2020 08:18:05 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9CAAE41259;
 Tue, 24 Nov 2020 08:18:05 +0300 (MSK)
Received: from [10.199.0.34] (10.199.0.34) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 24
 Nov 2020 08:18:05 +0300
Message-ID: <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
Subject: Re: Unresponsive BMC after booting into Ubuntu
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Date: Tue, 24 Nov 2020 08:17:59 +0300
In-Reply-To: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
References: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.34]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi,
I had similar issue, but it was just "not loading some pages in webui
and doesn't response on ipmi commands", ssh and serial console used to
work. And yes, it appears after Linux boots on the host, but not with
Windows.
The root problem in my case was in PECI driver and power saving CPU
modes.
Here was the patch which solves the problem for me:
https://patchwork.ozlabs.org/project/openbmc/patch/e6f4ab29854ac58a878189c1edece4e8eed2e7fd.camel@yadro.com/

I'm not sure if it is your problem also, if you use dbus-sensors you
can check by stopping CPUsensor: 
	systemctl stop xyz.openbmc_project.cpusensor.service
If the problem gone after this, you got it =)


On Mon, 2020-11-23 at 22:49 +0000, Patrick Voelker wrote:
> I have a situation where, while booting the host into Ubuntu desktop
> 18.04, my OpenBMC ast2500 BMC stops responding on all interfaces
> including its debug serial console.  It doesn't do this when the host
> boots into Windows.
> 
> Nothing came up when I did an initial google search.  Also, nothing
> unusual jumps out at me if I watch the BMC's 'journal -f' prior to
> the issue.  No kernel panic or anything like that.
> 
> Are there any known issues like this?  If not, are there some
> pointers to relevant debug strategies for when BMC is not
> available?  I'd like to avoid JTAG debugging the kernel if
> possible.  :-)
> 
-- 
Best regards,
Andrei Kartashev


