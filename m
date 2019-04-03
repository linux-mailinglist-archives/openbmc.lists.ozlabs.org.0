Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3518539
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:16:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45034Z1FWQzDq8g
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:15:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=toxicpanda.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=josef@toxicpanda.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=toxicpanda.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=toxicpanda-com.20150623.gappssmtp.com
 header.i=@toxicpanda-com.20150623.gappssmtp.com header.b="aDYM57vo"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZD9D3rkTzDqDK
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 04:49:15 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id k130so10715841qke.3
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+514+2lqNMNTuj5sabZ2RkXSxdhWR/VQGts8wdfq6AA=;
 b=aDYM57vo/h3E5OZ4fkR0ji2SMTjIxbLCU7upfbDF5883YqMYAlvzh+axC9ewpv1WmB
 3BkfrM/5NZnzowHYAip7/Fh2gkk9hSH2SD87jqZ2vq2HYevFzrM3ooGA8MCZPJeXoBuZ
 uv9aVPoVfZQaYdnvV2g/9S6WxKsGIU9J6uq+0M0naBWqTyV+cKEUH3xr5iwc2lY56a41
 GW9L8XFtEeSln+lAZsSAp2qj2zP1yCgpuCo0cUp4zbQ0iuqZWKvRxo86C9Z3+Gf2dUvO
 tN09BgKAy2Yzi5zmWciFFNydtFUCUB8GHowG35EKlGVinDCn0KK+Y18y8f0dEgyNOkS/
 EPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+514+2lqNMNTuj5sabZ2RkXSxdhWR/VQGts8wdfq6AA=;
 b=XGsrNn4P2z8zoRhEBrBbhQZFum3gt71OKKcfFtanBMbspIpunlklhoujfBT0g4SqyZ
 NcXLEddR4CZRicUaoNZUuRhY/kKo4kmlc8DN/1UhbEkS1OTPdDwJ3ymbEtbMwzgZyX7n
 CMFdzVYuCj95YYGUwZvD1U6B7jbShiYp4EADl/01aSH0ueYI2bmQgH1+2TzFcRS12g4n
 FXYW2Vj9RzRnQXRGurXfwKHl/A/BpTcj4GK8sPrAr0nZgrtncvWJVqCzA4iY5jl0MEBj
 UN5m5GHS0lucG+TKjad0aBtp7OB6ZlCyhDrQ1EeO9WjH+pnr48YNH5VXntuQvouRdGFJ
 8iOw==
X-Gm-Message-State: APjAAAWwEvuoLBUbqnykMguxMIv3stZhcD1reEJFCCkvbVgUCrKlKTAx
 gFPPnkZhf0np/zYOrKCrNZutLA==
X-Google-Smtp-Source: APXvYqyP6vQYoDaZm+jvFCOAoIAKFB44H4O+dwpNwG7a7dXM9U2S8GWq4xZPrCH5MRKVfaNmWg9vGw==
X-Received: by 2002:a37:69c3:: with SMTP id e186mr1252442qkc.308.1554313751651; 
 Wed, 03 Apr 2019 10:49:11 -0700 (PDT)
Received: from localhost ([107.15.81.208])
 by smtp.gmail.com with ESMTPSA id 11sm11759536qtu.5.2019.04.03.10.49.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Apr 2019 10:49:10 -0700 (PDT)
Date: Wed, 3 Apr 2019 13:49:09 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: [PATCH] nbd:clear NBD_BOUND flag when NBD connection is closed
Message-ID: <20190403174908.jk6xuhzvn2gm2l2g@MacBook-Pro-91.local>
References: <1544509023-18923-1-git-send-email-medadyoung@gmail.com>
 <a1da3fff285fe13d04522f1a6e72bdc1@linux.vnet.ibm.com>
 <7e192d24976532141c8c985329f5ca1c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e192d24976532141c8c985329f5ca1c@linux.vnet.ibm.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:01 +1000
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
Cc: axboe@kernel.dk, openbmc@lists.ozlabs.org, josef@toxicpanda.com,
 nbd@other.debian.org, linux-block@vger.kernel.org, medadyoung@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2019 at 12:13:53PM -0500, Adriana Kobylak wrote:
> Adding Josef (updated email address in the maintainers file).
> 
> On 2018-12-13 08:21, Adriana Kobylak wrote:
> > On 2018-12-11 00:17, medadyoung@gmail.com wrote:
> > > From: Medad <medadyoung@gmail.com>
> > > 
> > >     If we do NOT clear NBD_BOUND flag when NBD connection is closed,
> > >     then the original NBD device could not be used again.
> > > 
> > > Signed-off-by: Medad <medadyoung@gmail.com>

This doesn't sound right, this is just making sure we don't use the IOCTL
configuration stuff with the netlink stuff.  Once the disconnect happens the
configuration should go away and it doesn't matter anymore.  What are you doing
to reproduce this problem?  Thanks,

Josef
