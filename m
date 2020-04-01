Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563919B85D
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:25:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t13g2lqzzDqCT
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:25:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MRu4I7aM; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0yf0kygzDqvY
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:20:57 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id v7so1959783qkc.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vyl+z0JdprDovzhGan8hYRLquFSfzI9YGYgF7mt2ME8=;
 b=MRu4I7aMc7mQbLPALRySI/JnDWevBc0fP7jzrDTdoIJGQK8Koh0sUkTbKc++sM/ywP
 nlec6jrFtqKN3taaiaplQyqsuwVwlSBkYWgG9slzKL6/CSFST5THAOhmubSMDDFDEYda
 QETNXWhJCZpMeAeeGx8iAhHn3w1nE20nqHadc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vyl+z0JdprDovzhGan8hYRLquFSfzI9YGYgF7mt2ME8=;
 b=XnMN6H0D+TLw7bnMzt8uAOy8TiIC6k0jQuvJ/AgL31OwnBnpDXaO0mzCzZe6oV6gUe
 I7dSvpDuXv+jumrjmlMcGtyPlCrm2jlg2roy/tPUr0vli8zu4cEjmLu6WAf2KH3fLHp9
 T56UT/wlGYkBY4btWHUpwXrcqUr2oXL5WYnoKTuArdeMA7YT/EIvGE128wGOsPh0qmZ5
 UQwIRcivFkF1+TiG8jZyuTDWIu20JgE6KnyjbUTB0Zd3Wful/LcGKfHAkcm3YnjFkyAL
 XHRo7Q2wJ+EY+9BjT8cGd90b1LO0tGHbs4SW3PwuLbI3IuLLsVtSs97+1CrIgWHxXRmk
 dl3Q==
X-Gm-Message-State: AGi0PuaHu/lT4F8Z2EIxadkTMDwR1IFtDKlx+eCfkKYNcjSXDUg9tejh
 gx0ceiLe6jMfzC7fo7Z0XpCNd3LdPQQFL5Q309s=
X-Google-Smtp-Source: APiQypKEO9ihiFuwmgOlL7Hw/q8ZxhbgGgDSs7pHdOAGJa3BS6d1KH3hBvCOBjkpnxjGovL6eBfBpgS5v1tjWPqYWV4=
X-Received: by 2002:a37:3c9:: with SMTP id 192mr564726qkd.330.1585779650843;
 Wed, 01 Apr 2020 15:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200401220339.2006-1-eajames@linux.ibm.com>
 <20200401220339.2006-2-eajames@linux.ibm.com>
 <fc05a492-f04b-b80d-51a0-52cb793e5c9d@roeck-us.net>
In-Reply-To: <fc05a492-f04b-b80d-51a0-52cb793e5c9d@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 22:20:39 +0000
Message-ID: <CACPK8XcKpK9Fz8GmudSYVqph0MBFKpwrCdr68Hha1wtamLLNhw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 1/2] hwmon: (pmbus/ibm-cffps) Add another
 PSU CCIN to version detection
To: Guenter Roeck <linux@roeck-us.net>
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
 Eddie James <eajames@linux.ibm.com>, Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Apr 2020 at 22:13, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/1/20 3:03 PM, Eddie James wrote:
> > There is an additional CCIN for the IBM CFFPS that may be classifed as
> > either version one or version two, based upon the rest of the bits of
> > the CCIN. Add support for it in the version detection.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Link: https://lore.kernel.org/r/1583948590-17220-1-git-send-email-eajames@linux.ibm.com
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Those e-mails are confusing. Can you drop me from cc:, please ?

I think Eddie forgot to --suppress-cc=body when he git send-email'd

Sorry for the noise Guenter.

Cheers,

Joel
