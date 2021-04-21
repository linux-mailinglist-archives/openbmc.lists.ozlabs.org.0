Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9006366370
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 03:44:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ3JC72BLz2yZC
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 11:44:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ODVsxM4q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ODVsxM4q; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ3J06Htfz2y07
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 11:44:14 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id t17so13017355qkg.4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 18:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fH4JMTYllC5+6a8b47i09THGhwc7G9wUkKjuYqDPC1Y=;
 b=ODVsxM4q2Da+N3pXbrKxZ9BTpmnu3GUVj2M4967+q04MRrL5nQ+EdGTthZITd3e8r1
 P7dFSJJuPXrkTvGNLP81rMLHbNBnvO0P7ZT2IDAbE1UIKrRhQWKbD88yVA8PFSLd9Daw
 tyQu6dJ6CgWvVZfSDTEZqAh4nWzWtCU6Pwcdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fH4JMTYllC5+6a8b47i09THGhwc7G9wUkKjuYqDPC1Y=;
 b=E3uHIW0ctBXrAQkpkIM9ihKeb2yQ9uEHIA9ZnM8swspQT4dNUYZ528o3ckhOyz73T5
 2zDZMbdPjFuYkP2rkoKMrVQIFuwGPo+X1HevdiLMx1qNNvEwykQODiTpOdsjtIcdQvf/
 QyMBl8cXMs5V6d77SdfOvP1g9fEOHq5q3zrhtyedvbqXSEOtwmflDoOCS/Buzg5Nxs1G
 WUgfxSkUQ7+AGcEKZHwasmloFSsQcR5/HKmP98+TeOiPvNfYCAnluPcBucyN9Mt9B/sP
 UM36g8JuYodsa0kZ90frz9ei6aV/QNEF3+IXjUWE9OhbDG/JIME91QD+RtTBmT2Grxf0
 zPuA==
X-Gm-Message-State: AOAM531JhKKWUboa1g5gnDUksx2/yVdR4UW1lcoYKU32wJxxbF/s3cQe
 6Wsx3WTkFEmITMtU/TSV8LhzcVH5m8Fo3RuUuus=
X-Google-Smtp-Source: ABdhPJyfZ0Vngk1XwihAHfCe6cCxb/Wngq/0IZ6VLBKrtBNC8yMOme6b/b9voOa2PVE1hzVyieRoUKLkgzCcBX7ovHY=
X-Received: by 2002:ae9:c014:: with SMTP id u20mr15390125qkk.55.1618969450962; 
 Tue, 20 Apr 2021 18:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210420064648.994075-1-joel@jms.id.au>
 <20210420064648.994075-2-joel@jms.id.au>
 <310b1c39-5cb4-4fd8-1540-0ef1ba88ce66@kaod.org>
In-Reply-To: <310b1c39-5cb4-4fd8-1540-0ef1ba88ce66@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Apr 2021 01:43:58 +0000
Message-ID: <CACPK8XeoHZiu6+CgtFCwcmzWReSwEKWsnhhfsR2oec44H+8zZA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 01/10] configs/ast2600:
 Make early malloc pool larger
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 20 Apr 2021 at 08:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 4/20/21 8:46 AM, Joel Stanley wrote:
> > The size of the early (pre-DRAM) SRAM heap in u-boot proper is extended
> > to 8KB.
> >
> > Testing found that the DRAM driver would perform an allocation that
> > exceeded the limits, due to the probing of the HACE driver increasing
> > memory presssure. As SRAM is unused when u-boot proper is running, it
> > can all be allocated.
> >
> > (In theory the entire 88KB of SRAM is free, but testing showed more tha=
n
> > 60KB would break booting. Finding out why is TODO).
>
> Could it be a HW problem ?

This was testing in Qemu, so probably not. We model the full 88KB in Qemu.
