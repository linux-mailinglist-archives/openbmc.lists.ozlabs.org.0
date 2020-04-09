Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165651A2D2A
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 03:04:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yNFZ05PLzDqgw
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 11:04:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NgPDJyQn; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yNDt66qVzDr3N
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 11:03:26 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id ef12so4709636qvb.11
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 18:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9qO1YNmQGLDSly79VtZ07j//1RDoa1qtKkbxMBOXK0=;
 b=NgPDJyQnh8nY2EMYFPe4UC1MnGRAJeTqWwFWfSU4PI4EZ+JLfUS4GIGuGf7ZyYD9U1
 Z6DPMUn4SWM3NMKo7aeHJtV2k3lpTkHcVoqoZFJ+LH2x5hRzg8WKnShbMbJb6wCim0+H
 t+rvCnna1ZrGP9or7NZbSEawDL2mDue1L2aQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9qO1YNmQGLDSly79VtZ07j//1RDoa1qtKkbxMBOXK0=;
 b=MOzBo3oekVMuafNb9ibLjGOIjkSzHswrnu9GH30EzLr8R23MHZgpnsGrQJsZyH6CyI
 uHD+GfacE26I8mcD6YX5o/clmNXqDqGD9B/J32HcobEdCoW0fxH8DZw0hIMHrLXW5ww1
 p5cuBLQkMBcgXsvHbS74kqeo+UaJVZg/NQEwpUI7rY6JbKc23jyNrjCiVmr8SOE8PC6v
 bhvD+YYjg/ful6/i4ZIi1WE/rgzSxPTj0cqm9sJefJZA302keIgmhP1hleIJvlT6WZYu
 6Kn1zjhIzNs5bxS7ugu+ljVrO1ScL2udrmnUVPk0dqPnHgZ4l3EOqKu1h+clxi4HdK6V
 tsTA==
X-Gm-Message-State: AGi0PuZ8LBYBluYZ2NNMPMfzN2oQhY+HqXOS1P7burSq+LTE5+iI5OOI
 Ae1WyfNyl3HfbVHhhy2RqMFV+bdjqclwxof1qgQ=
X-Google-Smtp-Source: APiQypKxFGhU19sUkoUKsPyIuTbtUlb3aKJS/2IR+QeYKE8AhEz/qjOCZdpkYrmHZZmNxzb+UlfQzXfqQLolZdKlObI=
X-Received: by 2002:a0c:f207:: with SMTP id h7mr9962929qvk.20.1586394201147;
 Wed, 08 Apr 2020 18:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2KKeYNi=qbs-mf+3tBfCG-Z6fQmmh48EosSam0GMFuc7RD6w@mail.gmail.com>
In-Reply-To: <CAH2KKeYNi=qbs-mf+3tBfCG-Z6fQmmh48EosSam0GMFuc7RD6w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Apr 2020 01:03:09 +0000
Message-ID: <CACPK8Xd8+bNNkqtcyXQW=BhSXuzFcrBR7Rw3EPLesaukS7PZAA@mail.gmail.com>
Subject: Re: Availability of OpenBMC Secure boot
To: Thaj <tajudheenk@gmail.com>
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

On Wed, 8 Apr 2020 at 20:14, Thaj <tajudheenk@gmail.com> wrote:
>
> Hi,
>
> I see that OpenBMC Secure boot design(AST2600) is under review on gerrit.
> Also it is listed as Work in Progress.
>
> What is the expected time frame for the availability of this feature?

There's no published time frame at this stage. The bottle neck is
developer time. Are you interested in taking on some of the work?

Cheers,

Joel
