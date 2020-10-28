Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAD29D798
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 23:27:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM39h1KRGzDqXY
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 09:27:52 +1100 (AEDT)
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
 header.s=20150623 header.b=C8cS6fRA; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM3864shdzDqXQ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 09:26:26 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id i186so491483ybc.11
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sqEDOzEipPx0TEXYp4MmS1GESXmW59KOipB+bi/xSc0=;
 b=C8cS6fRA4zk9AMro5Woz/9qDqt4QNqOKCRXobWJiCwWcGYvZWHNeOoStK6MdsL4uUC
 zrOekrvL1AlquuF6bKSAY3Lzw8vsZMWEsSDDl3lVQEPsu/XcKOK+hvQcydkpYJ5G8P9g
 ptJfDoq8d3xyyCMetL+liSxX1wZnn0QQtJrqe+qXMm/Yie2XgvNHhwtuj7VIA9DBns/L
 uuPtoh2KEI7vghZGPpVobIE7oQVmnW/FhNOMVP5GihFNR+/ioevopBoY1Y8g2CmhcmpL
 MuuQTrX+fKwTsiDRloEDxJNuMJCynuhBr/Xkov2qESempH2pDFYma71YqX0O3D/d2N97
 nzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sqEDOzEipPx0TEXYp4MmS1GESXmW59KOipB+bi/xSc0=;
 b=eXlJNvxq70NmCX3BnTiTiO3TVmopeOSqigeDbSvPx5QaEXkUu3ZqyszmbEL17uPpin
 rmDaxghRlxOD5WQgPpHUDIS55TfHV5vtH4N1/vwbtisLHQEt3dUGkvYm3790UmR2Ld6Q
 +8kSzVynqZT/pSDtCd1V7aBytcHrbl11LodkKB77Mbl1FyEV64ytP+QehPAYHg3nlDs6
 /XgQNnmTyl+1fodL3csSiQIIFsSAuQKeE2fgqgK1ABHgbl9o78GBsZk7na71SaatCMCx
 AXhEHt7rVUfIgVRfIbPrPMu5I2p8u4yg7kmyq0fkEqjBkv5+WzgJAbjZmCUTxnGHZKsR
 ufyw==
X-Gm-Message-State: AOAM5334d6Tl4k/Q9WKpR0aUsT+qfV3AAaWv71f/RJ7pOaXRIe06ukTR
 UCszPFLDcOv1TPs8v1FlnTs3TkFh0HUKTftldEokgw==
X-Google-Smtp-Source: ABdhPJzxqdTDwc9xgZGwAFS8G3SXbGnOyYbSNJ9KsZxCKnpfJCH640hRrioDyt+muhlAojmRxMGhv1y1EaiJlx1l3xU=
X-Received: by 2002:a25:aaa3:: with SMTP id t32mr1660697ybi.209.1603923980341; 
 Wed, 28 Oct 2020 15:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <4D8141F3-33DC-48F5-99BA-9099044E6A60@fb.com>
In-Reply-To: <4D8141F3-33DC-48F5-99BA-9099044E6A60@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 28 Oct 2020 15:26:09 -0700
Message-ID: <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
Subject: Re: New fru bus interfaces
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 2:43 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
>
> I am seeing now new interfaces added to dbus for FRU devices which has no=
 fru device. I am using EM/FruDevice application and it scans dynamically a=
ll i2c busses for Fru devices. And it used to list only devices with Fru da=
ta only to dbus but current image adds all i2c bus scanned as dbus interfac=
es. Please see below
>
>
>
> root@tiogapass:~# busctl tree xyz.openbmc_project.FruDevice
>
> =E2=94=94=E2=94=80/xyz
>
>   =E2=94=94=E2=94=80/xyz/openbmc_project
>
>     =E2=94=94=E2=94=80/xyz/openbmc_project/FruDevice
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/0_80
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/0_81
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/2_109
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/2_112
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/2_16
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/2_22
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_104
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_108
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_113
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_36
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_68
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/3_81
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/4_112
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/4_22
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/6_33
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/6_80
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/7_69
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/9_39
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/9_84
>
>       =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/Ava_M_2_SSD_Adapte=
r
>
>       =E2=94=94=E2=94=80/xyz/openbmc_project/FruDevice/Tioga_Pass_Single_=
Side

Is that related to this commit?

https://github.com/openbmc/entity-manager/commit/d7b6659944c3527622d4545265=
09a0a8697ada0f

>
>
>
> In above tree there are only last 2 interface represent real Fru device, =
rest others have no Fru data. I am not sure why this was added.
>
>
>
> Please help me understand this feature if anything new added to the appli=
cation.
>
>
>
> Regards
>
> -Vijay
