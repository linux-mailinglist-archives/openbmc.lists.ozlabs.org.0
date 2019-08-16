Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12B903E8
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 16:22:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4695B66kgczDrNJ
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 00:22:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JxnvuMis"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4695625CbpzDrfb
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 00:18:50 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id u17so3022199pgi.6
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzVM+S0RsxGThJUI9CZpn6L9yPCMDBeV9CUb22EXHPI=;
 b=JxnvuMislrYsBGpmcMxg1xVl0nsuYApDK8WAmrRwYZI97v5Gxh1079xCyojZ6eyYh/
 wg5BPbbJWoyQ/Ht13bQV52ZmeHax7B0CIj94bWahafcCfgWqfUxm6LslZIzolWPbYJm3
 xz+hXQvl7pMUXd+ypCYsollevFMpyuF+B+1gWKWAxGJ6QuBEBeEbOl+PTBgGLhsOmfs4
 DnfSjozS20a3QAN+YtUEPKMGMGT6UvNuNNFmOsUW4cEbNXhsOO1xIfWSE1DeZRW/VuXw
 8btoLlSnUU/2t7emMkEN3PaMeVPS1Afojm9eF08uxp24xYB65Dq4+ssdWIBDZ1NTAm2E
 9qpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzVM+S0RsxGThJUI9CZpn6L9yPCMDBeV9CUb22EXHPI=;
 b=YED4atQ5796QJj7wBrAuAlf+DlZ9WX2OkgI5dH3kqaG2bvQ+1uL27snHXXCLK8WixS
 r1HbBwSQ2PknHjs0XC2vtQML0vx4tKgJN/dJzVmKNN6EujTeCP2L4awkw91V6DLJAlJH
 9Ba6SyJjBC7qwMNd97+Z+fFBr9K9KftdV4Wemlg5bLWsBMjUtpwvVyeUnw25uTixFM6G
 pUXW+J3wVnzfjQ/2RtVWYUSX5GzHuejrf/QTAsuvT94oyu3igR9sFUX7oBgR9zvvdUAW
 s7bsi4tlHQ+X86dwg0bgot6fvR2LxN05d01WVzF+RMUrflYsgMmn4gcOLIryBaS5QP7s
 KYcg==
X-Gm-Message-State: APjAAAVssu34m8vg7bZmPRQa1DZFThEZfWnr5eCj0ZGYOnfaBlrLcKzf
 OYU2tCZgfEB6+Wab0W18tMqE+cFK5iGYnYhIzcLNhQ==
X-Google-Smtp-Source: APXvYqwYtnYh7XMeYovjlHkg8qqzBFaYZ7nsCvWeYACD/Fop0Qc1jYmk5uyBKu+8pXnGthLy1z9a75/rkyxHTBGuaH4=
X-Received: by 2002:a65:6288:: with SMTP id f8mr7876968pgv.292.1565965127477; 
 Fri, 16 Aug 2019 07:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
In-Reply-To: <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 16 Aug 2019 07:18:35 -0700
Message-ID: <CAO=notzP-6i-YaS-LyB8u3w3qm7v4Vqqhxcnz1XN5W3sgZD-FA@mail.gmail.com>
Subject: Re: where to store application json
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 6:33 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
>
>
> On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
> >
> > On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
> >> As we start moving more and more of our applications to using runtime parsed
> >> json files, it seems like a good time to come up with a standard location to put
> >> the json files. I think a requirement is they be in a writeable filesystem
> >> (although that may bring security concerns) so that you can edit and restart
> >> services that use them on the fly for bringup and debug.
> >>
> >> /etc seems like the right spot. But if so, where in /etc
>
> While convenient to the developer for testing, to me it doesn't sound
> like good practice to put read
> only, critical files into a writeable spot?  How could we even trust
> data that comes back to us from
> the field when a user that can get into their BMC can just change
> these?  Or accidentally
> delete a file?
>
>
>
> >> ?
> >>
> >> Adriana pointed me to the FSH guidelines[1] in a review which has the following:
> >> "It is recommended that files be stored in subdirectories of /etc rather than
> >> directly in /etc.".
> >>
> >> /etc/opt ?
> >> /etc/opt/phosphor/ ?
> >> /etc/opt/phosphor/<repository name>/ ?
> > Where did the "/opt/" bit come from? Please lets drop that.
> >
> > IMO we should be using /etc/<application name>. Be mindful that one repository
> > can produce multiple applications, but what application sits in which repository
> > is a code organisation problem and not something that we should tie into system
> > configuration.
> >
> > Andrew

A lot of stuff is in /usr/share -- but I think /etc is a reasonable place too.

>
