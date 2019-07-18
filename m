Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A756C8F4
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 07:59:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q3P919PjzDqbq
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 15:59:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JDCcUCm+"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q3Nb1vLwzDqC9
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 15:58:52 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id v22so19489483qkj.8
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ct4djxaQ1e/mTdSrBIwsU7pdc+Wg5hAQ5Rc00jVfMEQ=;
 b=JDCcUCm+UxhRJyF+biaGLv+OhX8tEiF3GoH4md1lH+alkkFmbm6eTa1yuwCoTYvDft
 C6IrZEhwBk/suMNDroFbhb+Bb25IQVzVI8JI9NoYsAJosNOC7n7fKjlGdn6A2prgANKF
 qDt2yZUiUXO5KBYmHuqEbdtWNYNDjbWciy3HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ct4djxaQ1e/mTdSrBIwsU7pdc+Wg5hAQ5Rc00jVfMEQ=;
 b=qkeXDZnmIl2AglsCDhLkC0WXy9uNs6ZqKCXEjH7/YkcmdO7UEsXYOzzAPk9KB/nmSR
 F1FQZg3e3DlwcrjTE0NKVBXnV2A/9oxTZe1wqzGBoX0k47a7N5UYKsG8aocCW/x1fPs8
 ftwFptLvJGrLjw9fjVEenCQU5RnklovkijEm0+1wBOEb1WEZHqDRkXYZ5hillwofEjMO
 o3ZgoGdsr5odcRAYkWXfxv1gwgmSmzEMHVvfc1A4L0BkfM12pCwxcX6Hb3BAb+l2HKWy
 50TzkCVqH4yXAD51uCmoe8ZuIo2Rlj/M1FAmvdGoj8FYZV/tAkrGMYFsLXGYw9A11Cvi
 jLWQ==
X-Gm-Message-State: APjAAAXJ2e4N7xpN7maxwaA6b9gbqgzdkAjpOBJ8/riwDqaXwp7jGWUm
 jSAicfuIrqN+3q5UtytQIa+6yC4guLsBA1Yrt1s=
X-Google-Smtp-Source: APXvYqzcLYMEwoESQzzxmef5L9TTiiJuIWAKAm+XdfYfe6HMb/b31VMWQqdA+HZTL4rW/T3GD5FRKb10NjDJw6ddHYA=
X-Received: by 2002:a37:a2d1:: with SMTP id
 l200mr29536871qke.330.1563429528860; 
 Wed, 17 Jul 2019 22:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
 <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
 <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
 <CACPK8XdSeK0CPrncmxjMKBLfCwCVHE-VWhAVaia1oQMFTOf_0w@mail.gmail.com>
 <74652ba6-ef4b-9e45-7e3a-f2375e21d40f@linux.intel.com>
In-Reply-To: <74652ba6-ef4b-9e45-7e3a-f2375e21d40f@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Jul 2019 05:58:36 +0000
Message-ID: <CACPK8XfvM-mYW_wvdsKRqYm0aLmQnROptPbh3VnZ4jsoNs9HyQ@mail.gmail.com>
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey Jae,

On Tue, 2 Jul 2019 at 16:05, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> > Do you want we to merge this series into the openbmc tree for further testing?
>
> Yes please. It would be good if it gets tested on more various platforms
> before upstreaming it.

I did this and hit some issues.

The first one is that we don't support this with the qemu model yet
and so kernel crashes when probing i2c. This is bad, as we gate
commits to the openbmc yocto tree on them passing a qemu boot test.

Secondly, the changes you have made to the driver are incompatible
with the old device tree. I thought I could revert the device tree
change in order to get the old behavior, but the driver fails to
probe. In general we strive to make kernel changes compatible with old
versions of the device tree. I think that can be achieved here with
some thought.

Cedric will try to resolve the qemu issue. If you could create a
version of the patch that makes the driver compatible with the old
device tree that would be appreciated.

Cheers,

Joel
