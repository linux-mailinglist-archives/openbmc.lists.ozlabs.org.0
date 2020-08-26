Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB72525CD
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 05:36:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbs3N0dWZzDqZL
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 13:36:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=C4TLttWq; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbs2R5DsXzDqXq
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 13:35:43 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id i10so168557ybt.11
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XbDXWPzZvZwxIMRNGMi58KJ16Lf2s8IC4ZKr3ReLes=;
 b=C4TLttWqj+uEKOayqKtFLt2fkp/cw8t3VnUBF0NFWhILx5WxzUX263X0D7VAQIRUuz
 Zdl1ugzchz1kTRKjGJxhKTZMTKn8dgaTQdDtEYLepDaZz4jUiSwz/bepfrROTHYxpQt5
 nfUzhbp+2SNURwiAbjvrxE6P3szLxCcqowKoJNZHolq0G+ihjmyHPxwdX/ZXgfh+reAt
 yf7mO6JdJuCLkBjVzPR1/icfsDFVCAP6fU3gniN8Bmarp4mFPQo908zG1Oie6AHwxX3D
 g/aMsU8LKfRJu3Z1BZtZ7dN6jdjiFpJMDCa6F4xYsTaUxMKdkhUb0T8HKGewPXqV2xh8
 FjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XbDXWPzZvZwxIMRNGMi58KJ16Lf2s8IC4ZKr3ReLes=;
 b=RMpZEf16lS/miwnigSOrvsBs0kINTcaANiDGa629oweWB/UufOt4xq6l/CiXZmKdH9
 xk3idhr/6WuVoKuGVM2LnYrulrEEnoQaJsjn3pM09TFVdmSguLZZn3Yz455/Qb2HJxE5
 82wck11YB0zXT5JxMJj9+R/IZlJmw1i4nEiXZsWBsjEfyq89mwXSj5ow4AMKtuHj8VgX
 B6yrk3NMkdp3uyFxxvYNhktTVQnBHN0ZIoPPKmJqMfCZyO4GVGOyTGGbFyeexgd4sp0g
 wBgBMUCoUSFHj7Bbo8VwyXUh1rpxQt3/SSYj2UQMR5bBXN2a02GHhh1ULWpsacnJddY9
 ObmA==
X-Gm-Message-State: AOAM533+gGZWzC06xBZxIccH3JbIAmkACZhMW8PNMhGiqEKMLG8gHHBv
 IGEQ2r5eUuEIKAocFB8iMkeTFeqPMSXZySj5/PnGAg==
X-Google-Smtp-Source: ABdhPJwO1Lexo8I4JsQfoQRwKuURe9B2BFgxi9TK2F2Jz25QBR/bVOyNaTd5QLigiSoml/fetllkSTqvaVMO7qsn0WE=
X-Received: by 2002:a25:41c3:: with SMTP id o186mr568151yba.417.1598412939675; 
 Tue, 25 Aug 2020 20:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
In-Reply-To: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 25 Aug 2020 20:35:28 -0700
Message-ID: <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
Subject: Re: Seek feedback: BMC console and debug info
To: Zhenfei Tai <ztai@google.com>
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

Yes, this would be useful to others.  A number of commercial stacks
(including some I helped write) have this feature, and I had hoped
someone would tackle it at some point in the future.

My only comment is I'd rather that we don't duplicate the endpoints in
Redfish, and have both a Console and a ConsoleDownload collection.  If
we need a mechanism to download the full log files, I'd recommend that
the Console endpoint obey an Accept header of "text/plain;
charset=utf-8" and an Accept-Encoding header of "gzip".  That way,
we're still meeting the intent of the HTTP and Redfish specs, even if
we're providing more data download options than they require.

Other than that, yeah, sounds great, lets see the patchset.

-Ed

On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai <ztai@google.com> wrote:
>
> Hi,
>
> We have worked with our vendor on a system that provides console and debug information, which can be useful in times of debugging BMC issues.
>
> On a high level, we use obmc-console and phosphor-debug-collector to collect data.
>
> obmc-console: We collect console inputs from the host and save to local log files (max 8 files of 1 MB size with rotation.)
> phosphor-debug-collector: We run this process on the BMC with no modification.
>
> For the interface, the data is exposed via bmcweb where there are a pair of URIs for console inputs and debug collector respectively.
> e.g.
>
> /redfish/v1/Systems/system/LogServices/Console -- Enable/disable console inputs data collection.
> /redfish/v1/Systems/system/LogServices/ConsoleDownload -- Download the log files in a zipped file.
>
> It will be great if we can get some feedback on whether the community finds such a system useful and advice to improve the design.
>
> Thanks,
> Zhenfei
