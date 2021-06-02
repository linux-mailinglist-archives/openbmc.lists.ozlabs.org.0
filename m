Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B6398E8E
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 17:27:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwCZ94Q5Pz2yjc
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 01:27:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=uXDVV/Cm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uXDVV/Cm; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwCYw4MbPz2xZ9
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 01:26:58 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id q5so2749706wrm.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UjpwoJ44AY/CxpWuOEB6bGMuxCxcgmCELHTCmdou98Q=;
 b=uXDVV/CmGXFijlJQVm/vpZfFbuyQkOHXw9tzPx1Xo9SE7+vouQ5wbF+HTxmna/9N/n
 DxruNk6eeWwcVCZrkLwX04S7og0sFlMdxrBEHne1Zk1380RLQVdaA5u6V5eS0a0OZ6d6
 ECF5Tdoexj7q6z/PK+impo4ZIsZ1NjfXKfszOuYhwW66molGq6RHaEKVLBio4vnCYzZV
 Z2CfXr+HYBOFRJJmQr/xQ3RDWvnz/6+/WdyUz54xjUOjyRzdVo/wqSStyBOdFmEld62+
 NIZie/bpCaoW0OGvwBSbHJB0rJhvjiFsDLGfDcR3brjhDiF+Yt/A9mWYggGgkf2OjgVG
 uAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UjpwoJ44AY/CxpWuOEB6bGMuxCxcgmCELHTCmdou98Q=;
 b=AoBBl1/mhiyozs4eBSlYIN7zyesfvAOyREI7ZZItAW+jFpk/6PWQVZcmsS1IDxcl2X
 25owITEam1S1P1sqbtCiMuLPNiVjyIlyYXdSNCzEoj0MPqXrDSZNAUhFp7mOhgzMEBRO
 VHGh9Ua8KLS9kpGyax50GEaIzO2FFX7tYW5nyY+QG4efheDeJQ1tcsjoWpcx7g6kIGtM
 iu6OASMRtJDTJsBxX6NATjjco7Qd1vKVaoRkMqaQozDZ3pFDUnEu2p+hvutPL7iZdmkI
 pd0rZyMQ6bV6vd8oSf5YnOJs21RBjkWFA1W+BctXWV7+frgNuQcHViAxuIYcQRQbzcwr
 Qe6g==
X-Gm-Message-State: AOAM532VC9TjRmGPnrBEwNOpJVEdK8/ls19yXmBFKbymAZqx0swo71Pm
 or3qInhDXd3LR9pl4j0FG6dd5yciYgEiTJBHsoZOn8VmhVM=
X-Google-Smtp-Source: ABdhPJxNO9bhdO+vn7FwUYMtgQ9mKJtp3H5xqrQld4b8+S6JtkUHfLxpty7sF2AaDk9Li6+yLgl6zFthIcK0a812vNA=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr34149066wri.366.1622647613509; 
 Wed, 02 Jun 2021 08:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
In-Reply-To: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 08:26:42 -0700
Message-ID: <CAH2-KxD_WvQtHVAXg6etVx1hW++QMrM9B-0qvepeUetO=_WEgQ@mail.gmail.com>
Subject: Re: FruDevice/Entity Manager vs hwmon
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
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

On Sat, May 29, 2021 at 12:42 PM Mahesh Kurapati
<mahesh.kurapati@keysight.com> wrote:
>
> Hello,
>
>
>
> I want to define temperature sensors, fans and PSUs for our new platform.=
  Going through the documentation and sources,  I understand that there are=
 two approaches.  One is to define them with the same i2c path as mentioned=
 in the device tree as part of the hwmon configuration, and the other appro=
ach is to define a json file with appropriate probe in the entity-manager/c=
onfigurations folder so that the FruDevice and Entity Manager apps detect t=
he devices as per the probe and create the matching dbus objects, while the=
 dbus-sensors do the instrumentation.  With entity manager approach I under=
stand that the i2c devices are created/probed when they are detected.  My q=
uestions is we don=E2=80=99t need the device defined in the device tree fil=
e if I go by this approach?

Correct, although you can still include them if you like.
Entity-manager relies on the new_device sysfs interface to create
devices as they're found.  In the past we've used runtime-generated
device tree overlays to accomplish the same thing (something I'd like
to see us get back to, but that's a different story).

> I understand that this helps the dynamic detection of the FRU.  Also we h=
ave LM73, and other temp sensor TMP431c that is not defined in the FruDevic=
e record map.

What record map are you referring to?  So far as I'm aware, those
devices would exist in hwmontempsensor, not fru device.  TMP73 and
TMP431c could be added if they have linux driver implementations.

>  Next question is do I need to add support for the LM73 tmp75MP431C and o=
ther one in the FruDevice so that it gets created properly? Can I use any e=
xisting strings/mapping for these sensors?

I'm not following.  What "mappings" are you referring to?

>  This is not needed if I define the entries in the device tree, and integ=
rate with hwmon I have everything needed.  I see that hwmon and FruDevice/E=
ntity Manager/dbus-sensors provide similar functionality.  Can I have both =
of these services running at the same time on the BMC?

Hypothetically you can, but it's a bit messy, and I would recommend against=
 it.

> Will it cause any conflicts?  Please help me understand.
>
>
>
> Thank you,
>
> Mahesh
