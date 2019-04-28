Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60149B4C6
	for <lists+openbmc@lfdr.de>; Sun, 28 Apr 2019 04:43:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sBtS5zXZzDqd9
	for <lists+openbmc@lfdr.de>; Sun, 28 Apr 2019 12:43:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::133; helo=mail-it1-x133.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uv3EzoD2"; 
 dkim-atps=neutral
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sBsV69pZzDqc8
 for <openbmc@lists.ozlabs.org>; Sun, 28 Apr 2019 12:42:38 +1000 (AEST)
Received: by mail-it1-x133.google.com with SMTP id z4so11668097itc.3
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxKmazyPxgoeXfDFIB3efo7G+mf+edVnDmv34XtgdWM=;
 b=Uv3EzoD2Dtfyuv1rPGIzOvNGv+DY/nKLXGOUPDpAer74DWkbfLeDMqUuf6wVZuz0H8
 RK6fuYYzTLD9TGCT1dg+a7E1Zu1bl4JlyEFoSQolxVyYseMaF4DIQ7UoQkEmEaD/Z9ZT
 swLopEJVJd1cpSvUDE8X9FYmsjH7GAzrTHxjxiDPReAHOaTH6yHG47bWnz+jiuPDnfy0
 zxevoCskxnlzfKnQV7SNyReK/fo06DGY2PLOtL9huOIt5YM2J6wXfk6TaJf6RRO0+2I4
 q29RbA236pWMWFUwKIlVlrUrRRFkbkAZ4LcbnkZ4XQPyzibTcC0f7Wt1Rzq+AMKIbH6U
 Tavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxKmazyPxgoeXfDFIB3efo7G+mf+edVnDmv34XtgdWM=;
 b=CidAjH0oR34t7aTykYJ94/QdrnJmo+v6cbxGKTO52l+QnbovlReK3UMnxTvIdMDbJ+
 N5b8JkYCo4+vkDuDciyOrhi5f/9oLf9RFOujgQKXNhe65OIRWwuz+U9CKu4Zrlavpnfa
 o7z565AC9eJ4Yl3ud3R3l2OtV2YBDe4qQ5i6gGXAqLsrnGjPLwtDnc0CnFMdYztQDzTe
 bb1o1uvzNQhaH5EDuyWRhOJJkaKQF3CCtTgBWaWPt+RqF21RPAmGXlahpVSBPX/QfHH4
 NMUahx/bcD+6NlMUmVP8ZeNqoc5m/cZPYqGFhCRzpoe7kxLK7HPpIquNwBxgu3S4S0wB
 HXYg==
X-Gm-Message-State: APjAAAVcxLWmeENiJTwx1TiCm9Z5z1hxijIMsynFtakw1qrjxgTLAvbJ
 Y/p3qXvwyXh/wLfv/koqNXGQW4AthBU5IKmz3R0=
X-Google-Smtp-Source: APXvYqzmyCQWpAlEgVAyNKNk2y48t2yHxHk5R7xlXm7QfRLAN+w0Z6Jr3HKAEe5LHA426B2vs07ZRiO2t6983OOVAIw=
X-Received: by 2002:a05:660c:148:: with SMTP id
 r8mr912382itk.125.1556419355122; 
 Sat, 27 Apr 2019 19:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
 <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
In-Reply-To: <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Sun, 28 Apr 2019 10:42:23 +0800
Message-ID: <CAARXrtkSfziat2Eev0gqbHW2mih25FHXQ4JjXbV=BkCQh-0URA@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I recommend installing your distro's arm cross toolchain if that's possible. It's a much less invasive solution than sourcing the sdk's environment script.

But it would be convenient for bitbake's kernel build to treat warnings as
errors, so that CI will catch such issues.
