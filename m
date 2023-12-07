Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64B807FC0
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 05:38:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TaOmYGL/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm1jn0n4Sz3cT9
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 15:38:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TaOmYGL/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm1jB1hGkz301f
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 15:37:48 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66cso7514455e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 20:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701923865; x=1702528665; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNxk+Tn16UeZYgLYn+YBMEYht13cfPv8chlYxHLBT60=;
        b=TaOmYGL/1T84IZGdxWdmC4qAF01LxgbWYa4XDmcEEfPiPP0p4YKekzjKqvqpzlA51E
         oj1QRCEAvKUJFDOrJv2ev1+3y0FW6PqkfUi1Q4TNRWbjUa9JGPLk4cBLlAxrHWyMR/bz
         SqWQfwmCNQ2jYqoSMNl5QlA1G3jQuUyjoiQoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701923865; x=1702528665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNxk+Tn16UeZYgLYn+YBMEYht13cfPv8chlYxHLBT60=;
        b=nleKOOjNkNNH7AfCfQODpI4WX4YUIH+FOYFgCQUZOOXF5Q5993Dt9Cyp5aDXO5qR/q
         zbAYoZGXTwuohmyD5NgAXdSaCtMqb51yS20KUe7nsn+VqT/LgJ9++k+pQ0+BSs3x+Q4y
         yqOM4b0GoYLWlnNskomJT9OXgYtyegEBqQ3j0XlhdWjwA7c3MtLo6JguQowa8sLQsBvv
         fvV74EBtx0x8zT+W8DU7LEfVrzdr+hJpaTRFUgQrJFXzIdyWTzS9nMRs58maC7PVTRcn
         YfmKF/Rjd/Gc8NttcBAwyT8IaBgRu72MXPWaGNhj+ss/PopYYDuIB2EGGUI/zVN85clb
         Soag==
X-Gm-Message-State: AOJu0YyLyki4kRAamd1lK3EQAqKWCIzUPsTiQ4onSCdcfzqBMfDZhHw1
	farEjwZh4QG6Rm8TXhg9cTCDl3hciJOER88nvPE=
X-Google-Smtp-Source: AGHT+IGuLniy6SZCBkMqzTjd9LDLbyVzsbUWTyHPfHyZmOl9YrY295Ol3ZhLLHTH97xxsQ2ZW5fAjKSaBrxJ2PlmPgc=
X-Received: by 2002:a05:600c:3b9f:b0:40b:5e21:dd1a with SMTP id
 n31-20020a05600c3b9f00b0040b5e21dd1amr1198945wms.72.1701923864603; Wed, 06
 Dec 2023 20:37:44 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <ZXFHGagfYsg3eQm2@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZXFHGagfYsg3eQm2@heinlein.vulture-banana.ts.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Dec 2023 15:07:33 +1030
Message-ID: <CACPK8Xcqzp6trMmYFCcaojoEoGa4qR7EKU1cX4GKxVEihtVwOQ@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.6
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 7 Dec 2023 at 14:46, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Dec 06, 2023 at 05:29:59PM +1030, Joel Stanley wrote:
> > Hot on the heels of the last bump, here is the latest kernel base for
> > the aspeed machines.
> >
> >   https://gerrit.openbmc.org/c/openbmc/openbmc/+/67772
> >
> > If you're able to test, please comment on gerrit and give the change a +1.
>
> What is the tentative timeline for merging this?  I'd like to try it out
> on a few of our platforms but it'll probably be Friday before I get
> around to that.

Once we get a few +1s, in the absence of -1s, it can go in. I can hold
off if you want to test your platforms.

However, we don't need to hold up for too long. If people find bugs
then we can always add fixes on top.

Cheers,

Joel
