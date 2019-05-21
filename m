Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C025313
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 16:55:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457f1x5cYMzDqMb
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 00:55:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MKbR9pYP"; 
 dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457f1Q3Bv5zDqJl
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 00:54:32 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id w8so18993927wrl.6
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8i3NgDbesPppScUMrq7t9lCoGnHi+G9cfkdnPV8GYSc=;
 b=MKbR9pYPNPwqesxfsdqWWIvJgINttb+ieAT6QeThe8xjkiS8dJEjLEBSVxYIb5YBzl
 tfyTpI79XyzjSqeA+IYPFdt4VKXsBv5rG1rUAf3wL2w0EUXNT1nKXSDobO0+7fP5IyiK
 FI1Ny0mnXAuCUJKtpbjl8U+AbsZbKGMI6BQmCgCC8lq9nVi2lcwGMeJwmCE0sL6C2BlR
 VJPwIJVRWXyvDH5dX3ht3N3+TtO0vK31lBDzEipxO03Jv87AanGbZi6wO3BmsHf9dxb+
 Wd7Bd9YxVnA+yMx6xSFOPR+YUBs+FndXJibtxHA2ySq0qS1exDVK33HezPVAca8PXMaX
 OJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8i3NgDbesPppScUMrq7t9lCoGnHi+G9cfkdnPV8GYSc=;
 b=bk0+kKeJdyojsT6uRhv5JqccEjQ5oZNtJiHcaggMn8CeANMFDpfLDLauf6dhXOtRi+
 KZ8tpVSr26pxk78vbgRtUNMaRuURlZbhqb8zUSjBdt8NsVfN5PAwDHIJ6US5sjaf6su9
 suyKKZXUC0Fr91uzrVmwsnoTnSoNe8lWr1RipI7LLHK62cVvHo9HsknCpViTHkAngrA6
 uM9y5x877VaiAJwB4+WvZARqPwV3dpG6t1LwLpdX9+kQ8CnDam4nQr96muMVQJjf62nf
 pASKZsdTAMxMmlILRG+j7/hbgeHc0nbxZ6ZrgkByVfat+gktiL+z9TXM2DL4v78EiUJt
 GRGA==
X-Gm-Message-State: APjAAAXxVTOOst+/zJUd/xB5YKvvBhDHL1HJuJN8EGkaed2FxiS2fUDr
 ULzmMWO6JmPQCP1AW7vHsT18Rk0mWyl/2AQHY0M=
X-Google-Smtp-Source: APXvYqwt5qixW2w/uINW1Q3hLnxYfV1Zs60/l2j9TspPOmN3fkr6jmW0vcw6C1Zm3q1f2y13Z9Tz382buNFV7NGzMKE=
X-Received: by 2002:adf:9bd8:: with SMTP id e24mr46919639wrc.1.1558450467968; 
 Tue, 21 May 2019 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
 <19be2af8-7b88-5183-44c1-d27fddec29c3@intel.com>
 <CAOUmYFSSzi3Mo7YUh6-rvdJtNj1Bp2BG6+hV8AzMS3SHt9xWRw@mail.gmail.com>
 <CAG9c7cDTTbdC_huucwkEKf5mnaSJoaAUCUrQ3-1YdtVRVcpUSg@mail.gmail.com>
In-Reply-To: <CAG9c7cDTTbdC_huucwkEKf5mnaSJoaAUCUrQ3-1YdtVRVcpUSg@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Tue, 21 May 2019 09:54:17 -0500
Message-ID: <CAOUmYFT4VuCuej6b4mV7NnPQ+Dxy_TuxbZN8ZtiY9cX3J2Oj1w@mail.gmail.com>
Subject: Re: [phosphor-webui] Enable style-src 'unsafe-inline'
To: Henbin Chang <henbinchang@gmail.com>
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
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> We will look for other solution.
There is a ticket for creating sorting of the tables. Currently, the
markup used to create that UI isn't using an HTML <table> element. It
is using a series of <div> elements. I'd like to see this changed at
some point as well. I do think we should be creating our own solution
and not relying on an external library. Most often these libraries
attempt to solve all problems for all people resulting in extraneous
code and the need to try and resolve issues such as accessibility and
styling.
