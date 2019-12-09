Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BC11659D
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 04:49:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WTht1pNrzDqJl
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 14:49:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="V+B7yjYZ"; 
 dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WTRx1zTlzDqL4
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 14:38:20 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id z14so1522908qkg.9
 for <openbmc@lists.ozlabs.org>; Sun, 08 Dec 2019 19:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fODZB88aAE3qsoYhK9WmrWuZKruN3o++YTpPex332w0=;
 b=V+B7yjYZNID2V3U8xdZSKFbqsPAjBx6Dzh0i7ABqmaoxWa7maTMmPULwptjxw3fbVW
 PGO6cVuksokQkE8wzoP6KgDMUrwojbCq6PV8HwVIWp/5PoqZRSdUQmB9HoL7yb/iVN/f
 2xpWUb5ABXDDQhRGZ0aFgJYTv3FBs4SMVxohE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fODZB88aAE3qsoYhK9WmrWuZKruN3o++YTpPex332w0=;
 b=VnS2CDoSWyjUm94myagAsNpQVCztsNI4mTGnQN9snwsZT5e7cMLfhXjAx8ZsTNEawy
 SHj+r+F9y3ADIEVzWqAhr5mjLkJIlVwIINT7wnS1SioQkIUOaAF5sW9qDG9cJwVgceEs
 yTK/rUzuC9fVR1Uz1Y7vpQKPhAljkSb9EVDbUSY/p4JT0q5INTxuar6MhZTHmfk1kd0O
 ysKaDfj2bDPW2xdhATB8oDeHSd3P6cBbCC+r2IT1WFEVVXDJHtybmN+Dra75ohItfLhn
 1PiJ4VZKDsFEajEdmvjf1DapuLQj6VpzwYbPInwMwLUnsc5cQZjTTbtWmK9vSuVzxj3F
 qu5Q==
X-Gm-Message-State: APjAAAU+3hoCA8OnBscwqVgwZcCHpbbJgk5U/dWbzfwtVSrpL5FlP0tv
 yN+K8Goy+pZ+5t5+naLYbc3Bya88BDhpCgpMmOk=
X-Google-Smtp-Source: APXvYqxw4fVttzlCvYHJIU1EPWX/kha/kJycp48p1XqUthOaL6FINnwL66KQuS2PV4AQLAdtycTVXcL85W1wbYsNSaw=
X-Received: by 2002:a37:404c:: with SMTP id n73mr25083879qka.292.1575862695014; 
 Sun, 08 Dec 2019 19:38:15 -0800 (PST)
MIME-Version: 1.0
References: <41a8f4a2-6200-b8c4-22ec-baed7ec4b1f7@linux.intel.com>
In-Reply-To: <41a8f4a2-6200-b8c4-22ec-baed7ec4b1f7@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Dec 2019 03:38:03 +0000
Message-ID: <CACPK8XcNnEceuvpasgfHpZO9BDwaWttxnia-g3XwyAG=PYXFrQ@mail.gmail.com>
Subject: Re: New kernel CVE
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
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

On Fri, 6 Dec 2019 at 08:11, Yang, Cheng C <cheng.c.yang@linux.intel.com> wrote:
>
> Hi Joel,
>
>                 We found three CVE on our current OpenBMC kernel 5.3.11 which has been fixed in kernel 5.4
>
> Two of them are about crypto and the other is for trace. Do you have any plan to update kernel to fix them?

Yes, we plan to move to the 5.4 kernel. This kernel is ready to go,
with the exception of the broken dbus-sensors application, which
itself depends on PECI being enabled in the kernel and userspace
headers.

This work is being tracked here:

 https://github.com/openbmc/openbmc/issues/3634

Cheers,

Joel


>
>
>
> https://nvd.nist.gov/vuln/detail/CVE-2019-19062
>
> Fixed in https://github.com/torvalds/linux/commit/ffdde5932042600c6807d46c1550b28b0db6a3bc
>
>
>
> https://nvd.nist.gov/vuln/detail/CVE-2019-19072
>
> Fixed in https://github.com/torvalds/linux/commit/96c5c6e6a5b6db592acae039fed54b5c8844cd35
>
>
>
> https://nvd.nist.gov/vuln/detail/CVE-2019-19050
>
> Fixed in https://github.com/torvalds/linux/commit/c03b04dcdba1da39903e23cc4d072abf8f68f2dd
>
>
>
>
>
> Thank you very much!
