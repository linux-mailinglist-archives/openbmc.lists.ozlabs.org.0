Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F39429D24
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 07:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT4953Jykz2yXM
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 16:34:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3L9m5Pmv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=3L9m5Pmv; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT48j0d49z2xtR
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 16:33:54 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so7762420otr.7
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pvdlwr/Bnhmzuuy8enlPvpb7CdsZkEalPtDwBvfLRck=;
 b=3L9m5PmvgC2kQ93ITl9udd7OuEeobWrCQ/5UYiFc1ginudDt002qpx5/FFXdGbijz8
 CbTlPttc0sjFxHcJ0+LsW9oCKk4/Gj2MAhUNiEGorw5YttQ4vSxSR4X4N+eAmY1wZ/su
 9+ElAmcXM50qV38lT9Ufpr1pFymX9IAZ6Qvf0qgZzST3YePWtlCVPawv7KdqZb7PK7y2
 YDNTgzE8Py0xE3pVFuC3oFR/IVbWPPBp58VuuY1FRQjwynb0+vnYxQ9wtWnccyhnGxVv
 tsXoTxNv2r88ogjkfBaeV41zjMMF3rpdFaTnjowf2svau9lVR/82uaVp5NZHbPKQEhTB
 XVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pvdlwr/Bnhmzuuy8enlPvpb7CdsZkEalPtDwBvfLRck=;
 b=4f8MMrmX74C9pm8EHsJzxCdhjEXhEM6qVJiI76ExdG7N8fbCUKJeR+CHJN8PmlXPVA
 cekA8LzqZcCgFEDI81u/JzSq6LNtN7eQ+ASzaNAeL+EDJqAXokI8gUCyZfWQAfFUOgcL
 mU5U5EGGwNGabKYU5XsDieD6qXlVw+I1XdhmGk8P4vQvxKzaYvD0Ycr8x6ieV7rMfWw3
 EtlHemDXHmoXh7e5L3MvCS7Cnnkr6clM/p9ND0+PnCbNmP0kdesfC2HFN8WxAEsGy8oE
 NWOPSA7JitruhPNeIV2AqZ94Md5MKBPwwC8L5RjLNvqjGKfb1PffgpeVZvwZqwEEimtv
 uFGA==
X-Gm-Message-State: AOAM532LqsdYazbqnblD3ty7qxbNLCpdPhy6WP8u1PPA0TvLaJBo4naG
 p6FRsDf/G3jpDAgOwlvYkpu/l8MCvMQMOaSoDNzfvQ==
X-Google-Smtp-Source: ABdhPJywWwPd7spEmvvOw2BBNDfYfh2jCvFwg4IiuBhRVOrzaJOZyGbO3tbiKwSnN3Dkf14wzfCQWyipu3DIDrErEUw=
X-Received: by 2002:a05:6830:1af0:: with SMTP id
 c16mr11753524otd.16.1634016832685; 
 Mon, 11 Oct 2021 22:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
In-Reply-To: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 12 Oct 2021 13:33:42 +0800
Message-ID: <CAGm54UF4nADhYJPWjgr-ie3z2vGzW6aBvdsyQpJ4dsddgA3FLQ@mail.gmail.com>
Subject: Re: [External] Changing the os-release BUILD_ID back to its default
 value of DATETIME
To: Adriana Kobylak <anoo@linux.ibm.com>
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

On Tue, Oct 12, 2021 at 6:00 AM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> Hi,
>
> There has been some discussion in Discord on how to work around the "Same=
 version" limitation during fw updates, and having a timestamp field that c=
ould be used to generate a different version id (commit id plus timestamp f=
ield) for every build seemed had positive support in the discussion.

So the hash will be calculated as the `VERSION_ID` and `BUILD_ID` (as
timestamp), is it?
+1 for this proposal.

--=20
BRs,
Lei YU
