Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29C257B54
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 16:33:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgCP03wBhzDqMd
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:33:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=T3iXhn8x; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCK36bhXzDqTY
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:29:59 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id u6so4153817ybf.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OnznT+EL1JicoCMQZaMN8hxrRUpgUwm11cy+cs3e/cs=;
 b=T3iXhn8xjM/Libplm+/fAqGC0XfGpUD41tJ2XiQbITwwOO7Rq5Puj0ZeJ1fMbKZ+Au
 KWu3szA/RPuo5hYGnpcpL9SDKD3XI8DkHWLULNhVmnpAIrClrO8kD30fFBn1WV++D3R1
 pf0nt/c1VszTZNeh41c1bQzeNfPB3qLoKsXGVSwi+UFH4Loqh7fz7rmkEx8TG7Ae3xqh
 PSii9SXHDORw2myZW4B3/kW3VZ9zX+B5zmyYPTobjMlYuaUc1gGtgQkqPqTCE2vevjRu
 w9A3/k4D5Owjt0Qk75d0RD+eFJBDslZ8h+Yzgfpbsk/KIVJcIYzHpajazcGMWLvYR8Is
 Ij+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnznT+EL1JicoCMQZaMN8hxrRUpgUwm11cy+cs3e/cs=;
 b=VaAVNyG8v4bjOHTZC0fht6vHYejr2Sx0/a/0hewaqV546Q007cBKLopReqoMOfWANW
 uPNbA17Vn6cPOZ3A+UZA8rLXBIRtLb74uOxYjiruPTdiXNpW3xZ6le1jbcuutnz57pwg
 ATRQ0GGAdtBNUcRqgPW18WBjsm1MMTTZ7jfJi4cot07oYj7+IcuHPEHEhycj1MQbo8AH
 GIyl0pIplq2iu4890ZXARDBnpqvUrChzdN/saR3mrKRFTdzxz4yZg+UM7ihadXYbR2me
 2BSzR12PnrROvLLvtenzmVqXkttQcb2z70NvjpuNA0C/EBZH9q2wLBXi3LSLI7eNEifJ
 CvNg==
X-Gm-Message-State: AOAM5300rIzWbgIbwoYNWDpIUoKUFr/4gbWeribZqxmsdg3QHZT4CZLA
 888CVnriawAGZAEL1LRLsqh8J40p3xQIYWjqgr+5BQ==
X-Google-Smtp-Source: ABdhPJzD7RuENmF/Cb+ztIho3hsDnTkOoO1GwbBkHpXKDqMEwsrj5xKfU50D3VWZNbdNmAbN8X8DmW3gA/sRiar+5t8=
X-Received: by 2002:a25:f304:: with SMTP id c4mr2262617ybs.209.1598884195167; 
 Mon, 31 Aug 2020 07:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200831105718.o2ic4dvqhde5qrh7@thinkpad.dyn.fuzziesquirrel.com>
 <67f35707fd1844cea64708f64f41224e@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <67f35707fd1844cea64708f64f41224e@SCL-EXCHMB-13.phoenix.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 31 Aug 2020 07:29:44 -0700
Message-ID: <CACWQX81o5SMhoGrJwvJhTxNXa5iM77v+eFGYUEeH=6-7U3nxWg@mail.gmail.com>
Subject: Re: When building OpenBMC . . . ?
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 31, 2020 at 7:23 AM Bruce Mitchell
<Bruce_Mitchell@phoenix.com> wrote:
>
> We are building a separate port for Tioga Pass, so the question is should be not call it tiogapass?
>

Don't create a separate "port".  Check your fixes into the Tioga pass
machine and get them reviewed.  If there's conflicts with featuresets
with other tioga pass users (as I'm sure there will be) determine what
they are, then roll the required configurability options up to the
project level layers so users can select the features they want in a
build.

Please do not add meta-phoenix/meta-tioga.  The per-machine meta
layers are complicated enough as-is.
