Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C279C29FBC4
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 03:52:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMn0f07N2zDqjx
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 13:52:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Um2eYYHD; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMmyW3YF9zDqhn
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 13:50:43 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id g13so2232283qvu.1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 19:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hWG1bLi6EYAvCXzFEfBGZKVvt9EJ7zbR7bbulpvKQXM=;
 b=Um2eYYHD6M1WoeeYozGFsziy0hFFj2NDqi65PWUJDxetf9Gjd39oFvxMS8fgbQyjoh
 oKTpBBCfvGlwbzS4X7RqJiI6UyEGhHSDD4aTHuCe2OsCGkDJIW4wuMqdhXNak3HMTcj9
 wqFBPI5t1SEZkeyRW2mUWDKuey8FCKoywCW6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWG1bLi6EYAvCXzFEfBGZKVvt9EJ7zbR7bbulpvKQXM=;
 b=MEDEpY3Y8wAHALWgQ4QPMsJ3L/0HJDWTKbDt7AdKaqx9LrK4vvjHuSuvE1rhreFe8C
 ynrZZgKn9fOz04rUSU/UVeLTfoQa8CdVrF/Tsbp4zT5aiwmk5l4xT2gbA1/uaic3d0KH
 0y0HP0nsySk61fSD4FtbsFPgH/gYVEwJi+2sInFz3x/MnDSkJ5OW4RRvryWviC6xZACi
 elX1XNhfjRsAsXkz7JfYasx3VT1CDxBqOm8uNym01VlzChDaseUmyJ317yhA2xTGKXjS
 2GwIAu5VC/77MEwJyZhDFdUiKRYjGwoOhthJvhT471MA2xtjAhHSVHtHA90utaSefb3E
 Fx+A==
X-Gm-Message-State: AOAM533LcyZ6bmnvib5ufxSZmlFRcKnscFyfPhkDEprb2gD7k0wzRLsG
 j5g0NQFUlruV3PY61Dq+oBySvkK/MDbmOO1JeDWD70itj88=
X-Google-Smtp-Source: ABdhPJwWkI1pcuvWloOGwzmSWburvsOXX7JTlFNouS861NS+QRPXVpIXSiZMVT4wPADhQoQiV9CzAuA/5tDnapKN+J4=
X-Received: by 2002:a05:6214:180f:: with SMTP id
 o15mr7429523qvw.16.1604026237963; 
 Thu, 29 Oct 2020 19:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdR_Qb1Na5j7tN2ej6qZrLHNzU5dXP-XEYEH+Z7V4NADw@mail.gmail.com>
In-Reply-To: <CACPK8XdR_Qb1Na5j7tN2ej6qZrLHNzU5dXP-XEYEH+Z7V4NADw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Oct 2020 02:50:24 +0000
Message-ID: <CACPK8XdoWODoTkEwFkZp9m31U3q0xwj0TQqsZxw_YiZAN6SMyQ@mail.gmail.com>
Subject: Re: fsi2spi bindings
To: Eddie James <eajames@linux.ibm.com>
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

On Fri, 30 Oct 2020 at 02:49, Joel Stanley <joel@jms.id.au> wrote:
>
> Hey Eddie,
>
> The upstream version of your FSI SPI patches have landed the dev-5.8.
> It looks like you changed the way you did the restricted property in
> those.
>
> Can you make sure the dt-bindings are in sync with this, and any
> downstream device trees are also updated?

I noticed that they are correct upstream, we just didn't get that
patch backported.
