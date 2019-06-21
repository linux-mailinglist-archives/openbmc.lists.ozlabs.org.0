Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC74DE14
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 02:33:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VKS10NjVzDrK0
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 10:33:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZRi/YucS"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VKRR1wnhzDrFd
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 10:33:22 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d23so5215778qto.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JoUWwrccBOOYH40aOvO9aK9W00lep2VUivmASLAPoQ=;
 b=ZRi/YucScQmwVK4ot6EGuf1l/XCib9Xv92QafroXwfhSYirSVH9TVGLHTkBW1fcdcF
 rlzMqpnFShDgm7zetJ0wkuTp+ctWClueBjCClL5bGnhmrtbKLOhFqaYXdJs45RBzLz2B
 1H9J9VyPNln/YocfQsZnHWf6RCyZCKMq+tnfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JoUWwrccBOOYH40aOvO9aK9W00lep2VUivmASLAPoQ=;
 b=Rnu3LS9nljlL/pLAuJ2aimLD+SyzCg6tjOB5JqZvwQ1GuX43TmF9bI19s4BqiKxmXw
 Fmxp3MsuS9C8LS8/iGmsJHrRofUrJKXsZMMKjeq/ti5R7BwMHgyEAMBJI9hKSenHhk3Y
 jrg7SKZf4zcilYPVd3L3xk8bYdC/Suvunfyj+GLV69XRoCa0oeDTqaKDgspYnslYgdS1
 gTB4wPud4HT2ZRgAv5kK3TfgRKSuKAUpud9P+VwyzSDyZsLCrm4M2EWCMTHV2Ynk4MIz
 bgk9QKYLtoulRBaAWxsY0Yu617DGhVNEKq9bmwGAnBTELcuAuWROGcRJwRLTyh04OcCQ
 Qecw==
X-Gm-Message-State: APjAAAXtkxDiL9sIQ52owbo8FTCxmYYGI39CtYWG1jSm9yj+J9Zt98Jh
 XrVSUu+SFEbNPQkfteHMiZn6yTLgv2JO2a7LAnE=
X-Google-Smtp-Source: APXvYqyVnPKDGO/a/qf5CiENiTTvIH7/8rH1QsuxLRuUBjmSGd+Fbct9+95Dj9CXSdh1GOP8S/wyJCy+4/0gcHLOOyk=
X-Received: by 2002:a0c:895b:: with SMTP id 27mr41698109qvq.94.1561077198374; 
 Thu, 20 Jun 2019 17:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwO_0MNFY-70bGRwmQZGG4_Wm-=2zddmncKYkT-QkBx0g@mail.gmail.com>
In-Reply-To: <CAO=notwO_0MNFY-70bGRwmQZGG4_Wm-=2zddmncKYkT-QkBx0g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jun 2019 00:33:06 +0000
Message-ID: <CACPK8XdjO8uteCX6WzYWzrhjyWoof=_jwAOpjp=FUMeUwrXcLg@mail.gmail.com>
Subject: Re: reduced contributing availability
To: Patrick Venture <venture@google.com>
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

On Thu, 20 Jun 2019 at 17:55, Patrick Venture <venture@google.com> wrote:
>
> Hi fellow-openbmc'ers
>
> I will have fewer cycles to contribute to OpenBMC moving forward.
> It's unclear yet how it'll settle out, likely just a few hours per
> week.  Enough to finish current things, and review incoming patches
> (pid-control/hwmon/ipmi-blobs-stuff).  Unlikely to contribute to new
> long-term efforts or long bug arcs (epics).
>
> Watching this program grow as it has over the past couple years has
> been excellent and I'm excited to see the community continue to
> accelerate in growth and contributions.

Thanks for the heads up. And thank you for your contributions, it's
been great to have you around.

Cheers,

Joel
