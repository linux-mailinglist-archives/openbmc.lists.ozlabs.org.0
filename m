Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DDEC535
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 15:59:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474QLn4LMszF6rR
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 01:58:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c43;
 helo=mail-yw1-xc43.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r/RWr8b9"; 
 dkim-atps=neutral
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Py21gsbzF75F
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 01:40:57 +1100 (AEDT)
Received: by mail-yw1-xc43.google.com with SMTP id z144so1934746ywd.1
 for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2019 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=G/q2mebfEmcjg4M6KVJaCHVHnhawj200jaImtsdTy24=;
 b=r/RWr8b9vS0gnG92bjG4xe0i0QhtfyjjxnzCGpT4FeMEyEvsBwimoGgsuewbCkbV5m
 rbW2ioLZfWv6asQuuIglBd1e7g+dE95H+shnWCUws38FH/+yXYKl/rPmEFS8F8JM1RRA
 xZybwAaiuyNvzj04GSOOnFc/wZOrIG7iBbjI496eOPtpEr0iddNqYo0hYtTVyx1g1Crk
 HTjZF64t1/Yf4Sr2j7cdZFjVyDFhfp032jsFckEEQKWCjsSoCbwq9uJpaTc8BSpyQOrB
 xD7QWSIeum7/82UuFz0Jy6riZonqnS7x4btKB35D6FF37FnF+oaSkUwAiOhIloPHCs1E
 Y3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=G/q2mebfEmcjg4M6KVJaCHVHnhawj200jaImtsdTy24=;
 b=AV8nKwwGp18jTSef0sNxJnwTWbr+5Xo8FftGvl59KoImAiUarNr7gaw1mT3Zmj+4QA
 gPsK08MDqrSweZTdMoA8weLZSRVTw8NhFSu1M6r4dipHAfC9hPJ6VS5omXzfVtegKgO+
 6dfVG6vfO/zXuRtGpzpdhig7J5hItMDMbvhoylA4ojK4OTXpan/Pr5g6E5qLcS/VS2TX
 Fpc+6cJ8NQHSHjgHqgVk8yiBNGGX6qQ9Ct+vfQyIjOhQnJlWYcYOR/TEsXRJsBDoJvb4
 JZa3pdZMJQdnLm9WPAcEIRgwDc08jE6Z/7DeA4XQvgRIjQa9wJIhTPH5y3NeHAGIoAaR
 rV2g==
X-Gm-Message-State: APjAAAWXTXxpGPKjyo2Ekso0dkhnCtiLfP9EBvEsNLmJ61boglWrVnlC
 OX5BLUGPet3bgY0SWxVic8cvfjJsVp+mH1xKvf7wQQq0
X-Google-Smtp-Source: APXvYqxF5jv/vmX9Sl7MVNg9EhQlqI84zdx68F9N1+arwzySctyb0P3g9u8fF44Ncm7nTzEkt8boBaXHlowpNqBSJoY=
X-Received: by 2002:a81:1b03:: with SMTP id b3mr8563698ywb.39.1572619254523;
 Fri, 01 Nov 2019 07:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQThp=WRfdH+QHwmqP1ZqbgCKq81rS8Cp+0sYKQfNe4Sg@mail.gmail.com>
In-Reply-To: <CAMTupoQThp=WRfdH+QHwmqP1ZqbgCKq81rS8Cp+0sYKQfNe4Sg@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Fri, 1 Nov 2019 09:40:43 -0500
Message-ID: <CAMTupoSxchLJuFUjpmVu=7jS=M1H0OTTnWkUP3SNkvs8=R3uTA@mail.gmail.com>
Subject: Resend : Enable/disable access to BMC through interfaces for security
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I am resending this message to who has thoughts on which BMC
interfaces need to be disabled for security purposes and what the best
way to do that would be. I would love to collaborate with all parties
interested.

------- begin message:

Hello all,

As part of the GUI design team, I am starting to look at requirements
for enabling and disabling network interfaces for which the BMC can be
accessed. For example, IPMI, SSH, Redfish, HTTP, and USB, to name a
few.

I know there has been some conversation on the topic before (see email
linked below) and want to reach out to see who is interested in this
topic. And I would love to get your thoughts on the following topics.

Some questions we want to tackle are:
1. Which interfaces need to be enabled/disabled and what is their
priority? (See full list in the redfish documentation)
2. What should be the default for the selected above (enabled/disabled)?
3. Do we need a staged plan for it?
4. When can we expect backend availability?


Redfish documentation:
https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_4_0.json

Related email discussion (on staged plans to address IPMI access):
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018373.html



Regards,
Jandra Aranguren
