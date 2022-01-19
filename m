Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE449334F
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 04:07:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdrCx5CKZz30KR
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 14:07:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dCh2d1L+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dCh2d1L+; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdrCY1wjZz2xtL
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 14:07:03 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id t7so1541313qvj.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jan 2022 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yeYAEDHS6vA1Ae/k/34htmVP3QfuHUc1zWVxkC1Xvmk=;
 b=dCh2d1L+83WtvPXn3XNfGgPHPxvFauLjdCFp/ch9DNYrTPAT+z7FdaV1wtTwHXmq0f
 wy+BGoW5rNo0sHv9Hj642Uo5u6p1ytPOKZ1URo0EGVMN7F16EZvhBZ/OcT9Ue2KZVj6J
 rv+C0i0TCiBa0iEyCmDLUyYsaVGfF4kqp3/kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yeYAEDHS6vA1Ae/k/34htmVP3QfuHUc1zWVxkC1Xvmk=;
 b=TnU6AcI4ERdH4C84a2EXn2RecCFLPtlQgB493ff8NZjKGztWFjv+cGHjipSPyJNScm
 rCRrfiOn30NVlsl3nu5l/xnx1+N9OEedQBesuWJPRPtDUfgBU9Kiyzg/ZpAwhVAhzv9a
 d16xiu7JcyBWkZJ1ic08C3F0aCmB91NJOPG3fCI5rmBPvcdSKChcjDWbt1VM4p1Ua4gR
 KJ0kA6JNZp9EzNcYQeHv7Z2IfxLLHWwLWVX1SbdFcwjhlN8DBs6hUae8WgKeF1eal7Ej
 31oCMc536GEG60h4ynEpHY0BrKQolZ7QNsQTwjb5k0VwcPBPDbnSTfdhPOt4Iy+wg6FA
 lBJw==
X-Gm-Message-State: AOAM531wcQazQraRrG1HJHpRMfI6d5XjWQwljWO1tYmcqOM6J+DfvMik
 /0IRYibJO+rmAH9GqMnqnT+yCZB54M+eo0matrg=
X-Google-Smtp-Source: ABdhPJwsNaCTHyeElnHn0pewfvJdYEROQdqkbMZaikHgf5TdTD+53yrugxEmun11EUX0IZIsjdvkpeVuAVdIRoiSwoo=
X-Received: by 2002:a05:6214:29cf:: with SMTP id
 gh15mr17362795qvb.21.1642561619070; 
 Tue, 18 Jan 2022 19:06:59 -0800 (PST)
MIME-Version: 1.0
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
 <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
 <Yeb7iXvJSFvWa/NP@heinlein>
In-Reply-To: <Yeb7iXvJSFvWa/NP@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jan 2022 03:06:46 +0000
Message-ID: <CACPK8Xd+TgWx8bv810LBeTO9KYOUR3CsipamEBou+RHYteZz6w@mail.gmail.com>
Subject: Re: Procedure for the send review on u-boot patch
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jan 2022 at 17:40, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Jan 17, 2022 at 06:54:48AM +0000, Joel Stanley wrote:
> > On Fri, 14 Jan 2022 at 18:45, Patrick Williams <patrick@stwcx.xyz> wrote:
> > > On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
> > > > I strongly recommend using the newer v2019.04 based branch for any new
> > > > system you're bringing up.
>
> I was under the mistaken assumption that the aspeed-sdk was not hosted and
> maintained by us.  In u-boot-common-aspeed-sdk_2019.04.inc I see:
>
> HOMEPAGE = "https://github.com/AspeedTech-BMC/u-boot"
>
> ... but ...
>
> SRC_URI = "git://git@github.com/openbmc/u-boot.git;nobranch=1;protocol=https"
>
> Should we align these to avoid any confusion?  I assume we should adjust the
> HOMEPAGE to point at our repository?

The upstream for our branch is that homepage URL. Ideally we would put
all of our patches into the SDK (I often send Aspeed pull requests to
do this), and un-fork the repository.

If you found the homepage URL confusing we could add a note to
explain, and change it. I'll leave it to you.
