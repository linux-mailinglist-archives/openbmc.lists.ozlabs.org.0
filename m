Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682DB593E
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 03:23:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y2LC6X7vzDqP5
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 11:23:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7wLLXtl"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y2KS1wnvzF44L
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 11:22:51 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id r26so12187143ioh.8
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 18:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJEp8C5Hnz3Mqzaz+0emd9kzZwXZMQkE08gzt66bfrY=;
 b=M7wLLXtlaIuMu5lYOxjdDLXx10LrbxRNYEhlRUUwr+q50oaxe/3f2GKsTVpYl8+35z
 SxX/qU8j6Zp0kZ3EFaE2veFL2finAB6JHL9nZfYL9kHqUc469Fonoc3Kwmb/UGAvLICA
 Zep0O5mjv8T4YT8G5S/2cYjoeeLOTyZc9SKZACcLkqv7QWNGW7C8ARRV1/Hd0LQ00Bom
 SZdL5b/7RnMKAfJSI6BUzG5UwhjGbHtYGREdxKN/hdx+ivBd8PmTvgQ51SIwjOQ00p/c
 F6Evgth87TmBmX2gIHJruQNsl7YyxUAqjSQoYM/QXUC6qFCuo/8mV7E/kGXtDVkA7pha
 obCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJEp8C5Hnz3Mqzaz+0emd9kzZwXZMQkE08gzt66bfrY=;
 b=VpxGUtSshs0IuCC1vJDMnpOu6GRXT0Yr/jFzI1AaeeV0KxUg+4/y4nLm7cP0JNWJrf
 yDgc/VZUt3de/1CUDqPpGjlUSgQ2T5vMZMPnP6eXjDuPU6tKPJ/V3EgzNQx1Ln9fSdnf
 +du1zmIgjb7JO6fMpHZ7mnwVAKQgUTemOaoZdRnYvOE3lXyOlRxlxoWhMyGY8bHr4tGi
 JsuCUNxfV3ZY/m8EPrgn7EZgkACDgFTrS4bjs4X1N44XZJVWy6FMXJup7l199lEikRgd
 WOuQoOqypJHADxym56IeXL0Jh79t5GbPpOuMRiLcjOf47mbQfqPb0tKS0tJWWmtth1WQ
 23fA==
X-Gm-Message-State: APjAAAUDrKKtCAhbE59FCuBf/9tIpZN9Cq4z3mX+5+2Bu6gjYQNx4ZP1
 w1RlpJTx8TT7ba/bBrID13IQn0pKExLhxlgJr5Q=
X-Google-Smtp-Source: APXvYqwxQLNn92cdVfyQVlLCz5b+B/D3Rv9UmAa/wAiAAG1ds9baZzX5n/HZLRBT8Y0WWbvVx3u6n8PtojuTzteE0jw=
X-Received: by 2002:a6b:8e0f:: with SMTP id q15mr2328889iod.186.1568769767892; 
 Tue, 17 Sep 2019 18:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <05C62CB4-950C-42F4-9C17-41C91E54D9B4@fb.com>
 <CAARXrtnDnsq9BQEftaeymEF1W9ehKCwuzUZLkKbkcXJ3a60RnQ@mail.gmail.com>
 <2D4BCEA9-A10E-4B06-8D0C-34E8A6746F5B@fb.com>
In-Reply-To: <2D4BCEA9-A10E-4B06-8D0C-34E8A6746F5B@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 18 Sep 2019 09:22:36 +0800
Message-ID: <CAARXrt=4wovy+HbTN4a4R0q4vH6H-fGGh98z7OGHy_E3qcYuEw@mail.gmail.com>
Subject: Re: Phosphor code updater
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>     By default, image-rwfs is an empty image with size 0, and thus it will NOT be
>     updated to rwfs partition. So by default rwfs is preserved during code update.
> Then how will we get a clean install. If we want to have complete factory reset with empty rw.

This could be done by doing a [factory reset][1].
Example REST API:
curl ... -X POST -d '{"data": []}'
https://$bmc/xyz/openbmc_project/software/action/Reset


> Also how can we add machine name to manifest file which can be used to verify if the image is being built for same target.

This is good suggest and not implemented, welcome to add this feature!

[1]: https://github.com/openbmc/phosphor-dbus-interfaces/tree/05375b14e5a68ac249da6a8cd68e3d522a7ed022/xyz/openbmc_project/Common/FactoryReset
