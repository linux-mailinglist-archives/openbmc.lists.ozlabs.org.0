Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7849292D98
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 20:32:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFQNm13GhzDqfq
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 05:32:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=snKx1jLx; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFQN042ZSzDqWT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 05:32:15 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id d15so378425ybl.10
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4kTKrs+obVOqRPS0C1pfskKtTT4J9O4YkUWQd9EAYM=;
 b=snKx1jLxn5IpDxaUamz1nXRctD43Q7Ou5XWl490fmbNYBz5zCf3GHXNuri0lBabTFl
 asGqFie5JXjlqZ57ak8bQyj29P8X9vWRCmFCq9l+7oAP9wNwWMXM2p04Yia84NJ8u5tP
 qqao2HD5/OZ3WiFt8badmKl0/GrQOLNAGGw1Geb3e+lsogE5kDLjcGJv3fLhH5y8cKGu
 Q2eMb+L/fOiMPPCR9oxk/J9tjtXk6bRoAJ9/eQc5OO2ZW+ka4gKcPojscZW0zu8g/dhe
 GHAKiql8J8MOQWsToyWTCmt+QiCs1diXEltwIczg3Ak3rtC3ALpl6S0mbuPxHxCanlaK
 JImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4kTKrs+obVOqRPS0C1pfskKtTT4J9O4YkUWQd9EAYM=;
 b=YHhB8/5iBkZWqmP/nw1P/5hxM6vmE6QvsEhFTZZB+C6uqEi6xjS8p/2eMrmxrzEbOR
 ymUV9cKY/uvhzPl6BSRPs22PKZXW4mn8goHGf8UsVfTsZoWhXIL5pbKQHXJ8pl6DnAJt
 Eys9ZZqqANZz0SxvkhGrybigcUOFCGLiu/lRVEdmDwdVuh4W22Z0vKN4/OFcVtVJI3qj
 X8Pbmw1O25ogDNUnrP4zQVD8cXDOQpVyYaw0tstK8FLQ6ohuGN9wedY+LoMO3rTAKDbO
 hd3R4zekp2AVNOweTeLLPI96CF9WHmpfuu8PaEj7O8qbrx/+hqc8gL9E2lrAtAUcEcZD
 JCsA==
X-Gm-Message-State: AOAM532WZD/uC9xmd79vloRRpBlwLUmjP8yxCq0lQo8tpiIrK+GE+67W
 3SCTwwGdBI1UpcCL9wVpC+99ww1Tt8p5Y5zBGPvnzQ==
X-Google-Smtp-Source: ABdhPJyWuS9YRSea1j1KDxlfjOftq/AjmUPmQdrsrflMmA5yI2SUXVzM1cS1wNRmWKr544o69COsT3sza4CzznUXHo0=
X-Received: by 2002:a25:e74a:: with SMTP id e71mr709945ybh.209.1603132330873; 
 Mon, 19 Oct 2020 11:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
In-Reply-To: <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 19 Oct 2020 11:31:59 -0700
Message-ID: <CACWQX80+01RjO5hu3OQUrZKaMLz6LDR_-iAEdKPLDEHv4RZ=rQ@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>
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

On Mon, Oct 19, 2020 at 11:22 AM Thu Ba Nguyen <tbnguyen1985@gmail.com> wrote:
>
> Hi Ed Tanous,
>
> Thanks for your info,
> But in your platform we are using phosphor-hwmon to manage sensors.
> We don't use entity-manager.
> As I knew we can't use both entity-manager and phosphor-hwmon for one project.

Understood.  i was mostly just pointing out that there might be
logic/implementation details you can pull over into phosphor-hwmon.
