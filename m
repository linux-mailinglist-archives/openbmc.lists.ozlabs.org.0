Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F067123DB2
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 04:09:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d0N651y2zDqNf
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 14:09:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KQEL/Jam"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d0ML72CdzDqHJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 14:08:27 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id x129so363156qke.8
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 19:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gf/feCF3WlB0j1TN+C1gbnKxng1u61u/IqRr6J1aiI=;
 b=KQEL/JamlnaUP8m3bvlxgwyGoY4IfAPqeUqEvWxjF1fgq9wCjvqTB0MurPfGiAWuVQ
 GuiP9ExwQzhcU1F3ffrSadiOiyXom8NdjG3bxT4kyucUTk8YcLgSRyx6r/zcsvjyKH72
 nJMemNUsOfLrzRhgrvnZnzBFQ+E4sj+dvCtgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gf/feCF3WlB0j1TN+C1gbnKxng1u61u/IqRr6J1aiI=;
 b=TrOBKwtaFNw5LZqrxyuZ2oCF7RG4nN0ENZKp8bqLekdbJe2+hW4Kcx8yGwydTersWM
 a7LemzDSpiokSJpXQAHnl6dSIsB3RU6PNoI+qTV5dqTXm21nCghSOUbrppeb3soUjZrr
 8fXoJ4CpNSbsu5TWAl9VBwDx3/S8cG9bsvRruVBfSHBC+qYtRw1x2qTmPmbCPG3TWZng
 9hHFtjM/hbhJZhCTxZb+W/T4FbQqJBSXHb3XvdOA1f+R8DBqzLmWt6B72jTpDsvuUMO9
 9XU3ty7wjhY0STSs/uO+WeNeBOIBq8UimKl5LQ2ioGfRHuNzIxAe1CluW6dsrv1c6ylV
 i5QQ==
X-Gm-Message-State: APjAAAWw+0zXqS2NiCMb8t62J+Tqe8FbqOHT4xAf3YAGKeD7Sg/ecAck
 MUnF5s3t1QG3Ulwv7BreHYclAdfS7BX7nCw83oA=
X-Google-Smtp-Source: APXvYqw0CV+IV8qEsCTO++fzqDi7rdcSuQzkldt5i35aCLCz6f5UExpBcw4bkdVy6/KJbSLSHVEA5f9Aq09QbxTR14E=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr295700qku.414.1576638503905; 
 Tue, 17 Dec 2019 19:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Dec 2019 03:08:12 +0000
Message-ID: <CACPK8Xd1fEh-o_5XR=QFppfR=HiQVbz60KjUFvjX7Lh7b9Le2g@mail.gmail.com>
Subject: Re: [PATCH dev-5.4 00/14] PECI device driver introduction
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 18 Dec 2019 at 01:28, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> I'm still trying to upstream it but it would take more time so I'm sending
> it to OpenBMC list to get cherry picked in the meantime.
>
> I rebased it on dev-5.4 branch and it includes fixes for addressing
> upstream review comments I've got so far.
>
> Below change should be removed from the OpenBMC linux tree before applying
> it to avoid conflicts:
>
> c31349b9039281107b948bf94ed5e53c235c8081 (ARM: dts: aspeed: peci: Add PECI node)
>

Thanks. I have applied this to dev-5.4. Please test.

Cheers,

Joel
