Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE4FD2BA
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 03:07:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DhZS3570zF8Dc
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 13:07:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mNCEH39N"; 
 dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DhYG49JjzF8B5
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 13:06:39 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id a7so7699251ild.6
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeu+KIKhxYDDFaj3GDyiRjzOZ+0wlwVMJKPvbg6wHjE=;
 b=mNCEH39NK6eUQxUVYJHBzvxGekSdOjJ/OHOJVEhMf+NPAwiutDR2ZH7TYpxTX6SZ+t
 Bp4Ah/fI92ZzUL5eaOxDDZnXkdJBLAZlp9Sg9td68n8YoKk1P+DNpkAoWWywY2/T+89i
 FVqqTKamgB2A6V7+v/CG6nwdG18rDgxIDZ3ZqrorHBbjoRnC1DH/AQadPOmzreftCg6h
 GjP5VLeIgv/cldu/m7s2whbsHywx7/PCYVo+TJOmXbwX531Ekr2iW0ZxuEPidPcEM1Si
 ZXKY7J9V17DIc6vREXdtZCcqHXMjSbuSJV4JLrV5Sc+yuCbFnA0bQhpcwLf2U4KAsFp5
 0YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeu+KIKhxYDDFaj3GDyiRjzOZ+0wlwVMJKPvbg6wHjE=;
 b=YmU0NEuICYLBHdPVL5w+3OUXeCSPmRTL9Ocy25hVsdS6SQbdGIeNVrrLpuBNQICAb7
 2jJx95MoaszHiB0aK6YK9tsXgIiGlOLxGfYsI1A8IjuPy54Hsi0+usLFyl2UJDOzy+UX
 d+cR9OHEfh/l0e6RlbZTRFeCTQEGwHco88BVEq/RQjUoX/2DWZKZzTx85cCRADbdy/jK
 lRd6+NcaCOLLGA6HhHvbXKtVvehUjXwFxDgg9PAf7mYjtzMyXrencWSAhkZLGRGd7+X1
 0TYbXCmTk1S7rkteU+IcAnP0rW6f9TXftjRkoHaK0D3dqWdLn2F/S2Ee32CUMmEVRdFD
 iIZA==
X-Gm-Message-State: APjAAAXd/74jToRSsiFoT8KG7EtbRjndpOjgiHgAsGeT5dXte1jSiamu
 qktph5tpxtGvwCnBf8lM8dLAvau0XZwiRemCttpJwbWh+ss=
X-Google-Smtp-Source: APXvYqxyK7rdj8K0izzcnKDbvHc+CTWMmB2hVPHroXJDCbI6HaMe+SHXUYvVqXgpYAZMmzFFZxdIC5Ng1JkF9gqORbs=
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr815181ioe.52.1573783592101;
 Thu, 14 Nov 2019 18:06:32 -0800 (PST)
MIME-Version: 1.0
References: <90BAE90B-F2BF-46A0-BCC0-88223079D196@fuzziesquirrel.com>
In-Reply-To: <90BAE90B-F2BF-46A0-BCC0-88223079D196@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 15 Nov 2019 10:06:23 +0800
Message-ID: <CAARXrtm_JjCZqRBsnFU+LuH-Xn=4Uj9Eikp7+XKcuvZ8NWGKsQ@mail.gmail.com>
Subject: Re: meta-ibm restructuring
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 1:51 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> the meta-witherspoon layer in meta-ibm supports a number of machine targets beyond witherspoon.  the meta-ibm layer itself is nearly empty.

Before the change, meta-ibm layer has below:

  bmcweb
  dbus
  dump
  interfaces
  logging
  packagegroups

I do not think it's confusing because it defines the necessary recipes
for ibm machines.

> This is confusing to say the least, so I am doing some restructuring in the meta-ibm layer such that everything will simply be in meta-ibm:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/27263
>
> Please let me know if you have any concerns.

The commit moves everything from meta-witherspoon to meta-ibm, which
makes a machine that inherits meta-ibm inherits everything from
meta-witherspoon.
Is that intended?
Ideally, the recipes (bbappends) in meta-witherspoon has
append_MACHINE so it will not impact other machines. But can we make
sure every single recipe has correct append_MACHINE?
