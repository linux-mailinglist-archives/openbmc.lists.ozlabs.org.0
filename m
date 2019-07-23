Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BBF70F12
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 04:19:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t2Gk1f9HzDqW6
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 12:19:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TOwnZ4Kg"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t2GG28khzDqPB;
 Tue, 23 Jul 2019 12:18:45 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id l9so40413996qtu.6;
 Mon, 22 Jul 2019 19:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcC4RShVO4GBc+sW4MyK+3YODcf2RJ2zchY27GABnL8=;
 b=TOwnZ4KgvqrleYyt69kjA8Pa9iW5g09uAt5QjslSfRRn8IKi1esZ7HH1t1kr3eWn62
 HwvE1GIGFI6YVmc+kPriQ5kLlktrExjmXA39je9MWxpYWvJ3WHlYOp/XPt9YQGPAzJDw
 l8DiX0FJaHPr+AY0jKpkagQRf57jvHPnKWM58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcC4RShVO4GBc+sW4MyK+3YODcf2RJ2zchY27GABnL8=;
 b=ElnpdN4P1A+LvTlGyQAxNBKLWEL/6vsqWJGL1ACsn5conpeZe7DVbtH/Ekls76iXX7
 QvJQSXHXvhJNNGUAxNVU4GJDLawqs3QfkZw40WrhHygi4RYnvYgki5y9kXCjW+Ljb89U
 +EAln1mUssql8wpfc3POvkpCwy4hWRCOoADmaxcYzEmuAzDQ3kAWtHwNpP+l9ODWzGnL
 +zLoY6H32JA5je9NoHJdvSBE2zet9RxfY1+3K/gbHbywxtk3gsorgIoSK8ZT8+9KgVKe
 FxszJpVCpOfzDQAy5P3sQ8S27emZ8erKY6hvEvt5Uh4L1Bk7uoZGuaXff5pu2u9Ev/b5
 +aNw==
X-Gm-Message-State: APjAAAVXVYK+EEX8+HjP8Adm1y2uuZJoSlYTyK7hlG5i4JMS5O0AmPr/
 HnrM34ktpvj68KcuWWtQ++nmgnErgYsucllyIMY=
X-Google-Smtp-Source: APXvYqyKa4qglKbb1MdjCrqmWrNbSYFG/mfrDWZwOC07dy0d8FYB/4HTZQLyEyfhsZkvbBQEqQWHNxVW+HOmbCsiWG0=
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr52827407qvc.105.1563848321880; 
 Mon, 22 Jul 2019 19:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
In-Reply-To: <20190723002052.2878847-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Jul 2019 02:18:29 +0000
Message-ID: <CACPK8XfGxUpBU4iNG5TwE=3J1aEZAZ=nnVvrT74LQ-F0kqkw2Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Anson Huang <anson.huang@nxp.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Patrick Venture <venture@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeremy Gebben <jgebben@sweptlaser.com>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jul 2019 at 00:46, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> The pxe1610 is a voltage regulator from Infineon. It also supports
> other VRs pxe1110 and pxm1310 from Infineon.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Acked-by: Joel Stanley <joel@jms.id.au>
