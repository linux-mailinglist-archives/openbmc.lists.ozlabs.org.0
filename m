Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92828108
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 17:19:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458tTH2qLczDqXG
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 01:19:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4rKPOd2"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458tSg6WcXzDqRy
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 01:18:59 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id l25so5752987otp.8
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFWYnvoiJK3MaORqOqDFZ5Fa/roKgZtsc4UShivFmXo=;
 b=G4rKPOd2MPAWtCVSz2LVJOsdYlijIONTpBLwlyBjjdKLHY9EiWM173jeg2Jvs/r6oQ
 B8dC4zGQBPXIXETrY77mpgjAHj9rPPdxzh2VWRRXlxew/vN1nuWOsTE9uEObomKXB2+d
 VTnvI5jbWk0AW/TCy7GeVqaeRDxbVbhSuVmH3ow6avg8xRPXkQnxRabf/LlppGWHVxLX
 jBwsjdcbOBsG62wr0+C9BXN0XplehPgZh8IIrbF7gaWrVG/KlmZu0qZ42MFiI+2bwl0W
 +D5ept4oPgmbQh/iUk2w159YQrplpF6145Ztf3ZaeW0V0XN6w8nNB6NyUMIrnW9bmX/R
 DiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFWYnvoiJK3MaORqOqDFZ5Fa/roKgZtsc4UShivFmXo=;
 b=XbkKVwIIUIobc5L7QDqj48KTRQvXlThHYmd0RaHNwnz6A6njt6iZes/z3Msr8C2K7D
 XNCV+oeAdrESY8dLPle4G0/JOTGMttQZq6aqntU1+OHmrOITTw09XrGHxlfJ3bZNnM6k
 EV9woMGyr5EybxuNeXjNzocY0VfmUEujl5cOsFOklqjRollWMDUkGdN5zBV2mqLi9Y/l
 OFofCZjYzCofAD7IOFlUY5kruoIDAWjHVYAcOjtSikHVJy04L7RUno/C5DOXU3caXIrJ
 RhV89YE1kzRTRPdlckfp4zVPBd1N2CNnXXKmu7V33oYZxYdWPalpT3t8qUSo80j5TNWm
 pl9Q==
X-Gm-Message-State: APjAAAVWKWygcEkfYYZTbsTA1YdysL4tl6ggzpwOxWDy6uZcuXtl1QMg
 XyAU//WwuS/VGDIgklZbR8lw2mntl5reSW9NjG8=
X-Google-Smtp-Source: APXvYqzfEMZYWIt20mlf0qWv13E6/Bc1PppgjJV4JkBCrBa8CJN8VUDIjQ8yfcwKOoAWZ4MML7vQo4xyyIFaFICHIHI=
X-Received: by 2002:a05:6830:1389:: with SMTP id
 d9mr225050otq.329.1558624735787; 
 Thu, 23 May 2019 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <264283F7338E734E863366C752FEABBC41CB0452@CNMAILEX01.lenovo.com>
In-Reply-To: <264283F7338E734E863366C752FEABBC41CB0452@CNMAILEX01.lenovo.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 23 May 2019 10:18:39 -0500
Message-ID: <CALLMt=oJEXXfu9R7j2WPynUUgVs_Co3bSEzR=L_NDp-HgtzmLQ@mail.gmail.com>
Subject: Re: Could we implement new features by C language?
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: Derek Lin23 <dlin23@lenovo.com>, Duke KH Du <dukh@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Harry Sung1 <hsung1@lenovo.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 4:31 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Team,
>
> If we need to implement some features for project specific purpose. Is it necessary to implemented by C++?

I don't believe we as a community have any rules on language. I know
some even keep trying to get Rust
going :)  You may want to consider using a c++ compiler for your c
code though so you can utilize other
helper repos like sdbusplus, sdeventplus, phosphor-logging, ...

Andrew

> Thanks.
>
> Andrew Peng
>
>
