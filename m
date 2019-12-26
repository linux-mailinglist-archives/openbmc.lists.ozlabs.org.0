Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAC12AACF
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 08:37:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k1y82vzCzDqK9
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 18:37:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JsVUno6b"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k1xM6mLJzDqHr
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 18:36:52 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id 15so17980447lfr.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Dec 2019 23:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvYAv3TVs7xhGWtDlBs0TBX9W5o0BUjziEImEIoUxJE=;
 b=JsVUno6b2tbRRlpe8yLCWkfe+7r1oliK/frnzKwxsxtvynZIEUCgJqGwPhr1bDQjnP
 xwNMfUrQm1GKMB3s6HF9L9Unto1P7kkCHqtoP2zx1HJRZ9+MkSZ3ghcQqWGsRvaEp7mG
 OA9lfH+j5aQ5MT8hEurclsV18TX6Kg10J10lxmumR1oh77Wo3AEvKXSteATvDheUgTl/
 onZ/1BsHx007W5rz0vh6IS1nFC4sS9bFHL4hlGCC+allN9eaShPKccO9eXOgymhgv453
 r9Mcdt//vghI91FuGpYYygP5KB4zSHg48zzvywOf3BWw3rF8mU6OtsM9qQLod6ZzzQPC
 dGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvYAv3TVs7xhGWtDlBs0TBX9W5o0BUjziEImEIoUxJE=;
 b=VzH47gUdJ2uglDFfwFiL2oXTXDAPTKhIzDc5FeIW4kLwFzLq/MjwSwWCfZlGPdumyq
 Yct8q/eHzrA+bTBS0/ri+kKJb0RL31pTNVKTi19vfJ3IeMe3tSRfydz1KTl+8JPK9L7n
 X2gxI93kmw6AM9hwZjCtlhKezB4SI4QtztjoHSikD5UHaz3fEoH6OcC1KYvM93RI778i
 ev823mpBXuE59oBtrCtOBHOxqMNN+MUFPkFsiVphRRwPk7nDR5Gpu5+am35I0eu6SOzd
 au678xbvj7YV6G0DzC1SCUtmgBgZAHixHRG3b6JSFnq9DxI1nbIah/Z+WuVvzCpVXhI1
 OxHA==
X-Gm-Message-State: APjAAAUWA/HmCsZKJRG+BSsmL7odmvkP/W6VJH0M6Z0WcjTvHCxc7+Jh
 PGSPh4/HxGVj0/u6d6mEYgMl0A+HO7hCZno64Qo=
X-Google-Smtp-Source: APXvYqzmyIPdOw5mAnfD6ScRQ27KYbAGQ8OYbX3YFY7CIgCD7/ddbTHZz/GiS0n5sgUUm3zYm1C/4X7lAu74l1iEGJ8=
X-Received: by 2002:a05:6512:244:: with SMTP id
 b4mr24663970lfo.85.1577345808531; 
 Wed, 25 Dec 2019 23:36:48 -0800 (PST)
MIME-Version: 1.0
References: <13ed3524.9c60.16f4110e044.Coremail.zhang_cy1989@163.com>
In-Reply-To: <13ed3524.9c60.16f4110e044.Coremail.zhang_cy1989@163.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 26 Dec 2019 15:36:37 +0800
Message-ID: <CAARXrtkGz7oDdPHFY5R0kGTpn_c948Q1jXmwSN_hNkbJMnAKyw@mail.gmail.com>
Subject: Re: How to change the soft link in target.requires or target.wants
 directory
To: zhang_cy1989 <zhang_cy1989@163.com>
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

On Thu, Dec 26, 2019 at 3:18 PM zhang_cy1989 <zhang_cy1989@163.com> wrote:
>
> Dear All
>    The target.requires or target.wants contains some soft link.
>    Ex:
>         /lib/systemd/system/obmc-host-startmin@0.target.requires
>                    lrwxrwxrwx    1 root     root            31 Nov 29  2019 obmc-chassis-poweron@0.target -> ../obmc-chassis-poweron@.target
>                    lrwxrwxrwx    1 root     root            25 Nov 28 09:51 op-occ-enable@0.service -> ../op-occ-enable@.service
>                    lrwxrwxrwx    1 root     root            22 Nov 28 09:57 start_host@0.service -> ../start_host@.service
>
>     Now, I want to add or delete soft link:op-occ-enable@0.service
>     I can use "rm -rf ./op-occ-enable@0.service" to achieve the goal.
>     But,I'm not exactly sure this is formal operation. And I'm afraid this will be side effect.
>
>     Are there other tools or formal methods to do this?

These links are expected to be managed by systemd.
You could disable or mask the services by `systemctl [disable|mask]
<service>`. If you need them later, just enable or unmask them.
