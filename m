Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876CA6C1C7
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 18:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK8tk4Skzz3cFf
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 04:43:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742579003;
	cv=none; b=O0Je7AEhwVOv8ZzHLyIq8yEwPIS8ELu13C+gzRkb7f3rCnziTaKF8nWJm4ngnSPpH3otDwlwl6uEZ5QkK8VeQNtl22t/jLMvG7/4/aDQX+eDDHBME566jiDu7e3O4ZL9ocsDug0i8RXTZLpfr0XBIN0+sNEWHTVl6ZFd/MpaXI8AM+2MXjtUywswmWY5LhqPUmJyw8CoOVMu+YBL8ok/wQO4DRBXYT6YoVSacUuK/5W7Wf980RpfP77lTRO3vU7FFrlOwULhznTA6WmTr+HAadPLQhwrfZBHIqtLMJwwVdA/0V8VUINni7INJYU0KMRwy8fVe6C9pj6lnGF7EN4tSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742579003; c=relaxed/relaxed;
	bh=URcWnsBxK6BbxfCAMR5jNM24hJOGCcOuiZnZOijNk5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1fenwHcm61C71riznvdqAgzNUyAu3RtSXI01J+p821SJQuPxKiog1Uw6aJ0zzIQxyy5CWLqriT1aRzqOR7XKhsO6U9L3kfhE7hy6duYGvZc/koWJOy08xvEYFqLSEPzxSsRlzjn+FV2ItZP5XuYl7w+RTu0TXD5IZr2pyCC6eDcB3RiUsZjEXDC5Y7BRS9d7NtYHCe+oYeaMb1V9uIuXAUE63mnQ8ucNTJKY1h7lrztDIn4Qj9/2Y/wyZmygSjXiORS7EZwbhNlllaV1xmhm4EGrInbUIsp73LpWGUZCk3VPlC8qVn27weSuq7WBc0LlYvhENZMqce8hFO5mPj02g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=atU+Hk2J; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=atU+Hk2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK8tf0Lz8z30Ql
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 04:43:21 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30bfca745c7so22344911fa.0
        for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742578998; x=1743183798; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URcWnsBxK6BbxfCAMR5jNM24hJOGCcOuiZnZOijNk5w=;
        b=atU+Hk2JYpf/LzQe1qZrOdH87S5mJaELt+NKCU9yhyMM9Q+v/YzFM90EeVoDCPbY+p
         7PPSVXJ49iActnpxcYMI2L8hZVtAGhtM2+j/48qXAw15etDVZ2DqCqDbgP6HzgtUAhpX
         JIYLq3QKVLKK8JAWnYWbJPfsyc6o72yIgHY23Kd0bZdSGL4a6vy6AdLWPn0lM+KOaj1M
         MGsdSxo1iozxtDZZD4/G9dB89p6n7L5r4PaKwTxmzc3/IjvnaGy4wVApIrw5y6sqJu2H
         e5g0PSQ8zfwQAMLovlYyfriNHCS9W0iMU2LIN//fDzkaxPzVhX0r6AAjIRpZ2+TUYQGX
         0xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578998; x=1743183798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URcWnsBxK6BbxfCAMR5jNM24hJOGCcOuiZnZOijNk5w=;
        b=jbaOTWD0rMy5RqyNEEzN0eUxAy02yUt+Z3v9kT3zFpu41Uw2HYLIC5ydTgcVPWQA4t
         sR6ir6iCO3duN0HARL/ipptqxH5tQXatc7vQcy53qr4WzKRWX526OeM46Moo1BE2MCNG
         MNtiULQ6vlJZbsrKZyaeu9DPdVqOi5oK94sZkC2W9I6NbnJvEOl0Jdpr9N3+3yR+FA3l
         ELt6u8BXFcj0U8XMqmGKvk2E7ErXUwHDzq/YSm7DnjI/J8Qgik6LERS9cxpWxtBD2Ia1
         vg7VCnB3RDSfi/kZ5vrVXURsHEXQ1vPGyodj6Zx8JKKUJflA+aF4y6XMPNe0WR0nd+Rk
         ckHA==
X-Gm-Message-State: AOJu0YxJI1lj78gwQ4YNInsosCj6dWkCBPb1VJaFNaveBKxdg/z8ZTj9
	uZGcaq+bVKVlbeH3NjtebMkqhtHFtSzORQdeRgmvdltQxWWsz568PCz1yQ==
X-Gm-Gg: ASbGncsoGEedJcdibo0fJyZWFnuBGSQwi31+uDjZDfFWFx+e3h+DKxo2KMxQPJIFnCU
	W1/P9XIQk/Ixly+3WJQreL08rcK4iLXwZBhTMO9/738EGwXO5EP5BbnZA1XX0zRZByAaLrEcjwM
	zdWDfmAXdU1QUB1QUg4BoSKu0YdCvlvCpjHLvjVAbORw9wsj8wcBfCaTjuFSkhkz9CoIPtdm1rk
	e7qyN7hPIQpzT+uwuRass1zdqN4n00hlW2hqVOnDua+ewKztpZ6VbVzPytGwCZcb335NpwmGtBX
	7bALLxsMZbR7k/N5b0qsh9U0wEO1We+8cI5E/kEqhufi393mnpV0QzxQuos=
X-Google-Smtp-Source: AGHT+IHgJ/B5GNIWEvnnuJH1d0zkxfGiAd6ftaRlMTvIVoKB6JoU6E2fiNKd08yixX1MTnUKd1hSww==
X-Received: by 2002:a2e:be8b:0:b0:308:ec50:e841 with SMTP id 38308e7fff4ca-30d7e313eedmr22225661fa.25.1742578998214;
        Fri, 21 Mar 2025 10:43:18 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910dbbsm2937531fa.95.2025.03.21.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:43:17 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52LHhDTv005646;
	Fri, 21 Mar 2025 20:43:14 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52LHhDLP005645;
	Fri, 21 Mar 2025 20:43:13 +0300
Date: Fri, 21 Mar 2025 20:43:12 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
Message-ID: <Z92lMNqRcWrdmMrS@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
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

On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
>  application

A rather uninformative commit message again.

> Upstream-Status: Pending

Pending what exactly and why? I guess you're supposed to send your
series upstream (to Linux devs) first, then after they're accepted you
can ask for backporting them to OpenBMC tree. There're exceptions but
you need to provide a rather convincing reason for that I guess. I'm
not saying that in any official capacity, just as a sidenote, Joel
will clarify if I'm wrong.

> +if PHY_MARVELL
> +
> +config PHY_MARVELL_APPLY_MII_RXTX_ERRATA
> +	bool
> +	default n
> +
> +endif # PHY_MARVELL

This doesn't seem to be the right approach at all. If it needs to be
specified per board, you need to add it to Device Tree schema and
those Device Tree board files that are affected.

> +		/* Per the vendor, certain Marvell devices will not function if
> +		 * the RGMII TX/RX delay registers are modified.  If an
> +		 * affected design has been selected, do not write the
> +		 * RX/TX delay registers.
> +		 */

This doesn't say much. Please reference the actual errata document
number or cite its text or find some other way to explain which
devices are affected how. Proper implementation depends a lot on those
details.
