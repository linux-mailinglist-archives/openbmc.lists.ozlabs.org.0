Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76367A90AB6
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 20:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd84l17dQz3cPt
	for <lists+openbmc@lfdr.de>; Thu, 17 Apr 2025 04:02:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744826547;
	cv=none; b=i7a75k0Rywjqha6pPwswg91pYLY07+W1f/ohxDgU52f3PuI3gADG1b5h1QLbiyzcYBZ1/Y/bez3xUNhtrj0hFPUKCfEABgs0N9A9bhlJYtJlymBAnXV7aucnqpI6rGTQrdT+l5Sxwzz3JoC7M6g6hftFwmAUn0duycqWOZVp1HGsw1WS+6iCWeMFZM2z8EJL7sLiXSwMEW+0NC9X1Siaf9B7S3CGFBNShisn/FC2xrPC9O+ThJHXrDI56ts0a9Rg6DBbNgUl2euFZ7CIlkamU0pYVywT71ik0qe+R8dfJZLtaf9LffI9cNTDKQ3s//eNMe1RUSATeJiDeVYrHmrbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744826547; c=relaxed/relaxed;
	bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgwpjgEh0fHJ0HQH4tBeEEomKn90aOdVEs+jwfxcM6BjNmDUXzoWnhNVRKrrzNQlHu94avntHE9kuIG5dJpwP2QAccBia/yPRa14qA4bunTfcDtjdIKGyvya8mic6//Wp2Igyreey1mbImrfePtUvNxgSADHs/RDYOWNS6HEZVaqiupBZy6rz3BvQdUT6reyNtipZ31WChrO3xcBry7UHMqqUj2Kovhto1DrSLXWoOP+KkYWr1uX0QLuAclorUN4MY8TNLx35lpElLUsQNkalPDoElO6RRbRdvxmqn5FgqJCGBx0cbyzfuk7erCM48/MbKqv1g9ra/1VZP3jd8/7WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mq5ZVfLJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mq5ZVfLJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd84f20bDz305n
	for <openbmc@lists.ozlabs.org>; Thu, 17 Apr 2025 04:02:25 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e7040987879so6554910276.2
        for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826543; x=1745431343; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
        b=mq5ZVfLJuAkUGyXRLvryKMD5+jquSFEMB8cKg+j1OLzBpKhO5hsAarPkx4NqOlB5kL
         t61OuT7iQmHRXsej/JHWbScV+fk0oquYKVdEpURRog1TTPCR6RbpfnJgtU/rTpEpUQvB
         7oC2ejpKWsayTlD7vRvS22DXo7Efs88qqFlEEoS96lZwG5HMtwos6IIuYu74oPu5jK2e
         p1u7twNxhspB9yYPZwiES7WQZ4B90SUsPqjzc3H5Ofc1n6neFApr1e6pj0y1G83DlWJX
         FCMJtcaCrjlRb/IrARsFT6FE9nMEIt9UzrFN7iabxfwq3RX3T0s63b/LgMKFpITxH0Lq
         LzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826543; x=1745431343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
        b=AWwAHJ/bzDnUhkv80bWxHrKVduIrUAL74QWmEHwjwN/oJZyMQ97Aam21OLDpOYWIm6
         IqvWuP1rfNB1ruwdfRKYIA9NFRj/5oIj9k2eJB4vIwE6bDGjlkLmBkQV7C6W2cyCJuL8
         Rj9xEPTuvQlcgFmnt0tlTNve4P4XCzqhxP/JDa3CNGJiG/60s+Z3DmDBR8udLd63YecY
         Mr9tMUAifwIG3U3zqmU00cG9JAHaAcxTDU42uyDuZuSa1BZkYH67hiokRSPuiyo6xo9G
         h8+WqLqQIFSVYZfH/XmWqSjnRuHfPOmQIMP7FBMr7WQPiRnXPkqeMa2jlYGUxaxhCvD3
         f31Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdEiJfL1zX2LXgIjCCRLucDelVk5BP7+dKc2nciu2mzMH4hPXPcSiJZxmRkOuveXtlp7uPSq2f@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoD17SjIJCEwgw6nAuUZs3gvRZyPLYncpITiZxaiODeuUTqJiN
	KEVx0lyrYEFrGTutIvklOffAq/AeTTr2xRc5cELV8TCvwoieu2U3Zrd9r1IBrRhrJZrEitZqaYY
	8HGQQTSCEf46riiTTQ5zgJgy2f64=
X-Gm-Gg: ASbGncvpUtbu9rccwGf828bWflU4LvEKwlgMS7ko6/RXY/+fK0nnLbUD4VjjepMlaRi
	Rp9aM8fGkDhl2mE4AWv7bLiGcHGJ9I2lSmqmQC564w64un/rC66XNMIBxr0e3UBgDaZCcZD4HAg
	5J92tBvL3VeJExAhDyoHEK/kc=
X-Google-Smtp-Source: AGHT+IF6nv1Xwxa6/kuzoRUSeR3L5USo5Sfhi95vX8nH4+whJCLi5evTvDN3X+ES0OGn9kkZQBtbUmpklt5Jat9tfs4=
X-Received: by 2002:a05:6902:20c5:b0:e6d:f0a6:4cdc with SMTP id
 3f1490d57ef6-e72759971f7mr3697408276.20.1744826543082; Wed, 16 Apr 2025
 11:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250404191144.4111788-1-william@wkennington.com> <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
In-Reply-To: <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:02:11 +0300
X-Gm-Features: ATxdqUFQBsIrXD1qfRD11uxRSlG3C7oV5i-4OGCQWJVC6SAnP6S24OSDnGSxwfQ
Message-ID: <CAP6Zq1h5eLvJkP78zyvR_bsQVpGRtmcfjFHHzjrXirtddTpD8Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
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
Cc: openbmc@lists.ozlabs.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

On Tue, 8 Apr 2025 at 04:15, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Fri, 04 Apr 2025 12:11:44 -0700, William A. Kennington III wrote:
> > We have the driver support code, now we just need to expose the device
> > node which can export the SDHCI and SDMMC properties for the 2 MMC
> > controllers in the npcm7xx. Tested on real hardware to verify that the
> > MMC controller is functional with filesystem access.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
