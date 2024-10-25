Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC999AF6E5
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 03:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZQPB6H8Yz3c1Q
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 12:36:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729820203;
	cv=none; b=iYg5esXbkqaa3XBIyOxCZ2dm6QIUIg2aavWGdmqO4Id4KKCYw9KFaDmo8IZnUGQdh9G28L8xZO73AhWu/bxnW1EgiEegouCk4F0wpziTigTKWCe3FfNC9eqLbBUyHMa58GjFmgSQZshR5JRtY1BkISj9891ALQcncLdW/vZgIASxEsWo+/XmFzk3mJosQGiaRSLoKq8qMV8SCmsxofakM3GdnA7266MChqrsvO25/24C3u7uhKv4V0h+m7hxchD2HtPB9jSDEVzKwujRrqLoLgWV7BTh23HNjLDmwL7Q7u7m0jf1+XMA3N9du/lmTGMF6VH8SLzM4DAX+XgPKpv+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729820203; c=relaxed/relaxed;
	bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYeuDqrasDPipydrOouZmDHoKNAzCb+TKCtlYUjv6XqYghYiZNyFFFmUwC6PZP0eO4FTQmiOwKO9F8Tw+lRznggiueLdP0+AMxdRV/7nWN6i/lPmQSjAqtrsdhPgziFaJXeqN5lHt0q4obneNa7wT3racptHgbclovLAnXvL9vNBtg08ZkLhA01GEi3IELTqcbd02WyqWsghqmLAN7RLeApTG2p58/f5TemXUHwBSeH0oSH1x7d2p8SvuhO6Yo345jwzsB4wAu/DZONIzZlal7aLPI5LLnP00ngUDaltw/aeB5X7s5hT6HlF63osQDV2PuJJllsnnGKw7+eRNNeOgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2tAGkZR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2tAGkZR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZQP62MHgz2xJ6
	for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2024 12:36:41 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d4ba20075so991319f8f.0
        for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 18:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820196; x=1730424996; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
        b=J2tAGkZR8ujn0VtR9ICLkS4U/p3z3IvO8ZebGT+vU/Fsa1F0dxIeiZDCa+q4oECKzt
         dDFcXC4t65XZBg7/1OrrE12C4Qy9Eka+rDRmwpVJoGGanPoiGWXy6Z5sOKOBBBRivC/c
         zA396fYN2AlJ0LwdJPV4Bx6i3lHKc8/cvntUuyAwVailBhRoJVMz/mPI27SOhGFUjINF
         Q0xotvdz1mfUrZzGXflrnmZjWkMhaylnKWCOx/D+zkSjQkvlD3BPc8HzXegv9GNS05S+
         7YjkYpqMipJiigdogi5f4RhFn+vTr5fM/kXA24eFFw6oMQM0eB/XQu69Qecg5ThyhRFP
         xRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820196; x=1730424996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
        b=KF4Wi2Sr5ieyKmNN9cN1XyLO4NrL2ieJPeXhj6GKWP4CBYQ8BYLlxKeNrZcDLfzMxY
         gRsx8QW4sq+cWFNCud52kzU3gROlJf/1bTo2cU9K2zt3+CcaLQZN5q8pIj022IeeDRNA
         aF48f169fGum/fUHP6t5L19SolQ+SuHe2/5YGn+NpKTYMqX600H+WhXsRwjbQm4IPAAp
         qxftjrb+YIB/MfGt9sB6d0Av4kr11GzgL4gY/CjSGeoR7/xrd5K6+Sv3Cw7t4kUgqRQz
         R4inYnTz6sAVMndzjm5kL8IHVip9C2YPnof1PWO6LYPVEBK/NsnXfdvOyvyPnFhtvGui
         kb+w==
X-Forwarded-Encrypted: i=1; AJvYcCXGpUh6GeIHWBu8Stih527fv9gMkgnUKnV6CXQGVJARrdgb1dDWnS1keAUBMUUJr3vIGRUMIZ1W@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxvv0Pju25/BcOYrbXKrxRnaDkAju3/6yELfXXdkaC77BZP5yJA
	W5fQRzwCipnggynzPM7XoRxepPbayxJQaRaWwSaU7AyYgQDdDDALb2v8U/0jH/02EWP6qHMSSpV
	/AWjit4SYXrtDNzH+jIIe6jCx6w==
X-Google-Smtp-Source: AGHT+IGrg5Qsx7UtEtWPquGFb4c1OOVDWrYwbdFq5xvgXAuMTsixP4ouyOpiTyOMy6JfgLM6ucsGueCV3JQPW30Sc6k=
X-Received: by 2002:adf:e0c2:0:b0:37d:4744:9d1d with SMTP id
 ffacd0b85a97d-37efcf34f36mr4957208f8f.35.1729820196315; Thu, 24 Oct 2024
 18:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de> <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
 <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
In-Reply-To: <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:36:24 +0800
Message-ID: <CACD3sJauX4dg927nAvfTKOG_phW2d40CRLV09L2OigLn06kbUQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, tomer.maimon@nuvoton.com, tmaimon77@gmail.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, KWLIU@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

HI Andi:

Thank you for your help on this.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Tue, Oct 22, 2024 at 04:08:46PM +0800, Tyrone Ting wrote:
> > Hi Paul:
> >
> > Thank you for your comment.
> >
> > It'll be addressed in the next patch set.
>
> No need to resend, I can take care of it.
>
> Andi

Have a nice day.

Regards,
Tyrone
