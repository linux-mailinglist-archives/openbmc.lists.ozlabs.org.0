Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 945548B8C26
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 16:48:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfmjKX0N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV0Kz18Kfz3cXF
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 00:48:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfmjKX0N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV0KG2m1Jz3cYF
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 00:47:30 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e3f17c6491so56773195ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 01 May 2024 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714574848; x=1715179648; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Fl+fLmRZyiDNW/6JyUoRJz4DQMZ9LCyXCbw+ImdrLo=;
        b=nfmjKX0N440/YsHCc8nNzmX0jHttvBgZSPydOojPJDKl7REMOyKjeRpoLMNdQTqJnU
         MMNVoSXYYfE0G/aGVoxwV2T8hEMO7b+JeoeJ/PGkxXyWL3LR+1lh8Ci6PhbY+6MNpydf
         mZ7VuYBv/w5wss3ii/Ael07MrUorZ5AuTbAHuCWoMjoXGqMJYIU0x6Hiksb3xz/0JC86
         fv91BC3e/X8FDpkIDSbJCUsJRVXFA46sWOhCVIvb2ZPTEqnYZVe9giyx+e/4G23kfBl9
         tNIgBKcvV6vQJsLVTjLrP6q4eJofBDZzficVIODjMlraybbmCD2aqvuUX5VJ8XL1YPkl
         ba9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714574848; x=1715179648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Fl+fLmRZyiDNW/6JyUoRJz4DQMZ9LCyXCbw+ImdrLo=;
        b=kRChoop7aSF/KFpUJCnjqPgYvMGnui2tnYPpNtoYMJasqGSlaH3Wef5KUdRX5J1rz7
         TogSZVX7PJogE4MUZnLnNSoHiui7aYVuTUbyupBbpQmVDH8+OkNPMoATUptIZlaXH4j6
         tDKjjBPUjNRzRIqt0/WvzCEoCnBNcihkfJRFlb4zMBUXlVd4Pj0++Sorof6M3IePaE5c
         /eZV2tIua2hs9b/Y1yuE2h69Zzkow8QHtdebYGg+szdh+wGVGDVm5IpWR1XWqXvQ468o
         8g1ZLNEHIlRiNShK9azieJGLaIKvRfE+C4vFiGlupNgons3et9RsBE0oEVZEhEsFcwhq
         esAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUumkMbhYNM7FpVqOYLqhaj284DQWQspmbHCZGFMq7D4Ll/xXt2yNLpiiXcJoRrY/ZBPfy5fFGojrmCRMV0L/D6bHPTygYiW6c=
X-Gm-Message-State: AOJu0YxsZIx91D5nca36M/8rnj+7eWs20y1iDGp9HcADdlAEtbvADhY5
	T7CIcHFryWOHqfTRopgVV4b8pFW+leZma8ZzHraW8qjGWXsATiWr
X-Google-Smtp-Source: AGHT+IGgpIAXcFz1mMO9Yvnre1zeYuS5SHuvMtJ2mjS8Nwz+CACsWDEtmKwlEEfZxFUJp/H/q+7CNQ==
X-Received: by 2002:a17:902:ea86:b0:1ea:a87f:bd2c with SMTP id x6-20020a170902ea8600b001eaa87fbd2cmr2593775plb.68.1714574847597;
        Wed, 01 May 2024 07:47:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090311d100b001e904b1d164sm21162840plh.177.2024.05.01.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:47:27 -0700 (PDT)
Date: Wed, 1 May 2024 07:47:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 2/2] hwmon: (npcm750-pwm-fan) Remove another unused field
 in struct npcm7xx_cooling_device
Message-ID: <68a66010-97ca-4278-8dcf-95f01fec9d45@roeck-us.net>
References: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
 <2ff738663d40ac5ae3d0b4d2e688ff7e36032be8.1714505655.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ff738663d40ac5ae3d0b4d2e688ff7e36032be8.1714505655.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2024 at 09:35:38PM +0200, Christophe JAILLET wrote:
> In "struct npcm7xx_cooling_device", the 'pwm_clk_freq' field is only
> written and never used.
> 
> Remove it and update npcm7xx_pwm_init() accordingly.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter
