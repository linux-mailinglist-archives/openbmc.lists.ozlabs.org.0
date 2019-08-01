Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A1E7E035
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 18:31:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zwmT1K0CzDqlw
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 02:31:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ejO+qJaL"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zwlr6mlszDqgC
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 02:31:20 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id k20so145670950ios.10
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lObie5wmOrFGWUPDd50MBwpE2CzrN+xxdxN3KTpXyh4=;
 b=ejO+qJaLmSPOlj6QaibzN1IsFpbEXEHzTAAHnJFy2XOsnTck8Tu9UK1WrEh2KPNOsz
 CQ9Sxqj0O6d/EjyGDqweYuQ1DUZwoBWz41CkPnIG12eE0cTQl9bxg9USuQy0rfvF3vY5
 XqitP0KIcsXgXotMSWeNOTyTbNcIEGR6LSY4dgx8rvlgMPuu5cbRCFUYRlYMMcuNM2QO
 frZ3i9OB6+jhlY8sRuv2ZE8kXHk1O8nvPVkwzbZX+EhDouPca94cdcaYw1lRWr60HiKB
 m7awvI5oavD3uHgZKesAHzZ3+qbEr+dUkfiPNm0Nc9ne+jQWsgdqiAyzkVdszsCLy02i
 xZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lObie5wmOrFGWUPDd50MBwpE2CzrN+xxdxN3KTpXyh4=;
 b=UnlmoEfhPhUg8Xad6Mc4V418HjrBnFvx6Loqj+cirUsxbRHpnW7PbiVxd//MO0w0Yc
 QHgF69tu55ZqHrJKf7y7YZ3H9RHghTr26U14405LeH7zVjTiIIVVWUnveuT5HMWVAk85
 D/ZfL8fpXLfJzkzyEaIppTFWQUCiv9rEKiT0MbtmfMjNLP4p4nB8AekBCOsm/NlsuTty
 yBnZ6q3cAfhn93XRg9zjR7nfa+NRrBfo8TLhBFuu9baqE6zQ6v1rZ+D7Lmxvxw52afgv
 KvyUfISTfhGeHxPifvTOxBVVwTA1XAw27d3SBlnW0dBrSd4Hu6rPMri82/gzTf0VQkVm
 LwtA==
X-Gm-Message-State: APjAAAVPiLttoT8lrL9McEFkKo6XtLHoPX0gwMqpwGS2PNEHzZdrveUp
 43gmkuqUPHWJ+J/YsvzIZm+mGPOIm7iJqGjllTzTSQ==
X-Google-Smtp-Source: APXvYqxeE2cD5N7S0n0NYGUiZQZ6VeS2P0/7JyraVaU1R2pFAAXa/27dlDNjPmjzU0taOXNnuXjXKBIV4mX4xQcg+Uc=
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr4674806ioh.40.1564677076045; 
 Thu, 01 Aug 2019 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
 <20190722163049.kyupys7alq6zzq6x@thinkpad>
In-Reply-To: <20190722163049.kyupys7alq6zzq6x@thinkpad>
From: Kun Yi <kunyi@google.com>
Date: Thu, 1 Aug 2019 09:30:49 -0700
Message-ID: <CAGMNF6UO0T7Dq4--QDXGkbWZ3CwKAhFSLxy5rKeMW-Af=V=o_A@mail.gmail.com>
Subject: Re: Integrate collectd with OpenBMC
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
Cc: Gabriel Matute <gmatute@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

hi Brad,

We are making some progress toward two things that we'd like to push upstream:
1. An C++ wrapper for RRD "-- librrdplus"
2. An IPMI OEM handler -- "rrd-ipmi-blobs"

Would you please help create these two repositories?

On Mon, Jul 22, 2019 at 9:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Jun 27, 2019 at 10:51:03PM -0700, Kun Yi wrote:
> >Hello there,
> >
> >In the context of reporting BMC performance metrics, my intern Gabriel
> >(cc'ed here) and I have started looking at integrating collectd as a
> >metrics collection tool on OpenBMC. We have got it running, which is
> >trivial, but the next question is how to report the data.
> >
> >We have thought about it and thinks implementing a D-Bus interface to be
> >the most flexible approach. At first, we could implement a snapshot
> >(instantaneos read) interface. It would then be fairly straightforward to
> >add them as Redfish/IPMI sensors.
>
> Just curious in what situations DBus was required?  In the design I
> thought you had applications going right to librrd - where did that fall
> down?

Originally we did envision a D-Bus based data pipeline, but after
researching we think a
file based approach is going to be as flexible and more efficient.
Currently we don't see
D-Bus as strictly needed in the collection path. It *might* be useful
to have a few tunable
knobs exposed through D-Bus, but again it can just be a build-time configuration
for now.

>
> >
> >There are two ways to do this:
> >1. Implement as a collectd "D-Bus" plugin [1]. Collectd supports writing
> >custom plugins which are C files calling the internal plugin APIs. Could
> >probably use sdbus to implement.
> >
> >+ could potentially be upstreamed to collectd
> >- the code probably will live in a downstream fork first, and if it doesn't
> >end up upstream, maintaining could become an issue since collectd plugin
> >API is not guaranteed stable
> >- C
> >
> >2. Implement as an interposer daemon that translates between one of the
> >formats that collectd supports (unix socket, plaintext, RRDTool..) to D-Bus
> >
> >+ project could be purely OpenBMC
> >+ can use sdbusplus
> >- another daemon
> >
> >Any advice on this? Currently we are leaning towards the first approach,
> >but do you agree the D-Bus plugin is general enough to be of interest to
> >the upstream collectd community?
> >
> >I can definitely reach out to the collectd group but just want to ask here
> >first :)
> >
> >[1] Collectd plugins:
> >https://collectd.org/wiki/index.php/Plugin_architecture
> >--
> >Regards,
> >Kun



-- 
Regards,
Kun
