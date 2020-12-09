Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842D2D48E3
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 19:26:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crlqs0wyRzDqv4
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 05:26:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GLyyK8tT; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrlpZ1bNXzDqtK
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 05:25:21 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id g15so2196941ybq.6
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSZ0YV3z349wWs7aBVXiYCTcOx0SaoJDPMbspiNFvAA=;
 b=GLyyK8tTgnvJq2887ye+0YBeAyVWHH2g3Z2ZZKZDKheq/IiujqUk2ZnZSL1Js9WiGa
 EvvDvMcdmpKFkYOqARBpmKzEQFkrpFA/t1h/5z85/Z7RbxTEdQL99OlSmE1iLXYAtCDs
 ZhuLqxKWfW2zteZPsdTd9H6FMMpdXxoNOquTHH/arLbPWXbinDMniro7y6hlj8gJUZS/
 Vm71UojXHDt6mI+edGNHdCmfIJkLflh7KYPT/MLHj5li/YEfMsdCO6tHWuOIfVkIw+PW
 3ZdkgxQDw6Xr4ezsEosg4ipUYLGoH70VBpuu6X771+x2Ssu4YhduUn6POJX8/oURxJQF
 WPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSZ0YV3z349wWs7aBVXiYCTcOx0SaoJDPMbspiNFvAA=;
 b=mfD1zwWp2CeiggARPdir+AaW818tZZm3wk17Nyjn1eeI5AsKXYJbG34knQwfuhEmji
 jjoJQJKkuNL9UtXeIOVXJNihGDXqg03U1f5mdDZy3shhrbimahSf/10yuNeh6K2XQeXB
 ht5f3lpoQeeae/AYfdsi78n8KNvLmBvCR0lh+igSLrqAHE6KrmGKxySGXrl7VBpVbVpP
 HGqSza3HRx/NY6Tv9FyVMs2w9gXe/RTnqABcgzKRhdzmbDlmDYuuQic5S9SSqEc7CRej
 XGQZU+4+t0oLtkHcfoURvuFSA1puaxw4/EX39H6UdIQNUGggkSlm/Lylm4O49DlnTpYM
 4jAA==
X-Gm-Message-State: AOAM5303mcWWwwW3nkGTgJWNjZfCiRBFWtrr3gj+QOoM2GrkbbAd44Em
 AYox7YRuVMQh5l8kvAwWJD332ZDvvT6kkncM8NUjjUUD010=
X-Google-Smtp-Source: ABdhPJzju0QvWannRacjdOo7o3CDbw6YF5khTUp/JCdFAP4aE31rTg99p9b7WddWy80V3tSqhbgxN5vuRy0UKv3OxMI=
X-Received: by 2002:a25:1d46:: with SMTP id d67mr5006368ybd.480.1607538316501; 
 Wed, 09 Dec 2020 10:25:16 -0800 (PST)
MIME-Version: 1.0
References: <1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com>
In-Reply-To: <1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 9 Dec 2020 10:25:05 -0800
Message-ID: <CACWQX83Rc1pTmPbv9xhca-mMyGHenrVbj0a9oikOxHPy=XFxQA@mail.gmail.com>
Subject: Re: Proposal add PerformService privilege
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 4, 2020 at 12:13 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> This is a proposal to add an OemOpenBMCPerformService privilege to BMCWeb.
>
> See https://redfishforum.com/thread/397/redfish-direction-update-eeproms
> As mentioned in the Redfish forum thread, the use case is that some
> OpenBMC use cases require isolating manufacturing and service functions
> away from the customer/admin (including updating FRU serial numbers, and
> updating a permanent MAC address), and this is a Redfish compatible way
> to do it.
>
> The work items would be like:
> - Add this OEM privilege to the base BMCWeb implementation.

Can you talk through how you would do this mechanically?  Today, we
rely on privilege registry (published from DMTF) to guide these roles
and urls.  Now that you've invented a new role, how do you plan on
fitting that in?  Will it be required for all systems?  Will it be
optional?  Will it only apply to OEM schemas?

> - Identify URIs that we need to be able to isolate away from
> customer/admins.  Then modify the privilege mapping to require this
> privilege to PUT to those URIs.

What URLs have what privileges is already defined by DMTF in the base
privilege registry.  What you're talking about would require a
customizable privilege registry, which definitely needs some
significant thought, as the current privileges mechanisms in bmcweb
are very static today.  Just "customizable privileges registry" is
probably a design on its own, and would likely need to land before
adding OEM privilege levels.

> - Add this privilege to the Administrator role (but not Operator or
> ReadOnly).

If we're adding this privilege to the Administrator role, how does it
differ from ConfigureManager role?

> - Document how to isolate these operations.  Specifically, remove this
> privilege from Administrator, and create a custom OEM role that has this
> privilege
>
> What do you think?

I think we've got a couple designs that would need to land ahead of
this before we'd have the infrastructure and documentation to build
something like this.


The designs I see coming before this are:
Static PrivilegeRegistry implementation
modifiable/dynamic Per-URI privilege registry implementation
modifiable/dynamic Per-property privilege registry implementation
OemOpenBMCPerformService registry added.

> - Joseph
>
