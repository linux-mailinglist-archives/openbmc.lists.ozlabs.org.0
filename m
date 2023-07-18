Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970D75938D
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 12:57:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5ZdXFyo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVvL+OUJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Xpl21cHz2yD6
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 20:57:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5ZdXFyo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVvL+OUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4qwV59H4z2y1d
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 17:15:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689664518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LO/OU3eOEKbiSK+Rpa6237MBQHj5ytyRv/Karly+Uw4=;
	b=A5ZdXFyoSxGrEJSW68BKFT3EcXOX5u6qf4sZ86vt1ZDDpuAktf7LO+aA1ZdvsISDwZvQdT
	SVDkqbtj4Ov3TQKE9uqHEFXmyRL+qReG5/QYnKB3a8WV1945H116Y3x0rLZtBJs/NVXBcR
	V5gsdTxyBlT5ABSunncuXkWNNVihpWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689664519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LO/OU3eOEKbiSK+Rpa6237MBQHj5ytyRv/Karly+Uw4=;
	b=hVvL+OUJjrklHfYQaVQei2oReP+WIykeZd64HFxQbaCaGAQ6WuI/ZKwPuJpLCFpXrdynQP
	xpRvWY9cWVGo5yOd3zkjODFcSmzJYYl5yyGpEHLxiZgSOwho1tiOfSlCimfzMl4gbS4fkA
	SWgrQWzkWHCSSzj28PqD3YDdYuK5K1c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-IXVpHWruNXC6NK9-ZwB1ZA-1; Tue, 18 Jul 2023 03:15:17 -0400
X-MC-Unique: IXVpHWruNXC6NK9-ZwB1ZA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-402fa256023so9941291cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 00:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689664516; x=1692256516;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO/OU3eOEKbiSK+Rpa6237MBQHj5ytyRv/Karly+Uw4=;
        b=ghJpEcs15AT0lxaFdxLgsnROhiJXTTvgq4S/SG9IxEb3fK4c3ceHNlvVHNKR7Zm/xS
         n/2Z/hbp7WEeQiH983etamuPxnWDTVnZw+p4sArZ9bzoT1W0gWMo00ewM10um80xJP4S
         iLFZhNvykPmSdddLmE/84cnIexBUj4/sWIJMmUW8soHyejJxTNwX9cFZWxeLZ2/WwHta
         qEf5XXWEmjvfdh4O+7OridLEXmIuTFfRl8ZwoGBVs4NhvSvyyR6OGO1M+8R017vMTRDD
         V+hnQjECga3NZa0yfWUnJJt0eGye7+Ifk319D6wSm5AhexHBlutwMGI99j7EgrN05uAF
         GblA==
X-Gm-Message-State: ABy/qLawvx1EAL4CDM0mA6Jtar5I88Q7D4Cgtv2j1TtzTHwN/XDNuVYM
	YgoNSsbp//c6zB5/CvlWL4htcjNQ+DeMDBtcjWavj6/X1uFFmX1fGceU8CWClSYYmdHqmhxJT9u
	NtKxgm/yxKUUrqpS0kMQ=
X-Received: by 2002:a05:622a:145:b0:403:b11f:29f0 with SMTP id v5-20020a05622a014500b00403b11f29f0mr12838210qtw.0.1689664516527;
        Tue, 18 Jul 2023 00:15:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFCnBH5LbDKP5eqb3how4HWFYkMEEbEjoni1XoZY9ApODHPDOx/exsxIFeKjFPBf7UcYJHAUw==
X-Received: by 2002:a05:622a:145:b0:403:b11f:29f0 with SMTP id v5-20020a05622a014500b00403b11f29f0mr12838190qtw.0.1689664516267;
        Tue, 18 Jul 2023 00:15:16 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-170.dyn.eolo.it. [146.241.226.170])
        by smtp.gmail.com with ESMTPSA id bt6-20020ac86906000000b003f364778b2bsm482217qtb.4.2023.07.18.00.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:15:15 -0700 (PDT)
Message-ID: <6818bc7ffe07c21d415265c00b00cf32c6d2ac6f.camel@redhat.com>
Subject: Re: [PATCH] net: ftgmac100: support getting MAC address from NVMEM
From: Paolo Abeni <pabeni@redhat.com>
To: Paul Fertser <fercerpav@gmail.com>, Pavan Chebbi
 <pavan.chebbi@broadcom.com>
Date: Tue, 18 Jul 2023 09:15:11 +0200
In-Reply-To: <ZLDas0gsLNkzuUWR@home.paul.comp>
References: <20230713095743.30517-1-fercerpav@gmail.com>
	 <CALs4sv08GJXexShzkrhhW5CDSgJC0z3om5YJzy_qYRqEtvyMtg@mail.gmail.com>
	 <ZLDas0gsLNkzuUWR@home.paul.comp>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 19 Jul 2023 20:56:29 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Leon Romanovsky <leon@kernel.org>, Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Eric Dumazet <edumazet@google.com>, Tao Ren <rentao.bupt@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Liang He <windhl@126.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2023-07-14 at 08:18 +0300, Paul Fertser wrote:
> Hello Pavan,
>=20
> On Fri, Jul 14, 2023 at 10:14:02AM +0530, Pavan Chebbi wrote:
> > On Thu, Jul 13, 2023 at 3:28=E2=80=AFPM Paul Fertser <fercerpav@gmail.c=
om> wrote:
> > > Make use of of_get_ethdev_address() to support reading MAC address no=
t
> > > only from the usual DT nodes but also from an NVMEM provider (e.g. us=
ing
> > > a dedicated area in an FRU EEPROM).
> >=20
> > Looks like earlier ftgmac100_probe() would move on with self generated
> > (random) MAC addr if getting it from the device failed.
> > Now you will fail the probe in a failure case. Is that OK?
>=20
> I think the previous behaviour is preserved with this patch in all the
> cases other than of_get_ethdev_address returning -EPROBE_DEFER. Can
> you please explain what failure case you have in mind and how the
> probe is going to be failed in that case?

FTR, I agree with the above: it looks like the old behavior is
preserved. The patch LGTM, thanks!

Paolo

