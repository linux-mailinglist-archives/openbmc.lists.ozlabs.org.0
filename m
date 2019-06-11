Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BC3CCB9
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 15:13:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NVn00pt4zDqZN
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 23:13:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NVlX6JLrzDqYd;
 Tue, 11 Jun 2019 23:12:07 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id d15so7580693qkl.4;
 Tue, 11 Jun 2019 06:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyYvnirAncfvqftH8b0du6PTVoUwek5hDeS0HicdvJ8=;
 b=BQ0BPB/fw6H5AC93JcI7V71NR/q8j3PWBdLOI6AwIMTP6vrjxQBcZ5yohY04W2j502
 BZnq6Jol0qTaAqHj9Hso/Pk9h0KZcl6U+7ZjJie0DG8T8Z200CCxpJga35bmO2tJcsvY
 MhfqgiALeFVG5+r99eUtOoatM3D4iLNAw3lUqwRTHKToTozg6Bt5sfvAmKqrqNzxhZZ7
 2z1CZuD9waoJ3zeJK1XUBTy0pRpnOdmYsC/bNnsCPMRmXPTgILnzXluf2obh7Igz7rB8
 VgjnlLA/ZXDMZApg7wRKGXXHkSpRDdXhnx6gC4EYOajnAVzx2UdAvUF+NPZ5GDGImDWl
 nanw==
X-Gm-Message-State: APjAAAVTO8XGiJLV0IaJQFuzVw1MTIqvnfC2fKPr4ICIXVA1LOum3PeL
 Sm9MiJAYNi31Luc3wPqwaNP5efwKuIZlScPeRwk=
X-Google-Smtp-Source: APXvYqylIdCcVDzvlOPTn/Jad8SMMmSjCbrCYwIscvJcBt34a5gTosawEIrvHbQw778UawvftHqdj+8EU+S0lkdHer0=
X-Received: by 2002:a05:620a:16c1:: with SMTP id
 a1mr17486493qkn.269.1560258724850; 
 Tue, 11 Jun 2019 06:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190610133245.306812-1-tmaimon77@gmail.com>
 <20190610133245.306812-3-tmaimon77@gmail.com>
In-Reply-To: <20190610133245.306812-3-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 11 Jun 2019 15:11:48 +0200
Message-ID: <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 benjaminfair@google.com, linux-aspeed@lists.ozlabs.org,
 Avi Fishman <avifishman70@gmail.com>, gregkh <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Patrick Venture <venture@google.com>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2019 at 4:19 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
>
> The NPCM BPC monitoring two I/O address written by
> the host on the Low Pin Count (LPC) bus, the capure
> data stored in 128-word FIFO.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

We've run into this situation before, but don't have a good solution yet:

The driver seems useful and well implemented, but I keep having a bad
feeling about adding a chardev driver into drivers/soc for something that
is clearly specific to a particular implementation on the hardware side
but generic on the user interface. The same user interface might be
used on an Aspeed BMC or any other one, so please coordinate at
least between Novoton and Aspeed developers on creating a common
user interface, and review each other's patches.

Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
that collects all those user interfaces with a thin abstraction layer
and one or two hardware specific back-ends?

        Arnd
