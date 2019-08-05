Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE281056
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 04:48:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4622JC4zNrzDqX0
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 12:48:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMimQ/rf"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4622HQ6ztQzDqVK
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 12:47:29 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id g20so164209160ioc.12
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OXqEPZUecfRPXxPLmHETGASMei5LEm2b4dG/VuVKek=;
 b=VMimQ/rfGdbkwRIIkBelfRCFGcrIiNXnem7gvrlNbBevSMD2dNIkdXGGGHf3F0fm+h
 Fu9UMtPEw87uwy5Ewy4g1zmWyLOLjMAQkbzW83+HI4iltDwxzW50f8OhlvWTpthn7mR2
 qRpVd6zpWwKlQPSsdWSb6ols/UV87RXkyZreZ+kuwxl3JzpatmUMBsRG79BSUvqpqVrU
 c/J0D1Ws/kjH23fnhiGFKAbcgVr6hc3RpVDhHj7wFmFiiFG4Rna6E6MiCxnxs/ti64xP
 DIuIbx4LcZbagcTciSH41VQYH/8zZJOvmhp3IpSh+DTxZ86MGRM/fP/n3P43MBCY8puJ
 AfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OXqEPZUecfRPXxPLmHETGASMei5LEm2b4dG/VuVKek=;
 b=DLaKfT+D6DBlLVJGb3iZOVEUStskjZDcWEeG+ydboeHm4ayU2KDbevbmd39ioRisq4
 Eitks1qeA+AYoyNvaNhyfcnyPqlHH/9UY454PJBJ3l/trthCul5uh18ExTwG+JxvLmEI
 jAPfCvTQHHhOt0mHiMX0wU2F4U9cl+I6BDSjGJmXEUKqYxYQD5uY/84peAM8o5rfweJE
 mV3jJF39wEk1mswDMwcjB+Z28Vo4BILBWIU64m+LJ88Uvh/QiIcssCeWET8foYdoYxnD
 RWofw13mKPxMTj99nD28iS2cIvmHo8E5xsVBe3C9BL5/uMbIs2UQyr7dL+xLTDgwUzz/
 7ixg==
X-Gm-Message-State: APjAAAXXvE9cQ5fVBzZ2QiXE+IxtrvBzBE+uJQHee3Go5nHmGWKpiAa+
 UVOiUcr96UG9a6JMCQeRjYPNII74c9UY3lo6mks=
X-Google-Smtp-Source: APXvYqzVVAKOM9zUiLIoRiRa5I3NGZc1qccgnZxEMgsZjt1x/sD16vE6T4+0Z4zv7g5eVXgxInXzgGh0Y52zOjL60YI=
X-Received: by 2002:a5e:8c11:: with SMTP id n17mr67024099ioj.64.1564973246261; 
 Sun, 04 Aug 2019 19:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=-WgcYhXVd9WOxtgE54C4QCqatpM0nAeaaqc_h4tKWVg@mail.gmail.com>
 <CAPnigK=PhKkJUk6wDVnRwxqkFvh2YgpivCQYgVuyOfnC3+a0WQ@mail.gmail.com>
In-Reply-To: <CAPnigK=PhKkJUk6wDVnRwxqkFvh2YgpivCQYgVuyOfnC3+a0WQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 5 Aug 2019 10:47:15 +0800
Message-ID: <CAARXrtnvLxFNgWeJm4YodDzgT=n_M6WVXJhwOwMHk=BRzqAf-Q@mail.gmail.com>
Subject: Re: Using meson unittest in OE SDK environment
To: William Kennington <wak@google.com>
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

On Sat, Aug 3, 2019 at 2:41 AM William Kennington <wak@google.com> wrote:
>
> It seems like a complete misuse of the SDK if you have to hardcode
> that much of the toolchain information into the build scripts.

This is typical use in all the repos with autotool, see example in
https://github.com/openbmc/phosphor-hwmon/blob/2227bd52c5bb8d62dcfe33b58d65515d21e9be17/configure.ac#L149-L162

> This should all be handled outside of your meson build.

Could you kindly share how to configure this outside of meson?
The goal is to tell the linker to use the OE-SDK's ld.

Btw, I managed to config meson to specify the rpath and ld correct, by
splitting my previous linker args into two parts:
* Put dynamic-linker in `link_args`
* Put rpath in `build_rpath`

And it works as expected, see example in:
https://github.com/mine260309/phosphor-psu-code-mgmt/blob/cff6d1b02d43f3f7e4946e778dcfca388cec77e4/test/meson.build#L44-L45
