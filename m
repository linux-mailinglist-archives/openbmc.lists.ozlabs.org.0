Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A484375D42
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 05:05:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vv7f36bmzDqQL
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 13:04:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WU8RW7yv"; 
 dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vv7222MNzDqQ8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 13:03:57 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id r15so19019722lfm.11
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 20:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6QT+9D/2NU5hambOjOYWiZMV1xYkcvm+1sHkmhj1A4=;
 b=WU8RW7yv2d3vpQRidh7MUowcQ1+q8g+FxbkdXBFsVx145mtj8rZcbAxtCPKAi250Hf
 2D+qqUVyWmwVskfSl84AqUJliPmGO7aaaqg2h6s9iQlazY5Ku3zqoRByhKcUPhp4AFYD
 rloKt2wu+JwrCYXVKoFJdr1d3yogn1BhNEck7seqRK7GloidqfvIObQYHPvqZEf6ysEo
 dKAgURWSTSK5+Qbcy2Wx5W+x1NMC9joIHnzdpuLkAVYKe/a6RD4gZ0+WjWrcywAEvBAl
 w13sluHV3/XXRc6dt9425aFUI+1/wwWKs1w+jqZlMGiAT7nitvidz5S6haEWri09CTj8
 Kk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6QT+9D/2NU5hambOjOYWiZMV1xYkcvm+1sHkmhj1A4=;
 b=bJz9Puk/a3s1Dh5cDxSsStxYMoOTZ++kcEkHxTCZiSFIem0+32A26lXrrq44lai+no
 WzMs8bsDcPtl8/Yx9EBaYn4vL2TgXLxyAzPsyyPVGztLrOsZdDKWEWL/BI0PZzbssC3h
 TkbmBU5gLCHm5TEpYguVGZGD4zkzpNCReHVHM+bzs8BtyA2+3mQhWZYfQXYYxp1Z4ELj
 Cg498K2UTklmHN71FwqK5pdwm++H9KfSLpCgBJ9i+HsKLDEq46E8FQYr25lkB5JUZoLZ
 G1JT/g+8ph/xEyUCjzFIcjz7dzocwrwi9bEUOJGt0E8azzkI81ozlrtHF30uq+o2CeUk
 rx0g==
X-Gm-Message-State: APjAAAXs2CJ8dWbyEfuejeVuByiP4oHiRTlCGsrjaXXBKgDKvJ/OxBV4
 E5frXrj+A9CpoCXki4EuMrfTlmdX6Rm1P5ioCYE=
X-Google-Smtp-Source: APXvYqxzQxnD9dcxwps4lhj2XAnCzf+Fm3rPvgA+M4MrYp/OWlrmffbJf+OK2N4KDcfj9yq38/lcQfeks9Hv4jkpuXQ=
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr979280lfp.59.1564110227659;
 Thu, 25 Jul 2019 20:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
 <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
 <2f7ad2ea-7717-4f9b-bdd5-b6efc131cf4e@www.fastmail.com>
In-Reply-To: <2f7ad2ea-7717-4f9b-bdd5-b6efc131cf4e@www.fastmail.com>
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Fri, 26 Jul 2019 11:03:36 +0800
Message-ID: <CAHkHK0-_rKUd5EbyUtcgYttpZoy1-md8AG7f-8Er075pgObqBQ@mail.gmail.com>
Subject: Re: How to ideally fix the log function
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
 Matt Spinler <mspinler@linux.ibm.com>, Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 10:08 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 25 Jul 2019, at 20:52, vishwa wrote:
> > Hi John,
> >
> > Just some background; The goal is not to have func() pass in CODE_LINE
> > and CODE_FUNC since it would be a huge change all over in the code.
>
> There's no way this is really going to work. It turns out sd_journal_print()
> is actually a macro that adds the CODE_* properties via __LINE__ etc when
> SD_JOURNAL_SUPPRESS_LOCATION is not defined[1], so we either get
> the misleading information or force the caller to provide it.
>
> A hack approach that almost immediately falls short is that you could try
> macro over log() and adjust the actual log function prototype to take in the
> location parameters so we can call sd_journal_send_with_location()
> directly. However macro-ing over log won't handle namespaces correctly,
> and log() seems to parameterise the level with a template so we can't
> define the hypothetical log macro as a macro function (which we need to
> do in order to adjust the parameter list).
>
> Having said all that I'm not really a C++ person, but it appears the API has
> trapped itself in a C++ corner. Maybe people more experienced and creative
> than I can come up with something, but I think the best thing we can do
> is three-fold:
>
> 1. Build libsystemd with `CFLAGS=-DSD_JOURNAL_SUPPRESS_LOCATION`
> 2. Add a new log macro that allows us to capture the info properly
Maybe something like below:
```
struct traceLog
{
    traceLog(const source_location location = source_location::current()) :
        location(location)
    {
    }
    template <level L, typename Msg, typename... Entry>
    void log(Msg msg, Entry... e)
    {
        phosphor::logging::log<L>(msg, entry("CODE_LINE=%d", location.line()),
                                  entry("CODE_FILE=%s", location.file_name()),
                                  e...);
    }

  private:
    source_location location;
};

int main()
{
    traceLog{}.log<level::INFO>("xxxxx", entry("entry=%s", "xxxx"));
}
```

> 3. Change callsites to the new macro function over time.
>
> With 1 we remove the misleading information from the journal, and 2 and 3
> get us to the right place, eventually at the expense of CPP macros.
>
> Andrew
>
> [1] https://github.com/systemd/systemd/blob/master/src/systemd/sd-journal.h#L53
