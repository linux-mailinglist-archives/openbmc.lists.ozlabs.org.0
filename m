Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC512E7C88
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 22:06:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5kNK2KPMzDqKT
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 08:06:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PuXIGvLm; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5kMV5nHFzDqCW
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 08:05:25 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id d37so15857399ybi.4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 13:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lE2e241zvg9hV7lFFJYVJ5f7DTHPB5YJui0vBaVlWYg=;
 b=PuXIGvLmu5NjE+4JBEAzwRtzIK2Vh9xGRK+Yb6pLlQJyq0KqhsCN1K3n0q7H6tiIOf
 Kzyt+3PJ+Dj6IQIQhUV2EfPuAQguk4A8qXcbIzOc258X1xMcLsPIPau7ihRK5c17d1m/
 TeC158WAXZdtUpJuz6LE8oSOX40TAwdK6JX5OD+l1mEIYdjthZgbKkudLpXSiV8Z5v5A
 omO4s0Tyy/O4qhjCpzYWbVpN7/moxUn2dFnfE4Cfk3QsU/ZeuwE9dXyJaUw5X0krklnk
 W4mq40u8ojIDsZguLW5qmlD5PtKt0nkGuLG1oe54Jfuju1GBOM/GFyqo+Jq4O7CHwMLP
 JPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lE2e241zvg9hV7lFFJYVJ5f7DTHPB5YJui0vBaVlWYg=;
 b=Rs9FIwfwMJNbEl7pgYEFpb25p5XqaBZvJigzA3rua9AKgjyCyWd/P5cqmHd23a4NZL
 Y8ykK3hCsfFxR5DZyvgxcYXdYYCS3f+iJuZNg1YbSy/PLojBakHp9bJ71J3SOBdP5uYh
 r/7T9o7+0PQtB990iqOMJUet23dgbFsjrHlnVgeDhmbfUyg24T2VQytk+Lj8JegdexKV
 p1Z0lKUB/ozOV98dFL79g6Tum99UOysBQrRRPQGbOZymEPtkeBftaGOnPfMmPDNmfd+i
 YXoc3AVQTaKh0WwevBwGWCBLEC4q0W0FjsTgDGMiVxLpjrmMZ6ZUQVGMDuG+KBewJPzh
 Sp4w==
X-Gm-Message-State: AOAM533Ip4WXHzkOPKf0pNFWCYXrw6JvuiBJUpiXup9812AFw96eYyiI
 mbxRvvTeFdKfuY/ns581+FCPHZsjoZFMlDIiNPDsfA==
X-Google-Smtp-Source: ABdhPJzJmdnJklx2ubKjbHWFsvZx28qG9pLJ7ZN1vuuR0DTFBVHxTnwv3TGAQviBSd1RnP66XzeP6vlJGqsV6s4vW5k=
X-Received: by 2002:a5b:a8d:: with SMTP id h13mr13353500ybq.170.1609362323315; 
 Wed, 30 Dec 2020 13:05:23 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
 <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
 <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAJTGxZEL5Ae4VcTkVzZrxoSV75Wni=e0W-dGtB5qNc5OrV5Org@mail.gmail.com>
In-Reply-To: <CAJTGxZEL5Ae4VcTkVzZrxoSV75Wni=e0W-dGtB5qNc5OrV5Org@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 30 Dec 2020 13:05:12 -0800
Message-ID: <CACWQX83czjSfgJHkryO1w_rwiN5g7M6+kMo8-n_HCJgQD+hEvg@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>,
 Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 12:49 PM Vijay Khemka
<vijaykhemkalinux@gmail.com> wrote:
>
> Yes I understand that critical values for cpus are received from CPUs and not a constant values.  But just for this specific sensor we should not add a new complex feature in a virtual sensor.

+1.  This seems like a use case we've already considered and handle.
