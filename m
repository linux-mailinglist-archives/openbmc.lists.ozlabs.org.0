Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 546473169CD
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 16:12:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbNXY0dpTzDwfw
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 02:12:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=kRP6pbQL; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbLWN0lLgzDsmh
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 00:41:03 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 952C94127C
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1612964453; x=1614778854; bh=4vSozRjdPG5OssbpGnYKEVSEZ
 xN+pgx3RH6bev04qCs=; b=kRP6pbQL+x8lbCS9/3E+NroMFLw8q3H7V3Di1s/mB
 +03oW+3DOf5xoEjP8Hg13tI7Upf2jGqKYFeAnRGbOZ/L7tNqqQvNT81GC7OQtyAl
 4VR8BYAzj5osOE65agthrfh1ucy82ed9BKOv6l0d8KIgtKzrrnWPo0VFQaBOH6v4
 ck=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDx0ZR7ao72U for <openbmc@lists.ozlabs.org>;
 Wed, 10 Feb 2021 16:40:53 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0DC24404AD
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 16:40:53 +0300 (MSK)
Received: from [10.199.0.64] (10.199.0.64) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 10
 Feb 2021 16:40:52 +0300
Message-ID: <fd4a04a5c1cc11589413fc44a27c863d600f9896.camel@yadro.com>
Subject: Re: Kernel moving to Linux v5.10, dropping PECI
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Wed, 10 Feb 2021 16:40:51 +0300
In-Reply-To: <CACPK8XcCVmibRzOvrca87pzWzg0K5=ZBMeFQE7xorcLN8gxQdQ@mail.gmail.com>
References: <CACPK8XcCVmibRzOvrca87pzWzg0K5=ZBMeFQE7xorcLN8gxQdQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.64]
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

On Wed, 2021-02-10 at 12:43 +0000, Joel Stanley wrote:
> The openbmc kernel will move to a 5.10 based tree for Aspeed and
> Nuoton machines.
> 
>     linux-openbmc: Move to Linux 5.10
> 
>     This moves the OpenBMC kernel to a v5.10 base for both Aspeed and
>     Nuvoton. There are 125 patches in the tree, with 80 of those
> patches not
>     yet queued for merging in v5.11.
> 
>     Notably the PECI patchset has been dropped as the author, Intel,
> has
>     elected to develop it out of tree instead of submitting it for
> mainline
>     inclusion.
> 
>     https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40404
> 
> Regarding the PECI situation, I raised it on the list back in August.
> The conversation finished up in October with a commitment that the
> work would be done as soon as possible.
> 
> This kernel config option is enabled by machines from Facebook,
> Bytedance, HPE, Lenovo, Quanta and Supermicro. (Surprisingly Intel
> doesn't enable it on their platform?). It would be great for someone
> from one of those teams to step up and submit the PECI patchset
> upstream.

Intel enable PECI in their downstream port 
https://github.com/Intel-BMC/openbmc , where they do have downstream
fork of the kernel with PECI patches: 
https://github.com/Intel-BMC/linux
We used to branch from the fork for our x86 platform, so now it's
really tricky for us to follow upstream. We will very appropriate if
one will push PECI patches upstream, but this is still Intel's code
under development and this sounds a bit risky if someone but Intel do
upstreaming. 
So I'd like first to see Intel's position about not to upstream the
patches: what is the problem there?

> 
> In the meantime these in-tree systems will regress their PECI support
> until the patchset is submitted to mainline.
> 
> Cheers,
> 
> Joel
-- 
Best regards,
Andrei Kartashev


