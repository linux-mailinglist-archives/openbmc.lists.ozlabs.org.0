Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7F25E09
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 08:29:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4582mV0pfRzDqMB
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 16:29:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZSVRNwR0"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4582lw0T0kzDq6Q;
 Wed, 22 May 2019 16:29:13 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id y42so1040842qtk.6;
 Tue, 21 May 2019 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSMxtg+4ga1Ee9oZOxovOiqRSgoFxJ3R3tfcAgIm79c=;
 b=ZSVRNwR0h4DtB5SRXYj/E7Bhy/a+T8CG2DeKGYPJrsbXUJhriMeY/53XcwBiDL2Sbk
 VkWpfWiFeV2q8HMlHdEaoRUe+rdUw+9B9TZrcAEtZKgMFDopEUCwouUgE34MYzjISJUf
 UUkrubhRPheT4duHeV3lxsar4SiefPrjPkTrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSMxtg+4ga1Ee9oZOxovOiqRSgoFxJ3R3tfcAgIm79c=;
 b=npJyW9LonLXevRSXCJ0GHpeZdLQHXrKuUgA4EZT3Zma67I57PcGIg1pVj8XfqBX95f
 yXnNDuSqqdvt9UXcu0u2fWncqbZvpnaW7nZbmmTaL6YYYokVVFtKklsxty+Y/LJ77VbA
 +R/f1Y1FYvNUmHdoO6My/YbJrJnZ3PEEURqD/J3f8xdPI/EXISMObnPy6UrBPaqVR9SJ
 rKQHwyiYlr6+l3kSIFYzBCFlPdj8p2/uv4/RBgxRr4l+5eZYeLGHGYkZRzgO1jlw7cQ8
 l+qrM78z0KMBzOyKC/upaMENCAF7SeT+ry5OCJVYBQcA8JRriwaJByi5LQ15Lh+30RFK
 2ZSA==
X-Gm-Message-State: APjAAAVTxq4NyxfdAkc6IfvyeWGqP8n7ayekHpVJF718uUxj1zA3nICe
 oYXIGoWDUey4RP+qKb/EW7AZci9xe3ltP7KxxoI=
X-Google-Smtp-Source: APXvYqyqTKRL+YywvzncSapUnZu5PHqeksIQjn716a9Gmx7BVTxDzCp3VEnluEW4EtFIM4DjdfN1VLYv1Q+Ysvh21k8=
X-Received: by 2002:ac8:18aa:: with SMTP id s39mr71152178qtj.169.1558506549911; 
 Tue, 21 May 2019 23:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <1558383435-38811-1-git-send-email-anoo@linux.ibm.com>
 <CAK_vbW2474g00xqoNU-Qd5DJ31mk5vcQvcr1GKxL8mGZ-Dqxfw@mail.gmail.com>
 <CAK_vbW1fodzoYBAtqFg9w3i+kK5W3Yt4GczxukSfMHN80rku9Q@mail.gmail.com>
In-Reply-To: <CAK_vbW1fodzoYBAtqFg9w3i+kK5W3Yt4GczxukSfMHN80rku9Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 May 2019 06:28:58 +0000
Message-ID: <CACPK8XdxwFtn4rGwC3cn+DOy+BQ9ZNAT3tUmL+qQkptmV7PT_w@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add pca9539 devices
To: Brandon Wyman <bjwyman@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 May 2019 at 00:25, Brandon Wyman <bjwyman@gmail.com> wrote:
>
> On Tue, May 21, 2019 at 7:23 PM Brandon Wyman <bjwyman@gmail.com> wrote:
> >
> > On Mon, May 20, 2019 at 3:17 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
> > >
> > > From: Adriana Kobylak <anoo@us.ibm.com>
> > >
> > > Add the pca9539 devices to the Swift device tree.
> > >
> > > Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>
> Reviewed-by: Brandon Wyman <bjwyman@gmail.com>

Thanks, merged into dev-5.1.
