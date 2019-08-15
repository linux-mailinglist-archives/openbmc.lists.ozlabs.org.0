Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B34A98EC1C
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 14:58:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468RMW2cHhzDr6Q
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 22:58:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pYOh6cWS"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468RJP0sNDzDr4R
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 22:55:32 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id l12so1800584oil.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5S4p475ezAkW1DYNvepjWvLKEBrDqNktZKNo0+PnXCU=;
 b=pYOh6cWSm0QThAedGSkmHFbF7Cn6IZSfaAu9/VjNeM0NGshVAKtEhCU+6l0E4Mq3Qz
 JrXpVavLDeudw8jjiD4Vx3s6n2M+UnIEJbh/tcE3OqzlCGLbrmKNBb/TK4KrO6xb0be7
 6b4MBNgNsd8XdQ36tv/wkXv7ZK7NoEE3Uwt7lrH1irMXWTSHexeCqxf7apg5kOIsWUqn
 E2UMPiJvs27/GJz4Ag/9IGO8sz+pq1fX3iosGR6hyDp1AkfnKey2zAvNocW4ZyeTQL+b
 erNNuIzUyy3d4uBCzV1McYsrzZO4qFnSCUw5AdjDBiXkm5SnCvSMj5pz33EEMarGqvD9
 K7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5S4p475ezAkW1DYNvepjWvLKEBrDqNktZKNo0+PnXCU=;
 b=q3INoYtMmbSEetPUwSuq3XbNg/a22xyMDfkYpfwJpvX1hwpmx3WE2Es6++oggeSMKg
 nsYq87A50Wf7v1Psl3F8sxxXcUwvsRv8WTpZ35NOUrOmwp9FxGvzsTSdnMuzNZ5Oxj8i
 MG4wBp+OiLr4IBK7yWpGi0BfCuNa8wqjzbYoVueeZw1/G4ytAx9kszVtdZJhhhL8MIMz
 QA6B45MWjk0ZJr/8wnhuv0ENoNIHet3jlW5mG34Ki3hDmJRHALd8LakDpNhMrLzk7Muk
 9FYHcNAzdJ1SAVwzIhyJPW6QQwgCtcwMjqZjOrAzzcj+yoJ5JfyYJ/udPCgTMOJQK7bP
 BXHw==
X-Gm-Message-State: APjAAAV03Szf0HhwMIBj/sIwjO6R49P58tcjsASmkHQJpkdq+OF/Q1Fv
 u0/9ILRLsk/Y3hcd54CQZm0JHfEs4kwTmEbe8Ew=
X-Google-Smtp-Source: APXvYqwfWCfbEwDm7ggxy0dM9TE7DphMXKdfEUusMkk3BpVHGEWPvVyDWuyl+nwNux+q7lNhUbu/ix0BJC3G7J/Yfh8=
X-Received: by 2002:aca:c713:: with SMTP id x19mr1509483oif.158.1565873728646; 
 Thu, 15 Aug 2019 05:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
In-Reply-To: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 15 Aug 2019 07:55:12 -0500
Message-ID: <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
Subject: Re: Policy on Tools Posting
To: Wilfred Smith <wilfredsmith@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 7:58 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
>
> 1. Are there guidelines/procedures specific to submitting command line tools and utilities? I have heard that there may be a repository and/or path dedicated to CLI tools.

The community has definitely tended to limit wrapper tools within
OpenBMC. We had a discussion a while back that we're open to some but
the API's to them really need to be thought out and reviewed because
command line tools become customer API's (i.e. people start writing
scripts on top of these tools that then become key to the
manufacturing process or some other critical area).

Anything that goes into OpenBMC needs to support OpenBMC interfaces.
For example, I'm not familiar with fruid-util's D-bus service
xyz.openbmc_project.FruDevice. A "busctl tree
xyz.openbmc_project.Inventory.Manager | cat" shows the inventory items
on OpenBMC.

One issue we have within OpenBMC is there may be different
implementations of the D-bus API's for a given area. For example,
Inventory has different implementations so I'm not sure which repo
would best fit your tool. That type of issue leads me to wonder if we
should put the tools with the interface definitions in
openbmc/phosphor-dbus-interfaces? Or maybe a separate phosphor-tools
repo would be more logical for these.

Either way, I think command line tools should each get their own
mini-design doc
(https://github.com/openbmc/docs/blob/master/designs/design-template.md)
with requirements and interfaces clearly defined for review by the
community. If we can find a generic tool that multiple people find
useful, we can then find a place to put it. Otherwise, you could host
your tools outside of openbmc/ github and just pull them into recipes
from within your meta-facebook layer.

> Thanks in advance,
>
> Wilfred
