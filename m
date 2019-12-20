Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF0127348
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 03:07:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fBvf2L1hzDqvr
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 13:07:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VAikPW4b"; 
 dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fBv11GtyzDqtv
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 13:06:36 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id b15so6600517iln.3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 18:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ElvwwinUHzsJHdoke4sQZqvF2BcshT65l7CGLjfHP3o=;
 b=VAikPW4bd6eCN7SpbhIhzpT1+Pmy/2KKrZrDageYlSde+rLMUHH+mPfBelD7FYAAqL
 rCPDhXaQFxqcTb0o4Vg4GuyfZWnwSIJlkyYq8PdmLGTwqqtI7u+S8MrbKlBqBcAH97mC
 6CLr9f3IazvaIBx7PJPgSCjuJXyevRB4YGC5nFRfihWJ493h7Qza5b6itST4/M/TPjrr
 dRNEoChLkLQ85sZtvKvXXFvO7fyP16dtXmHyWV0TMSjyXVLwOjVs4HVQrjX37qSKGj/O
 J4o25wMrE8ehd7Zf5vLQ7627zob3QYG7XKnjJpyHjc9z46CulB1EIL4ZiSWlaIjaZxhl
 SvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElvwwinUHzsJHdoke4sQZqvF2BcshT65l7CGLjfHP3o=;
 b=b7+FgxSMad/HtMqV8DzVrFdIH4EsK1Rgd1/OoTim2W1FLFrWxqhsb4hvrRMvHG3Gci
 Z+TvtYxtVS/vQeTbQlTIQovyiBwU35ehFvFm6E07mM81F/KwicSZLJr9D2pusZ1RD+yr
 14GkttSysjkYIL8ehASLZSqGWecsN5CqpV4nnSZfoLz1w0YS+N9jNTnykClcoBdK6zNr
 0KQfMF9yCKxZXkBdTMSmB3RzOvmaC5eaDKSLTJ68yToN0VzcO/QuCRqhee2yxOKKhMtH
 sWQjC4NWx43ZkzAzzOdc0tEpGlHuxQ4eBGMjJL2+F5R6EoARaxWb+1ETIeE3jNiYdaGF
 E8Mg==
X-Gm-Message-State: APjAAAU6Sb2jfRi5s8DTJSp02ykE5p+LPAKHsbixQFlUst/esVBeBbpR
 JpbjPTyja3EM8TEVNInD1aEhCijGHCE4jUfxzHw=
X-Google-Smtp-Source: APXvYqy8bmyyqplbC7scZw3I2FewNZ0Po6Vmq4t2iY0+ubfD6OmeqBxtnQiOScPw5fhNbWTfq7ie9txdirio1DhUlig=
X-Received: by 2002:a92:498b:: with SMTP id k11mr9896148ilg.221.1576807592887; 
 Thu, 19 Dec 2019 18:06:32 -0800 (PST)
MIME-Version: 1.0
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
In-Reply-To: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 20 Dec 2019 10:06:22 +0800
Message-ID: <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
Subject: Re: Power Supply Cold Redundancy
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 9:13 AM Yang, Cheng C
<cheng.c.yang@linux.intel.com> wrote:
>
> Hi Brad & James,
>
>      I am going to upstream an Intel specific feature called Power
> Supply Cold Redundancy which is to keep one PSU in standby mode when
> there are two PSU on the system.
>
> You can get more information about this feature in design doc
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27637
>
> My question is which repo should I push the code, is there any exist
> repo maintain all PSU related features? If not can you help to create a
> repo for this?

phosphor-power is the repo for power supply related services and
tools, and it has a C++ i2c library that could be used to interact
with i2c devices.
It looks like a good place to add the service.

Be noted that if you have PSU driver bind to the device, e.g. for PSU
vin/vout/fault monitor, it's not possible to do i2c read/write
directly, unless you unbind the driver.
