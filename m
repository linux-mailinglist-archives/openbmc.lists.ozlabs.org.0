Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079C2B89C1
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 02:52:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2jT1XTbzDqWX
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 12:51:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=70.40.196.235;
 helo=gproxy7-pub.mail.unifiedlayer.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=E9zWzlCt; dkim-atps=neutral
X-Greylist: delayed 1445 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Nov 2020 12:51:08 AEDT
Received: from gproxy7-pub.mail.unifiedlayer.com
 (gproxy7-pub.mail.unifiedlayer.com [70.40.196.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc2hX5P60zDqVF
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:51:08 +1100 (AEDT)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id 27186216A55
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 18:26:57 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152]) by cmsmtp with ESMTP
 id fYitkJvindCH5fYiukQ4jy; Wed, 18 Nov 2020 18:26:57 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=N54H6V1B c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=TLnMg8FhEQBKgHsLnTUA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=75vtt6jxidqhOOdCVtUR7LT8iFbu0C38IO/svWRLDBE=; b=E9zWzlCtQXoPMglx8dz8xDM6qM
 F4w5cKFef8QuAenhDxrwP75qEHEs+STbTNSyeAmPtdEr5Axm6rcbyXxmeNDiGbFg416zS8cK4xalu
 RrJH/baG8ClqJB1UbtMIf05+h5UvK96P+/phIbuW8m3UVFWddFWmO7Ih/hzwNJLix6x4aEsU4lzyC
 qdFJkhg/hOVCt7P0kjkP1pFYDNvlqti616tRewVs8fu9J8qsUa+NT1oLYn5/IGekDyxDo+yHhkX8k
 kVG1XXRWY0QidkgasF0bfbGTTwg/ykWBnpMZhvcbesGTlem10D9JPrYqUEHOBG54G3Pe1G8ewrBQq
 nvmnkG2w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57144 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.93)
 (envelope-from <linux@roeck-us.net>)
 id 1kfYis-000JnP-0s; Thu, 19 Nov 2020 01:26:54 +0000
Date: Wed, 18 Nov 2020 17:26:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
Message-ID: <20201119012653.GA249502@roeck-us.net>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119010119.GA248686@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kfYis-000JnP-0s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57144
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Jean Delvare <jdelvare@suse.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, taoren@fb.com, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 05:01:19PM -0800, Guenter Roeck wrote:
> On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:
> > On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:
> > > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:
> > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > 
> > > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > > chip.
> > > 
> > > Hi Tao
> > > 
> > > Why are using sending a hwmon driver to the networking mailing list?
> > > 
> > >     Andrew
> > 
> > Hi Andrew,
> > 
> > I added netdev because the mailing list is included in "get_maintainer.pl
> > Documentation/hwmon/index.rst" output. Is it the right command to find
> > reviewers? Could you please suggest? Thank you.
> 
> I have no idea why running get_maintainer.pl on
> Documentation/hwmon/index.rst returns such a large list of mailing
> lists and people. For some reason it includes everyone in the XDP
> maintainer list. If anyone has an idea how that happens, please
> let me know - we'll want to get this fixed to avoid the same problem
> in the future.
> 

I found it. The XDP maintainer entry has:

K:    xdp

This matches Documentation/hwmon/index.rst.

$ grep xdp Documentation/hwmon/index.rst
   xdpe12284

It seems to me that a context match such as "xdp" in MAINTAINERS isn't
really appropriate. "xdp" matches a total of 348 files in the kernel.
The large majority of those is not XDP related. The maintainers
of XDP (and all the listed mailing lists) should not be surprised
to get a large number of odd review requests if they want to review
every single patch on files which include the term "xdp".

Guenter
