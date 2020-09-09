Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79462262E0A
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 13:43:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmgBZ1ybXzDqV8
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 21:43:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=VAeB0MOm; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmg5M0wCszDqNp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 21:38:45 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B5581574FB;
 Wed,  9 Sep 2020 11:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599651519; x=1601465920; bh=Ol3ikWiBZtMkCeafL3FbA797T
 vxK6xSfrUTKYioELqY=; b=VAeB0MOmiph07/VCSqrFXO+W9XY+K+RQnzKNZshzF
 XY5sUktOylq69kd94/ytfOsCyKfDd+X0igcPaCgoKY3TFS+Pp/L6kqIYsNv+Jt2z
 BrR/PGlilzJlzLLYyX1bVFpDGxLMYAmItgrxzVYYxIoEmaQohE1KR0iTKaZoNYbX
 Z4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGlyP9HOPcs6; Wed,  9 Sep 2020 14:38:39 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0A7C9535F4;
 Wed,  9 Sep 2020 14:38:38 +0300 (MSK)
Received: from localhost.localdomain (10.199.3.14) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 9 Sep
 2020 14:38:38 +0300
Message-ID: <d1efa5565fd0884d332c449f3a95075e20ff540e.camel@yadro.com>
Subject: Re: time control on wolfpass BMC
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: James Feist <james.feist@linux.intel.com>
Date: Wed, 9 Sep 2020 14:41:53 +0300
In-Reply-To: <e1bb6593-63a7-4460-b5cd-f53d0e85384b@linux.intel.com>
References: <a140b8dd494792d0d814cd20e6e4ab4b2714c16c.camel@yadro.com>
 <e1bb6593-63a7-4460-b5cd-f53d0e85384b@linux.intel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.3.14]
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
Cc: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-08 at 10:53 -0700, James Feist wrote:
> On 9/8/2020 7:47 AM, Ivan Mikhaylov wrote:
> > Hey James, Ed, Is there any way to control RTC/PCH time inside BMC on
> > wolfpass?In intel-bmc rep there is the pch-time-sync service which is doing
> > sync.
> > The service just reads out date via i2c regs and do the sync with system
> > time. I
> > didn't find any other utilities or something which can help with time set
> > from
> > BMC.
> 
> We default to NTP and use pch-time-sync as a fallback. NTP is configured 
> by systemd-timesyncd https://wiki.archlinux.org/index.php/Systemd-timesyncd.
> 

James, do you know this PCH time sets on the host side as regular sync hwclock
action? Are those i2c regs writable only from host side?

Thanks a lot for clarification.

