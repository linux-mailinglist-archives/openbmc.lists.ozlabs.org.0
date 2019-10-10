Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F4D2101
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 08:49:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46phWt6LW9zDqvY
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 17:49:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CHzh5/CM"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46phW334h5zDqvR;
 Thu, 10 Oct 2019 17:48:31 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id q203so4650118qke.1;
 Wed, 09 Oct 2019 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HfYimyj7XnI5kt+t6lECNj+HcYUo8K48jVJvvrvxJwU=;
 b=CHzh5/CMtBcl4mAy48yu0PywrvQ0pK9mWsdimHH8jgdHSBLl9cNKhCrpdvO4L0Zaaj
 VwAXU+VhkNVrUCrU3RuyIejzaWyqSWwSxMKr7W1whgRO8OpDt4vjoJVGtbQeBkgKQDGh
 vCtjQzVdaFc0D6pK3nDqrBDXTRMmwVcc0T0PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HfYimyj7XnI5kt+t6lECNj+HcYUo8K48jVJvvrvxJwU=;
 b=M1eKrOrF+clWpGEvRQZJJCJhkmpecPBpLK9LcrCpPrI40ydrmpZuvFTdD/kmP0TD3A
 B5zKgFujNqGWtD6Q65odBQFPAarrFZxaxZYGacVkah5ramMSdv90NCHIc4E4qZtOOzly
 C4wzwX/pwbDUp490j8OeIMmdV4SaoVr+9K7Weto7RnomynK72EybdCu0u8Gy7jX7CAmT
 PkXTdZMMMhsquNa5nNuwHrSf1LXazrWGKpISJrAQFQ9Gbb7MgUK1dT+2NvghIhnuVCjt
 GlOmdOmqMxGNiIxg6IX8G+uMROAByNmRUHB7HGGo0iJRTOPQVKzu6vN8HgET3Sm3k7kw
 UU7A==
X-Gm-Message-State: APjAAAX88Tq4T2ru0kW23lE6vdBdqp6u7QeJjCt8nfroBNXfYqSPOi7D
 RfOqbxR2tFien1NA0ZXMYRMFZD17Xke8CLDR4mQ=
X-Google-Smtp-Source: APXvYqwoWtsEFPJ7Ma76eSNtW4TPaTGucXelYXNVmcWl2X/aPwSWHNNk6gYfy+Y0OlvgYSg2H1snmH4FDyZYbyorRFg=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr8086400qkb.292.1570690107291; 
 Wed, 09 Oct 2019 23:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 06:48:15 +0000
Message-ID: <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Rob Herring <robh+dt@kernel.org>,
 Cedric Le Goater <clg@kaod.org>, Tao Ren <taoren@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Oct 2019 at 21:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> In case of master pending state, it should not trigger a master
> command, otherwise data could be corrupted because this H/W shares
> the same data buffer for slave and master operations. It also means
> that H/W command queue handling is unreliable because of the buffer
> sharing issue. To fix this issue, it clears command queue if a
> master command is queued in pending state to use S/W solution
> instead of H/W command queue handling. Also, it refines restarting
> mechanism of the pending master command.
>
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>

While reviewing I was concerned about the locking in
aspeed_i2c_master_xfer. It's a bit hairy, and I am not convinced it is
without bugs.
