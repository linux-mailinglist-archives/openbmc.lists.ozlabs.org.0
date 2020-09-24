Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECC2775DA
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:51:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By00L6mN2zDqYq
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:51:46 +1000 (AEST)
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
 header.s=20150623 header.b=GPzFNpye; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxzys3dsYzDqNv
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:50:25 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 67so2621307ybt.6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkmlAq5vXBqOB9UBj5P3OcSEkPHEdnb4hm4/jR04YaY=;
 b=GPzFNpyeY99WV6ax3MyZru2QUJiZ9fzCs6436nHhgsUdcttP5IpE0oqmQA/+tBn7qN
 7LnqTDIC5774Lej98KkG9zSOM0gweneeMV0hcuEGsS1jaSZ4amumYdOjvp6zzaQvngeK
 OiYtradz4MRr/tvf5YEeWawqkWQLUBIniP6lWat3nc9Z+8tCRPgNNM423QXTUNpY1oh3
 b2OFbAoQezYRKb6TqjBvRpqM8IWtRaUrJnHlbi6Aq6EYkDSi83ICVFQuwvoyaESRqrIv
 sghZzQBSBOvk3SFFkLrcMNDqzQRD+PH18l/OKrMtQaOfJTtUeFqGpOu25TtQ/vJ+w/IA
 zvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkmlAq5vXBqOB9UBj5P3OcSEkPHEdnb4hm4/jR04YaY=;
 b=dN8S6lJ3cDzL/jbpgX9omWSI671qqcPFloQ3fyCIf5s9WACrCQO3x6fZdEqAYYP8ar
 32lbV0Uw+neyQkiAGxgSjBfsh92BbnuEZRTj9drJAaDL2CTggEgSmtOm3aCDpAH26AAx
 us2J5C6m8iPG0VILMYSfzu0p0MTPWhrwOK3XAzhPa22Pt7VytBtvhvH44oVuKahPckWS
 jgTUKcklUVMlGSlK0ayMmNZow1qIvKMxvdb09/nz8LSGtmD+q3Ma5YDgFWbscqn78bGp
 tL5GTAhSyiF3qMePJzNUkxpYvKOq2+FocJfmE+XcUz8D7oEWuEV4PcJh+gbiHXOxgR9U
 1L4Q==
X-Gm-Message-State: AOAM5322bH1J3JFWX/HwDnS5UGNWKHwPNKiozQxvXVweMoknc0NQl33w
 nhO7lXeIVVBUqoWyoZRJzNbameN3IG86sk5uSwL+pydQ02Vw6n0D
X-Google-Smtp-Source: ABdhPJzg5TTqczy3hWh+kh7w3G7Z02grxw/Aq7ajo664fEDwakBQPLopwbBoN7II9UHjjirYG+L4lFf7GitTQk8a3Lk=
X-Received: by 2002:a25:1581:: with SMTP id 123mr258811ybv.480.1600962621406; 
 Thu, 24 Sep 2020 08:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 24 Sep 2020 08:50:10 -0700
Message-ID: <CACWQX82BLnW9joot+VmLZGydCBm2riQ88Ncq9twqyf0UJdrtNw@mail.gmail.com>
Subject: Re: entity manager configurations and dbus interfaces
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

On Thu, Sep 24, 2020 at 7:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi Ed
>
> Will quote a comment from this EM review:
>
> https://gerrit.openbmc-project.xyz/36702
>
> > entity-manager was designed with the tenant that it config files have
> > no knowledge of dbus.
>
> FWIW I had no idea this was the case.
>
> > We've broken that a little with the inventory interfaces on the entity
> > as a short term patch to gain some compatibility, but its easy enough
> > to roll back in the future.
>
> Interesting - so there is a vision here, but I have no idea what it is.
> Can you elaborate on how you envision inventory working if EM is not
> implementing the inventory dbus interfaces?

In the simplest terms, one goal of entity-manager is for an engineer
unfamiliar with OpenBMC to be able to add support for a new component,
be it a baseboard, drive, or add in card, in less than a day.  Dbus
APIs take more than a day to learn, so we need to find a way to
provide a syntax that is self describing (and ideally well documented,
but that's another issue that I'm hoping to tackle soon) as well as
relatively isolated from the complexities of the OpenBMC core.

Another advantage of this is portability, if any wide sweeping
architecture changes happen (ex, we rewrite the core in rust or we
build a DBusless OpenBMC) we have a minimum definition of the things
that are unique about the pieces of hardware we support, and don't
have to re-engineer every piece of hardware that's in the list.


>
> thx - brad
