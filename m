Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7281BCBC3
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 17:46:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d5CN5TYbzDqRp
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 01:46:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rtK++JuK"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d5Bl65CBzDqDN
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 01:46:07 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f19so1172517plr.3
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODTmNqmbdoMy4r+y0s4O14bCTfhRxs1jHnZx9940n2E=;
 b=rtK++JuK8dfk1PnMC1IW9WWCv2RsIIvMe2ygPEfydNkKQxTQibhvpOhiZSqiyb0SpV
 RyKSt2j4eUVOVERVtOEEPuNCPXzFjBovUqiWayumYb7FKFe9s2N+QeWS6dBn940P2jbe
 l3KtDWB2YVXJDZLl+ss2wv94YmrRxXHSpuwr950zygoKps7qeXUOJmBhRIWyGHa4L23D
 i5hBL7UJR59Nbzq4bxE5BCdDmPaBs13kOQNrMSll4kvEyNBrO869ByqZ8a0ACNzDwdcF
 SvpPdOCPeX8/ohyFP7s4eg2Ea5b8A+2KQOgkw+rcjLu8FLALXzwGnaKZCamdybEtXBJQ
 aogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODTmNqmbdoMy4r+y0s4O14bCTfhRxs1jHnZx9940n2E=;
 b=XxTMYqZ/WFyUp2Xid2K8MYscCcQV8vUZLuade4prWmYp3R/Y7vPxe8eYQePQ0t0eqT
 m/kcAhi5TfOhr2aRAJMvs9Q8Iv21PcwOKAU3sXAvRCkZ52dxZPzGIQ9O2MsxOcHgOAEJ
 myAUKcNd28YVzp6gyZHWe/9aGCS8sxEvoW7PpBE28YE5UY8SvpLTFgv/MkhRHYWKUCqv
 ILi5zWc1bGhl16RjCYQGyzqgyhtAh/SSa3mvvXB3xhJWxqDOcRozFdq1i1xCmWPdtwgB
 t5n7IkMbsjm/+mYd3yCU3ktgCYpT0OZdAVcX6ex66I9F3oerj0MIoVFTON3m2/ETRM8A
 Zkdg==
X-Gm-Message-State: APjAAAVUKOXXdoVK6dYUjYt3oPPfDA334ba5lPAUWGh7LcjhcVYReY/z
 tjd19lQAKHub+nzNFN3lSYmes7Jt0EqmkMtnDFthug==
X-Google-Smtp-Source: APXvYqxgF2Wv3ODUODe3/1v4KFeto9P8Q2nOjE+CPppPCWPSLv0NhP47m8yVBqoO742rkXsTvhEPpWDwhALGckttqKk=
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr3641065plo.47.1569339963678; 
 Tue, 24 Sep 2019 08:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyvvVCNr3GG3fvWkXfUc_NA+ge-KyB7capWGymNBYQb2A@mail.gmail.com>
 <f6f6856a-0a84-3ff9-b624-5575169284ac@linux.intel.com>
In-Reply-To: <f6f6856a-0a84-3ff9-b624-5575169284ac@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 24 Sep 2019 08:45:52 -0700
Message-ID: <CAO=notxGB2K7KefGS1=QMxH21qF0niWXvxJyqWCCbZMu4j2QRg@mail.gmail.com>
Subject: Re: MACHINE=s2600wf bitbake obmc-phosphor-image at HEAD fails
To: James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 8:41 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 9/23/19 8:06 PM, Patrick Venture wrote:
> > I'm hitting a build failure with intel-ipmi-oem on this platform.
>
> This should have fixed it:
> https://github.com/openbmc/intel-ipmi-oem/commit/28c7290ce54fe46c9fd82fdcd1702088d621e694
>
> Maybe you don't have the bump yet?

The bump hasn't gone through.  It looks like openbmc/openbmc is pretty
far behind for that recipe.

>
> -James
>
> >
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1849:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  1849 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> > |       |         ^~~~~~~~~~~~~
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > In function 'int ipmi::getCRConfig(ipmi::Context::ptr, const string&,
> > ipmi::crConfigVariant&, std::chrono::microseconds)':
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1869:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  1869 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> > |       |         ^~~~~~~~~~~~~
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > In function 'ipmi::RspType<unsigned char, unsigned char>
> > ipmi::ipmiGetSecurityMode(ipmi::Context::ptr)':
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2486:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  2486 |         *ctx->yield, ec, restricionModeService,
> > restricionModeBasePath,
> > |       |         ^~~~~~~~~~~
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2500:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  2500 |         *ctx->yield, ec, specialModeService, specialModeBasePath,
> > |       |         ^~~~~~~~~~~
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > In function 'ipmi::RspType<>
> > ipmi::ipmiSetSecurityMode(ipmi::Context::ptr, uint8_t)':
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2552:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  2552 |         *ctx->yield, ec, restricionModeService,
> > restricionModeBasePath,
> > |       |         ^~~~~~~~~~~
> > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2581:9:
> > error: no match for 'operator*' (operand type is
> > 'boost::asio::yield_context' {aka
> > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > (*)(), boost::asio::executor> >'})
> > |  2581 |         *ctx->yield, ec, restricionModeService,
> > restricionModeBasePath,
> > |       |         ^~~~~~~~~~~
> >
> >
> > Patrick
> >
