Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A133264FFE
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 03:52:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kfF50BSJzDqhD
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 11:52:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jTtSXcD9"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kfDX6fv4zDqRD
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 11:51:40 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id l9so4681266qtu.6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 18:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9hH78JfF0IovK05YGFgaJhkRuVxw4gofnnpOm9iqZw=;
 b=jTtSXcD9LDiWMxal7SX6XvuhFJG/RkRO80yLg3BXQ8wtC75pSRhe4mqRaF6qHG8Uf7
 NsG7MZflbAygQEZndXseVk9YV38DCjcjvjw3pLJpDvMD4Q9x3KqF4bJPf6z8ZrnHPHpc
 F1s/p0qcQWMcDZEJ3znE3yk8LlJGW1XGtN3Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9hH78JfF0IovK05YGFgaJhkRuVxw4gofnnpOm9iqZw=;
 b=JDRw4bx+ier/chV7OX81bltBnxpvPWOl2UB2mEGoMNe487+cEWpAcLuuwDI81HUExI
 cegN5gBHeZTGqKx1dKDCcceqiU4BRnCrUOG/fyaK18fMGHiJJTlurYAY6O6T60C+DF08
 mAYZbJFlq9+YclVJQ21/hW39HIZwFeT99tYq1ZHY7Jn7nMWMRigbNzuMldhWbDQFFpCp
 EAB4bF/yVidqLQebVrzDZctuPLHwZi7W/OwL7Nl1MulbgglBDqndRcFqDNQWWPvkkHYE
 SSPizkeR1QNHmv+JtSPPTU5JZ5f3D2roq3Bz/qZogHv6Z9agVS2esMntS/5HubmoTZ8G
 0Inw==
X-Gm-Message-State: APjAAAWzIScOYG95ddhhDHjl/UgGHu4vOL0gDJZcT6lC5SEi3Fk7uvcH
 qS7qVbrZ23fKoK5Q+aQRmdgWhFSB2zSmVWUzJ+0=
X-Google-Smtp-Source: APXvYqwtMciR9QLI3Pf8mbKhHk6nyGCsvalnwvrBHQ0pnUNWIYbIsBl1DRxcGHmPHtZUlkrS5HG5Roc1e329OMJusJE=
X-Received: by 2002:ac8:7219:: with SMTP id a25mr936261qtp.234.1562809896717; 
 Wed, 10 Jul 2019 18:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <1562574721-125584-1-git-send-email-mine260309@gmail.com>
 <2a9ffe98-e190-fe7b-b6d0-2123dadcf551@linux.vnet.ibm.com>
In-Reply-To: <2a9ffe98-e190-fe7b-b6d0-2123dadcf551@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jul 2019 01:51:25 +0000
Message-ID: <CACPK8XcY5UtyhaggEaKEAzVA626uo228j0vQ8_k6in5pJO89ng@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1] hwmon (occ): Fix division by zero issue
To: Eddie James <eajames@linux.vnet.ibm.com>
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

On Mon, 8 Jul 2019 at 15:19, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 7/8/19 3:32 AM, Lei YU wrote:
> > The code in occ_get_powr_avg() invokes div64_u64() without checking the
> > divisor. In case the divisor is zero, kernel gets an "Division by zero
> > in kernel" error.
> >
> > Check the divisor and make it return 0 if the divisor is 0.
>
>
> Thanks!
>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Merged into dev-5.2.

Lei, can you please submit this to upstream? Please add Eddie's r-b to
the commit message.

Cheers,

Joel

>
>
> >
> > Signed-off-by: Lei YU <mine260309@gmail.com>
> > ---
> >   drivers/hwmon/occ/common.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> > index e9d7167..15c5d43 100644
> > --- a/drivers/hwmon/occ/common.c
> > +++ b/drivers/hwmon/occ/common.c
> > @@ -406,8 +406,10 @@ static ssize_t occ_show_power_1(struct device *dev,
> >
> >   static u64 occ_get_powr_avg(u64 *accum, u32 *samples)
> >   {
> > -     return div64_u64(get_unaligned_be64(accum) * 1000000ULL,
> > -                      get_unaligned_be32(samples));
> > +     u64 divisor = get_unaligned_be32(samples);
> > +
> > +     return (divisor == 0) ? 0 :
> > +             div64_u64(get_unaligned_be64(accum) * 1000000ULL, divisor);
> >   }
> >
> >   static ssize_t occ_show_power_2(struct device *dev,
>
