Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF236037E0
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 04:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsYxq0cMcz2yQl
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 13:06:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ys/6zYCN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ys/6zYCN;
	dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsYxF1hcLz2xk6
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 13:06:06 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id d187so16484224vsd.6
        for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 19:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0kATS4XO+juNiDvC0DCeYG4HUWiHsBDfqy+1tjkaoAs=;
        b=ys/6zYCN6uykLt6S1a0f1RiRWluzFVlCANfweZVs56NrMkipb95jFLVEJedtXahPm8
         bnYGRcHAS+23/sJudzoX1+19Cq3JOd5lwvHVdTQq8UXjvCgcveciYXmByj9/tipR+EzC
         WAVvelHu53PPIR4ezkiSfmJTIYe+fWqK4i4/qqN5kJ8dqh+cw7uZxYPpvK3Csi906dsz
         ZnFf5OpoQHpOhx/IDY+UJMqdjDizJIC/c/LBsS6d5bomz3lz2qQSiMotR5bSlG/RHBGi
         eySLbsvJ/emw29tuj14l9jmvg8VY7n9qzIVsbeNekS8JBLcRRP27GqFrkMfFD9TKNTq0
         /h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kATS4XO+juNiDvC0DCeYG4HUWiHsBDfqy+1tjkaoAs=;
        b=NZUtlK8fPlVK47wMlZJYEBs/81J1Jr4fibwE0BPm758ftiLG+FoOf2Y7LbA47IKTWG
         Z8EVjMxKQPYRTpTusOHAkun1GM0qx7KNaaKUGDofD6hPnHWXzDDex335wvnBjy5BJzBj
         wBNcsET10JqypSY1jnGPPHAWA3ZBliE8XFezKGwYYOsWkq82IR3xXk11qArTGjXp5UWh
         0M3awJVTR6JaWqBFrs9OgqVLXstILu0EKuVMEzW619xF2IXuFea/NCFdIS6v1e9nevU/
         /ZMkp3o28WlSTOKxGgvwNIK0URQCI8y0NwR463XIgT1pwJyOJ1Sv249+EVblGARpZvJD
         sgZg==
X-Gm-Message-State: ACrzQf1YCRDCSwI8XUXum2Gw6TB03Dgv+dBjTwuVlYvJVUbMlYgSTo8v
	SXQdorvfad84VQVVFNUJu/rcJaeCf4WI3L2Tg+G6XA==
X-Google-Smtp-Source: AMsMyM5pa12NFZQh/UaOAsZ29CVD9CivJcBT8YitTs7hbKUPoRx9sbEWm8lFO75wv02wI8tSyPzPs3dixfIOaT/hO8U=
X-Received: by 2002:a67:b805:0:b0:3a7:a708:20a9 with SMTP id
 i5-20020a67b805000000b003a7a70820a9mr2671527vsf.64.1666145162353; Tue, 18 Oct
 2022 19:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
In-Reply-To: <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 19 Oct 2022 10:05:52 +0800
Message-ID: <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
Subject: Re: Adding support for custom SEL records
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 4:09 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Thanks Lei YU for adding the support desribed below.  Sorry for the
> necropost but I had a couple questions (below) for anyone that feels
> like indulging me with answers.
>
> On Mon, 2020-12-07 at 15:35 +0800, Lei Yu wrote:
> > This mail is to propose some changes in openbmc to support custom SEL
> > records.
> >
> > * Background
> > The phosphor-sel-logger is the service to provide methods (IpmiSelAdd,
> > IpmiSelAddOem) to add custom SEL records.
> > However:
> > 1. It only sends the log into the journal;
> > 2. It depends on
> > meta-intel/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> > to filter the journal log and write to "/var/log/ipmi_sel"
> > 3. It depends on intel-ipmi-oem to parse the "/var/log/ipmi_sel" to
> > provide the SEL entries.
> >
> > In short, phosphor-sel-logger only works with the meta-intel layer and
> > intel-ipmi-oem.
> >
> > To make it support general usage, several changes are submitted to
> > gerrit:
> > https://gerrit.openbmc-project.xyz/q/topic:%22dev-add-custom-sel%22+(status:open%20OR%20status:merged)
>
> To make it support general usage, I think we could have just moved the
> rsyslog.conf to meta-phosphor and moved the handlers from intel-ipmi-oem
> to phosphor-host-ipmid, correct?  Instead, we invented something
> completely new.  My question is, why?

There are several reasons:
1. The rsyslog way is undocumented and the handler is not in upstream OpenBMC.
2. The rsyslog way puts the SEL in a file and thus there are no DBus
objects, which makes it harder to work with other services.
3. The above SEL file needs extra configs to preserve, otherwise it's
lost after BMC reboot. (In upstream, the /var/log points to
/var/volatile/log, Intel's fork makes it persistent)

>
> Whatever the reason, OpenBMC now has two ways of doing SELs, and I am
> tasked with picking one.  Knowing what was wrong with the rsyslog
> approach that led you to invent something new to replace it would help
> me, (and others I suspect), make that decision.

Indeed, but the rsyslog way is not really (and fully) upstream.
With `SEL.errors.yaml` interface and the
SEL_LOGGER_SEND_TO_LOGGING_SERVICE option, in phosphor-sel-logger, we
have the ability to add logging entries to phosphor-logging, and let
ipmid to parse it as SEL.
There is one drawback though, the logging entries that are not
"SEL.error" could not be parsed as normal SEL, the current behavior of
ipmid parses it as an "undetermined system error".

-- 
BRs,
Lei YU
