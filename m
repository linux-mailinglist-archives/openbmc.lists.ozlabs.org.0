Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF535338278
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRg56Xmtz2y0K
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QJlcawyG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QJlcawyG; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRft5CZSz2xxt
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:35:18 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id by2so3494957qvb.11
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLxA7r+fBOWMVd7T7P2NcXytilJkXu1spGty0kJ9U2M=;
 b=QJlcawyGX0/bMbBOxzK+e1Z50fc5qeOzCNtTVaTxR9qjLVxmSnwYitPCicpqRByLlE
 pfDu4kpuCdwm7vYTB+38XTRWblr7QYs31cwQDnpJnob9eYSqASek8X3v2CWUWjQIenhU
 nIUXqc9m2i5DwfOFwLNfT/rUhDJYTP5dR1qt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLxA7r+fBOWMVd7T7P2NcXytilJkXu1spGty0kJ9U2M=;
 b=jdD5XGPkOyzHKVW5JfV0VoymWBKRNLOMY9oBvnE65LhqZ4sNUb1suTATv/7cFUuv+b
 HNEM9WZ49I8Iqeoh2Gi1BQCVSNp3EmqEddMcemA4iHXSm6mxqZ8JUAmeURRZaqP7FHYX
 5PMasTcr8Wi06A3zRq2IOr9OXdjRuhypMLc6iCoBhBXTsSMCVZoYeoCXk0tB84ce2jbt
 oSdsrL4IsmROkepgR/IriAZUXzodyS6uxtcUy7DzbyfQ6Og9UpxSYTBs3Wrqk7VQzVP+
 uUIk3NeZQRRb0Ttt7Nxf034gxn7Ew5NPHFtREW6eeq9lZozUcWc6YJep+fFBn8r/pTEN
 ioxg==
X-Gm-Message-State: AOAM532p5DFZU3+lOIHQcYOX4r3yW0PJoPeR7pJC2myb66Xt6CopTIL8
 vsqoMMfsF5ub8dekCguFjbmP0zPXjfGSQDfcrvSoS13vg/A=
X-Google-Smtp-Source: ABdhPJwbo9nO1QqZ5yAegbwNDD4/OLkBmPmmkdF6se/W/svpVATmeUETWiWxw9nNyhUSyDNla7UmY+tpxzZkxcTADbA=
X-Received: by 2002:a05:6214:180d:: with SMTP id
 o13mr10124676qvw.10.1615509316152; 
 Thu, 11 Mar 2021 16:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-28-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-28-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:35:03 +0000
Message-ID: <CACPK8XdA4a_DnjBzs+-3auYcd06-v2aF1-qvtPKE6q3+wU+RWw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 27/35] net/ncsi: Avoid channel_monitor
 hrtimer deadlock
To: Eddie James <eajames@linux.ibm.com>, Milton Miller II <miltonm@us.ibm.com>
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

On Mon, 8 Mar 2021 at 22:56, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Milton Miller <miltonm@us.ibm.com>
>
> Calling ncsi_stop_channel_monitor from channel_monitor is a guaranteed
> deadlock on SMP because stop calls del_timer_sync on the timer that
> inoked channel_monitor as its timer function.
>
> Recognise the inherent race of marking the monitor disabled before
> deleting the timer by just returning if enable was cleared.  After
> a timeout (the default case -- reset to START when response recieved)
> just mark the monitor.enabled false.
>
> If the channel has an entrie on the channel_queue list, or if the the
> state is not ACTIVE or INACTIVE, then warn and mark the timer stopped
> and don't restart, as the locking is broken somehow.
>
> Fixes: 0795fb2021f0 ("net/ncsi: Stop monitor if channel times out or is inactive")
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Please send upstream for review.


> ---
>  net/ncsi/ncsi-manage.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index a9cb355324d1..5a2beaf874c7 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -105,13 +105,20 @@ static void ncsi_channel_monitor(struct timer_list *t)
>         monitor_state = nc->monitor.state;
>         spin_unlock_irqrestore(&nc->lock, flags);
>
> -       if (!enabled || chained) {
> -               ncsi_stop_channel_monitor(nc);
> -               return;
> +       if (!enabled)
> +               return;         /* expected race disabling timer */
> +       if (WARN_ON_ONCE(chained)) {
> +               goto bad_state;
>         }
>         if (state != NCSI_CHANNEL_INACTIVE &&
>             state != NCSI_CHANNEL_ACTIVE) {
> -               ncsi_stop_channel_monitor(nc);
> +bad_state:
> +               netdev_warn(ndp->ndev.dev,
> +                           "Bad NCSI monitor state channel %d 0x%x %s queue\n",
> +                           nc->id, state, chained ? "on" : "off");
> +               spin_lock_irqsave(&nc->lock, flags);
> +               nc->monitor.enabled = false;
> +               spin_unlock_irqrestore(&nc->lock, flags);
>                 return;
>         }
>
> @@ -136,10 +143,9 @@ static void ncsi_channel_monitor(struct timer_list *t)
>                 ncsi_report_link(ndp, true);
>                 ndp->flags |= NCSI_DEV_RESHUFFLE;
>
> -               ncsi_stop_channel_monitor(nc);
> -
>                 ncm = &nc->modes[NCSI_MODE_LINK];
>                 spin_lock_irqsave(&nc->lock, flags);
> +               nc->monitor.enabled = false;
>                 nc->state = NCSI_CHANNEL_INVISIBLE;
>                 ncm->data[2] &= ~0x1;
>                 spin_unlock_irqrestore(&nc->lock, flags);
> --
> 2.27.0
>
