Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2B2BA205
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:46:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CclsW2GBPzDqxg
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:46:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LGJcQBr5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGJcQBr5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcQKb4ZX3zDqkq
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 03:35:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605803753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmz4vMCo9cJbvNaKXKHUnIBAy5VUu+3pBNzGePwX/CQ=;
 b=LGJcQBr5v4/qtQY4U20Y3P1ZzzIIcmQAvmcArL7LT3uiqZN3xX3TnZkT04DCNyZZky7vhr
 kEpWlxATej7TV53dtKKBvKtVvGJGA9JN+nDF/KKJk3lopuV67cXZ+r73FRG9zHqxP2pThZ
 xuNJEkf7/yp3RmIIZxp28ZhWetj7pqc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605803753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmz4vMCo9cJbvNaKXKHUnIBAy5VUu+3pBNzGePwX/CQ=;
 b=LGJcQBr5v4/qtQY4U20Y3P1ZzzIIcmQAvmcArL7LT3uiqZN3xX3TnZkT04DCNyZZky7vhr
 kEpWlxATej7TV53dtKKBvKtVvGJGA9JN+nDF/KKJk3lopuV67cXZ+r73FRG9zHqxP2pThZ
 xuNJEkf7/yp3RmIIZxp28ZhWetj7pqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-5cgFMGosMYiOELAYXE56dw-1; Thu, 19 Nov 2020 11:35:48 -0500
X-MC-Unique: 5cgFMGosMYiOELAYXE56dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A21D91005D5F;
 Thu, 19 Nov 2020 16:35:44 +0000 (UTC)
Received: from carbon (unknown [10.36.110.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BD6B60636;
 Thu, 19 Nov 2020 16:35:36 +0000 (UTC)
Date: Thu, 19 Nov 2020 17:35:35 +0100
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, Joe Perches <joe@perches.com>
Subject: XDP maintainer match (Was  [PATCH v2 0/2] hwmon: (max127) Add Maxim
 MAX127 hardware monitoring)
Message-ID: <20201119173535.1474743d@carbon>
In-Reply-To: <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
 <20201119012653.GA249502@roeck-us.net>
 <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:21 +1100
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
 linux-kernel@vger.kernel.org, taoren@fb.com, brouer@redhat.com,
 Tao Ren <rentao.bupt@gmail.com>, bpf@vger.kernel.org, mikechoi@fb.com,
 "David S .
 Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 19 Nov 2020 07:46:34 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 18 Nov 2020 17:26:53 -0800 Guenter Roeck wrote:
> > On Wed, Nov 18, 2020 at 05:01:19PM -0800, Guenter Roeck wrote:  
> > > On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:    
> > > > On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:    
> > > > > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:    
> > > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > > 
> > > > > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > > > > chip.    
> > > > > 
> > > > > Hi Tao
> > > > > 
> > > > > Why are using sending a hwmon driver to the networking mailing list?
> > > > > 
> > > > >     Andrew    
> > > > 
> > > > Hi Andrew,
> > > > 
> > > > I added netdev because the mailing list is included in "get_maintainer.pl
> > > > Documentation/hwmon/index.rst" output. Is it the right command to find
> > > > reviewers? Could you please suggest? Thank you.    
> > > 
> > > I have no idea why running get_maintainer.pl on
> > > Documentation/hwmon/index.rst returns such a large list of mailing
> > > lists and people. For some reason it includes everyone in the XDP
> > > maintainer list. If anyone has an idea how that happens, please
> > > let me know - we'll want to get this fixed to avoid the same problem
> > > in the future.  
> > 
> > I found it. The XDP maintainer entry has:
> > 
> > K:    xdp
> > 
> > This matches Documentation/hwmon/index.rst.
> > 
> > $ grep xdp Documentation/hwmon/index.rst
> >    xdpe12284
> > 
> > It seems to me that a context match such as "xdp" in MAINTAINERS isn't
> > really appropriate. "xdp" matches a total of 348 files in the kernel.
> > The large majority of those is not XDP related. The maintainers
> > of XDP (and all the listed mailing lists) should not be surprised
> > to get a large number of odd review requests if they want to review
> > every single patch on files which include the term "xdp".  
> 
> Agreed, we should fix this. For maintainers with high patch volume life
> would be so much easier if people CCed the right folks to get reviews,
> so we should try our best to fix get_maintainer.
> 
> XDP folks, any opposition to changing the keyword / filename to:
> 
> 	[^a-z0-9]xdp[^a-z0-9]
> 
> ?

I think it is a good idea to change the keyword (K:), but I'm not sure
this catch what we want, maybe it does.  The pattern match are meant to
catch drivers containing XDP related bits.

Previously Joe Perches <joe@perches.com> suggested this pattern match,
which I don't fully understand... could you explain Joe?

  (?:\b|_)xdp(?:\b|_)

For the filename (N:) regex match, I'm considering if we should remove
it and list more files explicitly.  I think normal glob * pattern
works, which should be sufficient.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

