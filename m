Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D162C484
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 17:34:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7t35yFyz3dtx
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 03:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tO2tLriv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tO2tLriv;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7md6Sw2z3cjY
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 03:29:36 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so1856820wmg.2
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6XHaypN+d9XxSZ9uqCce6O/fkzjnqzc/veDYsY0jfM=;
        b=tO2tLriveB5EPLHrmedFdKipdaLRtJMqJ322SCB3SzxwauvggKNcGMw8++SzVok6OH
         sjn0MV2t180r+Xx8nEVLWNCt4uhaduxrUTetdJJ2PfNdZVcpEh7fEYNZ6sO3LXnBImDV
         HBr+TK7lmr0mcjZg1ytKTps+Uj5i1g/dh0prjdOEBusxLwGNvOuGeya7fmNjovj36Xim
         syGGaEacwhAspqDFumZ36IuR7B33olw7Zp/xpuU4U4FOrKkAnAmBoX664V8fPcArXoAo
         KZ3rFsyt0B64iNYMP7hiWuXaFNf2EKmOXXKJ/CqY4mTMUoIyUSnI4qrFvAMEyG+7vOIi
         PhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6XHaypN+d9XxSZ9uqCce6O/fkzjnqzc/veDYsY0jfM=;
        b=fNtCzBvdoI7PP2AnZKUE5whgXbLyERQ4WRWm8WMMHc3fLBJAEQBVLuO8yH8cNY651i
         eYluN7Soo3ne29zJuJEnKQoC8LwpG+utsVP5+gpfWaLkoSMtBApB+cTmo2zn6aXJK3U3
         lfd0m/fb/3bcKo6kEayAtzLZoObzGcBWhPEgXa3xR7sZXzcFqQ3tHSQfXoAvuG6MZKEb
         8mDbh4MexRw7/FvRNubepBG59bNXHf87zQr3XDM573iWjRX/jyhf04JeJXTVIq7YDEXB
         blw0tB5j+0C9zf9beasmezHUtFGWqzIbsNfGwGvJuyX7uvj82Mn2/Pr7yurGnOeA0rKQ
         SlCw==
X-Gm-Message-State: ANoB5pmdsKgcHJKBsNqxBhC25SwUZUYusLQetKRf+P+yzFVZsYEbEGF8
	FeAs9cl9Kt6RtQ7E0AYMIvELFjKpgv0TNUane6v5KA==
X-Google-Smtp-Source: AA0mqf6m//O47Pwbd7Lg4WfjYV5+lr/A1LqFGW2NXLySIBRr3vzeOcES1PQzhAxuipWuk/JXussIRiNfocoIac32r2k=
X-Received: by 2002:a05:600c:34c5:b0:3cf:b102:c0e8 with SMTP id
 d5-20020a05600c34c500b003cfb102c0e8mr2663464wmq.169.1668616172457; Wed, 16
 Nov 2022 08:29:32 -0800 (PST)
MIME-Version: 1.0
References: <CA+H48BRsTM4B_MHreMZG+_9abbjp5G2jcxmiMwqiPGrFytWWTg@mail.gmail.com>
In-Reply-To: <CA+H48BRsTM4B_MHreMZG+_9abbjp5G2jcxmiMwqiPGrFytWWTg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 16 Nov 2022 08:29:21 -0800
Message-ID: <CAH2-KxABvChOBiOPqMZfjhCfByBJj0=h0PKZ6HcATZoEoYkUqQ@mail.gmail.com>
Subject: Re: Performance: BMCWEB prioritizing URI response in multiple redfish
 clients environment
To: sharad yadav <sharad.openbmc@gmail.com>
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

On Wed, Nov 16, 2022 at 5:28 AM sharad yadav <sharad.openbmc@gmail.com> wrote:
>
> Hi All,
>
> We are facing a delay(till 6seconds) in bmcweb URIs responses when there are multiple clients(4 in our case) performing GET requests in parallel on different URIs.

Can you elaborate on which URLs your clients are accessing?  Is this
on an upstream SHA1 of bmcweb?  Do said clients implement HTTP
keep-alive?  Keep-alive is important, because otherwise the bmc is
negotiating TLS for every request, which can be quite slow, especially
when done in parallel.

Can you put together an example script that reproduces the issue?

> We have a very important telemetry URI, used for thermal monitoring. On standalone, telemetry URI response is within 200ms.
> But with multiple clients, telemetry URI response reaches till 6seconds.
>
> Can we get help on how we can assign priority to our telemetry URI over other URIs in bmcweb?

I'm not sure how a priority system would work in this case.  Can you
elaborate on your idea?  There is currently no queue outside of the
TCP kernel, and async tasks in io_context.  Which queue were you
planning on assigning priorities to?

>
> Thanks,
> Sharad
>
>
>
>
>
>
