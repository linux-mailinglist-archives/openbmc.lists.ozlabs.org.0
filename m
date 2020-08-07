Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76323F158
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:38:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWHr6cfMzDqvZ
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 02:38:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Hg9ho5fK; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWH43cdZzDqlK
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 02:37:19 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id n141so1323150ybf.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uga7PifwEyP7KOmV2N6xXdWZhq7azGJlkXTNbZQmtI=;
 b=Hg9ho5fKsDaX/JKxnM++rZwBZykNQrx6OisSqZ+kWFoxQB9H67+8W4Kjnoj1YIJOE6
 N+9MzjVmb5nQhd18mFqXghLslq93ji9kQAZ7pFQ57rdzglm4LotfNBVQo0lakzljLh71
 paV/DK+Kho8Guj17upXIgMuFqZUhDutCS3Yxj5r36TDkZoCACyiwS38nTImR989LgmZW
 UBS2hjNriWWrTUNOQeFLsWPvi8Yppt0lRAwX3yyFoLfvPhSJcuZvUuXTnf1yJsAmT/Da
 lw4PHhsnzG03A+e6KB4a7e/w1TEsxBSbzWG+rRJlT/O434V6j7F8K9dJDYzvh0kwfpdf
 252g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uga7PifwEyP7KOmV2N6xXdWZhq7azGJlkXTNbZQmtI=;
 b=lC/BZY9D0JhaBHDUAhcd9ICuBJtq3qB6okq22WcjZXA6ObyEGokfWFH3RMH225t9Sn
 r3H9F+SXewMAIsQyS8xNl26b+wGAi/U83jM943/Qs9SagVabrvEVDscAJIkeGuQj0ZFC
 YtrYWeTbNojbgOE6+SrLAhKD414eyHrpfDad8JRd0RYjYLYyJsxS6sGS/csZvbziKx0m
 65QdX7gbJwgrMel9NCl7HW/r6Awd56GYXPE3FNKYABBWwhrd2REFx/b2q71awEm72WHn
 NOoZC6yGmYCoUXTh7CfHKG2mokviVCkPtGZnOxCdmkpRmBDKpglEHREwnCP15wccCBhx
 vi+Q==
X-Gm-Message-State: AOAM530oF80qpdg8S03wkrBrL+yb2fkdP8uRsE2VjBRYU3mJjdRnvglb
 zG/zA7y2vrrSXcENNEHS1zieruML6hvgnOTtAAbPqw==
X-Google-Smtp-Source: ABdhPJxfMc43YT37G9/R8MiHM8KZqm4pxAWkjea3+OkldAUBphpQgSkBs57Hx6EBd67IwaRJ905OWntJzqGW7qn5g14=
X-Received: by 2002:a25:640e:: with SMTP id y14mr20151350ybb.340.1596818235300; 
 Fri, 07 Aug 2020 09:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
In-Reply-To: <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 09:37:04 -0700
Message-ID: <CACWQX82UnYiLSPLdbeCyT5W0g15rdVjz+FghSWOLbf2nkPDS9g@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>
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
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 9:28 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/6/2020 3:52 PM, Jason Ling wrote:
> > Assuming that you mean "Omit Name attribute from the sensor
> > configuration definition and then change hwmontemp to require any Name.*"
> > This won't work since Entity-Manager requires Name (tried it,
> > entity-manager does indeed complain about not finding name).
> >
> > My rationale for an omit list vs permit list
> > (1) if it's a permit list then everytime you add another temp you want
> > to monitor you need to add to this list..if you want to drop a temp then
> > you have to modify the list again.
> > (2) General assumption is that the primary use case is to display all
> > named temperatures which means a permit list is typically large
> > (3) adding a permit list also breaks all existing code. Everyone has to
> > go back into their json config and add all the sensor values to the list.
> >
> > My rationale for using the value for the "Name" attribute rather than
> > labels or referencing sysfs attributes
> > (1) Looking at just the config , it's obvious as to what you're omitting.
> > (2) If it's label base, a label change in a driver would mean a breakage
> > in the userspace daemon. Not a big deal; but it can be annoying.
> > (3) if it's sysfs attribute based then it's my opinion that it's not as
> > readable.
> >
>
> I'm not a huge fan of this as the PSU sensor already has a way of
> handling this, and it adds a new way of handling it. I'd rather follow
> what is already there. It's already confusing enough that hwmontemp and
> psu do things in slightly different ways.
>

+1  If we're talking about adding this to PSU sensor.  For
dbus-sensors,  this feels like an already solved problem, even if the
particular sensor you're using might not have implemented the pattern
yet.

If we're talking about phosphor-hwmon, I think that's a very different
discussion, and one I don't have a strong opinion on.
