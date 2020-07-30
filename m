Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60319232B0D
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 06:50:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHHzd1ghczDqtv
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 14:50:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=e9JdF+XW; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHHyY425SzDqnr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 14:49:57 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 133so13768313ybu.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RHrUEwJq5xoAAGHkshUgNU97dvbrHtNkoUp8tXBLeiQ=;
 b=e9JdF+XW5UBYFXotzFL0e7qW36BDr/Hh4wNdbnRIyAkw6Zl+G3m8ITU5D+F9lvQXsr
 WQpSlB66GBI1d8Co0LgZE2oP4GuYIAAfoeiVMqlUFJjnq3T9xJ5AZwbTXMg9gvR4Mb6+
 9a1KgAR8QFrT2oXOqZKtHNXHyhPe2d885adCRBR1E2nkdwUXYwdunRrNM74M8Fo6VI1y
 hOzrenGQ7JGktiKvc1Jy1K7bnR8Z9ok5mdSw1xFzwehXzu0k15ueW/vWeBq4NX/jlFzQ
 NpgYhkio4IKcfAd/iH9tt556r5aovA4NXjprga+LX2j57WafrUm99HO6sozRdX0lmPQx
 r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RHrUEwJq5xoAAGHkshUgNU97dvbrHtNkoUp8tXBLeiQ=;
 b=mumuxBjOML8Ar2mvKHt6EiqM00SkdEdYCue2FStA0pPEaSqv7WCQsvc6xyFw065tDP
 wqpQYbR+GnOo1woDxq5ksoBUnP8wP9hmZAq0+Drf+8xkhdY8fZCAko+gWb1sFAwDKCuh
 cMQynOY3tKkvgGhTcvTY/HQR/THjga9Efk5hLSgUoZevI2YKwmNaz5/kJBOhie3xlBMi
 PPCl80gCNmmcyTBIj6Vc7z8sYaeKxgdkqsLXiqAhTgY7xauTk1bxVXRbjlb6p0vTK3vY
 BmKHVfbksRjaI32/KvLYuwhXyiEWcCdOYcxs8uvW4cOhJ6MFkvQDJbmv2R4HQrrJICPZ
 95HA==
X-Gm-Message-State: AOAM533G01zOQzITTwbtyExFmvp98EtA8cZqD951UvHApMIwrTxmZhQ1
 VcA9o2O3lH0PQ614CXtVLBjfDINgE9eR66EzSJ/Bjw==
X-Google-Smtp-Source: ABdhPJzyzCzAk2OmuopuAboFe8TmgE2cusD+Kj90yhbLZWH1LRlDPDXgS8+aaNhzDCgoCWwhuwSjuC9c3rg2Ua7VzQg=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr1755197ybq.170.1596084593851; 
 Wed, 29 Jul 2020 21:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 29 Jul 2020 21:49:43 -0700
Message-ID: <CACWQX82K5mx94PtBQDp1nA-arnxkUxn65kAgNOcb4_3NMyO=Qw@mail.gmail.com>
Subject: Re: OpenBMC : FRU Inventory management
To: Vasant Patil <vasantp@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 29, 2020 at 8:14 PM Vasant Patil <vasantp@nvidia.com> wrote:
>
>
> We are enabling OpenBMC on x86 system. We would like to know the recommen=
dation on FRU inventory management and corresponding pointers.
>
> There seems to be multiple options available
>
> described in  =E2=80=9CAdding new system to OpenBMC=E2=80=9D with  Yaml f=
iles (meta-romulus/recipes-phosphor/ipmi)
> Entity manager  with JSON schema
>
> We are looking to enable below inventory (Both FRU and non-FRU):
>
> CPU
> DIMM
> M.2
> U.2
> Motherboard FRU EEPROM
> Chassis FRU EEPROM
> Add-on PCI cards
> FANs
> PSU
> Etc.
>
>

I'm chuckling to myself a little bit here;  When we originally
designed entity manager, "GPU that comes in a green box" was
definitely one of the first example entity config files that we wrote
up to make sure the configs were expressive enough.  In short,
welcome!  Glad to have you here.

If the above is your requirements list, presumably you need runtime
configurability for the things plugged into the slots and ports.
Given that constraint, entity manager (+ dbus-sensors and
phosphor-pid-control) is probably the way to go, and is the way most
newer platforms seem to be trending.  Based on your requirements, I'm
going to guess you're building a platform that looks a lot like a Wolf
Pass.  I'd probably start with those config files, as it has all of
the features you list above, as well as backplanes, which you didn't
explicitly list, and should give you a good starting point to begin
your development.
