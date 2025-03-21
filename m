Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18702A6C669
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 00:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKJP53jbPz3cSd
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 10:21:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742599302;
	cv=none; b=bjVZzXLQ8wRUOWNZv6LGLYp5q7hIbcVCF37qfQtHL5jvi0w2Zvk6qQ/PmYzV5ft5cljUTCV6SIKng+QJwS9qT851npEVk8NdeXv/QvhXJsMKKtTQhGMK+4DPqkzjP0xvjX5QFCEIyVrpx2OEHpSuhhaa+Xuh2Z57mok92fRhqBimohOBPA54DCLtP2Ajxm1chexgVCoI1orJbDcBeYTKhGSk+kcAk2GggBQFXpyspwssH8fS/HXZjsxa3sfmdDt8KTp8AY2+4A4IXt6yxQ80DsyOBRW/vjWRV9QbWJ9WW73WuEd9bFcEbNzBR3TPtVyJ8O8KnXVeYrz3tou9LVSuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742599302; c=relaxed/relaxed;
	bh=QpbZy8JAY+tMo5KzqxpQLw6v85gS6SHLNRui3h8dJho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z233Qa7M/pldzchxyqE9VfsQ0IivG8pLrNqelb2MiS4NjUSDf3EgfvH0Blj7ShZtqQBjBx/mR/mLZrQgdGAKSx0joljk82EF7u1wthI/XEGQ0JbEDMlQofbGAPS6JnHX9fIbbGT/CTGyXXjBTvPKtQEpWfR4ZFjzW6pi6CApyY1pPVVtligTry17VVTbnY7RP0ZTEqPegYNThZDSzmltUXd8Y5Gvr3nAxpAJwcMQ2RUkurJ6MNkVL9P4p6bQe2kzIzZjzHJHP7DXW2TWH9jmSadKdADotT2tWzgyDsHnPc3yxkwom0DEdPzGQvahodLvghcn5Jdy2wyH8udvnudx8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVO1zJ+K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVO1zJ+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKJP10rxdz30TG
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 10:21:39 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549b159c84cso2821228e87.3
        for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742599296; x=1743204096; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpbZy8JAY+tMo5KzqxpQLw6v85gS6SHLNRui3h8dJho=;
        b=TVO1zJ+KkLXA8OWxcBTKhR4TudeLZapYZNCdL2xPJ9e4G+eEv+TueCZ0iZ74mx6P3A
         qiGmC+HHuRaYjrmYFFcwyXaZocvl2ZC1E1N32P4Z74mgDDgEeAvNczF8OO5l5vdj0WL8
         ur3T8uSzUAeN2grF4nCiaJjJqi08n/s9AvsZadQwe6Gzqp3KG47u3UK5Pb/wBUllmxYH
         U/LFW5bxiG9RmyBxuHUiajYv5MqFJTOGjMTzorXOfZR0B7HGp9YfOZcz7XKvH3NOVVI0
         8HIH52uJDuDRbBKmgd4o1S9cAzozr19Bo89Mb9GfKxqLTs1pAU4fr/8K3pSaouPFXHww
         FKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742599296; x=1743204096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpbZy8JAY+tMo5KzqxpQLw6v85gS6SHLNRui3h8dJho=;
        b=oXmg6bUG8q2qj6Y2+AvXXofaAkqHMcvkpToNe9RQSw635QBXGKdK6ABgDBJzjUI4jT
         d5dulcpDntAqPOAHrtcfxh5Xoqa330hk9YF/cHFdpksrmzvIQoI320w7oW3+4+/NvC4w
         Fkoo3UcALNTSzqaqoF8uMXG54qaqfIF8USBcJIrXuUTWGjNk0EMD3O7SsYeuGt8KvxNu
         ceqg6itBhoVdKgY96KtuaAIQWxZpPrvChr3oWk9kGxrBbOKEUDCyEu63KhQEho5M2ojH
         fQhilE15XtfUeFo76ZlqM+CGl7v4fbq8ihqVb4Wt5LPng0SmPJBU46gNS/NDr7ki9vuJ
         qH3g==
X-Gm-Message-State: AOJu0Yz/vq/H4lXtQDDelcwTY5hVxZpjDWpWq9dnxJZ8fPBR5BM37ve+
	ai4mrwSj64hGZpMG6ks+USJ4XYbMEw1MwT15/ngPuNQNgQx6ZU0G
X-Gm-Gg: ASbGncuh0P7a8IzepsHjA4bkMeAjCYzj6dd9MXT8Oxq05DOcCWfTxj6jvRjkCuEKHnP
	RVbLeC23UXIdV1uJnVve/iVK1URknJUWvb9nm1FmejVq7xJNMexc2SXoWvH+4w8pw9G2BkQuwlr
	lude/HxP397LsQaTiAXktDx5TaACM5WZuL2a7c4tIk0sl1yelITFh6XtI+BxK6K1/j0TzEBuWgq
	7vBTSvwjpLLdT6yy1Am92GULOTu+XSA5co+QE7a/AMjXEIyl47z34pe3ZqIMSJKDiqsGWYkDZL+
	xxGfYank6Jdu0/sbNe1uBtKy/b3H6CTjjAAzlEMzPB47KfsA4yx+O9JRrAQ=
X-Google-Smtp-Source: AGHT+IF6AOalAKXfYlAmTiemoPJ67odtSG4lisGAp2O9j7Stxikvyz2/JcgUzipkHp/Nmy/YO527ow==
X-Received: by 2002:a05:6512:3401:b0:549:8c86:190b with SMTP id 2adb3069b0e04-54ad64f5909mr2134314e87.39.1742599295557;
        Fri, 21 Mar 2025 16:21:35 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64688bdsm292410e87.49.2025.03.21.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 16:21:35 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52LNLWNK006109;
	Sat, 22 Mar 2025 02:21:33 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52LNLV6m006108;
	Sat, 22 Mar 2025 02:21:31 +0300
Date: Sat, 22 Mar 2025 02:21:30 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
Message-ID: <Z930epdwnOw+9DkR@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
 <Z92lMNqRcWrdmMrS@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z92lMNqRcWrdmMrS@home.paul.comp>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 21, 2025 at 08:43:12PM +0300, Paul Fertser wrote:
> On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
> > Upstream-Status: Pending
> 
> Pending what exactly and why? I guess you're supposed to send your
> series upstream (to Linux devs) first, then after they're accepted you
> can ask for backporting them to OpenBMC tree. There're exceptions but
> you need to provide a rather convincing reason for that I guess. I'm
> not saying that in any official capacity, just as a sidenote, Joel
> will clarify if I'm wrong.

Huh, it wasn't at all obvious to me that your patches were meant for
U-boot, not Linux, sorry (and you didn't specify that in the
subject). There slightly different rules apply, but in general my
comments should all be still relevant. Overall impression I got is
that you're adding a bunch of hacks and that most things about them
would need to be heavily reworked to become digestible for upstream. I
hope more experienced developers will correct me if I'm wrong here.
