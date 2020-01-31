Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15114F4D2
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 23:37:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488XCR5SxPzDqdG
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 09:37:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lDra1qh5; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488XBr45v3zDqcn
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 09:36:34 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id r67so3516279pjb.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 14:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uYZEm0INzrdIayljD4bc7Hbhm9MJ1GCTdIMQygedjS4=;
 b=lDra1qh5NSvj1ltdQOPb4xzuKbYHdlaycOVfOwdmXoLr1w83nSj6IxzT79GMq2KYfU
 PSXxNzsIJqu2kEzjs7JGvkmLsmYKgP5wyWpRDuVrye3o9vdijWuULOrspJbu7geUsnqZ
 oJvBqI30/5ZfdnEDfmNcwQM9KkOGQjlhh2d2uAeIVDQNZJg/E4i2cZt03VX5PeWKU6GF
 FQqsAO1n8C8fKmVkuTZOFVKAu8VyDQzRUgWeYSXykJHwyrr/54ldDlRS16eB8eDe5t+P
 IPgv6OYiGgUzikjxEyWV2Ujh8fW/zTGZKvnB4IJayVGjpGMGA+Xg3fVgQl9slOyG9Vbd
 RYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uYZEm0INzrdIayljD4bc7Hbhm9MJ1GCTdIMQygedjS4=;
 b=J5UO8oVxrrY4E+dqYNOPO+GSPZ61i8gfelElTIxYNW6PuMF8QxknzVCKtRR2NsiWRL
 c5q6wMSW/QQmlh4hLysM2S3mYcvDT8Yw32RjOl4FzcQA0GG3H7BsNpzdqlI2c5E1Bro0
 R46IPlQ+6JqOpk17tTm6a1dGc4G+MvJc0tMbk01QhIMyIkvmCapKhNys/rVegn8TWaj1
 2VlfBbaT2Q0OibDgNh9eBaiUHkGWkb5TJVhdwP48cGQQxd3HDD5oWConMUThllPqqRUw
 xUG7hxlkNJ1iJWEA3knw5VDRaUBFw+WMaQ0TQtDpA16NC9CwynNpWmn542GbiO8d7XB3
 Vv6A==
X-Gm-Message-State: APjAAAVkCLpDne8W0Sapp2NkN7/mmaXIqslsj2C3UyiUlKWmW2xRMD6y
 VxdiKs+5/+gpbDdSdlpws1A=
X-Google-Smtp-Source: APXvYqzNd9bbz77OEQDkrWzijD1Psh3irv6XDzpc6tdbQkloUUX1adR2LflizmOLXIzUnlM3x0xfzA==
X-Received: by 2002:a17:90a:8043:: with SMTP id
 e3mr14488242pjw.24.1580510190870; 
 Fri, 31 Jan 2020 14:36:30 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::1:a521])
 by smtp.gmail.com with ESMTPSA id f81sm10913394pfa.118.2020.01.31.14.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jan 2020 14:36:30 -0800 (PST)
Date: Fri, 31 Jan 2020 14:36:24 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.4 v2 0/3] aspeed-g6: enable usb support
Message-ID: <20200131223623.GA20974@taoren-ubuntu-R90MNF91>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <CACPK8XcWsHoeamPtd_R3=RUEjs93OyEo_Q-uk0=wfoa8ispSbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcWsHoeamPtd_R3=RUEjs93OyEo_Q-uk0=wfoa8ispSbA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 31, 2020 at 04:00:29AM +0000, Joel Stanley wrote:
> On Thu, 23 Jan 2020 at 07:50, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series aims at enabling USB Host and Gadget support on AST2600
> > platforms. I'm targeting openbmc tree mainly for some early feedback and
> > more widespread testing. I'm planning to upstream the patches after
> > 5.6-rc1.
> >
> > Patch #1 moves hardcoded vhub attributes (number of downstream ports and
> > endpoints) to "struct ast_hub_config" which is then attached to "struct
> > of_device_id". By doing this, it will be easier to enable ast2600 vhub
> > which supports more ports and endpoints.
> >
> > Patch #2 enables AST2600 support in aspeed-vhub gadget driver.
> >
> > Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.
> 
> I have put these in the openbmc tree. Please send the changes upstream
> for review asap (I would do it now) so we can get Ben's feedback on
> them.
> 
> Cheers,
> 
> Joel

Thanks Joel. I've already sent the patch series to upstream.


Cheers,

Tao
