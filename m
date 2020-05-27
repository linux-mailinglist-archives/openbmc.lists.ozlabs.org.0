Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660251E3DAB
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 11:35:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X5L43gdvzDqTN
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 19:35:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=zJ83PyiA; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X5K65kVDzDqRd
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 19:35:05 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 82so14072051lfh.2
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hgtz648xj6qNaLC0IlQrhMW1UtJqcgwoX5mrIcwQ4U=;
 b=zJ83PyiAE9s0OKO4EsXa38oFbd2Zu3Kj+t1OQ2NyVxebYmUpp6VM4NaHOebOn+rpgM
 L46rs4TKGvaADglc/GhFTnlp8AKHU06r9Q+ZVrayKq0Ap+2EuP/JSesf9JKQ1B1cRKOe
 awr9sIamuODq6whXnF2beUKaauYRe/OS85VJHo4YZzIUSXoudKCXYlADLprYOFijIaX4
 FmYBAiXQFTONriZyrazfZ4gzJP7Ugc59yq5/pO8zZISK96rgfUJ8VyNnkrshbE/KA6Rz
 thLB/wvpWc0PKVJXUaAsebPRpRtoHUuHc2KDeiN/dBb79L6+E6HxemoSrNV962Ff+IAX
 jMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hgtz648xj6qNaLC0IlQrhMW1UtJqcgwoX5mrIcwQ4U=;
 b=F2RbSu2lz1ndE36+ASw+mgh3pH2wZZFFX3E7p4Qi0akGfcZmB80Ac+WntoC5xdZTVZ
 iByz3GNA73/XmtjkTFXg1NM+ngJfBbY9KS4ylpLopG5TVj76ylmAczVaIxAQve6o0oT/
 243G1/Dp8Zsf0Dsy8mvJU3utCPf5hrkYSJePabbeYV1mjzEFlzJ0hz8+pUzi/jC0wFyY
 dfhdTF2mgf05f7GcRGGPVDAP2lHsDcsuW9MypO/ObPqqhSB35bLLYSJKJrczgQs0sDrU
 AUnylyQy4fkk0AnzbuPMMOsv1xrdsP5/RT0VGnSeHunG+R4klPKUua1esnPQ5WxV/GZb
 /DKQ==
X-Gm-Message-State: AOAM5330vytCUysLT2Z5nb/jyOSd0gDKBOsJb2040Qd78gsUEO3FXhX9
 Bv5XDUx6/xr7q17HcMEYfVjGPIpfybCzsJRs1Qx2xg==
X-Google-Smtp-Source: ABdhPJxqvDbcZbfdfSE7MQAWKfQblUjF5thFtnFD+GuMz1MY+cr8+Zhv3hg1Tpuofx727ufms1IFORP9O4K5cYW2/iE=
X-Received: by 2002:a19:c751:: with SMTP id x78mr2709164lff.82.1590572099350; 
 Wed, 27 May 2020 02:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
In-Reply-To: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 27 May 2020 17:34:48 +0800
Message-ID: <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
Subject: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
To: "Wang, Kuiying" <kuiying.wang@intel.com>
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

On Wed, May 27, 2020 at 4:41 PM Wang, Kuiying <kuiying.wang@intel.com> wrot=
e:
>
> Hi Lei,
>
> What=E2=80=99s your final purpose for this?
>

The USB ECM device is an ethernet between BMC and Host, so that they
could have a real local ethernet between them.

On this internal ethernet, it is possible to do internal
communication, e.g. host calls Redfish API to BMC without any
outside-network.

--=20
BRs,
Lei YU
