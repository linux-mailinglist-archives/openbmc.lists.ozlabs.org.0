Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F954716BF
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 22:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBLVZ36Znz2xvy
	for <lists+openbmc@lfdr.de>; Sun, 12 Dec 2021 08:28:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Mjj4BSUV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Mjj4BSUV; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBLVC4kvDz2yxW
 for <openbmc@lists.ozlabs.org>; Sun, 12 Dec 2021 08:28:17 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id u3so24213757lfl.2
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJFplU6fFc+s7cudNsjrhd+SZK2MYlpQ5bBN8riWD0A=;
 b=Mjj4BSUVXG8+njTqFPatYDk1N5VYsYaJJ+ack0S0IABNzgp+cneYaiGd/lVF50Q/av
 UX49+FbbOLP81IRKo4qsV8Ow1pNauMXozXEBVTfkAIxIb0+7WDYGs5M9hZxnI54movBl
 F0J7CPlycxvJutb/HlJnxjwJWw9UV1uI0dynILgqua2zpnxJl5RjTVcJUWGeDVlOXcf2
 wdv2rDqm/V83BNCduMIRCzJNU4+chysdJlGxLqilRN+w4/2HQ0UHKgUxjvfzkoXtyJop
 o/pY/hyUw2l7eGJSmTBezOlAf5MzVlj6WQQCAfFYpSSWMjP1hpPmrPrQr4QJI2bSyERE
 3o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJFplU6fFc+s7cudNsjrhd+SZK2MYlpQ5bBN8riWD0A=;
 b=syIcRnI5D1dNdAOaN1/S5pp1GF10ttYl4dwNKnqS9oVGWp/+6+Ye9Q8nNKq6N+Vzp9
 GF5Qji9KnXWydDcMYnpbBtz9UyhB/9o6ndlXtW0DFM390WYIH3JrEa6d2S6Ua4VQqbjf
 DJ8y2D8wViXCbO/kMGfG3dANx5U4DS++Ei5zdoPINkR2WKPgNNvDIPeTq40xGi3Kmqng
 aQ9gh3hb40FbWRKv7Rpo1yJscXLsBjvTqt0eETsRLc+cLwdFlcEwzhzd8Pz15FZclNZR
 3Rlhq+YuaDUpoMKmnm1KSKP699HZEsYUC9LA+aDOvtJ86jR0m4rXKQeP6IHwBChvYkaH
 Zkkw==
X-Gm-Message-State: AOAM532/iuD9ripO3CJPDt24n1gnpVvhfhRgJUXYG08eSgMY42VNjMBY
 5TSD7o/m9NeYzC8InTSiTiux8A68cP909TBTwnhFNWQ1xSM=
X-Google-Smtp-Source: ABdhPJw88RQnkrF1sql/a62fJqUe044xjVPGtZmQbkmcDxnA+0XfASd9vSCfzg85uVAfomq9QtAMnRmOcHHQV8EYXZ4=
X-Received: by 2002:a05:6512:368c:: with SMTP id
 d12mr19457158lfs.538.1639258093192; 
 Sat, 11 Dec 2021 13:28:13 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Sat, 11 Dec 2021 13:28:02 -0800
Message-ID: <CACWQX828Gxj0tnyppiGfMxNktu7iepYgxT=qs0UQjKFMuy6sbg@mail.gmail.com>
Subject: Re: Etag support in openbmc
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We previously supported etag for static resources, hence the
references to them.  They were removed when I moved phosphor-webui to
webpack builds, and it was always on my list to add them back, using
webpacks hashing mechanisms, but I never got a chance.

In practice, they didn't provide that much utility because most browsers:
1. only cache if you have a valid SSL certificate.
2. Have a very limited cache size.
3. Don't support cross site etag caches.

So in practice, the cache didn't provide any benefit in a majority of cases.

In terms of supporting etags on non-static resources, that's quite
complex, given that cache invalidation is difficult, and likely
deserves its own design document.

-Ed

On Mon, Oct 11, 2021 at 8:04 PM Mohammed.Habeeb ISV
<mohammed.habeeb@inventec.com> wrote:
>
> Hi
>
> Do we have the Etag support in OpenBMC? I see there is a mention of ETag in
> bmcweb file redfish-core/src / error_messages.cpp, however not sure if Etag is supported.
> Please let me know.
>
> Regards
