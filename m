Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137F307CC0
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 18:41:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRSSr5VhMzDrgf
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 04:41:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZaZtdtbU; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRSRy690JzDr7m
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 04:40:42 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id r32so6238817ybd.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKhGdxEw6Zgs7gXVa4KvoatPfk+vEeHtLCH70GWGl9w=;
 b=ZaZtdtbUzpeJTn0t0pUtQxuWoGHqyWy0cv21z3b2Z3vR+n/9lKyGkzU3VHEhWgD0gf
 bP2ONTHZjTctzhX8j+jdOzy+8VvezKFMyOS59OjPjgkrmv3WbRkunFmYsUUZ3MnmnrL2
 XvxQhNzATqLu8RLqyzduuqf/4FkcSQFRZFvxno7ZYRL4ez1Kc9xujsqbCimcCPoD80wv
 FJpeHexcY2dm5vx6FWr/TGkwmU2eyui77y+SCXPwpSXqsSAG/ITSq4htWJCNFYxedPvh
 7lApV1m8J14lNq3YoFwufooOuy2jhiUvt5byNrDz5GDgfD0fIa/geIOOufxuxhRnJLA5
 aCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKhGdxEw6Zgs7gXVa4KvoatPfk+vEeHtLCH70GWGl9w=;
 b=qZY0qUTU3CrYe3vtkrwGFuji9m7Hf/himW+PYR9smdfJs5qbkz/wuhUNy/JLxHvPxr
 XX4Q8lq7pEncoGUUd4HS3IlBgj9r553IPnd5GJjDTCgCmVxMxH8ls4CqVCOhSlJvC24h
 WpXxOe6bmmE3juStBlPn2jkbsVclo235k1cw5SYDc4wbvzp+bZ+/XEXHVnMJO1dAOqOZ
 zDQI1CJ9USyw0SOhcF+vJp7lGhFH8/YW0Op4Zz1aqRAZeapZajC9gXoSo9CoDtJ8rvvc
 lzPE6E8RlEIbEtk4P/O7CtNiFibDg4EpE3ga1hcH8RrOeIlX16hKlK51GgMsNv5KcWkl
 Diog==
X-Gm-Message-State: AOAM530/bXHU2C4lWbWhRcnFzr15xAoTF0p43sjz0oWYeSGy1qQRj5/U
 voumQoelYNe7QqeolbqZ0C4UmdgYZGn4Yo4z5IVcog==
X-Google-Smtp-Source: ABdhPJw7z32MHsmHDxoRT9cKlQeFbylB8Z8A+MgGmovFhx1fbmjOhF8c3DvxAVbkFq1fVDSYXgW0Y/mvbqXPoYBplXk=
X-Received: by 2002:a25:a541:: with SMTP id h59mr379847ybi.203.1611855639836; 
 Thu, 28 Jan 2021 09:40:39 -0800 (PST)
MIME-Version: 1.0
References: <8156dcbe-42d3-76f9-ba41-5998d3da6199@linux.ibm.com>
 <80e3b9cf-cd09-f1c7-abd8-69fa12da7e75@linux.ibm.com>
In-Reply-To: <80e3b9cf-cd09-f1c7-abd8-69fa12da7e75@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 28 Jan 2021 09:40:28 -0800
Message-ID: <CACWQX81R96xkhCYjUdCGhhaTVp3fsEMoAuuL43913hNbdOwYxg@mail.gmail.com>
Subject: Re: Use cases: what interface should admins be allowed to disable?
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

On Thu, Jan 28, 2021 at 9:34 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 1/13/21 1:23 PM, Joseph Reynolds wrote:
> > What network interfaces does your BMC support?  Do you want to allow
> > the BMC admin to disable them?
> > Please help provide use cases and guidance.  This is for current work
> > in this area: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006
> >
> > Discussion:
> >
> > OpenBMC provides several network interfaces including:
> >  - HTTP - either as access to BMCWeb without transport layer security,
> > or as a redirect to HTTPS (pending review)
> >  - HTTPS - access to the BMCWeb server
> >  - SSH - access to both the BMC's command shell (port 22) and the
> > host's console (port 2200)
> >  - IPMI (RAKP)
> >  - NTP
> >
> > See detailed interface discussion here:
> > https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
> >
> >
> > BMCWeb currently implements a Redfish API (ManagerNetworkProtocol) for
> > the BMC admin to enable and disable network interfaces.  This
> > interface is being enhanced by the gerrit review linked above.  We are
> > trying to determine how this should work.
>
> We discussed a direction in the gerrit review.
> 1. Enhance BMCWeb to be able to enable & disable these interfaces.

nit: Not quite all the interfaces.  We discussed excluding disabling
HTTPS over an HTTPS interface, as it can easily lead to a user locking
themselves out.

> 2. Enhance the service config manager
> (https://github.com/openbmc/service-config-manager) with a block list,
> so distros can decide which services should remain always-enabled.  For
> example, the default could be that HTTPS is always enabled.
>
> Joseph
>
> >
> > I wrote down my preferences here:
> > https://github.com/ibm-openbmc/dev/issues/1763  and I understand
> > others will have different use cases.  So, the purpose of this email
> > is to understand how to move forward.  I also understand some use
> > cases will completely disable various interfaces.  For example, some
> > users may completely remove IPMI functions from the firmware image.
> >
> > For each interface, I see three possible configurations:
> > 1. The interface is not present in the image.  Naturally, the admin
> > shall have no way to enable this interface (because it is not
> > present).  For example, we want IPMI eventually to be configured out
> > of the image.
> > 2. The interface is present in the image but the admin shall have no
> > way to disable it.  For example, SSH is present and the admin has no
> > API to disable it.  Another example, disabling HTTPS would prevent
> > Redfish access, and then the admin may lock themselves out of the
> > BMC.  This is not a desirable situation.
> > 3. The interface is present in the image and the admin shall have a
> > way to enable and disable it.  For example, this capability already
> > exists in BMCWeb for IPMI and NTP.  The case for SSH is discussed in
> > issue 1763 linked above.
> >
> > How can these configurations be implemented?
> > 1. When the interface is not present in the image -- Write bitbake
> > recipes to configure/build the feature out of the image, and also
> > configure BMCWeb so it cannot enable/disable that interface.
> > 2. When the interface is present and should always remain enabled --
> > Configure BMCWeb so it cannot enable/disable the interface.
> > 3. When the interface is present and the admin shall have a way to
> > enable and disable it -- First, if needed, enhance the BMCWeb Redfish
> > API to allow the admin to enable and disable the interface. Then
> > configure BMCWeb to allow that.
> >
> > I propose project defaults as follows:
> >  - HTTP - interface present and redirects to HTTP / admin allowed to
> > enable and disable.
> >  - HTTPS - always enabled (the admin is not allowed to disable it)
> >  - SSH - present in the image & admin allowed to enable and disable
> >  - IPMI - present in the image & admin allowed to enable and disable
> >  - NTP - present in the image & admin allowed to enable and disable
> >
> > Oops, I wrote too much!  Feedback here or in the gerrit review is
> > appreciated.
> >
> > - Joseph
> >
>
