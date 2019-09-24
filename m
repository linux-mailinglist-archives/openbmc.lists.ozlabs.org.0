Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F72BCBC7
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 17:48:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d5F46tBtzDqVn
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 01:48:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Zpt0gtUE"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d5Cy1YGczDqVk
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 01:47:09 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id a24so1558082pgj.2
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlIAhuj38yJYTHw8PYRy8cgPlkkm91WHnjYP+NhCtg0=;
 b=Zpt0gtUEO4Qba6Y0FB6x4s+L+06nwxBOl0P0L3cgCWOI/p3OO7AkOz6thKNcErz+1G
 JuqSytBCwLfqZwxNX81mUeDkESgiCzD/QtsxQq0OVVXPbCNcm+u5k/ES6cuEEkviXzDO
 0g2g4rtQrFrJ5bMGI6CtzVw4E2iIfr+e6b7zhUhFJuKpAlh5ar97NNa+CQCkwrXnUeHx
 4SWMBZOZbxu5iTu4MGa/7KCBi3DEySpG1uAcPoprxK2gzchWLUto1yJbOq8F7A3uBCHX
 giWAhPM5e38mlmGR45m+pWEwboSsNxYdzHgWmJ2eGrZOhQecoFc3L/D4RGR+kpg7YES3
 HmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlIAhuj38yJYTHw8PYRy8cgPlkkm91WHnjYP+NhCtg0=;
 b=bikG9wXCJZlRVH+Zmc6+JvIcFr6okVdr9iBw7qHc2yZp29HISuFtXF9ignrBNOrBfp
 ngpGf0fzcIaWmB+dSAFq3BLtBSFTrMOqE3p4wTWvE3gi1BdyF+b754Oe68rKyJ86RPGT
 aQMoym5Gw3ccI4z4uICoMzBdTLhhTF0zEyfZK7IGGHFK0SLp8lQPI6RmZBZmfVc1f6y/
 Hgu1Q1nM1lp8sbwuL7GTB9TybhWR7QQnAZYSuxC+84hrT5MLEUbwdlEk41ShyZC5tCMm
 IbJm6vWvwcltkGqWABAb4SHT+Q3+4Em3wBZrEjRzHHkCzX5z7cBhv+K5JecSuJrV6Koh
 IA2Q==
X-Gm-Message-State: APjAAAXMf3imliDSLmEUJRriw8Q0MCPbVM6Ujh1vhveZb4EmcrSeCLJN
 wET4TDnadq7V0xjjFB2/C7WFtcO3IVP0VmuAWg5udw==
X-Google-Smtp-Source: APXvYqyNufS3INRXtHyk9nLBniF1aKjsWCCaFBOpZu2vASRzoYxWx6IM8wN8dDYtKNOLEkGqgxVSrBjWH7TzQ8io5ug=
X-Received: by 2002:a17:90a:be13:: with SMTP id
 a19mr697499pjs.55.1569340027524; 
 Tue, 24 Sep 2019 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyvvVCNr3GG3fvWkXfUc_NA+ge-KyB7capWGymNBYQb2A@mail.gmail.com>
 <f6f6856a-0a84-3ff9-b624-5575169284ac@linux.intel.com>
 <CAO=notxGB2K7KefGS1=QMxH21qF0niWXvxJyqWCCbZMu4j2QRg@mail.gmail.com>
In-Reply-To: <CAO=notxGB2K7KefGS1=QMxH21qF0niWXvxJyqWCCbZMu4j2QRg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 24 Sep 2019 08:46:56 -0700
Message-ID: <CAO=notw4f5C2s=Ww6ggrumvU7Qr5oW3FkWb7Daw_SV5o=psPBQ@mail.gmail.com>
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

On Tue, Sep 24, 2019 at 8:45 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Sep 24, 2019 at 8:41 AM James Feist <james.feist@linux.intel.com> wrote:
> >
> > On 9/23/19 8:06 PM, Patrick Venture wrote:
> > > I'm hitting a build failure with intel-ipmi-oem on this platform.
> >
> > This should have fixed it:
> > https://github.com/openbmc/intel-ipmi-oem/commit/28c7290ce54fe46c9fd82fdcd1702088d621e694
> >
> > Maybe you don't have the bump yet?
>
> The bump hasn't gone through.  It looks like openbmc/openbmc is pretty
> far behind for that recipe.

Looks like this should address it:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/25491
>
> >
> > -James
> >
> > >
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1849:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  1849 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> > > |       |         ^~~~~~~~~~~~~
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > > In function 'int ipmi::getCRConfig(ipmi::Context::ptr, const string&,
> > > ipmi::crConfigVariant&, std::chrono::microseconds)':
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:1869:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  1869 |         *(ctx->yield), ec, "xyz.openbmc_project.Settings",
> > > |       |         ^~~~~~~~~~~~~
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > > In function 'ipmi::RspType<unsigned char, unsigned char>
> > > ipmi::ipmiGetSecurityMode(ipmi::Context::ptr)':
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2486:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  2486 |         *ctx->yield, ec, restricionModeService,
> > > restricionModeBasePath,
> > > |       |         ^~~~~~~~~~~
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2500:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  2500 |         *ctx->yield, ec, specialModeService, specialModeBasePath,
> > > |       |         ^~~~~~~~~~~
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:
> > > In function 'ipmi::RspType<>
> > > ipmi::ipmiSetSecurityMode(ipmi::Context::ptr, uint8_t)':
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2552:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  2552 |         *ctx->yield, ec, restricionModeService,
> > > restricionModeBasePath,
> > > |       |         ^~~~~~~~~~~
> > > | /usr/local/google/git/workspaces/ci_test_area/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+f267a67dff-r0/git/src/oemcommands.cpp:2581:9:
> > > error: no match for 'operator*' (operand type is
> > > 'boost::asio::yield_context' {aka
> > > 'boost::asio::basic_yield_context<boost::asio::executor_binder<void
> > > (*)(), boost::asio::executor> >'})
> > > |  2581 |         *ctx->yield, ec, restricionModeService,
> > > restricionModeBasePath,
> > > |       |         ^~~~~~~~~~~
> > >
> > >
> > > Patrick
> > >
