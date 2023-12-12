Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 502BD80E1FC
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 03:40:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jExdSYXJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq2sq5h69z3bNs
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 13:40:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jExdSYXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq2s90gBwz2yst;
	Tue, 12 Dec 2023 13:40:11 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c4846847eso15362705e9.1;
        Mon, 11 Dec 2023 18:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702348808; x=1702953608; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zAXD1RodxLCJLaHsUmAJZ2pqAt9clRdJT0+EpmZ3Uto=;
        b=jExdSYXJjSwqEPLGv7Gif1b5SDqtaA8oWb9naepZo+SE2C2xyfPHqIkESgtslQZcSO
         qst+6RP86N0sGitTg0OqNVuwoj+oDUHbyixvtBA9ZVFQqKP1MRz1mxf6r+Q3FnavT2WJ
         qx2Wkugng5nwRCQpFjEc9M8+xglwQF6Zmr7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348808; x=1702953608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAXD1RodxLCJLaHsUmAJZ2pqAt9clRdJT0+EpmZ3Uto=;
        b=HUvusHbWH2o73Mnk6f7eXszAwMJ88SSEpzRLNHOFgdff5Xj4j0eEf9UD1qsoZ28OwG
         P/B2Ov2akvuh2/+xszGa5BrqHiCBV6oOvk5Ite3pUw7+PJviLORsyzTKI20ty+PG1x9f
         SYeT6SoTtK+DCAnOeYxfla8KRVmzSnL2bHt+o3OKKdAFp5oUbaS/hkBU2BINUsJRp+Pm
         1sN4LiqMIMvRyXcCo1MWpf9Vbv9Hh8EsY/O9bglGF89hm5SIVRzHGukoCGcAkyBARh8b
         L3KrArSyR2qcv37/EMioo9xs4GneAThFLFTxyW/BXNhFwVn63SiHX3fOelHkTrOX4yVz
         dj1w==
X-Gm-Message-State: AOJu0YwF4rPDomwFiyKgYcYT8zRN/2l2JWI2XurxWopmkPv1V02EzJoG
	2XwlFdpBZJGRL8j8lHuKyMLA12DHiGeBYRJoW8U=
X-Google-Smtp-Source: AGHT+IGro7ebzIbDoL45S1IR1W+QmdX6go9COEOECHXrDlJuyCg39Z2Svxx69OR3G5dk255FoNyjGuIcZuMlOJIug34=
X-Received: by 2002:a05:600c:11ce:b0:40c:377c:4b62 with SMTP id
 b14-20020a05600c11ce00b0040c377c4b62mr2683948wmi.50.1702348807434; Mon, 11
 Dec 2023 18:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
In-Reply-To: <20231211102217.2436294-1-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Dec 2023 13:09:56 +1030
Message-ID: <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c: aspeed: Late ack Tx done irqs and handle
 coalesced start with stop conditions
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, linux-i2c@vger.kernel.org, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 11 Dec 2023 at 20:52, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> This series consists of two patches to handle the below issues observed
> when testing with slave mode:
>   + The coalesced stop condition with the start conditions
>   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
>   read request".

Looks good. I've reached out to a few people who use slave mode to ask
for review and testing on hardware. As long as they don't come back
with issues, we should get this merged and backported to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
