Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481541D4385
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 04:29:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NXRf531lzDqyJ
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 12:29:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UBtwNdhI; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NXQs3QvTzDqxL
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 12:28:52 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id u6so548355ljl.6
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 19:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXa9I5POtAu2NfNLmMMGyXrrsaquzn1MU1PLkY1+NX8=;
 b=UBtwNdhIpeFc12s/H3zCx41GUp96m6mqEO14CZB24m5f1TODMkpW2imkjuHC6jjlSj
 W/vnoM2m+xpWOfeTtDlvx8/3HXHse53LvBSEVt33fJgGYrJvHul3h1v8bhY1hGLffw65
 Gugb4s8kceMtCr6yWfOJTdGvNhuKT4dkK9IAHV++6vaxqnsZoRf4y9l+i32P8hbXCZqd
 hvWNlRQKlpRh92Xyweh7qSXMTqAmTVVHMkNoR/UYc5+qqAWS7bHOEhCJvwAONkcpnj/5
 tjt+igRhgNafsMCOlVOC9x2uYLMLN41QaxN8O/RHGiCPdLYdUGMZ0ZLv+K1S74c2M0Dd
 vYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXa9I5POtAu2NfNLmMMGyXrrsaquzn1MU1PLkY1+NX8=;
 b=Rj0UzHsYhfYkMmPgdlwAoibLpkeouFbm1FXDmyvoh7i/jY75QvOwBeEh2r4u1PRNFW
 1aMUahuhEvFWCScYdIWB8e3KJTowVBlOKA1aL49DHfoji2J3RuDZciQ7ni6v3zK0MqHC
 dluOoGZrbv6T+s5ry71sU72oaBOsfC7balnqmWyGbVWR1YWJOb2Ho25rJDeZlsC3KtYp
 QTcXo37QrVUXaRzMoAROYU9q7p4RSXNTycLMZQcKy5ix/XV1ipOVpLG9X19jRSQuYotw
 n99lv2GoPksqcvTKdYbPpCnxpyHuOjr82dMvFaVHAIJcrmhtbntijwmxq+IsqxjBuyXl
 Qtvw==
X-Gm-Message-State: AOAM5306mOwqhheaixMoF5ObidQqXEIk5gZNHm29tv/JB3VFyP/lNVCU
 FoSGJANIpWOktCREj0082kpeOHmtSXFD/kzPr0iiaA==
X-Google-Smtp-Source: ABdhPJyU6aNiZeZGTbjIOckLIAxI7L9E1lzBddPHTeRNKCoSlS98VJsJZEilYeZTen07BiK+uzE7hkgMvasl6ZG3ADI=
X-Received: by 2002:a2e:8191:: with SMTP id e17mr743427ljg.68.1589509727385;
 Thu, 14 May 2020 19:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <a8c9861001b14bf7ba2bd6cba832d2f5@quantatw.com>
 <9390dab8-9e8a-64e7-572a-52fcbca4b215@linux.ibm.com>
In-Reply-To: <9390dab8-9e8a-64e7-572a-52fcbca4b215@linux.ibm.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Fri, 15 May 2020 10:28:36 +0800
Message-ID: <CAGm54UF3MzDqk8eEJY+Vkiepe1+PRQL6kh6N7_VB_7eqnzn8rg@mail.gmail.com>
Subject: Re: Openbmc-test-automation checking service root URL "/"
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 "gkeishin@in.ibm.com" <gkeishin@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 11:34 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> I understand GET requests for URI "/" to return the web app, if
> BMCWEB_ENABLE_STATIC_HOSTING is enabled and the web app is present. See
> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L49
> and https://github.com/openbmc/phosphor-webui

Yup, the URI "/" is supposed to be the webui.
By default, it is phosphor-webui's login page, but be noted that it
could be in a compressed format.
