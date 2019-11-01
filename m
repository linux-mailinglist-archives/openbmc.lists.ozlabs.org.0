Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DAFEBC46
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:15:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746kZ2KKlzF6W8
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:15:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZI4z5ijp"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746fQ0qTMzF35G
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:11:25 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id 15so9312504qkh.6
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhUcw/B6hJ3wSTrPnN7QAq5A6CVMvzkcyjc061N3zuE=;
 b=ZI4z5ijpjpahksdaH6u7N9McKsmdn3Y26vReIhql8fxAr9G2sQHf6VUSQ1e4PIxekY
 uekEC3S9ILa17yW/j2yyh5px86bPdBMyRJAdNKBj6xyyNdnlQPVEQEdB+ngLSiseqikR
 sYEq/0jD1HCgQZe8PvVMPUPtn8O1xATNsSxak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhUcw/B6hJ3wSTrPnN7QAq5A6CVMvzkcyjc061N3zuE=;
 b=XPXO2hz31gngk431Lq5CkiwKnAdmq2GCuRZd28tHwd5J8mYhwaP/NUrR1Fi1iyZn1b
 O46bclD6L/ZpoIdlsFLpXoR/A+aSaTywBMkndqNR94uxylpZIpyUOFRPyFhrhKrXF47G
 AKq0ft3cxN5qwrQln04AwNYcEfHKWHvoAKDvGmnWGIReyFg/l6XIC0qhNq5jzdszfGhd
 zSsXtAUGjennMJ0yy/0JFejgFjlKK2gb0M8DwuiR2JCQyccZYM3EqXb7kxx7WfiFcehu
 GuXr3u6UpUNYU2hrVIl6NGRbzfp7hNQHeuiT+HreNADIwAvo7VTMZwD5ffLMIXHih3iJ
 8tKA==
X-Gm-Message-State: APjAAAWMnalQh9Xm/XnF6ENU/rfe9aHI0wuYoai6ANx4/R1jExX6r/wy
 laAZhJq07c2t/eli4VCvS+rWtN7QaDa1levBo40=
X-Google-Smtp-Source: APXvYqyg1gbnOyG15GU8/e0t9OQ/BfADUZzglfLA8z1a9VUwlfmX2NAI4fgBm/sfi83dkU9zsG1tgkeEWNJXatRSNlI=
X-Received: by 2002:a37:5fc1:: with SMTP id t184mr1289486qkb.171.1572577881913; 
 Thu, 31 Oct 2019 20:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-2-joel@jms.id.au>
 <6cf81782af1267d91ac2e7db9d21f9ed45b79ad0.camel@ozlabs.org>
In-Reply-To: <6cf81782af1267d91ac2e7db9d21f9ed45b79ad0.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 03:11:10 +0000
Message-ID: <CACPK8XdE5izKRDYZfk762EUngPT35z+djoSRFUrJH=sVkCwvWQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 1/8] fsi: aspeed: Implement byte and half
 word writes
To: Jeremy Kerr <jk@ozlabs.org>
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

On Fri, 1 Nov 2019 at 03:09, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > The driver did not previously support non-word size transfers. The
> > fsi-i2c driver attempts accesses of this size, so we require it now.
> >
> > This creates three functions for doing word, half word and byte
> > writes. This was done to avoid having to decide which length the
> > transfer was twice: both in aspeed_master_write to determine how much
> > of the void * to copy, and again in opb_write to look up the opcode.
>
> Looks good. I was wondering about doing only the writes in this format,
> but then I saw patch 2/8 (would it make sense to combine these?).

I was wondering at what point we merge this driver upstream, and if
it's worthwhile keeping the history.

The major pending TODO is error handling.

>
> Regardless:
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
>
> Cheers,
>
>
> Jeremy
>
