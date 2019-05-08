Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECE1744C
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:56:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVhJ5G1qzDqHw
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:56:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DTbCPAhN"; 
 dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVgK4SM9zDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:55:41 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d20so4723321qto.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osBTPoQZ1v00qAusgudCBoj9vtfbnh1Ukbq/5McX444=;
 b=DTbCPAhNur4y7YJnRICsTAjNYpO4/Gukwk5tJc+DfCWk+tQMwa8iI8pWOkqx4zoBnf
 HCyvOkBcEjphbL4iJxxWQhQ5ofQRz7WU7CIyVD4/s3EQpcBGQDAUeCYHvCPh7E4pxXqF
 ddlI3XoqbzSim7aHgPNQkuaG87oJewNe3L+AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osBTPoQZ1v00qAusgudCBoj9vtfbnh1Ukbq/5McX444=;
 b=r+Z8stWDl6Eq8Qbg44XoRnDSrCKju7Z2ANE4zjjTXXAQUFtnO9TYVZexGMH5RVSCk7
 OUi95281TmEwKo3XfwxiAYuUFqEXKm/5EueeL+xdCYGsiAi/fHxi19PVTmsM6pNvtAuj
 DSdKiBaCtwOuYfQTdi0iJdUnGH9/Vlpq9nb2C0537sZWeUQlFfTtDbz3aA2JCfISm8uO
 +M/LwUyUnh6h2s9gZx16vj7EV5CN9b0ZmpytC7JW1sofFSQ6a8z0zozkmqPB/UOghowL
 TFvEmxRLZC9W/T9q1qHo+5qCGMe9/N9FolaqLWc+vlpqHYlTAA8k2XgHGogmP1GhO8j2
 9bVA==
X-Gm-Message-State: APjAAAW52zGpM9KavnCJifsNpMhGQKJLk2CLohqN/DavJDQdJdR9DVe+
 a974yQx52GJYmR5KfowTNSj377M9+k9YumaDA7M=
X-Google-Smtp-Source: APXvYqwRecejI/6ZUE/L+OYyfGAMAb7ZM6N2Lj/0VUgfx62MzuNdWlDKJvWyudYqmejVi1i4Fz0UEVxFo6zH3uWcJJk=
X-Received: by 2002:a0c:ad89:: with SMTP id w9mr24293726qvc.89.1557305738970; 
 Wed, 08 May 2019 01:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
 <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
 <CAARXrtk_AOkHQU09YO1rAzo7A4BbMw0gts+5r3jLK7upyJGXXw@mail.gmail.com>
In-Reply-To: <CAARXrtk_AOkHQU09YO1rAzo7A4BbMw0gts+5r3jLK7upyJGXXw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 08:55:27 +0000
Message-ID: <CACPK8Xdcxss9XFEuMoL7Av=P8-ZSuUUY=LmpzT3b_0g=Ls=VNQ@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Lei YU <mine260309@gmail.com>
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

On Wed, 8 May 2019 at 08:48, Lei YU <mine260309@gmail.com> wrote:
>
> > To clarify, this only affects the updating of the PNOR/BIOS, and not the BMC?
>
> No, this affects BMC update as well.
> With https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/21208,
> the APIs in /org/openbmc/control/flash/bmc will be dropped.
>
> BMC code update shall use the APIs in /xyz/openbmc_project/software instead.

Okay.

Does it affect the on-device update method of putting images in
/run/initramfs and rebooting?
