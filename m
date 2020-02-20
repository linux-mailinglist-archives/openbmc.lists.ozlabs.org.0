Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F706165449
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 02:32:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NHBT2wJrzDqSc
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 12:32:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YnmfKpLl; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NH9d5ZLPzDqBg;
 Thu, 20 Feb 2020 12:31:17 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id j17so171712pjz.3;
 Wed, 19 Feb 2020 17:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=szYg2AQsd4vPQUXlNOTQeaWlhRWbCJD6D1ASNIe6NPQ=;
 b=YnmfKpLlHDFp/4r9dbH9mYpcYtDzQkvfjIBwgZOS2FTAVbZEvFLZJV5cYEjVMHryDD
 ZinziWcgxAtkfqZWej/jlk7ErptUcF9zL/uzSUXVV0X8Y/ituH3Puhd62Y94Aby9OSkG
 3UbWxTFpyekwXSZdOygXreubDyUmc65byNxSAW4/uIxvOjBoGj1tmYLH0V8Xds/Gg/TB
 wiCCGBqvOvG9wBmmK/W8WPoO9RMwtjz/i6JLUr2rGsuV4PSe0tqMxW13nlDTwF5PGwPY
 melwQyeC74boGcoqQU9vlVMFYWCOnAYj9pFLH6QPl1xq/lpWe0zHUKeugY3TkPMfI2ps
 bZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=szYg2AQsd4vPQUXlNOTQeaWlhRWbCJD6D1ASNIe6NPQ=;
 b=B/KpobiuuEI4d8I3eTYR4hHtvF8iMBcyvHqi2a2Ux0Zd7gZ1PotvoGHM8QvQTtiMnx
 P6bBsIxOHM6Lc9mGMIydfkKVMdMnRgLUuLo2kizbSck8osQ0USYR7fcaYaThjJssC2cq
 xtHK8N1TucvkPcEWqzArCOnW4TLSmku1wB0nQRKA7ixyWsJHnusyhRztFw1CYx/Zk5qM
 +GU6RGMJvhewy5rM2YDWusjyUgcrLT9RI9EWeFiJg3sSYM9fzUwvpqy4glQqs5R7CbVE
 lIhI7RfzGzJOZXw1S/QepxSNFwXeD2QztbVjgXuh0ZGsm0D8Wu4tr5J8qQgnl4kj23KI
 6Gpg==
X-Gm-Message-State: APjAAAX/5rALGAcDu7tbHveKEaFUdUhNW6sYlISvoDENzhPC49ghdiXt
 egW5Yh6xIcOe4VsllkTHSkI=
X-Google-Smtp-Source: APXvYqyzmgvxyBGFHEKtfmbVHh4nsUmpCnOiJOLklUkLLXD00WNKvL2PU2ls8e+TkkBLFHlsbUTTpw==
X-Received: by 2002:a17:90a:b318:: with SMTP id
 d24mr687568pjr.142.1582162274835; 
 Wed, 19 Feb 2020 17:31:14 -0800 (PST)
Received: from taoren-ubuntuvm (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id u13sm957679pjn.29.2020.02.19.17.31.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 17:31:14 -0800 (PST)
Date: Wed, 19 Feb 2020 17:31:04 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 0/5] aspeed-g6: enable usb support
Message-ID: <20200220013103.GA4830@taoren-ubuntuvm>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
 <5d295199-d0d7-4d58-be29-4621738d7f28@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d295199-d0d7-4d58-be29-4621738d7f28@www.fastmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, Tao Ren <taoren@fb.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 20, 2020 at 10:55:10AM +1030, Andrew Jeffery wrote:
> 
> 
> On Tue, 18 Feb 2020, at 13:43, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > The patch series aims at enabling USB Host and Gadget support on AST2600
> > platforms.
> > 
> > Patch #1 replaces hardcoded vhub port/endpoint number with device tree
> > properties, so that it's more convenient to add support for ast2600-vhub
> > which provides more downstream ports and endpoints.
> 
> Ah, something I should have mentioned on the previous series is you'll need
> to update the binding documentation with the new properties.

Looks like we don't have dt binding documentation for this driver. I will add
the document in my 2nd patch set "allow to customize vhub device IDs/strings"
so all the new dt properties are included in the doc.

> > 
> > Patch #2 enables ast2600 support in aspeed-vhub usb gadget driver.
> 
> Also need to add the 2600 support to the dt binding document.
> 
> Looks good to me otherwise.
> 
> Andrew

Thanks again for the quick review, Andrew.


Cheers,

Tao
