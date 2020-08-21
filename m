Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2EF24CDE7
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 08:22:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXryr6Y7szDqP1
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 16:22:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GvNx8NLB; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXrxl14nhzDr6Y
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 16:21:02 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id b30so365452lfj.12
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qJ7NkDbwVHw7Job5E6BJj59RRPg2wKm8G4tFA/QWZu8=;
 b=GvNx8NLBqZaTu4Yihfm8BTjnJs/inryAWltoRfr6v3buZx9lMaJ7n2dls/+v9J8YUD
 bNhAKrAVpgvFxYIkTDUF0hNNUcDrLA/L0IjoVFJ1dML6I/sdodCcZoD1/t3X9XsIEjdm
 jo87xKgiclRy1IYRoViK3FigHLEX5vFCErX7HWJyQUBTSSZ2BXQJrr9PNx0lS2C1rvY9
 LAUVMJIRss1ZqYe/j63k+oPZEfce8BvntIXnwC13tGFjqtdZGEuBqCRuNbeYBc5YFnxR
 an4FldJ9Ss/1glq4DtZUq+S+ByxvvyWkoI9hyZPRc0NR/9+fxYEEXM0n8Wjg6hkNpEou
 W1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJ7NkDbwVHw7Job5E6BJj59RRPg2wKm8G4tFA/QWZu8=;
 b=R3/Om17G4E92wA8o3KDpFgu5e9j/74N426JtvF9Cn1qeXacKSHZS/n6BD+w4fNHmq3
 Jy0JdRB0hmVAY2EkNDJqcFztmkR3g9xA0Tg4idFsjN6xgmIs6+eZrNmKl3z6PecTfXvh
 vu/OslWaATVDwvvxnwqLnorxsxTcYC4V29IUc28fjd+VASOqzmNtt0GPxk2WiP5sBQ8+
 nrKDSG1/aOALrUS8PXnuPS8tp00+uoVM2+Xu7/LcfKeWERPmZWW1T9tY0qwZ/Nt1oL87
 OWVQQZW3uKaYxsIaBfJiyf4uwHOfOCaIwsOT2IPGcOQ/dDKX4ICI08IWq9AXdP3nk0WC
 qdmg==
X-Gm-Message-State: AOAM5312pFcpjVgt9A1R4ohZh4tYnaayGFKmvP/bn2ygiZ+akCdwIFMN
 w/x/Tky76WZ/DzAHo64/6dg0/aI8htFC9rbojvlHzOW3Dmk=
X-Google-Smtp-Source: ABdhPJw59mpxp9iUr5X7VVjj1+evtF4DDbhnJRrtN0dW7wkxepOerKinjD8BT3YChGZBNXDLCDAQ9Oe59cPcw0tBYLs=
X-Received: by 2002:a05:6512:2010:: with SMTP id
 a16mr706885lfb.196.1597990856052; 
 Thu, 20 Aug 2020 23:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
In-Reply-To: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Fri, 21 Aug 2020 14:20:44 +0800
Message-ID: <CAGm54UFLDWAqBstr6q2Su_wtF6ux1pJiHnJD2j8k5V0a2dJkNg@mail.gmail.com>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 9:17 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Please share your thoughts on the matter.
>

The whole idea looks good and it makes the layers simpler.

One concern would be, what if we have recipes with the same name in
(previous) different layers?

E.g. in case we had:
  meta-openpower/recipes-xxx/foo1/bar.bb
  meta-x86/recipes-xxx/foo2/bar.bb
And if we move the layers into the meta-phosphor, and a build picks
the bar.bb recipe, what will happen?


-- 
BRs,
Lei YU
