Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53720D6A07
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 21:22:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sT3174rfzDqc8
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 06:22:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ete/3/xy"; 
 dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sT103mkKzDqwf
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 06:20:36 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id u16so13559lfq.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bf57M5viLpYi876k/TOFxXEeVD6VfsCUbO1dLQzdj7U=;
 b=ete/3/xy+K6aDCSNHo0HeipACrfZMEMS+P7pEyUSa5wjqOTjK4RUxUug1pZ7olAMHA
 6G5Cb8OfEXLv81gnvzcyHE38id38G/EyvyUpFQwNnOxKN6FIYn0apuRCUyCSWiqavMiq
 t8Kg66gkdFpAml7EcRuOILZgc3xkUE6IO5WNLqk0iEMWvyimTZ4vkCPcXUhGbRbzh4/C
 1PpGQqcIt+GrLv1/7I+XDwz1Q4/HMmU2RQNz2z9El7NCnUHV3dHAWHzljNWiWtpvDn77
 1mUayGFHYn+PoZsfpIjW+X8DKKzHKydY0Bo4RynBMa3vbH2gSdjZGLHwXCDNa+LR1VA7
 aXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bf57M5viLpYi876k/TOFxXEeVD6VfsCUbO1dLQzdj7U=;
 b=OgC1KyWd6GHTYVSDic5948nXDp6SiNHUGcAh5G2SgB74U82ZRpP90wQ8XgWmDQWRHA
 kFXAXZ5L/vEmt+eoWQEFP/9ItTVPusaesN7wRDB8vosJDaCZS6bGXX8SaAnv1LYZYeit
 pnP1a75pnxf0tojCuduRBoi25rPgcVYoQqVi65z+uBuZUCTgNpuyxBMIPwt6qQzCY/Wu
 hs3toc60pCcP8tMMltRskdfa+bJ3nPZq5LdON+ChbC52AEfXDciBJ6ZZL+8kr/Irit2l
 pbzmtW3pg5H/8yaFcgb2NmA2PG3SEISlOt0cJsoGLLTlxRK3aI+Locfltzgde0UmOUhC
 8rHw==
X-Gm-Message-State: APjAAAXgAykykTpuJ7xAwuShztl5JLRNlgphgWhbsGAPF+HphuYhzg7U
 FYUTWNiHcOQs1seI4bC9hmoJrcBf/NyIHFhs2KoHkQ==
X-Google-Smtp-Source: APXvYqwIklG4Bw5wkxsLN608tK5QGTmVy1ouWwTeRic+0kesOG7og7a6lJ2Z+Idfh39WkoAWAR11H4vlxC8UoY30QiY=
X-Received: by 2002:ac2:5595:: with SMTP id v21mr6149643lfg.168.1571080831196; 
 Mon, 14 Oct 2019 12:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com>
 <4cb17f48-d29d-4994-e516-315068dbabfd@intel.com>
 <563ccf95-dda2-37f5-33d7-0bc8aafb61c0@intel.com>
In-Reply-To: <563ccf95-dda2-37f5-33d7-0bc8aafb61c0@intel.com>
From: William Kennington <wak@google.com>
Date: Mon, 14 Oct 2019 12:20:19 -0700
Message-ID: <CAPnigKn-ivY4zF1AuFiCyp4CBvnqrF0cxW7QN+Df-Tr544uEtA@mail.gmail.com>
Subject: Re: host-ipmid bumps failing on tiogapass
To: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This should be working with the latest code vijay added in
https://github.com/openbmc/fb-ipmi-oem/commit/a7231893bd729508ef48b5863d8f77e7d7809fb4

On Mon, Oct 14, 2019 at 9:10 AM Johnathan Mantey
<johnathanx.mantey@intel.com> wrote:
>
> Looking at the logs from the build, there are some "multiple definition" errors:
>
> 08:47:22 /tmp/openbmc/work/arm1176jzs-openbmc-linux-gnueabi/fb-ipmi-oem/0.1+gitAUTOINC+38183d6670-r0/git/src/oemcommands.cpp:77:16: error: conflicting declaration 'constexpr const auto ipmi::network::ROOT'
> 08:47:22    77 | constexpr auto ROOT = "/xyz/openbmc_project/network";
> 08:47:22       |                ^~~~
>
> This content was in the include/ipmid/utils.hpp file.  The commit moved them to the transporthandler.cpp file, making the definitions private.
>
>
> On 10/14/19 8:38 AM, Johnathan Mantey wrote:
>
> Do you have logs to review for the build failure?
>
> On 10/14/19 8:01 AM, Brad Bishop wrote:
>
> Hi William
>
> After: c514d874e4 (transporthandler: Rewrite + New Handler)
>
> fb-ipmi-oem no longer builds which is an issue because the tiogapass system uses it for the bitbake CI.  Is this a backwards compatibility issue or a bug in fb-ipmi-oem or something else?
>
> thx - brad
>
>
> --
> Johnathan Mantey
> Senior Software Engineer
> azad technology partners
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>
>
> --
> Johnathan Mantey
> Senior Software Engineer
> azad technology partners
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>
