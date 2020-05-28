Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A1A1E54CC
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 05:56:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XYlT6NwvzDqXD
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 13:56:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dTY0BfcD; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XYkh5lc8zDqQb
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 13:55:23 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id z18so31565762lji.12
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 20:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hrqOVM8m4VjXh6A9wlPzWOY9r+WKac/2mwxB02RwcFU=;
 b=dTY0BfcDHq7gJHugBGZSomFkbP4m2mXdYx8D1VgFGlpZWLqgWk0Bmz1vPj0nSRsg7d
 6jYR2r5F7BsRTvHunc07d/3skXnhjz6tbevb7jjgYXg5H1s7MAfE4sJ/HS+oNAIZAWjN
 q5TyXrezMzgAdCGsy0LfEBlYD/zPDFWBv7GjnJOQSs0V/DSUaGbj7D/AplBUUcSS4dvA
 0wRFuup5gRviDeWCsW/WghQl49dK+Hi1JDVCGcXmWdYOGvC/9u+wG9gRoU/bqoKbgfyE
 UcxA6jB8/GrsyxU7pH6MHWUsGsYeNrXixgQJuWu5OhRlzGq91WtWxmTcSKA0WWfWGroL
 QBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hrqOVM8m4VjXh6A9wlPzWOY9r+WKac/2mwxB02RwcFU=;
 b=asIrclKS5ocLJW70j37LE3KBUVnK34xBIJl6wLwA9mx9VhnJQmeiUdl9069jCHuhEg
 kR8sOvC+dHXpamaxG0kF2mwk2yOsQkgnd6fMYA5od0FkCkT4MF7AS46lP0Bn496aiK4q
 wpArSHx4g8v+9x0TwwLkupN4jNB2y0ryamiSCVAdgJMfkc8WSfu6/5idYBji5hWPG7RF
 7A7PXjXzFS+TL1GQxUPkjMWdpdoOpQQlUEuzlPDJ+fI2BRlXbS8PlV8B4n8MDFh6wKrp
 RYBhfrn2W3t3qmIj6OVkAmn4dChIe87a/74leNPiaaePA9rl56d3D82zsdBZWfJS759S
 5QtQ==
X-Gm-Message-State: AOAM532pDN+lWsi2/hkdSPnzaQC+Gujqxz3TWyeRbHQgnjaA5tgFCRxm
 i1xwvzJJpy/qwY6KxUR8t1eE33n5HYcUO/LMrfAHKQ==
X-Google-Smtp-Source: ABdhPJxiOOhHeQGFSQ/fbimnsHwRmoLejnrVjwIqvhgFjQdttWrhgmBAVYLMbqnXxiYhKnVb6uiiaFPn5Ot/X+KATYU=
X-Received: by 2002:a2e:8885:: with SMTP id k5mr443524lji.416.1590638118993;
 Wed, 27 May 2020 20:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
 <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
 <c3ab98b048824b50859560d747d07f84@intel.com>
In-Reply-To: <c3ab98b048824b50859560d747d07f84@intel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Thu, 28 May 2020 11:55:07 +0800
Message-ID: <CAGm54UG4peETHnXjaGoAV2vCxxiKOKfTbhHmZUiinjMPf6wHGQ@mail.gmail.com>
Subject: Re: [External] RE: Adding usb-ctrl from intel-bmc into phosphor-misc
To: "Wang, Kuiying" <kuiying.wang@intel.com>
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

On Wed, May 27, 2020 at 8:25 PM Wang, Kuiying <kuiying.wang@intel.com> wrote:
>
> Ok, it is a working way, we could discuss more detail on your patch review.
>

Sure.
The patches are pushed to below series:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/32877
