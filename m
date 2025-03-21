Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BFA6C195
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 18:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK8fk5zTqz3cF6
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 04:33:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742578379;
	cv=none; b=dyoqTw2X/VWhlSTfF6M0iSgAAW090iF08oMgO9US1bfV3qmIs4V4PaKjCTcBIQFkHflPBa/E3zGcanOZ+sX9ocZq88yF1dJzMoQhaYQBcEx0dZ/ZClLKEgHWHjSBBsj7ZyXs01Si5cTMz8w7eB5Q9ikLsZnBw7C/zDV/Mh5/0ulnNmVJojHBflQU29fTjgkcc4Jl2RBSHuxiAVRbuqE+HkKWPB9DaMfgo2SliUjrld9mxXPaWy9Ms/ODAFKKPN+vTIUFWScn+/poufXm3NG7fqDVM64pBeCdGwWh7hUsYPC0vNkuEVejIhcIYCmMv5mo0cTj3yUr9NlflveZeUg9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742578379; c=relaxed/relaxed;
	bh=cl5whmx2Jk5UpFPK8Wy/p9k54QuBOv1OCFMMlxLfZ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cux2UjuOxdseyDGRTDdaPN0TtZPw4W0GTBhmLtNziMgORB2ZRLanx48xKyXqLE06VyG3/SYK/pnCBWEPbcSrdX/FRclN7wbYhugU45fOkDnJp2uKv9OGFgqqj3Zfri4+6ls6IC4my5+oueaxNqkpiW5YZeUyh2g4HaeNmuI4Cyy9CQCUkH8Ir4n7Ar44ZyN8nKB0ziXSAIft4JiuibA1RbR6+e/ZisxTFkMM5xk1JEVoMaQBt3ub5qHMYiP+F0FCxouXR6JvbpPJSSW7ErEArA1kkks2r062BPMQiM7J4kl+b9rTz1OeBhMPFqy9ChaqXdLfDj7bMYn5cX9P6lc6/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GqosaEDa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GqosaEDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK8fd6rydz30T0
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 04:32:56 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54298ec925bso3382762e87.3
        for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742578374; x=1743183174; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl5whmx2Jk5UpFPK8Wy/p9k54QuBOv1OCFMMlxLfZ7k=;
        b=GqosaEDacMf6kdPBI1RqQ0gAnCjg2Up2yCKgSh3qr6cMKBElkOyS0qQo5BKr+5zLKI
         Jh6qCDqgbUqLiADJuVEwDz7BK3eawOddADzBEegLCp5JrcnK6FOKRWavahQti7Fh2m/a
         vi0uX6a8oShxTLUGM1EaDgcl8Cq4FCNboF9G5JpEG5vGKXaFgY1B7SiNpO6E9zef5pBV
         sszzpygNXhuVL1HECDQHCiDWlwW/zM0RPJ//Q7EyyRHoHjbaZRS8jd7fAMXnYN5u4eca
         0H4bTonCWkt9hzYdwv1f+H1Pran6zna7zBcb9xuy7OYndv4S4lw3eWASRoFjlKWxQxpJ
         UA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578374; x=1743183174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl5whmx2Jk5UpFPK8Wy/p9k54QuBOv1OCFMMlxLfZ7k=;
        b=hYne+uoz+H3tH6DcDGGJGpl6Xj529oFiz6r4CaparKVIaOKFQ7dMeL6s1mcdDPIKau
         Jd3b1sgJldu+6dX5vkRYfsQej7RKZXlmAsuG4RgFMrEy2E0hrGSWxbvgg32+r8OnX0Hu
         Mj87vLjhcDK+43Et1dn6NKCfEgBBo047qSdbY/Lvy7XBkcDkLYEOUP/YIK3xTVNwTyFS
         +63vhzlS3GziA+mSxzvJU5H0fO7OztxT1SYnAA3rb3qIpnXIU3ihN/vmruLHx5Q9S/xb
         Jd1ryZdA+58At1y++gOEKEfQY8QuVtdX6ACIUj3DUQxyBAGDJTGwZHY6X4tkVJIgESB/
         2Vhg==
X-Gm-Message-State: AOJu0Yyj/3jDYJF7MOzPZrvPtgx6Hi6i4mnOAx234jkeXKd+JX9JNWD1
	lFuiHUmEX7n8GLW0JBo6OIEiCfzX9sHhSHhkDAY3oZspD23mGjGXScH5Nw==
X-Gm-Gg: ASbGncvj6mdPvZGK40sevdxMy9zqYMhPQEKZY7cRsMPYc568xn05AE4Es1Nil+/g3MP
	YwY91ibgR8L9ETgZOeE6ET7RL5CywL6oDhXMPQhLzw3pD9rM11ZdSIEXn709LIuTHFIjXIaTs3g
	MsOLNdIXR5ltSdh2e3jVpzVG2US+PBfcn//UfSZZsAm06NNCsiz9dlZipLPYI/BctRf5i0m+MLs
	ZC+GQ7IzzbjOJtaPaTmc0+7Uekc3hZwssWTxvP2GhmhoRDQs/Vb3KMa/oiMNrb4UIU602vScPKb
	LAYneT2Cw/N1sVwB8O1REFpHQe74wvkdPAgVSoiGKRPjccoEshcqu6UNKbc=
X-Google-Smtp-Source: AGHT+IE4E5eWj7xpk6hiIZT7JX/QizOzgICxQw675EtFl8OaD/kdbBwQmhZ+FklJ/6etYoGsR3v48g==
X-Received: by 2002:a05:6512:3085:b0:549:74a7:12de with SMTP id 2adb3069b0e04-54ad650d588mr1643670e87.48.1742578373219;
        Fri, 21 Mar 2025 10:32:53 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad651237fsm228901e87.242.2025.03.21.10.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:32:52 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52LHWmDP005625;
	Fri, 21 Mar 2025 20:32:50 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52LHWmWs005624;
	Fri, 21 Mar 2025 20:32:48 +0300
Date: Fri, 21 Mar 2025 20:32:47 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/4] ftgmac100: Allow target board to override MAC address
Message-ID: <Z92iv6GvAqIsv5hg@home.paul.comp>
References: <10646965.19586515.1742574581480.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10646965.19586515.1742574581480.JavaMail.zimbra@raptorengineeringinc.com>
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

Hello,

On Fri, Mar 21, 2025 at 11:29:41AM -0500, Timothy Pearson wrote:
>  read function

That's some incomplete commit message.

What kind of function do you envision here and for what kind of
overriding and with what rationale?

Please explain why you need that instead of using e.g. NVMEM subsystem
or having the bootloader set it in DT.
