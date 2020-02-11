Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF40159C99
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 23:53:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HJ2m0HvkzDqML
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 09:53:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z1EBuzBz; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HJ280CgczDqLJ
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 09:52:31 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id q15so180834qke.9
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 14:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V69PsD4TOZMSFU6SJPS2kquQecAeQKTZ6TWb2EI+VD4=;
 b=Z1EBuzBz8JZYL33y2FGmvZ4MC0WP6QxwZgP5c5Gi2a7iOGTZvmGQwzVYUm0aufOuUS
 2w+zxMCceLun1Me1MFhRJqsNPxtix7fNnsr0oOwD+54wqKVRRpgOlsWcMr8BlMJJAaDL
 xW887it9LN/anfT27K5DaKq+drUd2jLSF+ixk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V69PsD4TOZMSFU6SJPS2kquQecAeQKTZ6TWb2EI+VD4=;
 b=Jjcxgs4y//b4QHbSwPqQS4NM8dUHEJmtMpafs0nBTn+Su/adQu2Of11xvIbR/VZxYS
 URVKz+VcQnSG9cOhAzHK+gUF+f/OmOWEOJdYRWKB65fUr4SSNOVD+FVZHJoVSZ+b9OBX
 R0osg+H0HZZadZQ3jLmy9R+GKeyUULmM2+Ym+NDj7btn5OO7vhGcYpW5x8DUEjQ0T2oR
 OKShBXMFVFMXn268zvjbEpaE6Jcylu9vJ07rRKN/exSd6wGzvsJzU+8NTWkzv2+KddbQ
 fVP3XBk/sS05xjLjdR4tDOSx97HHAbHtVF3kbY0qxSXqMut+1BDI3YTzVSZWIh3skfsl
 yGIg==
X-Gm-Message-State: APjAAAX00vK1/suRDGusa81msfsqY8SNu4vuJmJiJwzgEnJK/Yjgz45O
 I/dOgb8zSTDkQYlpKhIM7g8JPwdTsEYz3dU/pOVOsQ==
X-Google-Smtp-Source: APXvYqzrOHThYAbMAAiUdCFdHJWEo3rogv00yB+2r8u+VqMRv5H8UgaTwtIuTArWAxwjzNm/C0lkHS+zcqfwX9rCmpk=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr8216504qka.208.1581461547324; 
 Tue, 11 Feb 2020 14:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20200211224345.3624-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200211224345.3624-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Feb 2020 22:52:14 +0000
Message-ID: <CACPK8Xdb+gMZgEo-kCOBnjQtEMiPWoc5QJ7fF5W7ZeAOWzP6Og@mail.gmail.com>
Subject: Re: [PATCH dev-5.4] peci: fix license identifier
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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

On Tue, 11 Feb 2020 at 22:41, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit fixes license identifier to prevent an error while
> doing 'make headers_install' that says:
> error: include/uapi/linux/peci-ioctl.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
>
> Reported-by: Tao Ren <rentao.bupt@gmail.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Thakns for the patch.

How's the upstream submission of PECI going?

> ---
>  include/uapi/linux/peci-ioctl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/peci-ioctl.h b/include/uapi/linux/peci-ioctl.h
> index 843930f9fedd..c74b3cde52e8 100644
> --- a/include/uapi/linux/peci-ioctl.h
> +++ b/include/uapi/linux/peci-ioctl.h
> @@ -1,5 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/* Copyright (c) 2018-2019 Intel Corporation */
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* Copyright (c) 2018-2020 Intel Corporation */
>
>  #ifndef __PECI_IOCTL_H
>  #define __PECI_IOCTL_H
> --
> 2.17.1
>
