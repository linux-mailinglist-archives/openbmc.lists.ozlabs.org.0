Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D09383CFB2F
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 15:51:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTg9Y5gp5z3bkh
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 23:51:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=BuOt/l22;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=BuOt/l22; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTg8s4txJz3bTk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 23:50:53 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 531AE49E49;
 Tue, 20 Jul 2021 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1626789048; x=1628603449; bh=qqKIsxqdrcNF/IKpkTk+z2h38
 NvJz05bthgnU5UbwnE=; b=BuOt/l22UsVmsW/7GpB9fRgKo+wW8/1+ywe/WYk+4
 5LJmV4/mcYJtxlQpe2YMJxYoxg16z5TWttpbDz35xbkGKLlN/Cgwxk0MddcNgKU8
 ddsi44BlLVWTra3H+6aT9Za3bTt59PumRx8L9VNqpM22AUtGYEdF0XB+vUi8QcZz
 nU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n03l0el1CeA3; Tue, 20 Jul 2021 16:50:48 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 34FBB49E6C;
 Tue, 20 Jul 2021 16:50:48 +0300 (MSK)
Received: from [10.199.0.81] (10.199.0.81) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 20
 Jul 2021 16:50:47 +0300
Message-ID: <10902992a9dfb5b1b4f1d7a9e17ff0e7b121b50b.camel@yadro.com>
Subject: Re: [PATCH v2 0/3] net/ncsi: Add NCSI Intel OEM command to keep PHY
 link up
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Paul Fertser <fercerpav@gmail.com>
Date: Tue, 20 Jul 2021 17:00:40 +0300
In-Reply-To: <20210720095320.GB4789@home.paul.comp>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210720095320.GB4789@home.paul.comp>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.81]
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-07-20 at 12:53 +0300, Paul Fertser wrote:
> Hello,
> 
> On Thu, Jul 08, 2021 at 03:27:51PM +0300, Ivan Mikhaylov wrote:
> > Add NCSI Intel OEM command to keep PHY link up and prevents any channel
> > resets during the host load on i210.
> 
> There're multiple things to consider here and I have hesitations about
> the way you propose to solve the issue.
> 
> While the host is booted up and fully functional it assumes it has
> full proper control of network cards, and sometimes it really needs to
> reset them to e.g. recover from crashed firmware. The PHY resets might
> also make sense in certain cases, and so in general having this "link
> up" bit set all the time might be breaking assumptions.

Paul, what kind of assumption it would break? You know that you set that option
in your kernel, anyways you can look at /proc/config.gz if you have hesitations.
In other ways, if you're saying about possible runtime control, there is ncsi-
netlink control and solution from phosphor-networkd which is on review stage.
Joel proposed it as DTS option which may help at runtime. Some of those commands
should be applied after channel probe as I think including phy reset control.

> As far as I can tell the Intel developers assumed you would enable
> this bit just prior to powering on the host and turn off after all the
> POST codes are transferred and we can assume the host system is done
> with the UEFI stage and the real OS took over.
> 
> OpenBMC seems to have all the necessary hooks to do it that way, and
> you have a netlink command to send whatever you need for that from the
> userspace, e.g. with the "C version" ncsi-netlink command to set this
> bit just run:
> 
> ncsi-netlink -l 3 -c 0 -p 0 -o 0x50 0x00 0x00 0x01 0x57 0x20 0x00 0x01
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/36592
> would provide an OpenBMC-specific way too.

I know about it, Eddie posted that link before.

> There's another related thing to consider here: by default I210 has
> power-saving modes enabled and so when BMC is booting the link is
> established only in 100BASE-T mode. With this configuration and this
> bit always set you'd be always stuck to that, never getting Gigabit
> speeds.
> 
> For server motherboards I propose to configure I210 with this:
> ./eeupdate64e /all /ww 0x13 0x0081 # disable Low Power Link Up
> ./eeupdate64e /all /ww 0x20 0x2004 # enable 1000 in non-D0a
> (it's a one-time operation that's best to be performed along with the
> initial I210 flashing)

Good to know, thanks.

> Ivan, so far I have an impression that the user-space solution would
> be much easier, flexible and manageable and that there's no need for
> this command to be in Linux at all.

You may not have such things on your image with suitable env which you can rely
on. There is smaf for mellanox which is done in the same way for example.

Thanks.

