Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5A92077
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 11:34:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bpf23RZBzDqx1
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:34:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YdC/NSNa"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BpZY0MvlzDqgF
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 19:31:00 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id z4so1153831qtc.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 02:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFfcd2aWnD63uHxrGGrBMx20FuJCpjkBSuAwl0BDHEA=;
 b=YdC/NSNaLxX9MHpFGBgW6CU7EZ1XTRHLmAXFhRSy5ehgbthqvmQcm39HaAi5OGQIHb
 0eNSjYbbqlfjSDyujt1P0JDhw5rMV0WiECJiU3e+T6uleOoDaWmni9BMy+03LoVqVVsj
 Ghzy557/dBTOuqxVM7ewVAsTXoDhI/4lBqwIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFfcd2aWnD63uHxrGGrBMx20FuJCpjkBSuAwl0BDHEA=;
 b=X3r0NHpxUJ84bCySrhqTK9fGBZv6IwLKInxddpl83GTs0OSRr5p0cvORAaj5a0NqZ6
 ohTwxPa8wUxT6tutbrqUmFYACZLXXWxv3O2uHdPNhzqDkM9KMViRpRb0kzHX48zvCKiC
 mp2uHHl9+Pokp5RU90LwMGfS8W45HwlKIi5ZIfLJBARSs7OW1d1xRFTL2NM1ns/Z4L2X
 bhiMdJHmmmb4T9+SA3ZSB5jWvsdYkuY1LFZtgdd/KQhW1cASTI9o9FbJuGZonW6iGLrD
 FeZX37i6hQaFoYboHaoCiz9bDEE9HcSnkXxeu9J9UT0Nf+YBhugGt0+nr6ZkMwQPhSPG
 nyaw==
X-Gm-Message-State: APjAAAVd+mKnnyI1FtsGIj9fvrnlENjfHDqPCDY1TcPc/UrkPL/KbqSa
 W6qE7RitTk/kro6xH94jyVe36tB4zZBfa0fctjE=
X-Google-Smtp-Source: APXvYqwdbyD050l1JQMNhqORypwCwlewcXrshUh6xNe/3T/3iFa5hXDqHmKkUkqt20f7MbKR1wov3rIhLLbsktfmLg8=
X-Received: by 2002:aed:3e6f:: with SMTP id m44mr20030489qtf.220.1566207056483; 
 Mon, 19 Aug 2019 02:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190819091509.29276-1-wangzqbj@inspur.com>
In-Reply-To: <20190819091509.29276-1-wangzqbj@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2019 09:30:44 +0000
Message-ID: <CACPK8XfAAU+x8d+=7ALDAUSynLG=8KUWD3zDZqaHRnh5pajDKQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
To: John Wang <wangzqbj@inspur.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 duanzhijia01@inspur.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 19 Aug 2019 at 09:15, John Wang <wangzqbj@inspur.com> wrote:
>
> Add the driver to monitor Inspur Power System power supplies
> with hwmon over pmbus.
>
> This driver adds sysfs attributes for additional power supply data,
> including vendor, model, part_number, serial number,
> firmware revision, hardware revision, and psu mode(active/standby).
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
