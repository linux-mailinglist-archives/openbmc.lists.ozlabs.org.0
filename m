Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35149080A
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 13:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcr941xSKz30K4
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 23:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N3cGi53w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=N3cGi53w; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcr8c6SZCz2xXX
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 23:01:04 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id w7so16022754ioj.5
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 04:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9D1f3Ik1P+igrYa0bbRgKP7Np8w9AXCGSLP+E38kw2I=;
 b=N3cGi53wpcJzFa4puRh5vDzz5hJoikqqdXMd0GO7cwWCNNGMdSy4B7TXnUD0vYR+E0
 tRwBHaE0bQNNTuFsWjkNmzhxPFBRw6hlhXQNhFFMESw3kY07sOGOMHZ67GtT3z6cPzIK
 +oa5oWIdkcd6erpMq+EqqDPZAamuQnlDCc390=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9D1f3Ik1P+igrYa0bbRgKP7Np8w9AXCGSLP+E38kw2I=;
 b=GC9VIQcnrF6/sezDy9SjwrhLhKQ4bd/43vtGfFTjzvVz0VDIODAN8kQRXL5HQlRExZ
 U/Z2Hmyg1HpbO7S8ozSC6gTu/J6v+YmTbvheV6ygXrX/C2mbg89tTUQbVhFitP7w7RVa
 KLAt54nXSrGvunzszIdsDKyro8eNRZ+NBth6GFmrim+sN1sYxqReo4tUBedPYqu+QvdW
 UGm7U25gKCfjO/dXf9yd3ZMGUI0SxsjIwg7ShdQpZznYpkumpFkKL+PyqnMEz+RcDD8j
 a3S5ZqmBgxddkUru3MteAW3csYGLPux0DbssceAiAbQR6asCVGEBw1rEXwS0VJp7ZAIG
 Sb6w==
X-Gm-Message-State: AOAM533OOvjS7Dhkyw+Pqmvde4f8ugx0GPaYJl2P1CYQu4nSjDCF/LBk
 hNAI4VcJBWwG7uYNc2/mqRxPBlHGsP7HbOjNRD0=
X-Google-Smtp-Source: ABdhPJwm1Mrk9kwJ0p8qrzs1En8gdeZCoFcljF6cDe8pisGKxVZSq0E2Rxrgs5sEGV8MNeBGu+rSn3UAwHjpXRJz0aA=
X-Received: by 2002:a05:6638:1241:: with SMTP id
 o1mr1368345jas.137.1642420859528; 
 Mon, 17 Jan 2022 04:00:59 -0800 (PST)
MIME-Version: 1.0
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
 <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
In-Reply-To: <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jan 2022 12:00:46 +0000
Message-ID: <CACPK8Xdxzxasoo8onu1QbPXFRYr8+saHAg32bZdpp9d7KH2CJQ@mail.gmail.com>
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

On Mon, 17 Jan 2022 at 06:54, Joel Stanley <joel@jms.id.au> wrote:

> > I think everyone doing AST2400/AST2500 work has been copying from existing
> > systems and still pointing to the v2016.07 branch that we have working in the
> > tree.
>
> Where possible I review for this. If there's a way for gerrit to tell
> me when a new machine is added I'd enforce it more often.
>
> I've mentioned on the list before that I'd welcome a change that flips
> the default to the new tree. That would require setting
> PREFERRED_PROVIDER_u-boot for all existing aspeed 2400/2500 machines
> that don't have it set, and then changing meta-aspeed.

I've given this a go:

https://gerrit.openbmc-project.xyz/q/topic:aspeed-u-boot-default

I did some boot tests of yosemitev2 and romulus in qemu and all looked fine.

Next step would be to convert the EVB to the new u-boot, and perhaps
some of the prominent machines that people use to base their new
systems, on so they start on the right track.
