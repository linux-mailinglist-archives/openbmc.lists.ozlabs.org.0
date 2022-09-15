Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37D5B9F1C
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 17:44:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT1jF2dRBz3bly
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 01:44:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4LRwgaa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4LRwgaa;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT1hn0V5Nz303C
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 01:44:08 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id p5so22684753ljc.13
        for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=MTL0p90qhzvaa9Qy56q//m1syQEZ7USkfPoHOhnC+Jk=;
        b=i4LRwgaaHJksuuObJshFcKX+A8JNBcL+Ao+YGHOdxMOCYShEucRokxxF6gOHrXTJHa
         YR++plI15/TCx9YyE0mL8MbPscbkG/3bNcqcD/mxXVj529K9j/K9KTWdux7g41+xi+9z
         iUyusKCJEGpkr+pq8hcndXL9cm2FKfIlZ56kRietnjgf6/RHtWfr2yX4SKFtejcaDBYE
         7GWawXejycAX8ArJ6fTbFNJVMFJfgc1tNZZcK6haqy2n3KE/aeC6bZWaGoVZ+snXWL0d
         Ei8vmUclBUcceGA+2uKXNCDSP1QlaN3mX9FfXne5aS2EGTkpfntCGVADIHE5MSVMf2En
         xCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=MTL0p90qhzvaa9Qy56q//m1syQEZ7USkfPoHOhnC+Jk=;
        b=zgm1iC1MNYc0RHWCP5cYS6TsZ5vr9TKl8Zg+y7eKkVRwslHwV0EF0H5ShpsF4FnXRl
         Haj0p/jSSugqaPoKSTOcoTM7m6wypVqJJHVCl6So4SeHiADvtVJW+r9U/fAoHQjroxOq
         6/3oX8+817K8hrArRdL09FlpeHc9O/4UQkzD0pLpmuBbKOlu2HPzGj3KhQIhVjYQgyLv
         y16K3RXiF2HV0XHkzUpw8H9ks+kAgB1qJBaOOyOuf/hBLDNHxMCgt08dvOw/kaP9QhMw
         wrmYl9sEf0c43dChrAdOssn+ODpWKJO4GQPtghz7JSZRyxxLf/wdpaU4dxPm+iKzDC0y
         PHYQ==
X-Gm-Message-State: ACrzQf2P9etacjkegP4JbAHHjZ50CBBsRcgB7OMTUPvnNa9PqILBiZ4P
	6IBgtqHMM/jkwUs+2d8rS50=
X-Google-Smtp-Source: AMsMyM4mMip9R4TrOPWPmHEJYLs0UBjYnWs4kk4CsebSxVXPFnhwWHIwh1bmvU/AflVI3wAdUerAFg==
X-Received: by 2002:a05:651c:1611:b0:261:e11c:c2ef with SMTP id f17-20020a05651c161100b00261e11cc2efmr108775ljq.340.1663256643779;
        Thu, 15 Sep 2022 08:44:03 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id o20-20020ac24bd4000000b0049c29292250sm1748961lfq.149.2022.09.15.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:44:03 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 28FFi0gJ021928;
	Thu, 15 Sep 2022 18:44:01 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 28FFhwaf021927;
	Thu, 15 Sep 2022 18:43:58 +0300
Date: Thu, 15 Sep 2022 18:43:58 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Message-ID: <YyNIPjNX9MCI3zkK@home.paul.comp>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
 <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
 <Yxrun9LRcFv2QntR@home.paul.comp>
 <36c12486-57d4-c11d-474f-f26a7de8e59a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c12486-57d4-c11d-474f-f26a7de8e59a@linux.intel.com>
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Sep 13, 2022 at 10:12:06AM +0800, Jiaqing Zhao wrote:
> On 2022-09-09 15:43, Paul Fertser wrote:
> > On Fri, Sep 09, 2022 at 03:34:53PM +0800, Jiaqing Zhao wrote:
> >>> Can you please outline some particular use cases for this feature?
> >>>
> >> It enables access between host and BMC when BMC shares the network connection
> >> with host using NCSI, like accessing BMC via HTTP or SSH from host. 
> > 
> > Why having a compile time kernel option here more appropriate than
> > just running something like "/usr/bin/ncsi-netlink --package 0
> > --channel 0 --index 3 --oem-payload 00000157200001" (this example uses
> > another OEM command) on BMC userspace startup?
> > 
> 
> Using ncsi-netlink is one way, but the package and channel id is undetermined
> as it is selected at runtime. Calling the netlink command on a nonexistent
> package/channel may lead to kernel panic.

That sounds like a bug all right. If you can reproduce, it's likely
the fix is reasonably easy, please consider doing it.

> Why I prefer the kernel option is that it applies the config to all ncsi
> devices by default when setting up them. This reduces the effort and keeps
> compatibility. Lots of things in current ncsi kernel driver can be done via
> commands from userspace, but I think it is not a good idea to have a driver
> resides on both kernel and userspace.

How should the developer decide whether to enable this compile-time
option for a platform or not? If it's always nice to have why not
add the code unconditionally? And if not, are you sure kernel compile
time is the right decision point? So far I get an impression a sysfs
runtime knob would be more useful.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
