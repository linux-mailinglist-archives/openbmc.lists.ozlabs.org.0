Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3455F562EE
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:11:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZ283zdkzDqZW
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:11:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lROd+WYH"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ1R74zGzDqW2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 17:10:34 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id w25so243312ioc.8
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c26NsIrGBTv3I2BcvRNSo945qiITPCLqsIRvILjvNR4=;
 b=lROd+WYHS+y86aeGsWoYDd4BfAxFZ80Fjh6nEvqTkrN/VSvjnPIxMWWF9e5YZZEUq6
 PAgq9M0YGlu3v2KCzBuMA+Jd1NPt6FlSN+MK+1dsmMwJyYfU8YM2Ng3D3Lwv5I7ukF3k
 aikOPib8bj61HzCJVJYR3cQ4N/NaaSvruA6bC+5gr9jwZ05iuAz7gWdicPGEQ7bD5UW+
 uCGWnYAT8MWAFF3e0TxVdUbh2A0zDwE4mPT5Hdd1UO/oIkHVnaLjL0+Fl8eDvzsMJXpg
 r8soa1KZ/LIR3oEVs1mVlmnpj8FVfjFgTZZonoLAg1AxtsMPVKx8kJg694LOFfrnydOd
 ICgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c26NsIrGBTv3I2BcvRNSo945qiITPCLqsIRvILjvNR4=;
 b=OOu+VaKfEp0VMEACWhQGwI86piJbIrRqVM4LVD5JS/MX55c6a//+ink2vrSsM4iiCk
 NbBcVdo7FCVqL2GIEO52F1gmhLcaVBPtxkLePdPRWCQGaPRpxJuBXqOpl9KgHa92mU3M
 GiQgCpEm3q52NwD2BgjQ22B2xnSnou9vvLNmcrbvOuw4k45choLHMmUZKIfDuBJsbmIQ
 QsKFavtDRZxHEj1+v14KOEUV+OMuWd0VwwLZiLiWzXyZu2Q7PNpJAHG6iVSFKlI9ESz3
 5Etw6tzN51wduoEB6pYdHkFYCfA4i4Hl8YBh59QwdmRJ6aDDmH1IC1R1jEKc+NwZSSJO
 unmQ==
X-Gm-Message-State: APjAAAXvISJZBzkcHWIbOq+A7I9dEL8azjnic4eEG/4X7khNqU3Eqt23
 7wXghiQE0WtFEIK7qwz1xEE2MJbSz1JSkmCkdbE=
X-Google-Smtp-Source: APXvYqyxZ2zwCF/KfKD5CKol5U0dYwAyXOYc6p+CvHaOlfvcI4RHWJzBKz58EDJR7qCXbzYosuQklQps5cXBYzApDms=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr3098726jai.39.1561533031300; 
 Wed, 26 Jun 2019 00:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <8f7ab4ab-99fe-edeb-f0dd-5eb38c480f79@linux.intel.com>
In-Reply-To: <8f7ab4ab-99fe-edeb-f0dd-5eb38c480f79@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Jun 2019 15:10:20 +0800
Message-ID: <CAARXrtkyGn6ZxGPeCwFLbAtvQW44O=5sDyjvTHQci7E6CmwfEg@mail.gmail.com>
Subject: Re: Reg sdbusplus - async handlers - D-Bus error not getting reflected
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2019 at 12:19 AM Thomaiyar, Richard Marian
<richard.marian.thomaiyar@linux.intel.com> wrote:
>
> Hi,
>
> In sdbusplus code, async_send_handler callback() uses the
> sdbusplus::message::message.get_errorno()
> https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/detail/async_send_handler.hpp#L66
> function to instantiate the boost::system::error_code. Unfortunately,
> none of our D-Bus exception throwing functionality sets the error_no to
> a proper one, but instead updates only the error_message field
> https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/method.mako.prototype.hpp.in#L171
> causing the error_code instance to always return a generic error code
> value, instead of a proper one. Because of this applications which uses
> the asio logic will not be able to differentiate between exceptions
> thrown / errors from D-Bus.
>
> Planning to fix the same in 2 step,
>
> 1. To make all D-Bus exception to set the errorno properly using
> sd_bus_error_set_errno and getting the error from the yaml if available
> else return generic one (so that no change in existing daemon will be
> required).
>
> 2. make change in async_send_handler_callaback, such that derived class
> of boost::system::error_code is returned, which will hold the error
> message too. Any daemon which uses asio logic, can depend on ec.value()
> as primary exception identifier or ec.message() for any detailed
> exception thrown.
>
> Let me know your thoughts , and if agree, will start implementing the same.
>
> Regards,
>
> Richard

I am glad that you feel the same way!
The patch https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/21611 was
submitted trying to resolve the issue.
And during review, it's noticed that there is a better way to achieve the goal,
that the DBus error is returned by the message.

So we have https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/22481

Now in sdbusplus, message::get_error() is added, and the caller could get the
sd_bus_error* from the returned message, and get the DBus exception details
from the sd_bus_error.

See examples at
https://github.com/openbmc/bmcweb/blob/e4a4b9a95622b8e1c1bae93718699ad19f4882ac/include/openbmc_dbus_rest.hpp#L1385-L1403
https://github.com/openbmc/bmcweb/blob/e4a4b9a95622b8e1c1bae93718699ad19f4882ac/include/openbmc_dbus_rest.hpp#L1882-L1893
