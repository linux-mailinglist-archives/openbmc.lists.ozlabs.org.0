Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD2579B2
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 04:51:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z4DQ0bDzzDqcT
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 12:51:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYF0nJHv"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z4Cq1ZKBzDqcS
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 12:51:18 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id n5so1384646ioc.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 19:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vyp4vVOmyTxMMeK2B8TOmcCgj0Bd9e26u6t+n4icWl8=;
 b=dYF0nJHvfh2qSesME03HAx4bF4jltOtoGBzZgJXE7+uv3BIZML/O0AxWo4+AxAFOvo
 gOM5VPNjWkuSaPY+jUgym1qWTdUMh+fJrKxSQuNuorm8vCsVqtK8yEj3VaGHfPD19NNH
 LZO3bswGlrebKj96o0PSLeV4dcZ1d4IBAn/6RQaO5VnCRs3/XLFYBu+aRDxHMJMhJh7l
 FkwJyad0oKs8vM4P6la4CWlT53TWLft9NYjfkfwUZe0NaAbsStWX1BgKtEwv0KfNWK0n
 yOW1AYkeSgWkK8wT2yUmCNLqlMXRViKrmpUrVpEYS50bRX08BROUfYfglQ8EfZtYVmD1
 pdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vyp4vVOmyTxMMeK2B8TOmcCgj0Bd9e26u6t+n4icWl8=;
 b=uKlutNkEcB1SAxMEeOiRuTT8+RcqXHPfru5RNg9hqoqC9STtOdfAhiWJDIiJvk/Mnl
 F9dcHWIlds2EBUuq93mXD9XdvNg+mOPNjuorbCIQ5qHIHFUdGNlEnru5rprBJcr2Yloc
 fjWJlr5LADsfqfDhxur4cf2WGgEiX1lklL8BvaDyYs7GwgntIjhZmJqsTYZ5C7pR3e4x
 3S7WfYWTupHpq3n69FTEzNYOJFAIeMrOJ1nEk/wdlzWe9jNfkl6Ds73rxlh7GsfUJO6Q
 au+Y8EdJTS4FzCHZxW8NmGluloEn9N+CrKiYq9nfIoqWHlVIJ0hbM81924E8hwDN8ymG
 7n+A==
X-Gm-Message-State: APjAAAWiHu05XRw83I6rNOj1y+fhIS/CelEN6e0+hisR8getiLS7bAMi
 Kf7jHUhCXv0/rW6+fBHLp30uogafjq16hiZfT18=
X-Google-Smtp-Source: APXvYqxwyHnnlzaDmEJbaw1hEyp7AmZP49KddZUgm/fbpV4yESnX3Lheu84Altk735RSX2mEXDcAdWZdGGMdC7hW+Qo=
X-Received: by 2002:a02:3904:: with SMTP id l4mr1619837jaa.81.1561603875392;
 Wed, 26 Jun 2019 19:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <8f7ab4ab-99fe-edeb-f0dd-5eb38c480f79@linux.intel.com>
 <CAARXrtkyGn6ZxGPeCwFLbAtvQW44O=5sDyjvTHQci7E6CmwfEg@mail.gmail.com>
 <dc937b26-2194-b93e-398d-d15b51ebf9e5@linux.intel.com>
In-Reply-To: <dc937b26-2194-b93e-398d-d15b51ebf9e5@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 27 Jun 2019 10:51:04 +0800
Message-ID: <CAARXrtn04OoM4sZGeC84Ps0b=+DtPWb1Hv=7eX9jq_ByLojRUw@mail.gmail.com>
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

On Wed, Jun 26, 2019 at 11:22 PM Thomaiyar, Richard Marian
<richard.marian.thomaiyar@linux.intel.com> wrote:
>
> Hi Lei,
>
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/21611  is exactly what i had in mind for #2 but still looking for #1, so that error_no can be propagated, at this point of time, it is not set from D-Bus daemon.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/22481 - is merged, and it solves async_send, but doesn't work for async_method_call(). Any situation in which you have used in async_method_call() ?

Right, it won't work for async_method_call() due to it only returns
boost::system::error_code and data, no sdbusplus::message at all.
I am not a usual user of async_method_call() so do not meet a situation needing
to get the dbus error.
But it's true that it could be better for async_method_call() to get a proper
dbus error.

It could be achieved either by adding a custom boost::system::error_code (but
it's tricky and not well tested), or possibly adding sdbusplus::message or
sd_bus_error in the returned values (but it breaks the current interface).

@Ed @Vernon Do you have any suggestions?
