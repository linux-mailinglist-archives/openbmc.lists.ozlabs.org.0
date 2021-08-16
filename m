Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B43EDDEE
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 21:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpPTf3tpWz2yXM
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 05:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=GwbcZ8Hb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GwbcZ8Hb; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpPT94TjKz2yWN
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 05:32:59 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id a7so28890491ljq.11
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/s3WHfeRzAGK+lRFx2ucyGlYSF4fDWDdRGWNyzH+vqE=;
 b=GwbcZ8HbY8eDmQdjNJX39qiKdgpFWr0XiJPxMBWFWjB/dtpSqeaKQCzQNqg84ZZQST
 N0XHOrbVDA/1Au6YOntaQH+b6UGPiB7sxM3QeGmSmsbAV0QDFlknHqxEaeCof2jHLzZS
 SKQ8yZbg602LYRoERiw6+fDplRj6OUp5zZKTdKewyHPxaATXD8dtxTOnhiwASmlJkoBz
 y4m0hfMbQJKekVA9DpYnumxCQbVzr9FpvsUONnQrVZseXjddyAnH8CIdudVHtxMo51Es
 7UpKu8t0XOSjKf9ThFpGkYIHplYeVvDZ3pABORxE+aeWzqrE2RJKKf5R6zxC4DebwNkO
 aHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/s3WHfeRzAGK+lRFx2ucyGlYSF4fDWDdRGWNyzH+vqE=;
 b=dXPF0UP94ZRw5ctbnmfI2PMIRBRSDe5rhRfLtWvNnjmPIb9iLejcP/jaojMtXw8kIt
 pUdOA58jFcIqV9At4sNCZxb/EZWqAnhNym0QPfj6f6YMn3fTi5Mor32gzq/KoPeb+aSo
 qy9TdI76VRt8qbOERv/ryKXFv36sz7Zf11Cww6VmeDBoXeLb8yk3cXKs2OaBD406SSel
 gAbiF90QF8GZTgIgA7ft+t3VFvlivxa9teu6xB5H8miA9dOxN0X3hOLEvp0RSMlLwF+K
 droAHs8rJOiO6TN4FlQTpIDNO2W0HwvPHYY5wyX9GtLB2L6TlX7zBSgO+drmRLAMJxP0
 q4jQ==
X-Gm-Message-State: AOAM532teSeuMVsOZXwVGw9DA0mxCVg64i2yNnSWNfvyra2vO5N4bpSO
 3LcNAaLQBXpUkdUqpDe9hmzx8NRftOtPLvXjTQvxVg==
X-Google-Smtp-Source: ABdhPJw6AvFhlj6WkDrycEjVy1K5/tfK0rwRhfe1PQgP4KLb/24sD6R47/JZvSIVxJo6TBFK7dlV4Kza1zmYFT+HjIE=
X-Received: by 2002:a2e:a4db:: with SMTP id p27mr180183ljm.161.1629142369594; 
 Mon, 16 Aug 2021 12:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7TbcveKrAFSODfKKJ_q1yaPEZgvn06mBO2tXe7h=Xr6jZHLw@mail.gmail.com>
 <CAA7TbcsaM_nFeA1q=Eq6zsW1gH_73HXSCmtsc=3O0hi2s8QGfA@mail.gmail.com>
 <YRq0fULpBC1hJwhw@heinlein>
In-Reply-To: <YRq0fULpBC1hJwhw@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 16 Aug 2021 12:32:38 -0700
Message-ID: <CACWQX82LHoOPPMPzYwVmcT45hr=U3jb=cN0FQXVn4YhGStHcig@mail.gmail.com>
Subject: Re: Creating Hard Shutdown interfaces/alarm for NIC Sensor
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jayashree D <jayashree-d@hcl.com>,
 Amithash Prasad <amithash@fb.com>,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 16, 2021 at 11:54 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Aug 16, 2021 at 09:27:58PM +0530, Kumar Thangavel wrote:
> >         Gentle Reminder.  Any suggestions/idea on this.
>
> Hi Kumar,
>
> Can you frame your original email with a question?
>
> I'm not versed in the details here enough to know what you're underlying
> concern is.  When I read the email I see mostly a list of "facts".
>
> I suspect others are similarly not responding because they don't know what you
> want to know or where your doubts are.

I wasn't responding because there's been several discussions on almost
this exact use case, as well as patchsets to add the new types and
interfaces.  To reiterate Patricks comment, I was hoping you'd search
for them and either jump into those discussions where the work is
being done, or propose some more pointed questions once you got more
versed on what already exists along those lines.

>
> --
> Patrick Williams
