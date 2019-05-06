Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0D143D5
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 05:54:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44y85D671rzDqGx
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 13:54:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Hb4zxIV9"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44y84K6nbbzDqGg
 for <openbmc@lists.ozlabs.org>; Mon,  6 May 2019 13:54:09 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id c35so13259830qtk.3
 for <openbmc@lists.ozlabs.org>; Sun, 05 May 2019 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLmItnnqILiWWXO3Q5jI4vP2Ej3ZQf5sMErtWvOvLKo=;
 b=Hb4zxIV9LJHj8Qztum+gv2gC2iuvmxT+zAIuM+L0Uyv5J9nn51oQOiWdkqX3hC71w5
 495k/D/Ka3Bqbo5f/QdVspzo/6FSb1IfjONGH5NnBGkNkUluoetI2TLnCDz7sBYQ5wk6
 DbnIYy1m/eqWNVG9qK8dQjduoHj4TQ58+HW0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLmItnnqILiWWXO3Q5jI4vP2Ej3ZQf5sMErtWvOvLKo=;
 b=Q03zrXsPIo6rXQuFBdBa944nflMPSmhBAOsxHo8oHvvPuqjVIdTCFxxmTVNWcZBYJ6
 e7BSV+QjRVolNzw94zS6A11nz/eEy/YsSXBml8H3R6JvRNZhZswK+zPP+CMGOgetO3l7
 v9rlx6d0FV70wGM+rXwWyygCBsQdOebtHf7AghTALfGlqZ6EN47e0cMlR16SXG7dCp8M
 BNNp41NzEiX7IoKmdCBO3pb+ypCsfZ7f3zceS9p5WeIMwU5uhQMzHMgCDXJVKgfYWmz8
 CjjPWCQi5eRZMFv+lY6CX7jAS9ooV0eQTzHzUGuxZzl5HJPc+DVwbppAUVRaIZ8hKpSj
 uM2A==
X-Gm-Message-State: APjAAAVaB/gLE6/adaMUR9SbbkY05+xfi2noqkCjJNj/cn3K8p4vc8zD
 uJZh2gxXXz4mAefJjkgfqcZ3ef/7KalomXQbim8=
X-Google-Smtp-Source: APXvYqxWcLvDzsGzdeaDMClUQRaL3mRma/UHsa5khFMKXBVTIKfw4gT5W9rHs2lFOhBNFAH+Js6EDk/awZDpyErZV7s=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr19057304qta.136.1557114845468; 
 Sun, 05 May 2019 20:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190503124444.5056-1-joel@jms.id.au>
 <88246755-225c-43d9-b27f-6f081bba2d14@www.fastmail.com>
In-Reply-To: <88246755-225c-43d9-b27f-6f081bba2d14@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 May 2019 03:53:53 +0000
Message-ID: <CACPK8XeQ=+uva-JA2nL_RzNmdZVTB0JH3qfrXBgo4m=Ktwrr+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0] ARM: dts: npcm: Remove use of skeleton.dtsi
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 6 May 2019 at 03:05, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 3 May 2019, at 22:16, Joel Stanley wrote:
> > This file is not present in 5.1. Clean it up in preparation for moving
> > to a future kernel base.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks. Applied to dev-5.0.

Cheers,

Joel
