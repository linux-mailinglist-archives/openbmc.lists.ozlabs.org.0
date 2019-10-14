Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCED593A
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 03:11:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s0rg5y3czDqvd
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 12:11:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="a7jj1wba"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s0r618RnzDqvP
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 12:11:15 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id h126so14456449qke.10
 for <openbmc@lists.ozlabs.org>; Sun, 13 Oct 2019 18:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3Y6aFVNfPq/cSohhcScVa0puWC/eozcFcx+wRNsZS8=;
 b=a7jj1wbamOmHl9oPp4BAgpDV3VgFUraO5dQXn9v+tcSF8O3klvvAmmRChty/KKJkwE
 f3vbL1ChTPIaVUbhS6H6az8rhrHFcffUPfWjHD2+mdE+zEdTK+zYWC/YDMfteUzEpoYB
 MK+wr0Ggi0M3lNamFORtmBduFzJ+gbBGrHkC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3Y6aFVNfPq/cSohhcScVa0puWC/eozcFcx+wRNsZS8=;
 b=rT5jlmmPQapYRpvEUFyLlFRqyJLchh5r4xyp/B+ZXJbznYTG2jtgeTzpqv7SyPNZBX
 O+BuFmYFw8EiF6USeK2L2VbPgVdA4GFMlxWLR6QcvLLu6nwxJV22hsB2i9V13mIh05aA
 +sYMs4zf2kObyWNSL2x3lVI7oZbCJimqagASHZD6trB/cvlVNAdvPvStMkee/LLNDV48
 FiC2kuxV0OnJxs/fQGVBkYSl9B8zvMprkiCAYQFc7V1LZbp4rzA/kIpapoul2jwwCYD3
 iaFQGx/fdwHHq2x6igm6vTEAaLaEJpYnyWDn6oK9hCCB7zYDyi7K/3JYvKNn+68HAOSm
 0m/Q==
X-Gm-Message-State: APjAAAU4UgrwzrFgmeOXdN8CV7IEyjvT0nq+3Y8g+lgsGlasP3Ajfoa9
 nafMTwtm3KfBRTOV6TQJ++j/cM8NKjSqCMJbCA6zUqy3
X-Google-Smtp-Source: APXvYqymwihQu7QKUS12fEkffTWNjg7zZB8HBiCqSeiwxOBfsHmhhBf24ytcHMIwyQrXkVm2yAlZH5BBub/WdqoeKi0=
X-Received: by 2002:ae9:e30d:: with SMTP id v13mr27324504qkf.208.1571015471739; 
 Sun, 13 Oct 2019 18:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191014004433.28180-1-joel@jms.id.au>
 <de89b084-be95-4113-97c4-40c62d8572c9@www.fastmail.com>
In-Reply-To: <de89b084-be95-4113-97c4-40c62d8572c9@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Oct 2019 01:11:00 +0000
Message-ID: <CACPK8XeTmFK92XnTvW1Skjj3y8SnaKDsPoaLoC0utQQL6KHMUA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3] fsi: aspeed: Add debugfs entries
To: Andrew Jeffery <andrew@aj.id.au>
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
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 14 Oct 2019 at 00:49, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 14 Oct 2019, at 11:14, Joel Stanley wrote:
> > From: Eddie James <eajames@linux.ibm.com>
> >
> > Add debugfs entries for the FSI master registers.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> A bit ugly, but:
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Yes. We will keep it around for in the 5.3 branch to aid with
debugging, and drop it in 5.4.
