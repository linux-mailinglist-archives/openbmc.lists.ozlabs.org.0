Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC926E70A
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 23:03:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsqFF2XqZzDqfX
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 07:03:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QSTmDFZE; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsqDS1PQLzDqfX
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 07:02:44 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id g96so2651625ybi.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLEAQCvYCy7P1R6gerUHDmKCoVlk+WFytSpHUuXLUSk=;
 b=QSTmDFZEYDZPJWdCY9tvQCJ3ULuequJgloCbHWeScUggDs/vsl+eTNR7545a5+ItXs
 6lOLtv3/D+kH1DVALG3dEuKTZkgxAy2Mh/sqzmK3L1k0PpPsl5vOFRKfCBN4mFIOhZsm
 e+b6etWUCWTPNy6UiP2zXpRE20Fuv7jHPv9HEBC4zJYzq36Ls5Q9nvDK9w2YSNVxyWdM
 WjkOaeFFwi1aH7b6qWfq4UcqbiDptls+JN+ZsKJ24g3tFOIOyQBgwd5x1NHIQraDptOj
 O8F7Wg0qRid32MCIp2Dn1/JCKJoI94Q9+HkX/evw72KWQSuaRm+mZneoSjF11TKn4IPp
 83+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLEAQCvYCy7P1R6gerUHDmKCoVlk+WFytSpHUuXLUSk=;
 b=kmNAWZaeresmHLF9ao2/i7ha7nSCgtO2A/g8xPYfESB7kmuykfl0djXPA15uJUBTTU
 kyqfPZsP3VUXt0qoiU1WHocF1WdS70qYceR5TcYfxJkHINIqEI3pcNxO9CZCzgBwWx9c
 JoMh5JAaLQZgkMvhUjG4sreFLYwqNnXOf1jIFv8w3NR4j9oua3ugHBch2LUgLhdVWr59
 1cNqGX23hEyyUwT7LiGZUvjVZpckHDclmN2tLUiz+rNxlnumLMvvzT363eMzdhJhB+3G
 0beaxdcLka/8j+Zn0/WXkI7qud5GEkBpEbP0f5Z5w74fvf4oGAiUS2yPdrNg4Gs7G2Dv
 795A==
X-Gm-Message-State: AOAM532SF8s/zrKFvKfC2T7ktaUwVjzeoasFftqmizFa0AVjcWkwxCfp
 YNTX0awV9YEf3M9TF0mc+f4ncEBofYiG/e+jijQ3I4w4VZO5gqgr6gc=
X-Google-Smtp-Source: ABdhPJwHTbeDvalGL69sH/OMsEwErto5HZuOwreiRfNc4kEyrB0CFmj2HKbCUt0LbR/WaV+U5pMYK9cPV0KZ88F6K0I=
X-Received: by 2002:a25:5882:: with SMTP id m124mr3623294ybb.209.1600376561205; 
 Thu, 17 Sep 2020 14:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <20200917201032.4dbcqjylrdhljwsb@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200917201032.4dbcqjylrdhljwsb@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 17 Sep 2020 14:02:28 -0700
Message-ID: <CACWQX82_GWxDeiX_7P2A6mYBYp0OWUkfQLEsOhHeCgU676s7Zw@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

On Thu, Sep 17, 2020 at 1:12 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Tue, Sep 15, 2020 at 04:28:32PM -0400, Brad Bishop wrote:
> >I have an RFC for an empty image that these users could bbappend and
> >opt-in to specific image features instead of having to repeatedly
> >opt-out.
>
> If anyone is curious how I envisioned this would be used I am intending
> to use it on witherspoon (we are out of space):
>
> https://gerrit.openbmc-project.xyz/36588

Out of curiosity, has anyone run a space analysis on a recent
witherspoon image?  It would be interesting to know where the space is
going, so we can start hammering those subsystems back into shape.

This is the script I used a while back to come up with relative,
compressed sizes for all the components in the rootfs.
https://github.com/openbmc/openbmc-tools/blob/master/edtanous/rootfs_size.py
