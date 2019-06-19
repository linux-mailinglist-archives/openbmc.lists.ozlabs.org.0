Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA64B02F
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 04:36:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T8Ft6ZDQzDqhD
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 12:36:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BPQXnu94"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T8FG3nl7zDqLf
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 12:35:29 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id d15so9973995qkl.4
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 19:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJgzm7tZyN2SAJ6zlcRJVE5bVFtqdOXVzLWWIoicP64=;
 b=BPQXnu94/3JtHufzemzUdfc53Ep8bn+LGIOFp7/i7b7EzFRhAQL0QyhAXm80TeQ4dr
 zrUk7jUgVtExzPVXoys+XkxGznT9MNGZHZkAgi6DF7+vgTh0pUuymFn62gfNSOxGzWh2
 buAfMOQH9Bn9MYlrNoQt0KR7Pz4P6lC1w3JJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJgzm7tZyN2SAJ6zlcRJVE5bVFtqdOXVzLWWIoicP64=;
 b=W38HyuddKDG8X9tHCeCw5vcsPpoTeXnqw/82eYU0b5kESPWeZrPBwiqBpMHiL4vHXd
 kQr4IsnIeumgtQIAq4WiLCKhAd9L4he60kwZPCE+TgF4i8+h4XxgoPPTEK8qxu8OZ1Fb
 yT7pBnNX/oMTJPKOezxVQwdk/l6L6DM1vLWNQ2Gh3pmW9r9l0npkEuCjBwHkDPew+qIg
 a/v2jgF7GzQoQkWYFSx+tD5F5lzSU1oLAEh6aJxi/kchHukSRjnxe94GlXqTQv50peze
 rZlo5XyPZfbXPqS/EKwfmIZS0Pmxnvhk7Nv84JlBn1VVOaX5fM3h6djY5YcoNdC/2NiL
 /1KA==
X-Gm-Message-State: APjAAAWdJ2xjEi4qTd9IR8wItIuU/v0kx8J6Hhu0P9ZtQyDjaqAdXj9V
 RMVBh+BUOVhwVm4KPN7w9i7zWF70LFmk14qdfeE=
X-Google-Smtp-Source: APXvYqwInGCX9WnMYYbdTlJSxviDZ4ovgWO32qAd2+HafZ6IZMuUITln8f9VbRfjP/HSiwM21gK/EkSZl6+W2LLHBhc=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr100009180qke.76.1560911726418; 
 Tue, 18 Jun 2019 19:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-5-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-5-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:35:15 +0000
Message-ID: <CACPK8XctZJj3KwhB_5ctmBgungeNrHe8gCORmjtwdx=enHROxg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] net: NC-SI setup and handling
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 at 01:38, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> Add the handling of NC-SI ethernet frames, and add a check at the start
> of net_loop() to configure NC-SI before starting other network commands.
> This also adds an "ncsi" command to manually start NC-SI configuration.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> v2: Update ncsi command help text
>
>  cmd/Kconfig   |  8 ++++++++
>  cmd/net.c     | 18 ++++++++++++++++++
>  include/net.h |  2 +-
>  net/net.c     | 27 ++++++++++++++++++++++++++-
>  4 files changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index 0badcb3fe0..9851b04972 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -1332,6 +1332,14 @@ config CMD_LINK_LOCAL
>         help
>           Acquire a network IP address using the link-local protocol
>
> +config CMD_NCSI
> +       bool "ncsi"
> +       depends on PHY_NCSI
> +       help
> +         Manually configure the attached NIC via NC-SI.
> +         Normally this happens automatically before other network
> +         operations.

Do we need to make it even clearer that "this command not required to use NCSI"?

I'm thinking of future me wondering if we should put this in openbmc
builds or not. It would be good to have your advice on this.

Cheers,

Joel
