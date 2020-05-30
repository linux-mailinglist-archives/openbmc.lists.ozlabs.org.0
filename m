Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FE1E9480
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 01:24:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZHZK633BzDqkw
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 09:24:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FOFi3IVA; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZHYk0RLZzDqkB
 for <openbmc@lists.ozlabs.org>; Sun, 31 May 2020 09:23:36 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id c14so4771075qka.11
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 16:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EZJabjQoeRqKPQ5dBxOPbwvFKhjFFqR2iZL1+I7MtEU=;
 b=FOFi3IVAvzvk0Lys8X5WNZ26ahqih2T8HkcqchZrAWZx4cX2j8Y8K5A90z58+APAYs
 bNDlxr/OJI9MY4t8/35JMNFYw7S34vF6bQbJ2w06RGqobZhaEv4Yc4jA0rn/ztho3E8Y
 1Ifp1KzQfMmlZ4rAcDV7DH7me1zMdp7CbiMvjap9B0mAzDklx5l+Q5KR43LvnGJ8l/0o
 DjLrLfokoi60Ytp0xjn5OV/jw0uQ26JbS2gKtLniymnZeMvfvpHZNRoydHz9S2uNLLqw
 CsWCEy3UR3oXzpbrudU+Xuu8tfQWSXuNZE8tyyvVjQ7kAEDRNymt0AU+C4gMR/UstT7u
 sjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EZJabjQoeRqKPQ5dBxOPbwvFKhjFFqR2iZL1+I7MtEU=;
 b=bpxPpQPtdD9w9hA2y0BptaypsQ+XOACC9nPSW944ffBmKGhXrjr9m+mCUkAJzv06UO
 9oWd2Eb43WiAcfRUVsTc9f8X9efGnrOQHZE3wNqp5LNGilkCCtA3Hwk7umIeH099UXDW
 Xq7yAUXhZXqoW3a0HStZXYVr8ZaVclMWA8CDHAtpswDplvXhZMicA59gnZhN5H/7B4ow
 d3xLO3KFjPBw5ZmCh71va315H45XXKO38Bun6MBkAF6AM5Qwj6vIEL/goVlbR/MdaMLX
 o3iIrzQwkCsj9Xoalvb5XbTo9n6G+wY71PvUQKSkZWln8/Xf7pcsGnLTUqx5hu9Rr7Ps
 2MHA==
X-Gm-Message-State: AOAM530nPI2k3PomoLsDwwJuS1BYuoTI0FKXRFmGcpzXuEBIIi3xzBjz
 E9idOT6nP2P6KY2pk2EmjieGXYSV0rihZ+djyVGxA+d4
X-Google-Smtp-Source: ABdhPJzDJmAcWVzOTbKVeiSl25NLj/BM2dofcPh3lxO1wqmX2Kiey67KgN7SRfbcYOrSd8kRlYaoheM12C3Cd02YG6I=
X-Received: by 2002:a37:a4ca:: with SMTP id
 n193mr13261291qke.261.1590881012932; 
 Sat, 30 May 2020 16:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz682nVvnxtuj=vzEMBKbHQm01fd+=-JC9pXu+jGioMSg@mail.gmail.com>
In-Reply-To: <CAO=notz682nVvnxtuj=vzEMBKbHQm01fd+=-JC9pXu+jGioMSg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Sat, 30 May 2020 16:23:22 -0700
Message-ID: <CAO=notxjf=TVko9zpGv6sD5-a4v7WyD4hzU2g5_RHe6otmCN2g@mail.gmail.com>
Subject: Re: Looking at intel-ipmi-oem
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, May 30, 2020 at 4:20 PM Patrick Venture <venture@google.com> wrote:
>
> James;
>
> I'm looking at separating the sensor and storage commands in
> intel-ipmi-oem from their interfaces, -- making them work without
> dbus, so that they can be dropped into other environments.
>
> Re-familiarizing myself with the codebase, I found the matches
> https://github.com/openbmc/intel-ipmi-oem/blob/fcd2d3a943c4fb518d399d8a0addd1cc661e5628/include/sdrutils.hpp#L66
> don't appear to be referenced, they are declared in two places and
> then the symbol doesn't appear to be used.  Can you verify this or
> point me to how they're used?

Nevermind, it appears to be that in their creation, they register
their behavior.

>
> Patrick
