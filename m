Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F422C3EE179
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpXYf6SBnz2yX8
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:52:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sgqeN3Nw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sgqeN3Nw; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpXYG6pfgz2yLs
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 10:52:01 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id x5so7298639qtq.13
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 17:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nHdPyB80OiqHWXwavS4AItxTjsGaD8gid75pQ+AMZ2k=;
 b=sgqeN3NwLh2pjj5JXHDOh1riBAfJiGSTLbujBYXTtJM8s2uu/u2i9x9eNMEr+d92RQ
 ouLwbaI6xzt5bfbKqKPDDrtTqW4eA82s3kGU9TjtKjgjQA1Tj9i1F69fIuMgoF1qbCmv
 Ec3nwqquJ4MrA8OB7jb5tfQrdYH4El/pPVLu8UhlxwqfH2GWVuKvH/3lQM5Yc1QVzcZb
 stVWnOFnOfDR/bcnmFUyKekZVRPa7w2olrVTJ0aV0K+NDwYiWZVTdadbLEeRhirqqW4/
 jARVYUc37pJqI15+U2bUIG7s4zzkPLpxUOXReNRn+B7qkV6fqOwtCRkOnNBRQBwQRbpC
 IaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHdPyB80OiqHWXwavS4AItxTjsGaD8gid75pQ+AMZ2k=;
 b=pVYmwlY6aklqEGwPBNwU/zMrFnEn4dQFay4ZUEeqrStyQOhzfmPmhsTTmwy0gsmXaN
 4frC9NIq9JXQsgkwE0YWTTOHQg9SpdZPw+LKoTLwwkiol1gvsfrUtB9o82R2bM7DCY1N
 tiC82YhbyMirI7d9CJ9qN/hMTp+xb0t9N3xCibkg3jWqye5sUGt+6NP35GTE6ThL1n7Q
 mFBBDXZU4fSShyU3fgb3O4QCfyTREwm+fmHY/GDLu6GL5bXJHm5q0sj/Sc16zIg9LCiI
 CR7SKewc3OqUcuwhN5nOsRH0Ir/BDI6YOdHLGejhP7FU82KxaV0o0Hg91TbsVlQ8ygXS
 +Hqg==
X-Gm-Message-State: AOAM532lR5fm4uS0mpZGUkwBCu07KZpdX2QuLnbvgMZNXKWcrjBLILH3
 AUjwP6GgLN8/wGrsIcC0idJGMgHSvDiylBPNNDNdXytj
X-Google-Smtp-Source: ABdhPJzU/iQzQ4OUPkYn6uB6CzqUAz1EhD+YOQpPMVjCND211zplUV5J+WBaJir8QPLFwE2VcJHZvu/wkP0PlxuKe7w=
X-Received: by 2002:a05:622a:3d0:: with SMTP id
 k16mr710830qtx.331.1629161518478; 
 Mon, 16 Aug 2021 17:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7AOMpqhpa_Upn5toNeSDzZK_TADbc4ikqjbZBjmrMoBSA@mail.gmail.com>
 <YRp1VMAJ6TcDzTz5@heinlein>
In-Reply-To: <YRp1VMAJ6TcDzTz5@heinlein>
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 17 Aug 2021 08:51:47 +0800
Message-ID: <CANFuQ7CaVw-w2LUGO+fDr3qbunAJgNa9-pcSwRU3GXG52ONxBw@mail.gmail.com>
Subject: Re: Request new repo for Audit function
To: Patrick Williams <patrick@stwcx.xyz>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 16, 2021 at 10:25 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Aug 13, 2021 at 08:51:32AM +0800, George Liu wrote:
> > Hi Brad:
> >
> > We have a requirement to implement an Audit function, I found that
> > there is a design doc[1], but there is no code to implement it.
> >
> > Could you create a new repo for Audit function?
> > eg: phosphor-audit
> >
> > [1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
> >
> > thx - George Liu
>
> George,
>
> Are you planning to implement the design as-is?  It has been quite a while since
> this design was proposed and it feels to me like there may be some overlap with
> the Redfish logging proposal[1].
>
> With how old this design doc is, I think we should have an update / re-review
> of it.  If you are willing to take on this development effort, could you replace
> yourself as the "Primary Assignee" and make any necessary updates?
>
> 1. https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
>

Thanks Patrick.
Yeah, I will update this design and re-review it.

>
> --
> Patrick Williams
