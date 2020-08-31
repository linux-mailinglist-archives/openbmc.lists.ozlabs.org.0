Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2225847C
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:40:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgRWp1h8gzDqVH
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:40:06 +1000 (AEST)
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
 header.s=20150623 header.b=gSeoYqBS; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRW05TDHzDqT7
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:39:22 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id q3so5036166ybp.7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiJwcqwWyH9Oqci0ti292MRlW01eqKT5URAXVuGyMuk=;
 b=gSeoYqBSUC86DIw/H4pEYFwlDuLF/SQ7mRIrP3NvtmPqkPr72mxwDqcUHfF8WMQizX
 EEfHrQsPLyfUk3u+oJqeXOx9eehXgt/FjN87Hp7Fc14vYmVYMlJQEHu3Yuo6UsWGlreC
 2+pPRpKVgnifKjbXxs3k1m5GSyh86IbUOL5gNaqcw0iw54gU7moLseuIMft+l/pizr2K
 1G/gHuGCyWG8Q6pPor0eO4ex220G2SF9LBA3MJUpo3eSX0vzUUA5O+qcdkjTv1kf/0bx
 ptFmWs7Be30QNK7yqKb5BXt7aKYY0lNBU5BLRv5kumhHxfuTiHBj6nY7WcY1VNpUgnib
 KArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiJwcqwWyH9Oqci0ti292MRlW01eqKT5URAXVuGyMuk=;
 b=dZgFzCxL//UIOQbmLaal+wqSEfUWYi8jvDZ/S1IBgwtGqOKmRpbaJHO9DmARljZRd6
 2pGK0G8aAFWW05R4+NX/dTV/MNf8S1VScGgtCTaP//f2LM//8eTRXeqQSj8ojBughM4n
 pQDhu52S/bsJfaTe5ROAiHj34fatLP2GcaDd7BPafDkFBLwPf9cxJEzooBUarIaaDK3b
 9D2Kad0SvCFywGnVZJKhEImvEm5ihBNBpn7ucgaOYGnggc9RUwDwP39ildHdEgtJU+hJ
 wjwTW0hrAIz4q/iAK8EYfc0egpXvwKwIocf17iX55FghgJ4ZndvS9iv0HxTBZFHvY+Ez
 8T6w==
X-Gm-Message-State: AOAM531mEd2HyUJbNDxQFIQwLz8gYVPtrZDT96HqBbNwCNGZKHYlyEG3
 V7vr2gKOvOUYuC+oMh4fqlbuXxXC6zjDdFzlqQ1cZLet6pNy6Q==
X-Google-Smtp-Source: ABdhPJyGNS+zcSQ25PWopcsDZqh89lEQMXALYWUWwVt0NaCvW/chFP16I3K5Nv4pxguorwJehFeL+/5TGqiHdV/Od0Q=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr5739431ybe.417.1598917157455; 
 Mon, 31 Aug 2020 16:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
In-Reply-To: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 31 Aug 2020 16:39:06 -0700
Message-ID: <CACWQX80Fj2fiF9fW56meL0kQucKfkQc4QbL5-nC-_amRb8O-zg@mail.gmail.com>
Subject: Re: Naming DBus paths of CPU objects
To: "i.kononenko" <i.kononenko@yadro.com>
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

On Mon, Aug 31, 2020 at 10:55 AM i.kononenko <i.kononenko@yadro.com> wrote:
>
> Hi,
>
> I'm working on improving of the OpenBMC RedFISH API. In particular, the endpoint of the Processor.
> To provide all the properties of the applied RedFISH schema, we need to get from
> DBus everything related to the CPU object.
> It can be CPU, Sensor CPU temp, Sensors Core CPU, etc.


I'm a little confused.  The Processor schema doesn't have a Thermal
property (did they add one?) so CPU temperatures and core temps would
need to go under an equivalent Assembly or Chassis.  I think today for
some platforms they're added under the baseboard, which isn't
"correct" but is close enough.  Can you talk a little more about what
you're wanting to accomplish in your improvements?  What would the end
result look like?

>
>
> However, some services have different names for the same physical processor.
> In particular it is about `entity-manager`, `dbus-sensros`, `smbios-mdr_v2`.
> `Smbios-mdr_v2` (just like `hwmon`) names the processor, indexing
> it from 0; in `entity-manager` and `dbus-sensor` indexing starts from 1.
>
> I want to add dbus-associations between all Processor's object,
> but for that I think we need to adopt a naming convention for the same DBus objects.


Can you talk about why you need this?  Keep in mind, there are lots of
systems that have processors on add in cards, or separate
accelerators.  Making the statement "all" makes me think you're
wanting to make a blanket association from system->processor, which
I'm not sure we can do as a generalization without breaking those use
cases (which admittedly aren't modeled very well today).  I would hope
we don't need to rely on a common naming convention to do it.

>
>
> I like to index it from 0, just like doing that the `hwmon`, for example.


I completely agree that we should standardize the naming convention
where we can, the only problem here is that the overarching goal is
that we match the silkscreen mask on the board, some of which zero
index, some of which one index.  With that said, I know that a lot of
the existing configs don't currently match the silkscreen.
smbios-mdr_v2 to my understanding should be using 1 indexing.

>
>
> --
> Best Regards!
> Igor Kononenko
