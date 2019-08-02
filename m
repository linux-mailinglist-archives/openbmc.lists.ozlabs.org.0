Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C37EA91
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 05:03:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Bn92ZqCzDql6
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 13:03:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HHpUAOqq"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460BmS4Dm1zDqc5;
 Fri,  2 Aug 2019 13:02:47 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id r6so68265796qtt.0;
 Thu, 01 Aug 2019 20:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pMvBx1hh8/G6Czd/FV/OwlwQ8LJ13TfBmKizcKZrRrs=;
 b=HHpUAOqqbJLsZvBpfU4B2ieP1G/ChCo8uBUPMEmCma/20hEezhFd8aoEeR1umSF8st
 7GxteKnxNfdURFGMMp6U/7upsqAq16TOUhW4ynIdOjUInlB+AfUCDBkFzVQKITorXkBw
 D8rvt6E/LHBk1CNSmBCzubB5Ews/Mo/hG3wE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMvBx1hh8/G6Czd/FV/OwlwQ8LJ13TfBmKizcKZrRrs=;
 b=t6OeE71ukxdJ2JrDyjMceTSz1Rblegy/7pqcCaguzihP+eji9qENMGfNdyOBFmKbQc
 Y+F2XKSRLO4fiAyLahDhAaMW9jFNMDUucTF/iL8MVt1ofEEk/Qf0EK1RRljSCChisMly
 SARB5O+lpjdnZZIxdQG3muEVDxzMzru1sIH9DFhBAwbJWX/DDGOHwpziMlc5ZS4ZMguj
 d31kLpqNEAntWq8tY0tr23thwFpS3K0raxfIOg22m88ldcrVG3ImytGN+5ubNfTa4Jqq
 ME9fDql93SWXsxCQexj9Ew+2tvVgJJl5gsTWTaGgbE434dcNr929Pd7NOMaAyIdRHStL
 TVuw==
X-Gm-Message-State: APjAAAUjeB7bFHCOtnQDQZSg1xc8XlQHQtnPaQd+zN/hTNbSZTl5zxQM
 /DJQEZF1gAolJbT71Cn45X3w8wvvwSl5SULup2s=
X-Google-Smtp-Source: APXvYqz7mHdc8lBlyD3HcADLWRy1k1ur3idhBRDnYpffy7ym+Av1tf5AlRYkmS9IXaNcLXyUw56O4NlOlpWTDVLcclE=
X-Received: by 2002:ac8:2fc8:: with SMTP id m8mr94544340qta.269.1564714962033; 
 Thu, 01 Aug 2019 20:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190802010155.489238-1-taoren@fb.com>
In-Reply-To: <20190802010155.489238-1-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 03:02:30 +0000
Message-ID: <CACPK8XdS4m9+74oxK0-ed3ZLr_QCh--AsFgGcF-OpLw24v9g4Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Wedge100 BMC
To: Tao Ren <taoren@fb.com>
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
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2019 at 01:02, Tao Ren <taoren@fb.com> wrote:
> +
> +       chosen {
> +               stdout-path = &uart3;
> +               bootargs = "debug console=ttyS2,9600n8 root=/dev/ram rw";

Are you sure you want 'debug' in your boot arguments?

The rest lgtm. I can remove debug when applying, or leave it there if
it was intentional.

Cheers,

Joel
