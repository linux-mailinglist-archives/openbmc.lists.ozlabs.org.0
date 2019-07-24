Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D16726C5
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:38:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjKM1RjNzDq6K
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:38:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Z4VucZhr"; 
 dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tcZQ2ZzhzDqLk
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 11:04:46 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id g18so32572218qkl.3
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 18:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USqcm5RGTjud6eYO1jUl1qSvibs0z3C5pkGOMIS85gc=;
 b=Z4VucZhrb/Gjin2jPOuvrejqQtV4H6zpxy4BbxXfAVV1D1+TmW0GKMvaAcIGpSjCSL
 vjU//kMwY2BoDHHnrNFudTTZSRLU+CO/QF1Nk3B3MwfGxZHumm6A6/KLwZ/6B+V229lZ
 TBupTBR0jJEox3gRAQ1ruB7/cS/0MNotyTDkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USqcm5RGTjud6eYO1jUl1qSvibs0z3C5pkGOMIS85gc=;
 b=OtxJUYjXv7N1UzFttrPJ0+dUSryCifITRLy6FUR7DW47m9QPEKMoX2dSURf7V9AlqY
 /0++oYbuhiYbJXiesHmXRNm6W3dhOgWyyLr2PK3KNd83tlyYk9iQK/tfqmRy1BvGllyh
 77dj9N6pbDdqomN8QEqHuIjH5STb2YBjqa6biM3pM33nB8UYSctcB+zzAi9SXNOFQUAa
 58fgiELgIUzUIlS+uZL+/+GP1nZVUcRuZR/XUHMebRFeMMXVcgAzfq2eHnK7hn8KQPgV
 bIiSU4Qh4m/uvfYONnjXmuq0ytiWxMqQyU4AsHaIC+lVDTfGhNxU7GoEqfbeHw/WpuDB
 9ktw==
X-Gm-Message-State: APjAAAVfc4OcuZ8R57DnbZb9QmpiKOAwmtaDt1X4zQWpd2tPjSXAJq71
 BfJN3hD+9Dd70B727xb+jf+7MxE58sreTP2/gg4=
X-Google-Smtp-Source: APXvYqwcgE3XIG3TjuxNa8njCLdEJ5g1ERKQWpX00UVSRfT3nLIhezPSp+LlMCCQd0phUTsOZb/WGkgT6m6nTX2nEQc=
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr52150430qke.208.1563930283454; 
 Tue, 23 Jul 2019 18:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
 <DM5PR15MB1321495F72F3045CA719498AA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
In-Reply-To: <DM5PR15MB1321495F72F3045CA719498AA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Jul 2019 01:04:31 +0000
Message-ID: <CACPK8XfKUxo2cx9W5B=r=a18LRLMMRL8Rv7Vy36pLgxyZTz-Og@mail.gmail.com>
Subject: Re: Out-of-band NIC management
To: Ben Wei <benwei@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Sam Mendoza-Jonas <sam@mendozajonas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Jul 2019 at 18:00, Ben Wei <benwei@fb.com> wrote:
>
> > On Tue, 16 Jul 2019 at 21:46, Ben Wei <benwei@fb.com> wrote:
> > >       1. A command line utility (e.g. ncsi-util) to send raw NC-SI commands, useful for debugging and initial NIC bring up,
> > >       For example:
> > >           ncsi-util -eth0 -ch 0 <raw NC-SI command>
> >
> > The NCSI kernel maintainer, Sam, has written a tool that fits this descirption:
> >
> >  https://github.com/sammj/ncsi-netlink
>
> Thanks, this is exactly what I was looking for!
> One question on this, do you plan add some command-specific parsing.  Especially for commands like get version ID,  capability & parameters, and various statistics. I think these are especially useful for initial NIC bring up and debugging.

I am sure patches to do this would be accepted.

I won't be doing any work on the tool myself.

Cheers,

Joel
