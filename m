Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4486A9A5
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 09:14:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LbGQIE1+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl6Zs4sm2z3dRV
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 19:14:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LbGQIE1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl6ZH0tLQz2xdh
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 19:13:57 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d275e63590so63974631fa.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709108032; x=1709712832; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCZmvsT6CUrQriijYPlJxQ0aVHBrsxiVkPiD9RwstUE=;
        b=LbGQIE1+3t7N9Gz/FUO0zGZXL8f2RgNRrcb8wxYDbuuSIApbDZz7+Xud1bX9E9Xz7G
         gAULqtS9+rZS9sex4DjVwrXWOOKeARNR8HR9WVctZPhc9gyjDVeubnzjnv2hRiYaQ+Yj
         dod1JE8PmvjIabFN2IvD5JkxnQphig8s9lcc/gg70Ttw3ME/DaKpdyAGefMNyg0Ct1QF
         g4aoRq6Hc4OSJdpQosc2WPd/gKLJCG1RBlU8Qz9dAntVHGEermjByk/vHGaEmX5unmQx
         EJ53geehOpIpt9FISlwXSKFrdgGxNIbdI1ZScdNYyP4w7xHEemRhtX5dK6qEKSa/bwcq
         Lygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709108032; x=1709712832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCZmvsT6CUrQriijYPlJxQ0aVHBrsxiVkPiD9RwstUE=;
        b=aP3fHNoWNrMChSCrM2PiRxrcUWc1uT/1jXWQItdDAl6u0wbFLDQ1AMRoUHctknilf7
         uSRGHQP+3qHTh14UlnJCPAPyj8922rmx2K4Il+amIEZo4w9wn30QFZS1j0nJXBCDm28s
         ktiDNT6dkuQlGswTVTEj1+ZoQ2oslPxgDn/p+m6XW7e83uS+mvPjaObEoMnhVoPEH2XP
         MOwfEJOz351qoHEspbBOCMizkhCcqH4ITh1pZHCKmvnXiNGMshQDAMUYdtlzUxt9gfGk
         BYy63GImlLv46VWlMEuwAAthRQ/l81dD8+JHHK8A25AD8AHZDmiTq33Nzb9udtFQiEml
         obWQ==
X-Gm-Message-State: AOJu0YxcU1UNfR5UGO6ez7cWSUa0mNNJFmekDw0L7TjTmfupPMCOiFQe
	jBijKQ98kvOZvBRrisl5jSGlOXZWFrohBKSoi46cz5SHjNAkykLRD781xyqj
X-Google-Smtp-Source: AGHT+IHMSp4m2ow5z6l6AeKCPlyO2SI+1MLLG5PHFpG2frTzS8O7b1W39ZCZO0LdL8aazIpRkpArWQ==
X-Received: by 2002:ac2:4299:0:b0:511:9008:7266 with SMTP id m25-20020ac24299000000b0051190087266mr6691735lfh.6.1709108032267;
        Wed, 28 Feb 2024 00:13:52 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id x17-20020a056512079100b005131c5285f8sm83296lfr.107.2024.02.28.00.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:13:52 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 41S8DnHl013362;
	Wed, 28 Feb 2024 11:13:50 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 41S8DmpO013361;
	Wed, 28 Feb 2024 11:13:48 +0300
Date: Wed, 28 Feb 2024 11:13:48 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: AKASH G J <akashgj91@gmail.com>
Subject: Re: Display Port support for AST 2600.
Message-ID: <Zd7rPOJeE842w6qH@home.paul.comp>
References: <CAE33tLFTvpHNCuKbHBxvogZ1x1t7JkAHw4MZQsuoYN-=y1tCYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE33tLFTvpHNCuKbHBxvogZ1x1t7JkAHw4MZQsuoYN-=y1tCYA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Feb 28, 2024 at 12:05:35PM +0530, AKASH G J wrote:
> I want to take display output of host via AST2600 Display Port Interface.
> How to enable display port support in BMC firmware for AST2600?

It's essential to have CONFIG_ASPEED_DP=y in _U-Boot_ config for DP
output to work. Because for whatever odd reason "The MCU FW controling
ASPEED DP is loaded by BMC boot loader."[0] And if it's not loaded
Linux just silently fails.

For Linux DT you might need to check that &video and &gfx are enabled.

With this the host system should see a video card on PCIe bus and if
you followed the reference schematics the image should appear on
AST2600 DP output.

HTH

[0] https://lists.freedesktop.org/archives/dri-devel/2021-November/331941.html
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
