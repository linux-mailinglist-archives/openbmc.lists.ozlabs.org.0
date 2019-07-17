Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA86BE5C
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 16:35:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pfvJ6mH3zDqP4
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 00:35:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="M8/tmPVA"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pftT3yJ7zDqP1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 00:34:56 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id m9so12021732pls.8
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IyvjrRlAxRPnYZQaznPIPb4PY/a5zSgffH9cl1GK10g=;
 b=M8/tmPVAOOr8QZWWmWU5+uCEJFGP/kBFqdXgd6s1HAtwrJwyBPqP5WSv9/1Cu7Kdj7
 Qn7SOdmx90eKGRvIbYAsGroc80/Z6isln5QxU6HngEV0Xt7AKdUWfGMjnMM1wtAmc6eS
 ebGWtsEKZsPJG96CpsJfH2AKX/Ptd6UGJX4TJ1uPuby8s75acMY/UdLS5uglZg6dJczR
 tH7yX2kprZY86wf+plhfK3QNAFLHw4DxRi5H5MRK4rnxiQb7WVE1OPxZxjORsb8eBUtU
 UE6VhZS2/SGGfcW9Fr1dP23RYTH8QMBRnBTmouwhZalsQFWdnP0XQCEsuAabm/znRxXT
 oVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IyvjrRlAxRPnYZQaznPIPb4PY/a5zSgffH9cl1GK10g=;
 b=WGJhn7UyX4t2M79WoOp9SkH5171avbIgvTiL8TaamOYwDm8TnA9T2A3I0gU2uofjH0
 kCYYo2u7n6AaOtGgOy5AJuEhzQLNAp6kHgtwbd8KBhl5TUEKHPWOc0mysnt6n9BP7Ohm
 c+pjmjCNMqX7vnO/XbpHTpUf5SZrlL2YwRY4Yuwqpxv/u66X7TJ2X4WxV3ywik9glYp1
 bGz1amfQrPO6C9hxe53o2nPY3LGjczY9Tb7wkBvdSj6UI7Z98INcM3OzvQep3RLOFOJJ
 8TKhlI8Zgs2p03Y75y003EeXEJFQzKbZRCCSz9JQJtFAwPLtpsgFLqzWbB6TgBZj6gnJ
 0tnQ==
X-Gm-Message-State: APjAAAWYO+BevBdEhbMBBef7jvKZn5RBqYEq8WXr7aCpk7l8sIYz13pE
 3CS9gaMEjpm21sAXyxvmu4MZmc+RWtANzX8Xnyrtgw==
X-Google-Smtp-Source: APXvYqzHUQPIVAyue3xS7Fpn3tZTI3hOLR7zPAY2hk1LnuQmBKCNscoxI3fGVVxKwlieGR7QpEA2vR15yTO9zHpbn7E=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr43170415plp.47.1563374092554; 
 Wed, 17 Jul 2019 07:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <06d5b8e1fac3401b9f8c0dd2bbdd56fb@lenovo.com>
In-Reply-To: <06d5b8e1fac3401b9f8c0dd2bbdd56fb@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 17 Jul 2019 07:34:41 -0700
Message-ID: <CAO=notwoCLdbM8qy9Lgvydw+upHPimWOmZZUTV54xhs419p65A@mail.gmail.com>
Subject: Re: How can I do to remove some default package?
To: Andrew MS1 Peng <pengms1@lenovo.com>
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

On Wed, Jul 17, 2019 at 4:21 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Team,
>
>
>
> How can I do to remove some default packages such as bmcweb and obmc-ikvm?
>
> I try to use RDEPENDS_${PN}_remove to remove packages but the executable binary and service still exist in rootfs.
>
> Could someone give me advice?

For bmcweb, I looked into how it was added to remove it.
I created a recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
file which appends the recipe that adds bmcweb.

# Disable for all machine types.
RDEPENDS_${PN}-extras_remove = " bmcweb"

That removed it from where it was added.  One must be careful with
this type of change because _remove is (unless I"m mistaken) always
the last action.

In this case above, I didn't specify a machine override because this
change is in one of our "global" Google layers and strips it for all
our machines.  Later this change will likely be tailored via an
image_feature or something along those lines and we'll only disable on
platforms not using it, so keep in mind you may want more control of
this inclusion/exclusion.

>
>
>
> Thanks,
>
> Andrew
