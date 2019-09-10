Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B60AE230
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 04:03:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S7by00TMzDqSc
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 12:03:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxX6fCqp"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S7bP6qGVzDqPW
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 12:02:57 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id r4so33848488iop.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 19:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bfa1lLbdU7Us8/fov2ehU7magpjZ9QSDosY+8oBz1GU=;
 b=VxX6fCqpFC+w+YyXM8i2fPYQVs05Txm+PFbraVUjz9/+PnDz0EUMWPiPfJwMZnHwuc
 xlLgaADhq2mt9JJcCjnTYVtCmByHCIV3QE2nMQzSBWTqq9Hz3mn/AXFwVfNJXEB2sSz9
 xWH6lst4cjaVQGEzZmWvMCKH6tyB+2ojRskZblbycNztNibsaA1LwcetfS5mBMOkCftL
 gYyeTaaRKlGzMkGO6IqmrLyynKhBXk66iej42v2LEXDP3WwAoPGuaqa54QW/lNRng0BJ
 CS3qISNueoMJecOKOWWB0npla3K8NZcaDHWlnnV/Xu/7qawFjhViGceyQ5dlYNSk7wwA
 FAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bfa1lLbdU7Us8/fov2ehU7magpjZ9QSDosY+8oBz1GU=;
 b=N2kSA1OUsvwsD8/izBLuNEd3P3MNDxp3ndvWxatkE9S5qGNB9w8hOsJNN03yiMCCIa
 0qzkYU7ktFG0AwyyT13TLCtfjBMcANWvfZ8L9HYA4g+WKR+I5PVDDITznID7SofKDs5x
 tbLsT0RNXRX/dbHKq+746j4SWAgx/Z9FvWWUF2QFxI6+leoZ9ebw4jYga7zQwVLEXLLl
 8gCtjNIyOTfc4njKD7KZqruuo5qqKLF74CbSLrMCdzInJzBXmS2cbQSQ3VFef+8ODyco
 wfq5K4SzaH6a0EX88w94Y5qnk/HdvfoZTs9vVq+XQa2bWEBN0k/hPcpRLPOLb1Fh+/A1
 yG9Q==
X-Gm-Message-State: APjAAAXtwOS1/emgLpltlkwgw6nl+clbZL0JULG5pPROjKiAztyTZv+X
 L4sl45am4GAvY1lj6CeO462qbTejMnQYr4iZgxQ=
X-Google-Smtp-Source: APXvYqxH8HjCnThLqUijD4qPhxJDsDRkACsG2cfXgy8uojOYh2am0SnUAxhsT9ssi/QeMdKOEPp/ZnSWIKfUmqBiAiU=
X-Received: by 2002:a5d:9499:: with SMTP id v25mr8579157ioj.138.1568080975183; 
 Mon, 09 Sep 2019 19:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <31AC8BA7-36DC-43EA-A541-47D233C97D97@fb.com>
 <3437EA8F-D052-4507-A18D-9E1268875BEB@fb.com>
In-Reply-To: <3437EA8F-D052-4507-A18D-9E1268875BEB@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 10 Sep 2019 10:02:44 +0800
Message-ID: <CAARXrt=20eL5DKCDtN_5W4WpQ1t5zMUDz2oKfWw5L_HUiyAo7Q@mail.gmail.com>
Subject: Re: [Potential Spoof] Re: Sdbusplus/tight memory conditions
To: Wilfred Smith <wilfredsmith@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 4:42 AM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> No, I=E2=80=99m adding the compile options -OS (optimize for space) and -=
s (strip symbols).
>
> I=E2=80=99m happy to look at other possibilities, but if you review my ex=
periments, symbol stripping alone can=E2=80=99t reasonably account for that=
 much bloat. I would love to be proven wrong so that I can get closure on t=
his. I will build and flash a complete image, as you suggested.

I would suggest to use `file` to check if the binary is really stripped or =
not.

My test with SDK shows that with your `Experiment3`:
* Before strip, it's 2468324 bytes;
* After strip, it's 140996 bytes.
